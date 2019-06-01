#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage #:cl-matrix.autowrap.api-schema
  (:use :cl)
  (:export
   #:api-schema
   #:request-guard
   #:endpoints
   #:produce-endpoints
   #:endpoint-area
   #:spec-file-pathname
   #:api-pathname
   #:imports
   #:additional-exports
   #:target-package
   #:modules
   #:module))

(in-package #:cl-matrix.autowrap.api-schema)

;;; you know, I don't really agree with putting modules in the same package.
;;; each module should have it's own package.
;;; that's going to take a little bit of jiggling around and this is a much much simpler fix atm.
(defclass api-schema ()
  ((spec-file-pathname :accessor spec-file-pathname
                        :initarg :spec-file-pathname
                        :initform (error "a pathname for the specfile must be supplied")
                        :documentation "a pathname to store and read the spec from that will be produced by
the generic `endpoints`.
This will be used as a backup should the network be down or producing the endpoints fails.
Or it can just be used so that the end user won't have to do anything risky to produce it.

See produce-endpoints")

   (endpoints :accessor endpoints
              :initarg :endpoints
              :initform nil
              :type list
              :documentation "the endpoint specification loaded from the spec-file for this schema.")

   (api-pathname :accessor api-pathname
                 :initarg :api-pathname
                 :initform (error "a pathname for the generated api must be supplied")
                 :documentation "a pathname to store the generated api")

   (%additional-exports :accessor additional-exports
                        :initarg :exports
                        :type list
                        :initform nil
                        :documentation "additional symbols to export")

   (%import-from-table :accessor imports
                       :initarg :imports
                       :type list
                       :initform nil
                       :documentation "assoc list of packages and symbols to import from there")

   (target-package :accessor target-package
                   :initarg :target-package
                   :type symbol
                   :initform (error "must supply target-package designator")
                   :documentation "a package designator for the target package")

   (modules :accessor modules
            :initarg :modules
            :type list
            :initform (error "must supply at least one module")
            :documentation "a list of modules the schema is implementing
See module")))


(defgeneric produce-endpoints (schema)
  (:documentation "return the endpoints for the schema, has to be defined if the schema wants to be updated
you should also update the endpoints for the schema with setf in the body.

as of writing, requests should match the regex \"^(GET|POST|PUT|DELETE)\\s*~a(\\S*)$\" where the string to substitute is the `endpoint-area` for each module.

See api-schema
See endpoint-area
"))
