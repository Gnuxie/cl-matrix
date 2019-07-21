#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package #:cl-matrix.autowrap)

(defun update-spec-file (schema &key (if-exists :supersede))
  (produce-endpoints schema)
  (with-accessors ((endpoints endpoints)) schema
    (if endpoints
        (with-open-file (f (spec-file-pathname schema) :direction :output
                           :if-exists if-exists
                           :if-does-not-exist :create)
          (pprint endpoints f))
        (error "could not produce endpoints ~a" endpoints))))

(defun load-endpoints-from-spec-file (schema)
  (with-open-file (f (spec-file-pathname schema) :direction :input)
    (let ((file-endpoints (read f)))
      (setf (endpoints schema) file-endpoints))))
