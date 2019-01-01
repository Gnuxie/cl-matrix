#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defclass room ()
  ((id :accessor id
       :initarg :id
       :initform ""
       :type string)

   (events :accessor events
           :initarg :events
           :initform nil
           :type list)

   (state :accessor state
          :initarg :state
          :initform nil
          :type list)

   (back :accessor back
         :initarg :back
         :initform ""
         :type string
         :documentation "The token representing the events we have up to backwards in time.")

   (front :accessor front
         :initarg :front
         :initform ""
         :type string
         :documentation "The token representing the events we have up to forwards in time.")

   (limit :accessor limit
          :initarg :limit
          :initform ""
          :type string
          :documentation "The number of events to return per request")))

(flet ((format-direction (dir)
         (etypecase dir
           (boolean dir)
           (integer (< 0 dir))
           (character (when (char= #\f dir) t))
           (string  (when (string= "f" dir) t)))))

  (defgeneric messages (this-room direction)
    (:documentation "fetch more messages for the room in direction"))

  (defmethod messages ((this-room room) direction)
    "Fetches messages from a room in the given direction by updating the events list for the room.

it sould be noted that the chunk blocks are most recent first in order for both directions"
    (let* ((dir (format-direction direction))
           (from (if dir (front this-room) (back this-room))))

      (multiple-value-bind (response start end) (%room-messages (id this-room) from (if dir "f" "b"))

        (if dir
            (progn ; forwards
              (unless (string= (front this-room) end)
                (setf (events this-room) (append (reverse (jsown:val response "chunk")) (events this-room)))
                (setf (front this-room) end)))
            (progn ; backwards
              (unless (string= (back this-room) end)
                (when (jsown:val response "chunk")
                  (setf (events this-room) (append (events this-room) (jsown:val response "chunk"))))
                (setf (back this-room) start))))))))

(defmethod messages ((this-room string) direction)
  (messages (get-room this-room) direction))

(defmethod print-object ((this-room room) stream)
  (print-unreadable-object (this-room stream :type t :identity t)
    (format stream "~a" (id this-room))))

(defun startup-sync ()
  "Initialises the rooms the user has joined by using the sync endpoint"
  (let* ((sync-data (account-sync))
         (front-token (jsown:val sync-data "next_batch"))
         (joined-room-data (jsown:filter sync-data "rooms" "join")))

    (setf (%rooms *account*) (make-hash-table :test 'equal :size 200))
    (setf (room-list *account*) nil)

    (jsown:do-json-keys (room-id room-data) joined-room-data
      (let ((new-room (make-instance 'room :id room-id
                                     :events (reverse (jsown:filter room-data "timeline" "events"))
                                     :front front-token
                                     :back (jsown:filter room-data "timeline" "prev_batch"))))
        (add-room room-id new-room)))))

(defgeneric filter (predicate sequence &key key start  end)
  (:documentation "filter a cl-matrix sequence"))

(defmethod filter (predicate (sequence room) &key key (start 0) end)
  (remove-if-not predicate (events sequence) :start start :key key :end end))

(defmethod filter (predicate (sequence string) &key key (start 0) end)
  (filter predicate (get-room sequence) :key key :start start :end end))

(defmethod filter (predicate (sequence list) &key key (start 0) end)
  (remove-if-not predicate sequence :start start :key key :end end))

(defmethod events ((room-id string))
  (events (get-room room-id)))
