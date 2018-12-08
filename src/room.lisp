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
    (let* ((dir (format-direction direction))
           (from (if dir (front this-room) (back this-room))))

      (multiple-value-bind (response start end) (%room-messages (id this-room) from (if dir "f" "b"))

        (if dir
            (progn ;; forwards
              (unless (string= (front this-room) end)
                (setf (events this-room) (append (jsown:val response "chunk") (events this-room)))
                (setf (back this-room) end)))
            (progn ;;backwards
              (unless (string= (back this-room) end)
                (when (jsown:val response "chunk")
                  (setf (events this-room) (append (events this-room) (reverse (jsown:val response "chunk")))))
                (setf (front this-room) start))))))))

(defmethod print-object ((this-room room) stream)
  (print-unreadable-object (this-room stream :type t :identity t)
    (format stream "~a" (id this-room))))

(defun startup-sync ()
  (let* ((sync-data (account-sync))
         (front-token (jsown:val sync-data "next_batch"))
         (joined-room-data (jsown:filter sync-data "rooms" "join"))
         (joined-rooms (user-joined-rooms)))

    (loop :for id in joined-rooms
       :do
         (let ((new-room (make-instance 'room :id id
                                        :events (reverse (jsown:filter joined-room-data id "timeline" "events"))
                                        :front front-token
                                        :back (jsown:filter joined-room-data id "timeline" "prev_batch"))))
           (add-room id new-room)))))
