#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage matrix-autowrap.api-schema
  (:use :cl)
  (:export
   #:api-schema
   #:request-guard
   #:endpoints
   #:endpoint-area))

(in-package :matrix-autowrap.api-schema)

(defclass api-schema ()
  ((endpoint-area :accessor endpoint-area
                  :initarg :endpoint-area
                  :initform ""
                  :type string
                  :documentation "I don't know the formal name for this.

Baically it's a string representing an area of endpoints on a server, so for example, matrix's client server api
starts with `/_matrix/client/r0/`

See endpoints")))

(defgeneric request-guard (schema request)
  (:documentation "return a guarded request, override this to place a json parser or check for errors."))

(defmethod request-guard ((schema api-schema) request)
  'request)

(defgeneric endpoints (schema)
  (:documentation "return the endpoints for the schema, has to be defined as this will be called when building the wrapper.

as of writing, requests should match the regex \"^(GET|POST|PUT|DELETE)\\s*~a(\\S*)$\" where the string to substitute is the `endpoint-area` in the api-schema.

See api-schema
See endpoint-area
"))
