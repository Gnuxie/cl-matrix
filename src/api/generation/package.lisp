(defpackage #:cl-matrix.api.generation
  (:use #:cl #:cl-matrix.autowrap.authentication
        #:cl-matrix.autowrap.api-schema
        #:cl-matrix.api.base)

  (:export
   #:update-specfile
   #:generate-api
   #:*spec-url*))
