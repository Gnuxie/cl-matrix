(defpackage :cl-matrix
  (:use :cl :matrix-handlers)
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
         
         account
         :get-room
         :add-room
         
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
