#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-user)
(defpackage :cl-matrix.base-events
  (:use :cl :cl-matrix)
  (:shadow "ROOM")
  (:nicknames "CL-M.BASE-EVENTS")
  (:export
   sync
   on-room
   room-event
   presence-event
   inivite-event
   ephemeral-event

   :issue-sync-event
   :register-client-handlers
   :deregister-client-handlers))
(in-package :cl-matrix.base-events)

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

;; try get it so that this isn't blocking but the other events are blocking. This way accounts can run in parrelel.
(defun issue-sync-event (sync-data)
  (deeds:do-issue sync :data sync-data :account *account*))

(deeds:define-handler (client-new-room-h on-room) (event account room-id room-data)
  :before '(:main)
  :class 'deeds:globally-blocking-handler
  (with-account (account)
    (funcall (client-new-room) event room-id room-data)))

(deeds:define-handler (client-room-front-h sync) (event account data)
  :after '(:main)
  (with-account (account)
    (funcall (client-room-front-updater) event data)))

(defun register-client-handlers ()
  (deeds:register-handler client-room-front-h)
  (deeds:register-handler client-new-room-h))

(defun deregister-client-handlers ()
  (deeds:deregister-handler client-new-front-h)
  (deeds:deregister-handler client-new-room-h))
