(defpackage #:cl-matrix.api.base
  (:use #:cl)
  (:export
   #:cl-matrix-error
   #:api-error
   #:forbidden
   #:bad-state
   #:gdp-consent
   #:room-in-use
   #:invalid-room-state
   #:guest-access-forbidden
   #:too-large
   #:unknown-token

   #:handle-http-request
   #:handle-json-only-request))
