(defpackage #:cl-matrix.autowrap
  (:use :cl #:cl-matrix.autowrap.runtime #:cl-matrix.autowrap.api-schema #:cl-matrix.autowrap.authentication)
  (:export

   #:define-request
   #:guard-request
   #:define-endpoint

   #:build-package
   #:export-auto-api
   #:define-api

   #:update-spec-file
   #:load-endpoints-from-spec-file
   #:read-and-create-api
))
