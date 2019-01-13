#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-user)
(defpackage :cl-matrix.base-events
  (:use :cl :cl-matrix)
  (:nicknames "CL-M.BASE-EVENTS")
  (:export
   base-event
   sync
   on-room
   room-event
   presence-event
   inivite-event
   ephemeral-event
   e-m.room.message
   e-m.text
   

   :issue-sync-event
))
(in-package :cl-matrix.base-events)
;;; e- means event
;;; h- means handler
;;; d- means dispatcher ie something that does deeds:do-issue for an event type

(deeds:define-event base-event (deeds:event)
  ((account :initarg :account)))

(deeds:define-event sync (base-event)
  ((data :initarg :data)))

(deeds:define-event on-room (base-event)
  ((room-id :initarg :room-id)
   (room-data :initarg :room-data)))

(deeds:define-event room-event (base-event)
  ((room-id :initarg :room-id)
   (data :initarg :data)))

(deeds:define-event presence-event (base-event)
  ((data :initarg :data)))

(deeds:define-event invite-event (base-event)
  ((room-id :initarg :room-id)
   (room-data :initarg :room-data)))

(deeds:define-event ephemeral-event (base-event)
  ((room-id :initarg :room-id)
   (data :initarg :data)))

(deeds:define-handler (sync-rooms sync) (event account  data)
  (jsown:do-json-keys (room-id room-data) (jsown:filter data "rooms" "join")
    (deeds:do-issue on-room :room-id room-id :room-data room-data :account account )))

(deeds:define-handler (room-event-h on-room) (event account room-id room-data)
  (dolist (e (jsown:filter room-data "timeline" "events"))
    (deeds:do-issue room-event :room-id room-id :data e :account account )))

(deeds:define-handler (sync-prescence sync) (event account data)
  (dolist (e (jsown:filter data "presence" "events"))
    (deeds:do-issue presence-event :data e :account account )))

(deeds:define-handler (sync-invite sync) (event account data)
  (let ((rooms (jsown:filter data "rooms" "invite")))
    (jsown:do-json-keys (room-id room-data) rooms
      (deeds:do-issue invite-event :room-id room-id :room-data room-data :account account))))

(deeds:define-handler (sync-ephemeral on-room) (event account room-id room-data)
  (dolist (e (jsown:filter room-data "ephemeral" "events"))
    (deeds:do-issue ephemeral-event :room-id room-id :data e :account account )))

;;; room events
(deeds:define-event e-m.room.message (base-event)
  ((room-id :initarg :room-id)
   (data :initarg :data)))

(deeds:define-handler (d-m.room.message room-event) (event account room-id data)
  (when (string= "m.room.message" (event-type data))
    (deeds:do-issue e-m.room.message :room-id room-id :data data :account account)))
;;; ¬ msgtypes
(deeds:define-event e-m.text (base-event)
  ((room-id :initarg :room-id)
   (data :initarg :data)))

(deeds:define-handler (d-m.text e-m.room.message) (event account room-id data)
  (when (string= "m.text" (msgtype data))
    (deeds:do-issue e-m.text :room-id room-id :data data :account account)))

;; try get it so that this isn't blocking but the other events are blocking. This way accounts can run in parrelel.
(defun issue-sync-event (sync-data)
  (deeds:do-issue sync :data sync-data :account *account*))
