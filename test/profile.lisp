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

                             matrix-requests:get-login
                             matrix-requests:put-room-send-event
                             matrix-requests:put-room-state-key
                             matrix-requests:get-sync
                             matrix-requests:get-room-messages
                             matrix-requests:put-room-state
                             matrix-requests:matrix-post-request
                             matrix-requests:post-room-join
                             matrix-requests:get-room-state-key
                             matrix-requests:post-room-leave
                             matrix-requests:post-user-filter
                             matrix-requests:post-login
                             matrix-requests:post-logout
                             matrix-requests:matrix-get-request
                             matrix-requests:get-joined-rooms
                             matrix-requests:get-room-members
                             matrix-requests:get-room-event
                             matrix-requests:post-join
                             matrix-requests:post-logout-all
                             matrix-requests:post-create-room
                             matrix-requests:get-room-joined-members
                             matrix-requests:get-room-state
                             matrix-requests:get-room-state-event
                             matrix-requests:post-room-forget
                             matrix-requests:put-room-redact-event
                             matrix-requests:post-room-invite
                             matrix-requests:get-user-filter

                             drakma:http-request))

(defun report ()
  #+sbcl (sb-profile:report))

(defun reset ()
  #+sbcl (sb-profile:reset)
  #+sbcl (sb-ext:gc :full t))
