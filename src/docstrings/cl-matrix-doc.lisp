#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com>
|# (in-package :cl-matrix)

;; src/main.lisp
(docs:define-docs
  (variable *account*
    "Special variable that is used to manage the active account. Effects operations on the clients room representation

See WITH-ACCOUNT
See ACCOUNT
See CHANGE-ACCOUNT"))

;; src/account.lisp
(docs:define-docs
  (type account
    "Class representing a matrix account

Contains all the state that can be associated with an account including the rooms the user has joined and in turn their state.

Contains ACCESS-TOKEN slot containing the access-token associated with a currently \"logged in\" account.
Contains USERNAME slot holding the full user id for this account.
Contains PASSWORD slot for this accounts password.
Contains HOMESERVER slot for this accounts homeserver address e.g. `matrix.org`
Contains ROOMS slot which is a hash-table with keys for the room-id and values for ROOM instances.
Contains ROOM-LIST slot which is a list of all the rooms in the hashtable for MEMBER tests. Not sure how necessary this is tbh.

See MAKE-ACCOUNT
See GET-HOSTNAME
See ROOM")

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

  (function get-room
    "Reader that will return a ROOM from the given room-id from the ROOMS slot in the current *ACCOUNT*")

  (function add-room
    "Function that will add a ROOM instance to the ROOMS slot in *ACCOUNT* with the given room-id as the key.")
  )

;; src/room.lisp
(docs:define-docs
  (type room
    "Class that shadows cl:room. Represents a matrix room

Contains an ID slot representing the id for the room in full.
Contains an EVENT slot representing the events the client has locally for the room.
Contains a STATE slot representing the most recent room state the client has locally.
Contains a BACK slot which is supposed to hold a pagination token for events backwards.
Contains a FRONT slot which is supposed to hold a pagination token for events forwards."

    ))

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

