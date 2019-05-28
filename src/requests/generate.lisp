#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :matrix-requests)

(defclass matrix-client (module)
  ((endpoint-area :initform "/_matrix/client/r0/")))
(defclass matrix-media (module)
  ((endpoint-area :initform "/_matrix/media/r0/")))

(defclass matrix-requests-schema (api-schema)
  ((spec-file-pathname :initform (asdf:system-relative-pathname :matrix-requests "matrix-autowrap-spec.lisp"))
   (api-pathname :initform (asdf:system-relative-pathname :matrix-requests ""))
   (target-package :initform :matrix-requests)
   (modules :initform (list (make-instance 'matrix-client) (make-instance 'matrix-media)))))

(defmethod request-guard ((module matrix-client) request)
  `(handle-json-only-request (lambda () ,request)))

(defmethod request-guard ((module matrix-media) request)
  `(handle-http-request (lambda () ,request)))

(defmethod produce-endpoints ((schema matrix-requests-schema))
  (let ((spec (plump:parse (drakma:http-request "https://matrix.org/docs/spec/client_server/r0.4.0.html"))))
    (setf (endpoints schema)
          (concatenate 'list (lquery:$ spec "tt[class*=docutils literal]" (text))))))

(let ((schema (make-instance 'matrix-requests-schema
                             :exports '(auth
                                        access-token
                                        homeserver
                                        query-param
                                        
                                        cl-matrix-error
                                        api-error
                                        forbidden
                                        bad-state
                                        error-description

                                        gdpr-consent
                                        consent-uri

                                        room-in-use
                                        invalid-room-state
                                        guest-access-forbidden
                                        too-large
                                        unknown-token)
                             :imports '((:matrix-autowrap.authentication
                                         auth access-token homeserver query-param)))))
  
  (matrix-autowrap:define-api schema))
