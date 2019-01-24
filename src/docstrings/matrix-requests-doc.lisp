#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com>
|# (in-package :matrix-requests)

;; src/requests.lisp
(docs:define-docs
  (variable *access-token*
    "Special variable representing the access token to use as the default keyword argument to all requests defined with DEFINE-MATRIX-REQUEST

This variable gets used the same way by all endpoints defined with DEFINE-MATRIX-ENDPOINT.
The access token is injected into the url as a query parameter.

See DEFINE-MATRIX-ENDPOINT
See DEFINE-MATRIX-REQUEST")

  (variable *homeserver*
    "Special variable representing the homeserver to use by all requests defined with DEFINE-MATRIX-REQUEST.

As of writing the homeserver is just the domain to use e.g. `matrix.org` and there is no way to change the homeserver used by a request other than via this variable.

See DEFINE-MATRIX-REQUEST")

  (function define-matrix-request
    "Macro that will create a function wrapping a drakma:http-request with the name provided and of the type specified
e.g. `(define-matrix-request matrix-post-request :post)`")

  (function define-matrix-endpoint
    "Macro that will create a wrapper around a function defined with DEFINE-MATRIX-REQUEST specific to an api endpoint.

It takes a name to use for the function and the http methods that endpoint supports
Then it takes a list that describe the url, strings are constants and symbols are variables.
e.g. the api `PUT /_matrix/client/r0/rooms/{roomId}/send/{eventType}/{txnId}` can be expressed as

```
(define-matrix-endpoint room-send (:put)
  (\"rooms\" room-id \"send\" event-type txnid))
```
which should create a function with the signature
`(PUT-ROOM-SEND ROOM-ID EVENT-TYPE TXNID CONTENT &KEY PARAMETERS CALLBACK ACCESS-TOKEN)`

the json is parsed by jsown and returned as their representation of the object, this was necessary so that errors could be detected properly and rate limiting could be handled.

See DEFINE-MATRIX-REQUEST"))
