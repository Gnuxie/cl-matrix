#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package :matrix-autowrap)
(defmacro array-bind ((&rest vars) array &body body)
  (let ((i 0))
    `(let (,@(loop :for var in vars
                :collect `(,var (aref ,array ,i))
                :do (incf i)))
       ,@body)))

(defmacro ppcre-bind ((matchedp &rest groups) expression &body body)
  (let ((array-sym (gensym)))
    `(multiple-value-bind (,matchedp ,array-sym) ,expression
       (when ,matchedp
         (array-bind (,@groups) ,array-sym
           ,@body)))))

(defun symbolise-uri (uri)
  (intern (string-upcase (remove-if (lambda (c) (or (char= c #\{) (char= c #\}))) (substitute #\- #\_ uri)))))

(defun add-index (array index item &optional (start 0))
  (concatenate 'string
               (subseq array start index)
               (string item)
               (subseq array index)))

(defun escape-slashes (thing)
  (declare (type string thing))
  (let ((next-slash (search "/" thing)))
    (loop :while next-slash :do
         (setf thing (add-index thing next-slash #\\))
         (setf next-slash (search "/" thing :start2 (+ 2 next-slash))))
    thing))

(defun %read-and-define (endpoint-spec schema)
  (declare (type string endpoint-spec))
  (ppcre-bind (matchedp method uri) (cl-ppcre:scan-to-strings (format nil "^(GET|POST|PUT|DELETE)\\s*~a(\\S*)$"
                                                                      (escape-slashes (endpoint-area schema)))
                                                              endpoint-spec)
    (let ((fun-sym (symbolise-uri uri)))
      (endpoint-definition fun-sym `(,(intern method :keyword)) schema
         (let ((length (length uri))
               (i 0))
           (loop :while (> length i)
              :collect
                (if (char= #\{ (aref uri i))
                    (let ((next-slash (search "/" uri :start2 i)))
                      (if next-slash
                          (prog1
                              (intern (subseq uri (+ 1 i) (- next-slash 1)))
                            (setf i (+ 1 next-slash)))
                          (prog1 (intern (subseq uri (+ 1 i) (- length 1)))
                                 (setf i length))))
                    (let ((next-slash (search "/" uri :start2 i)))
                      (if next-slash
                          (prog1
                              (subseq uri i next-slash)
                            (setf i (+ 1 next-slash)))
                          (prog1 (subseq uri i)
                                 (setf i length)))))))))))

(defun export-auto-api (package)
  (flet ((endpoint-p (sym)
           (let ((pack (find-package package)))
             (and (eql (symbol-package sym) pack)
                  (cl-ppcre:scan-to-strings "^(?>GET|PUT|POST|DELETE).*"
                                            (symbol-name sym))))))

    (let ((pack (find-package package)))
      (do-all-symbols (sym pack)
        (when (endpoint-p sym)
          (format t "~%:~a" (string-downcase (symbol-name sym)))
          (export sym package))))))

(defun read-and-feed-spec (schema)
  (let ((endpoints-spec (endpoints schema)))
    (list* 'progn
           (map 'list (lambda (s) (funcall #'%read-and-define s schema)) endpoints-spec))))

(defun read-and-create-api (schema)
  ;err yeah
  (with-open-file (f (api-pathname schema) :direction :output :if-exists :supersede :if-does-not-exist :create)
    (pprint (read-and-feed-spec schema) f)))

(defmacro define-api (schema package)
  `(let ((schema (make-instance ',schema)))
     (update-spec-file schema)
     (load-endpoints-from-spec-file schema)
     (read-and-create-api schema)
     (export-auto-api ,package)))

