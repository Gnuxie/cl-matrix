#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :matrix-requests)

(defclass matrix-requests-schema (api-schema)
  ((endpoint-area :initform "/_matrix/client/r0/")
   (spec-file-pathname :initform (asdf:system-relative-pathname :matrix-requests "matrix-autowrap-spec.lisp"))
   (api-pathname :initform (asdf:system-relative-pathname :matrix-requests ""))
   (target-package :initform :matrix-requests)))

(defmethod request-guard ((schema matrix-requests-schema) request)
   `(handle-request (lambda () ,request)))

(defmethod produce-endpoints ((schema matrix-requests-schema))
  (let ((spec (plump:parse (drakma:http-request "https://matrix.org/docs/spec/client_server/r0.4.0.html"))))
    (setf (endpoints schema)
          (concatenate 'list (lquery:$ spec "tt[class*=docutils literal]" (text))))))

(let ((schema (make-instance 'matrix-requests-schema
                             :exports '(auth
                                        access-token
                                        homeserver
                                        query-param)
                             :imports '((:matrix-autowrap.authentication
                                         auth access-token homeserver query-param)))))
  
  (matrix-autowrap:define-api schema))
