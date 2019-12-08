#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defclass account (cl-matrix.autowrap.authentication:auth)
  ((username :accessor username
             :initarg :username
             :initform ""
             :type string
             :documentation "The username for the account should be in the format \"@<username>:<homeserver>\""))
  (:documentation "Class representing a matrix account

accounts are only used to represent a login session and in future device information,

At the minumum an instance only needs the username, access-token and origin.

Contains ACCESS-TOKEN slot containing the access-token associated with a currently \"logged in\" account.
Contains USERNAME slot holding the full user id for this account.
Contains ORIGIN slot for this accounts homeserver origin e.g. `https://matrix.org`

See LOGIN
See MAKE-ACCOUNT
See GET-ORIGIN"))

(defmethod print-object ((this-account account) stream)
  (print-unreadable-object (this-account stream :type t :identity t)
    (format stream "~a" (username this-account))))

(defun get-origin (user-id)
  (format nil "https://~a"
          (elt (nth-value 1 (cl-ppcre:scan-to-strings "@.*?:(.*)" user-id)) 0)))

(defun make-account (username access-token &key (origin (get-origin username)))
  "Helper to make an ACCOUNT

Will automatically calculate the origin for the ACCOUNT using GET-ORIGIN on the
provided USERNAME which is why it's optional.

See GET-ORIGIN
See ACCOUNT"
  (make-instance 'account :username username :access-token access-token
                 :origin origin))
