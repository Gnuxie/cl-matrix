(defpackage :cl-matrix
  (:use :cl :matrix-requests)
  (:shadow "ROOM")
        (:export 
         :account-log-in
         :account-log-out
         :room-create
         :msg-send
         :user-invite
         :room-join
         :account-sync
         :account-sync-since
         :user-joined-rooms
         :room-joined-members
         :rooms-joined-members
         :rooms-joined-members-ids
         :room-state
         :rooms-state
         :room-power-levels
         :rooms-power-levels
         :change-power-level
         :room-forget
         :room-leave
         :invitations
         :upload-filter
         :room-messages

         room
         :id
         :events
         :front
         :back
         :limit
         :startup-sync
         :filter
         :messages

         :event-type
         
         account
         :get-room
         :add-room

         cl-matrix-error
         api-error
         forbidden
         
         :get-hostname
         :make-account
         :change-account
         :with-account
         :access-token
         :username
         :password
         :homeserver

         *access-token*
         *homeserver*
         *account*))

(in-package :cl-matrix)
