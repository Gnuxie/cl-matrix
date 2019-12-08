(in-package :cl-matrix-test)

;;; honestly this needs cleaning right up.

(defun profiling ()
  #+sbcl (sb-profile:profile cl-matrix:login
                             cl-matrix:logout
                             cl-matrix:room-create
                             cl-matrix:msg-send
                             cl-matrix:user-invite
                             cl-matrix:room-join
                             cl-matrix:room-state
                             cl-matrix:room-power-levels
                             cl-matrix:change-power-level
                             cl-matrix:invitations
                             cl-matrix:upload-filter
                             cl-matrix:room-messages
                             cl-matrix:event-type

                             cl-matrix:make-account
                             cl-matrix:access-token
                             cl-matrix:username
                             drakma:http-request))

(defun report ()
  #+sbcl (sb-profile:report))

(defun reset ()
  #+sbcl (sb-profile:reset)
  #+sbcl (sb-ext:gc :full t))
