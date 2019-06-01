#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package #:cl-matrix.autowrap.api-schema)

(defclass module ()
  ((endpoint-area :accessor endpoint-area
                  :initarg :endpoint-area
                  :initform ""
                  :type string
                  :documentation "I don't know the formal name for this.

Baically it's a string representing an area of endpoints on a server, so for example, matrix's client server api
starts with `/_matrix/client/r0/` and media is `/_matrix/media/r0/`

See produce-endpoints")))

(defgeneric request-guard (module request)
  (:documentation "return a guarded request, override this to place a json parser or check for errors."))

(defmethod request-guard ((schema module) request)
  'request)
