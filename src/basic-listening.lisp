#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-user)
(defpackage :cl-matrix.base-dispatcher
  (:use :cl :cl-matrix.listening)
  (:nicknames "BASE-DISPATCHER")
  (:export
   base-dispatcher
   :make-base-dispatcher
   :events
   :presence
   :invite
   :left
   :ephemeral
   
   :base-sync
   :base-room
   :base-event
   :base-presence
   :base-invite
   :base-left
   :base-ephemeral))

(in-package :cl-matrix.base-dispatcher)

(defclass base-dispatcher (dispatcher)
  ((events :accessor events
           :initarg :events
           :type dispatcher)

   (presence :accessor presence
                        :initarg :presence
                        :type dispatcher)

   (invite   :accessor invite
                        :initarg :invite
                        :type dispatcher)

   (left    :accessor left
            :initarg :left
            :type dispatcher)

   (ephemeral :accessor ephemeral
              :initarg :ephemeral
              :type dispatcher)))

(let ((new-room-client (make-listener (cl-matrix:client-new-room)))
      (new-event-client (make-listener (cl-matrix:client-new-events)))
      (room-front-client (make-listener (cl-matrix:client-room-front-updater))))

  (defun base-sync ()
    (make-dispatcher (lambda (instance data)
                       (mapcar (lambda (l) (invoke-callback l data))
                               (listeners instance))
                       (invoke-callback room-front-client data))
                     :description "dispatcher for raw sync data"))

  (defun base-room (&optional parent)
    (make-dispatcher (lambda (instance data)
                       (jsown:do-json-keys (room-id the-room) (jsown:filter data "rooms" "join")
                         (invoke-callback new-room-client room-id the-room)
                         (mapcar (lambda (l) (invoke-callback l room-id the-room))
                                 (listeners instance))))
                     :parent parent))

  (defun base-event (&optional parent)
    (make-dispatcher 
     (lambda (instance room-id the-room)
       (let ((listeners (listeners instance))
             (events (jsown:filter the-room "timeline" "events")))
         (mapcar (lambda (event)
                   (invoke-callback new-event-client room-id event)
                   (mapcar (lambda (l) (invoke-callback l room-id event))
                           listeners))
                 events)))
     :parent parent
     :description "invokes the callback for it's listeners on every single event in sync"))

  (defun base-presence (&optional parent)
    (make-dispatcher
     (lambda (instance data)
       (let ((listeners (listeners instance))
             (events (jsown:filter data "presence" "events")))
         (mapcar (lambda (event)
                   (mapcar (lambda (l) (invoke-callback l event))
                           listeners))
                 events)))
     :parent parent
     :description "invokes it's listeners callback for each event in the presence part of sync"))

  (defun base-invite (&optional parent)
    (make-dispatcher
     (lambda (instance data)
       (let ((listeners (listeners instance))
             (rooms (jsown:filter data "rooms" "invite")))
         (jsown:do-json-keys (room-id room-stuff)
             (mapcar (lambda (l) (invoke-callback l room-id room-stuff))
                     listeners))))
     :parent parent))

  (defun base-left (&optional parent)
    (make-dispatcher
     (lambda (instance data)
       (let ((rooms (jsown:filter data "rooms" "leave")))
         (jsown:do-json-keys (room-id room-data) rooms
           (mapcar (lambda (l) (invoke-callback l room-id room-data))
                   (listeners instance)))))
     :parent parent))

  (defun base-ephemeral (&optional parent)
    (make-dispatcher
     (lambda (instance room-id the-room)
       (let ((listeners (listeners instance))
             (events (jsown:filter the-room "ephemeral" "events")))
         (mapcar (lambda (event)
                   (mapcar (lambda (l) (invoke-callback l room-id event))
                           listeners))
                 events)))
     :parent parent)))

(defun make-base-dispatcher ()
  (let* ((base-sync (base-sync))
         (base-room (base-room base-sync)))

    (make-instance 'base-dispatcher
                   :events (base-event base-room)
                   :presence (base-presence base-sync)
                   :invite (base-invite base-sync)
                   :left (base-left base-sync)
                   :ephemeral (base-ephemeral base-room)
                   :listeners (list base-sync)
                   :callback (lambda (instance data)
                               (mapcar (lambda (l) (invoke-callback l data))
                                       (listeners instance))))))

