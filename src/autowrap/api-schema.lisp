#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage matrix-autowrap.api-schema
  (:use :cl)
  (:export
   #:api-schema
   #:request-guard
   #:endpoints
   #:produce-endpoints
   #:endpoint-area
   #:spec-file-pathname
   #:api-pathname))

(in-package :matrix-autowrap.api-schema)

(defclass api-schema ()
  ((endpoint-area :accessor endpoint-area
                  :initarg :endpoint-area
                  :initform ""
                  :type string
                  :documentation "I don't know the formal name for this.

Baically it's a string representing an area of endpoints on a server, so for example, matrix's client server api
starts with `/_matrix/client/r0/`

See produce-endpoints")

   (spec-file-pathname :accessor spec-file-pathname
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
                 :documentation "a pathname to store the generated api")))

(defgeneric request-guard (schema request)
  (:documentation "return a guarded request, override this to place a json parser or check for errors."))

(defmethod request-guard ((schema api-schema) request)
  'request)

(defgeneric produce-endpoints (schema)
  (:documentation "return the endpoints for the schema, has to be defined if the schema wants to be updated
you should also update the endpoints for the schema with setf in the body.

as of writing, requests should match the regex \"^(GET|POST|PUT|DELETE)\\s*~a(\\S*)$\" where the string to substitute is the `endpoint-area` in the api-schema.

See api-schema
See endpoint-area
"))
