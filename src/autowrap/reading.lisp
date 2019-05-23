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

(defun exports-from-auto-api (package)
  (flet ((endpoint-p (sym)
           (let ((pack (find-package package)))
             (and (eql (symbol-package sym) pack)
                  (cl-ppcre:scan-to-strings "^(?>GET|PUT|POST|DELETE).*"
                                            (symbol-name sym))))))

    (let ((pack (find-package package))
          (exports nil))
      (do-all-symbols (sym pack)
        (when (endpoint-p sym)
          (push (string-downcase (symbol-name sym)) exports)))

      exports)))

(defun read-and-feed-spec (schema)
  (let ((endpoints-spec (endpoints schema)))
    (reduce #'append
            (delete-if #'null
                       (map 'list (lambda (s) (funcall #'%read-and-define s schema)) endpoints-spec)))))

(defun write-package-definition (stream package exports)
  (format stream "(defpackage ~s ((:use :cl)~%(:export~{~%  #:~a~})))~%(in-package ~s)~%"
          package
          exports
          package))

(defun read-and-create-api (schema package)
  ;err yeah
  (with-open-file (f (api-pathname schema) :direction :output :if-exists :supersede :if-does-not-exist :create)
    (let ((definitions (read-and-feed-spec schema)))
      (write-package-definition f package (concatenate 'list (exports-from-auto-api package)
                                                       (additional-exports schema)))
      (format f "~%;;; generated requests")
      (mapc (lambda (s) (pprint s f) (format f "~%"))
            definitions))))

(defun define-api (schema package)
  (update-spec-file schema)
  (load-endpoints-from-spec-file schema)
  (read-and-create-api schema package))

