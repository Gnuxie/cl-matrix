(in-package :cl-matrix)

(push '("application" . "json") drakma:*text-content-types*)

(defun account-log-in (username password)
  "'Log in' by fetching the access-token of an account."

  (let ((response (jsown:parse (post-login
                                (jsown:to-json (cons ':obj (pairlis
                                                            (list "type" "user" "password")
                                                            (list "m.login.password" username password))))))))
    (setf *access-token* (jsown:val response "access_token"))))

(defun account-log-out ()
  (post-logout "{}")

  (setf *access-token* nil))

(defun room-create (&key
                    (room-alias nil room-alias-p)
                    (visibility "private" visibility-p)
                    (name nil room-name-p)
                    (topic nil topic-p)
                    (invite nil invite-p)
                    (preset nil preset-p)
                      (is-direct nil is-direct-p))
  "Create a Matrix room. Please refer to the specification to see what should be given in the keyword args."
  
  (let ((json-to-submit (jsown:to-json
                         (cons ':obj (alist-without-nulls
                                      "room_alias_name" room-alias room-alias-p
                                      "visibility" visibility visibility-p
                                      "name" name room-name-p
                                      "topic" topic topic-p
                                      "invite" invite invite-p
                                      "preset" preset preset-p
                                      "is_direct" is-direct is-direct-p)))))
    
    (jsown:parse (post-create-room json-to-submit))))


(defun msg-send (msg room-id &key (txid (random-timestamp)) (type "m.text"))
  "Send a text message to a specific room."

  (jsown:parse (put-room-send-event room-id "m.room.message" (princ-to-string txid)
                                    (jsown:to-json (cons ':obj (pairlis
                                                                (list "msgtype" "body")
                                                                (list type msg)))))))


(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (jsown:parse (post-room-invite room-id
                                 (jsown:to-json (cons ':obj (pairlis
                                                             (list "user_id")
                                                             (list user-id)))))))

(defun invitations (user-name &key (since *sync-next-batch*) (from nil from-p))
  ;; see filters in the spec /_matrix/client/r0/user/{userId}/filter

  (let ((invitations-filter (cdadr (upload-filter
                                    user-name
                                    (if from-p
                                        (format nil
                                                "{\"event_fields\":[\"m.room.member\"], \"account_data\":{\"limit\":0, \"not_types\":[\"*\"]},\"room\":{\"account_data\":{\"senders\":[~s]}}}"
                                                from)
                                        "{\"event_fields\":[\"m.room.member\"]}")))))

    (let ((invitations (jsown:filter (account-sync :filter invitations-filter
                                                   :since since)
                                     
                                     "rooms" "invite")))
      invitations)))

(defun upload-filter (user-id filter)
  (jsown:parse (post-user-filter
                user-id
                filter)))

(defun room-join (room-id)
  "Join a Matrix room by id, not the same as alias, see the spec."

  (jsown:parse (post-room-join room-id "{}")))

(defun account-sync (&key (since *sync-next-batch*) filter)
  "see the spec, read 8.2 syncing to understand how this works."

  (let ((response (jsown:parse (get-sync :parameters
                                         (concatenate 'string
                                                      (when since
                                                        (concatenate 'string
                                                                     "&since="
                                                                     since))
                                                      (when filter
                                                        (concatenate 'string
                                                                     "&filter="
                                                                     filter)))))))
    
    (values response (jsown:val response "next_batch"))))

(defun user-joined-rooms ()
  "Fetch rooms joined by the user. This is not filtered from sync, it's an actual api call."

  (jsown:val (jsown:parse (get-joined-rooms))
             "joined_rooms"))

(defun room-joined-members (room)
  "Fetch a list of joined members for a room"
  (let ((members
         (jsown:parse (get-room-joined-members room))))
    (push room members)))

(defun rooms-joined-members (rooms)
  "Fetch the members information for all the supplied rooms"
  (let ((members (mapcar #'room-joined-members rooms)))
    (push ':obj members)))

(defun rooms-joined-members-ids (rooms)
  "Fetch the joined members as user-ids"

  (let ((members (rooms-joined-members rooms)))

    
    (cons ':obj (pairlis rooms
                         (mapcar #'(lambda (x)
                                     (list (jsown:keywords (jsown:val
                                                            (cdr x)
                                                            "joined"))))
                                 (cdr members))))))

(defun room-state (room-id &optional event-type state-key)
  "Get the state events for the current state of a room."
  (jsown:parse
   (cond ((and event-type state-key) (get-room-state-key room-id
                                                         event-type
                                                         state-key))

         (event-type (get-room-state-event room-id event-type))
         (t (get-room-state room-id)))))

(defun rooms-state (rooms &optional event-type state-key)
  (cons ':obj (pairlis rooms
                       (mapcar #'(lambda (x) (room-state x (when event-type event-type) (when state-key state-key))) rooms))))

(defun room-power-levels (room)
  "Get the power levels for the room. Maybe this should be deprecated for room-state"
  (room-state room "m.room.power_levels"))

(defun rooms-power-levels (rooms)
  "Get the power levels for all the rooms. Maybe this should be deprecated for rooms-state"
  (cons ':obj (pairlis
               rooms
               (mapcar #'list (mapcar #'room-power-levels rooms)))))

(defun change-power-level (room user-id power)
  "change the power level of a user"
  (let* ((current-levels (room-power-levels room))
         (current-users (jsown:val current-levels "users")))
    (setf (jsown:val current-users user-id) power)
    (setf (jsown:val current-levels "users") current-users)
    (jsown:parse (put-room-state room
                                 "m.room.power_levels"
                                 (jsown:to-json current-levels)))))

(defun room-forget (room-id)
  "forget a room"
  (jsown:parse (post-room-forget room-id
                                 "{}")))

(defun room-leave (room-id)
  "leave a room"
  (jsown:parse (post-room-leave room-id
                                    "{}")))

(defun random-timestamp ()
  (+ (* 100000 (get-universal-time)) (random 100000)))
