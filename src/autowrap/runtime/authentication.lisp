#| Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage #:cl-matrix.autowrap.authentication
  (:use :cl)
  (:export
   #:auth
   #:access-token
   #:query-param
   #:origin))

(in-package :cl-matrix.autowrap.authentication)

(defclass auth ()
  ((access-token :accessor access-token
                 :initarg :access-token
                 :initform ""
                 :type string)

   (origin :accessor origin
           :initarg :origin
           :initform ""
           :type string
           :documentation "scheme://hostname:port to make requests against.")))
