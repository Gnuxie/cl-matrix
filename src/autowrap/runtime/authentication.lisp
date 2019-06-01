#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage #:cl-matrix.autowrap.authentication
  (:use :cl)
  (:export
   #:auth
   #:access-token
   #:homeserver
   #:query-param))

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
   ))
