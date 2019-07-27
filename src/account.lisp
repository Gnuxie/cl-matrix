#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defclass account (cl-matrix.autowrap.authentication:auth)
  ((username :accessor username
             :initarg :username
             :initform ""
             :type string
             :documentation "The username for the account should be in the format \"@<username>:<homeserver>\"")))

(defmethod print-object ((this-account account) stream)
  (print-unreadable-object (this-account stream :type t :identity t)
    (format stream "~a" (username this-account))))

(defun get-hostname (user-id) (elt (nth-value 1 (cl-ppcre:scan-to-strings "@.*?:(.*)" user-id)) 0))

(defun make-account (username access-token &key (homeserver (get-hostname username)) (scheme "https://"))
  (make-instance 'account :username username :access-token access-token :homeserver homeserver :protocol scheme))

(defmacro with-account ((this-account) &body body)
  `(let ((*account* ,this-account))
     (declare (special *account*))
     (if (not (typep *account* 'account))
         (error 'cl-matrix-error :description "invalid input to with-account")
         (progn ,@body))))
