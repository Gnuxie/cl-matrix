#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package :matrix-autowrap)

(defmacro with-safetly-produced-endpoints (endpoint-schema-sym schema &body body)
   `(let ((,endpoint-schema-sym
         (handler-case (produce-endpoints ,schema) 
           (error (c)
             (warn "Caught condition when producing endpoints. ~&" c)
             nil))))
      (unless (null ,endpoint-schema-sym)
        ,@body)))

(defun update-spec-file (schema &key (if-exists :supersede))
  (with-safetly-produced-endpoints endpoint-schema schema
    (with-open-file (f (spec-file-pathname schema) :direction :output
                       :if-exists if-exists
                       :if-does-not-exist :create)
      (pprint endpoint-schema f))))

(defun load-endpoints-from-spec-file (schema)
  (with-open-file (f (spec-file-pathname schema) :direction :input)
    (let ((file-endpoints (read f)))
      (setf (endpoints schema) file-endpoints))))
