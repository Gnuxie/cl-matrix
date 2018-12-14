(in-package :cl-matrix-test)

(defun profiling ()
  #+sbcl (sb-profile:profile cl-matrix:account-log-in
                             cl-matrix:account-log-out
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
                             cl-matrix:id
                             cl-matrix:events
                             cl-matrix:front
                             cl-matrix:back
                             cl-matrix:limit
                             cl-matrix:startup-sync
                             cl-matrix:filter
                             cl-matrix:messages
                             cl-matrix:event-type
                             cl-matrix:get-room
                             cl-matrix:add-room

                             cl-matrix:get-hostname
                             cl-matrix:make-account
                             cl-matrix:change-account
                             cl-matrix:with-account
                             cl-matrix:access-token
                             cl-matrix:username
                             cl-matrix:password
                             cl-matrix:homeserver

                             matrix-handlers:get-login
                             matrix-handlers:put-room-send-event
                             matrix-handlers:put-room-state-key
                             matrix-handlers:get-sync
                             matrix-handlers:get-room-messages
                             matrix-handlers:put-room-state
                             matrix-handlers:matrix-post-request
                             matrix-handlers:post-room-join
                             matrix-handlers:get-room-state-key
                             matrix-handlers:post-room-leave
                             matrix-handlers:post-user-filter
                             matrix-handlers:post-login
                             matrix-handlers:post-logout
                             matrix-handlers:matrix-get-request
                             matrix-handlers:get-joined-rooms
                             matrix-handlers:get-room-members
                             matrix-handlers:get-room-event
                             matrix-handlers:post-join
                             matrix-handlers:post-logout-all
                             matrix-handlers:post-create-room
                             matrix-handlers:get-room-joined-members
                             matrix-handlers:get-room-state
                             matrix-handlers:get-room-state-event
                             matrix-handlers:post-room-forget
                             matrix-handlers:put-room-redact-event
                             matrix-handlers:post-room-invite
                             matrix-handlers:get-user-filter

                             drakma:http-request))

(defun report ()
  #+sbcl (sb-profile:report))

(defun reset ()
  #+sbcl (sb-profile:reset)
  #+sbcl (sb-ext:gc :full t))
