#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package #:cl-matrix.api.generation)
(defvar *spec-url* "https://matrix.org/docs/spec/client_server/r0.6.0.html")

(defclass matrix-cs-schema (api-schema)
  ((spec-file-pathname :initform (asdf:system-relative-pathname :cl-matrix.api.generation "cs-api-specfile.lisp"))))

(defclass matrix-client (matrix-cs-schema) ())
(defclass matrix-media (matrix-cs-schema) ())

(defmethod request-guard ((module matrix-client) request)
  `(handle-json-only-request (lambda () ,request)))

(defmethod request-guard ((module matrix-media) request)
  `(handle-http-request (lambda () ,request)))

(defmethod produce-endpoints ((schema matrix-cs-schema))
  (let ((spec (plump:parse  (drakma:http-request *spec-url* :accept "text/html"))))
    (setf (endpoints schema)
          (delete-if-not
           (lambda (s)
             (cl-ppcre:scan-to-strings "^(?>GET|PUT|POST|DELETE).*" s))
           (delete-duplicates 
            (concatenate 'list (lquery:$ spec "tt[class*=docutils literal]" (text)))
            :test #'string=)))))

(defvar *client-schema*
  (make-instance 'matrix-client
                 :imports '((:cl-matrix.autowrap.authentication
                             auth access-token homeserver query-param))
                 :endpoint-area "/_matrix/client/r0/"
                 :target-package :cl-matrix.api.client
                 :api-pathname (asdf:system-relative-pathname :cl-matrix.api.generation "../client/")))

(defvar *media-schema* 
  (make-instance 'matrix-media
                 :imports '((:cl-matrix.autowrap.authentication
                             auth access-token homeserver query-param))
                 :endpoint-area "/_matrix/media/r0/"
                 :target-package :cl-matrix.api.media
                 :api-pathname (asdf:system-relative-pathname :cl-matrix.api.generation "../media/")))
  
(defun update-specfile ()
  (cl-matrix.autowrap:update-spec-file *client-schema*))

(defun generate-api ()
  (dolist (schema (list *media-schema* *client-schema*))
    (cl-matrix.autowrap:load-endpoints-from-spec-file schema)
    (cl-matrix.autowrap:read-and-create-api schema)))
