(defpackage :cl-matrix
        (:use :cl)
        (:export 
        :account-log-in
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
        
        *access-token*
        *homeserver*
        ))      

(in-package :cl-matrix)
