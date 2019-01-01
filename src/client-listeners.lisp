#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defun client-new-room ()
  (lambda (instance room-id the-room)
    (unless (member room-id (room-list *account*))
      (add-room room-id
                (make-instance 'room
                               :id room-id
                               :events (reverse (jsown:filter the-room "timeline" "events"))
                               :back (jsown:filter the-room "timeline" "prev_batch"))))))

(defun client-new-events ()
  (lambda (instance room-id event)
    (with-accessors ((events events)) (get-room room-id)
      (push event events))))

(defun client-room-front-updater ()
  (lambda (instance data)
    (let ((sync-token (jsown:filter data "next_batch")))
      (maphash (lambda (room-id the-room)
                 (setf (front the-room) sync-token))
               (%rooms *account*)))))
