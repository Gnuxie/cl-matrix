(in-package :cl-matrix-test)

(defun profiling ()
  #+sbcl (sb-profile:profile cl-matrix:login
                             cl-matrix:logout
                             cl-matrix:room-create
                             cl-matrix:msg-send
                             cl-matrix:user-invite
                             cl-matrix:room-join
                             cl-matrix:account-sync
                             cl-matrix:account-sync-since
                             cl-matrix:user-joined-rooms
                             cl-matrix:room-joined-members
                             cl-matrix:rooms-joined-members
                             cl-matrix:rooms-joined-members-ids
                             cl-matrix:room-state
                             cl-matrix:rooms-state
                             cl-matrix:room-power-levels
                             cl-matrix:rooms-power-levels
                             cl-matrix:change-power-level
                             cl-matrix:room-forget
                             cl-matrix:room-leave
                             cl-matrix:invitations
                             cl-matrix:upload-filter
                             cl-matrix:room-messages
                             cl-matrix:event-type

                             cl-matrix:get-hostname
                             cl-matrix:make-account
                             cl-matrix:with-account
                             cl-matrix:access-token
                             cl-matrix:username
                             cl-matrix:homeserver

                             drakma:http-request))

(defun report ()
  #+sbcl (sb-profile:report))

(defun reset ()
  #+sbcl (sb-profile:reset)
  #+sbcl (sb-ext:gc :full t))
