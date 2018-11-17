(defpackage :cl-matrix
        (:use :cl)
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
         :room-power-levels
         :rooms-power-levels
         :change-power-level
         :room-forget
         :room-leave
         :invitations
         :post-filter

         *access-token*
         *homeserver*
         *sync-next-batch*
         ))

(in-package :cl-matrix)
