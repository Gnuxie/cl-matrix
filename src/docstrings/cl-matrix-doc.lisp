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
"))

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

