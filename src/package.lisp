(defpackage :cl-matrix
  (:use :cl :matrix-requests)
        (:export 
         :login
         :logout
         :logout-all
         :room-create
         :msg-send
         :room-redact
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
         :room-kick
         :room-ban
         :room-unban
         :room-put-state
         :invitations
         :upload-filter
         :room-messages
         :n-messages
         :all-messages
         :now-token

         :id
         :event-type
         :msgtype
         
         account

         cl-matrix-error
         api-error
         forbidden
         
         :get-hostname
         :make-account
         :with-account
         :access-token
         :username
         :password
         :homeserver

         *account*
))

(in-package :cl-matrix)
