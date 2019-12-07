(defpackage :cl-matrix
  (:use #:cl
        #:cl-matrix.api.base
        #:cl-matrix.api.client
        #:cl-matrix.api.media
        #:cl-matrix.autowrap.authentication
        #:cl-matrix.autowrap.runtime)
        (:export 
         #:login
         #:logout
         #:logout-all
         #:room-create
         #:msg-send
         #:room-redact
         #:user-invite
         #:room-join
         #:sync
         #:user-joined-rooms
         #:room-state
         #:room-power-levels
         #:change-power-level
         #:room-kick
         #:room-ban
         #:room-unban
         #:invitations
         #:upload-filter
         #:room-messages
         #:now-token

         ;; media
         #:download-media
         #:upload-media
         #:thumbnail
         #:preview-url
         #:destructure-mxc-uri

         #:id
         #:event-type
         #:msgtype
         

         #:cl-matrix-error
         #:api-error
         #:forbidden
         #:bad-state

         ;; account
         #:account
         #:get-origin
         #:make-account
         #:access-token
         #:username
         #:origin

         ;; room-messages
         #:get-creation-event
         #:history-generator

         #:get-state-callback
         #:generate-generic-callback
))

(in-package :cl-matrix)
