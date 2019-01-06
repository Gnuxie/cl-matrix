#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com>
|# (in-package :cl-matrix)

;; src/main.lisp
(docs:define-docs
  (variable *account*
    "Special variable that is used to manage the active account.

It could be set by the user to an account object but it is recommended to use the with-account macro, think of the *account* variable more of a special that is local the functions making requests to the homeserver.

See WITH-ACCOUNT
See ACCOUNT
See CHANGE-ACCOUNT"))

;; src/account.lisp
(docs:define-docs
  (type account
    "Class representing a matrix account

accounts are only used to represent a login session and in future device information,
it is recommended to make a new instance should you wish to logout then login again.

At the minumum an instance only needs the username, access-token and hostname.

Contains ACCESS-TOKEN slot containing the access-token associated with a currently \"logged in\" account.
Contains USERNAME slot holding the full user id for this account.
Contains PASSWORD slot for this accounts password.
Contains HOMESERVER slot for this accounts homeserver address e.g. `matrix.org`

See LOGIN
See MAKE-ACCOUNT
See GET-HOSTNAME
")

  (function make-account
    "Constructor for ACCOUNT

Will automatically calculate the hostname for the ACCOUNT using GET-HOSTNAME on the provided USERNAME which is why it's optional.

See GET-HOSTNAME
See ACCOUNT")

  (function GET-HOSTNAME
    "Function

Simple function that will return a hostname from a USERNAME

See MAKE-ACCOUNT
See ACCOUNT")

  (function with-account
    "Macro that will wrap the body in a let clause with a dynamic binding to whatever the first argument evaluates to and the symbol *ACCOUNT* .
An example of this could be `(with-account ((login \"@me:matrix.org\" \"*****\")) (user-joined-rooms))`
Most of the time though, with-account will be used something like this `(with-account (*my-account*) body...)`.

These forms are nestable.")

)

;; src/conditions.lisp
(docs:define-docs
  (type cl-matrix-error
        "Base Condition for all conditions defined in this package.")

  (type api-error
    "A base condition for all conditions raised by the matrix server in it's response content e.g. when the server returns an error object, this is different to when a HTTP error happens.

Contains a slot DESCRIPTION with a reader ERROR-DESCRIPTION which should contain the value of errcode and error from the error json object.
Will report the content of the ERROR-DESCRIPTION to a stream.

if the type of api-error has not been defined then this condition should be raised.

See DEFINE-CALLBACK
See GENERATE-GENERIC-CALLBACK
See https://matrix.org/docs/spec/client_server/latest.html#api-standards")

  (type forbidden
    "A condition for the matrix api error of FORBIDDEN

See https://matrix.org/docs/spec/client_server/latest.html#api-standards"))


;; src/callback.lisp
(docs:define-docs
  (function define-callback
    "Macro that is used to generate \"callback\" generating functions. What I mean by that is the functions that are produced return a closure that can be used with a function defined by DEFINE-MATRIX-ENDPOINT to raise different errors depending on the error content of the server response.

It takes the name, the arguments you want for the generator, the arguments that generator should expect and then a list for what symbols you want to use for the server response, the \"errcode\" and the \"error\" (or error message (these names are from the matrix spec and they're bad)) by default they are response, errcode, and error-msg.

Then you pass lists starting with the matrix error (from the spec) you want to handle. e.g.
```
(define-callback forbidden-callback ()
  (\"FORBIDDEN\" (error 'forbidden :description error-msg)))
```
If the error type returned by a request using this callback is not specified then an api-error will be raised.

again apologies for the horrible name.
There is an example of this macro:

See GENERATE-GENERIC-CALLBACK
See API-ERROR"))

