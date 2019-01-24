(in-package :cl-user)

(defpackage :cl-matrix.requests
  (:use :cl)
  (:nicknames "MATRIX-REQUESTS" )
  (:export
   #:get-login
   #:get-room-state-event
   #:post-room-leave
   #:get-sync
   #:post-room-forget
   #:post-user-filter
   #:get-user-filter
   #:post-join
   #:define-matrix-request
   #:get-room-messages
   #:post-login
   #:define-matrix-endpoint
   #:get-room-event
   #:put-room-redact-event
   #:post-room-invite
   #:get-room-state-key
   #:put-room-state
   #:post-create-room
   #:post-room-join
   #:get-joined-rooms
   #:matrix-post-request
   #:get-room-joined-members
   #:get-room-members
   #:matrix-get-request
   #:post-logout-all
   #:put-room-send-event
   #:get-room-state
   #:put-room-state-key
   #:post-logout
   #:post-room-kick
   #:post-room-ban
   #:post-room-unban
   
   #:auth
   #:access-token
   #:homeserver

   #:cl-matrix-error
   #:api-error
   #:forbidden
   #:bad-state))
