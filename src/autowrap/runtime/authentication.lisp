#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage #:cl-matrix.autowrap.authentication
  (:use :cl)
  (:export
   #:auth
   #:access-token
   #:homeserver
   #:query-param
   #:protocol))

(in-package :cl-matrix.autowrap.authentication)

(defclass auth ()
  ((access-token :accessor access-token
                 :initarg :access-token
                 :initform ""
                 :type string)

   (homeserver   :accessor homeserver
                 :accessor domain
                 :initarg :homeserver
                 :initform ""
                 :type string
                 :documentation "the domain to use in the endpoint calls e.g. `matrix.org`")

   (protocol :accessor protocol
             :initarg :protocol
             :initform "https://"
             :type string
             :documentation "This is here because drakma requires you to specify the scheme for the url and we want people to be able to use http or https because you might need http in a test environment.")))
