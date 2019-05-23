#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :matrix-requests)

(defclass matrix-requests-schema (api-schema)
  ((endpoint-area :initform "/_matrix/client/r0/")
   (spec-file-pathname :initform (asdf:system-relative-pathname :matrix-requests "matrix-autowrap-spec.lisp"))
   (api-pathname :initform (asdf:system-relative-pathname :matrix-requests "api.lisp"))))

(defun handle-request (request)
  (let ((response (jsown:parse (funcall request))))
    (if (jsown:keyp response "error")
        (let ((errcode (jsown:val response "errcode"))
              (error-msg (jsown:val response "error")))
          (cond ((search "M_LIMIT_EXCEEDED" errcode)
                 (sleep (/ (jsown:val response "retry_after_ms") 1000))
                 (handle-request request))

                ((search "FORBIDDEN" errcode)
                 (error 'forbidden :description error-msg))

                ((search "BAD_STATE" errcode)
                 (error 'bad-state :description error-msg))

                ((search "NOT_FOUND" errcode)
                 nil)

                (t (error 'api-error :description (format nil "errcode: ~a~%errmsg: ~a~%" errcode error-msg)))))
        response)))

(defmethod request-guard ((schema matrix-requests-schema) request)
   `(handle-request (lambda () ,request)))

(defmethod produce-endpoints ((schema matrix-requests-schema))
  (let ((spec (plump:parse (drakma:http-request "https://matrix.org/docs/spec/client_server/r0.4.0.html"))))
    (setf (endpoints schema)
          (concatenate 'list (lquery:$ spec "tt[class*=docutils literal]" (text))))))

(let ((schema make-instance 'matrix-requests-schema :exports '(matrix-autowrap.authentication:auth
                                                               matrix-autowrap.authentication:access-token
                                                               matrix-autowrap.authentication:homeserver
                                                               matrix-autowrap.authentication:query-param)))
  
  (matrix-autowrap:define-api schema :matrix-requests))
