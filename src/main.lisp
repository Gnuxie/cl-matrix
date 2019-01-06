#| This file is part of cl-matrix
   Copyright (C) 2018 Jaidyn Lev
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(push '("application" . "json") drakma:*text-content-types*)
(defparameter *account* (make-instance 'matrix-requests:url-formats))

(defun login (username password)
  "calls the api endpoint post-login with the username and password.
makes a new cl-matrix:account object with the username and password.
sets the access-token slot of the account object to the one returned in the response.
returns the account object.

See make-account
See with-account"

  (let ((new-account (make-instance 'account :username username :password password :homeserver (get-hostname username))))
    (let ((response (jsown:parse (post-login new-account
                                             (jsown:to-json (cons ':obj (pairlis
                                                                         (list "type" "user" "password" "initial_device_display_name")
                                                                         (list "m.login.password" username password "(λ () 'cl-matrix)"))))))))

      
      (setf (access-token new-account) (jsown:val response "access_token"))
      new-account)))

(defun logout ()
  (post-logout *account* "{}")

  (setf (access-token *account*) nil))

(defun logout-all ()
  (post-logout-all *account* "{}")
  (setf (access-token *account*) nil))

(defun room-create (&key
                    (room-alias nil room-alias-p)
                    (visibility "private" visibility-p)
                    (name nil room-name-p)
                    (topic nil topic-p)
                    (invite nil invite-p)
                    (preset nil preset-p)
                      (is-direct nil is-direct-p))
  "Create a Matrix room. Please refer to the specification to see what should be given in the keyword args."

  (labels ((room-create-json (json)
             (funcall (generate-generic-callback #'room-create-json json)
                      (post-create-room *account* json))))
    
    (let ((json-to-submit (jsown:to-json
                           (cons ':obj (alist-without-nulls
                                        "room_alias_name" room-alias room-alias-p
                                        "visibility" visibility visibility-p
                                        "name" name room-name-p
                                        "topic" topic topic-p
                                        "invite" invite invite-p
                                        "preset" preset preset-p
                                        "is_direct" is-direct is-direct-p)))))

      ;; this needs sorting out. The problem is we don't want to do all that work creating a room object again
      ;; so we should either make some representation of a room or make a function that can just take this.
      (room-create-json json-to-submit))))

(defun msg-send (msg room-id &key (txid (random-timestamp)) (type "m.text"))
  "Send a text message to a specific room."

  (put-room-send-event *account* room-id "m.room.message" (princ-to-string txid)
                       (jsown:to-json (cons ':obj (pairlis
                                                   (list "msgtype" "body")
                                                   (list type msg))))
                       :callback (generate-generic-callback #'msg-send msg room-id :txid txid :type type)))

(defun room-redact (room-id event-id reason &key txid (random-timestamp))
  "redact an event in a room. txid is a `(random-timestamp)` by default."
  (let ((json (format nil "{\"reason\": \"~a\"}" reason)))
    (put-room-redact-event *account* room-id event-id txid json
                           :callback (generate-generic-callback #'room-redact room-id event-id reason :txid txid))))


(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (post-room-invite *account* room-id
                    (jsown:to-json (cons ':obj (pairlis
                                                (list "user_id")
                                                (list user-id))))
                    :callback (generate-generic-callback #'user-invite user-id room-id)))

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
  (jsown:val (post-user-filter *account*
                                user-id
                                filter
                                :callback (generate-generic-callback #'upload-filter user-id filter))
             "filter_id"))


(defun room-join (room-id)
  "Join a Matrix room by id, not the same as alias, see the spec."

  (post-room-join *account* room-id "{}"
                  :callback (generate-generic-callback #'room-join room-id)))

(defun account-sync (&key since filter)
  "see the spec, read 8.2 syncing to understand how this works."

  (let ((response (jsown:parse (get-sync *account*
                                         :parameters
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

(defun now-token ()
  "returns a pagination token for now using sync, useful to get the starting token for sync if the user has a lot of rooms and messages.

This is really useful if the account is in a lot of rooms and sync will try return GiB's of messages with no filter."

  (let ((filter (upload-filter (username *account*) "{\"room\":{\"state\":{\"lazy_load_members\":true},\"timeline\":{\"limit\":0}}}")))
    (nth-value 1 (account-sync :filter filter))))

(defun user-joined-rooms ()
  "Fetch rooms joined by the user. This is not filtered from sync, it's an actual api call."

  (jsown:val (jsown:parse (get-joined-rooms *account*))
             "joined_rooms"))

(defun room-joined-members (room)
  "Fetch a list of joined members for a room"
  (let ((members
         (jsown:parse (get-room-joined-members *account* room))))
    members))

(defun rooms-joined-members (rooms)
  "Fetch the members information for all the supplied rooms"
  (let ((members (mapcar #'room-joined-members rooms)))
    (cons ':obj (pairlis rooms
                         members))))

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
   (cond ((and event-type state-key) (get-room-state-key *account
                                                         room-id
                                                         event-type
                                                         state-key))

         (event-type (get-room-state-event *account* room-id event-type))
         (t (get-room-state *account* room-id)))))

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
    (put-room-state *account*
                    room
                    "m.room.power_levels"
                    (jsown:to-json current-levels)
                    :callback (generate-generic-callback #'change-power-level room user-id power))))

(defun room-forget (room-id)
  "forget a room"
  (post-room-forget *account*
                    room-id
                    "{}"
                    :callback (generate-generic-callback #'room-forget room-id)))

(defun room-leave (room-id)
  "leave a room"
  (post-room-leave *account*
                   room-id
                   "{}"
                   :callback (generate-generic-callback #'room-leave room-id)))

(defun room-kick (user-id reason &rest room-ids)
  (let ((json (jsown:to-json (list* ':obj (pairlis
                                           '("reason" "user_id")
                                           (list reason user-id))))))

    (labels ((room-kick-json (room-id json)
               (post-room-kick *account*
                               room-id
                               json
                               :callback (generate-generic-callback #'room-kick-json room-id json)))) 

      (dolist (room-id room-ids)
        (room-kick-json room-id
                        json)))))

(defun room-ban (user-id reason &rest room-ids)
  (let ((jsown (jsown:to-json (cons ':obj (pairlis
                                           '("reason" "user_id")
                                           (list reason user-id))))))

    (labels ((room-ban-json (room-id json)
               (post-room-ban *account*
                              room-id
                              json
                              :callback (generate-generic-callback #'room-ban-json room-id json))))

      (dolist (room-id room-ids)
        (room-kick-json room-id
                        json)))))

(defun room-messages (room-id from dir &key to limit filter)
  "see the spec for this one.
returns the response, the start token and then the end token

if moving backwards the most recent events will appear first in the chunk.
if moving forwards the most recent events will appear last in the chunk.

This is because the paginator has to return the events nearest the front token first, ie, the events nearest the from token will be closer to the front."
  (let ((response
         (jsown:parse (get-room-messages *account*
                                         room-id
                                         :parameters
                                         (concatenate 'string
                                                      "&from="
                                                      from
                                                      "&dir="
                                                      dir
                                                      (when to
                                                        (concatenate 'string
                                                                     "&to="
                                                                     to))
                                                      (when filter
                                                        (concatenate 'string
                                                                     "&filter="
                                                                     filter))

                                                      (when limit
                                                        (concatenate 'string
                                                                     "&limit="
                                                                     limit)))))))

    (values (jsown:val response "chunk") (jsown:val response "start") (jsown:val response "end"))))

(defun n-messages (room-id from dir n &key to filter)
  "returns a minimum number of messages from a room, if there that many

alright, i don't think this is necessary.

returns values the event-list, the end of the chunk and the number of messages returned.

TODO maybe make n optional, returning all messages by default?
maybe allow user defined predicates for terminating pagination."
  (let ((messages nil)
        (current-number 0)
        (morep t))
    (loop :while (and morep (> n current-number)) :do
         (multiple-value-bind (new-messages start end) (room-messages room-id from dir :to to :limit (princ-to-string (- n current-number)) :filter filter)
           (if (null new-messages)
               (setf morep nil)
               (progn
                 (setf messages (append messages new-messages))
                 (setf current-number (+ current-number (length new-messages)))
                 (setf from end)))))

    (values messages from current-number)))

(defun all-messages (room-id from dir &key to filter)
  (let ((messages nil)
        (morep t))
    (loop :while morep :do
         (multiple-value-bind (new-messages start end) (room-messages room-id from dir :to to :limit "1000" :filter filter)
           (if (null new-messages)
               (setf morep nil)
               (progn (setf messages (append messages new-messages))
                      (setf from end)))))
    (values messages from)))


(defun random-timestamp ()
  (+ (* 100000 (get-universal-time)) (random 100000)))
