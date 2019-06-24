#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-user)
(defpackage :cl-matrix.base-events
  (:use :cl :cl-matrix)
  (:nicknames "CL-M.BASE-EVENTS")
  (:export
   #:base-event
   #:sync
   #:on-room
   #:room-event
   #:presence-event
   #:invite-event
   #:ephemeral-event
   #:m.room.message
   #:m.text
   

   #:issue-sync-event
))
(in-package :cl-matrix.base-events)

;;; why do we need to be passing account?
;;; we at the moment bind *account* when we use the function issue-sync-event
(defgeneric sync (account data))

(defgeneric on-room (account room-id room-data))

(defgeneric room-event (account room-id data))

(defgeneric presence-event (account data))

(defgeneric invite-event (account room-id room-data))

(defgeneric ephemeral-event (account room-id data))

(method-hooks:defhook sync issue-on-room ((account account) data)
  (jsown:do-json-keys (room-id room-data) (jsown:filter data "rooms" "join")
    (on-room account room-id room-data)))

(method-hooks:defhook on-room issue-room-events ((account account) room-id room-data)
  (dolist (e (jsown:filter room-data "timeline" "events"))
    (room-event account room-id e)))

(method-hooks:defhook sync issue-presence-events ((account account) data)
  (dolist (e (jsown:filter data "presence" "events"))
    (presence-event account e)))

(method-hooks:defhook sync issue-invite-events ((account account) data)
  (let ((rooms (jsown:filter data "rooms" "invite")))
    (jsown:do-json-keys (room-id room-data) rooms
      (invite-event account room-id room-data))))

(method-hooks:defhook on-room issue-ephemeral-events ((account account) room-id room-data)
  (dolist (e (jsown:filter room-data "ephemeral" "events"))
    (ephemeral-event account room-id e)))

;;; room events
(defgeneric m.room.message (account room-id data))

(method-hooks:defhook room-event issue-m.room.message ((account account) room-id data)
  (when (string= "m.room.message" (event-type data))
    (m.room.message account room-id data)))

;;; ¬ msgtypes
(method-hooks:define-hook-generic m.text (account room-id data)
  (:method-combination standard)
  (:hook-point t))

(method-hooks:defhook m.room.message issue-m.text ((account account) room-id data)
  (when (string= "m.text" (msgtype data))
    (m.text account room-id data)))

(defun issue-sync-event (sync-data)
  (sync *account* sync-data))
