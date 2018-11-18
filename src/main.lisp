(in-package :cl-matrix)

(defparameter *homeserver* "matrix.org")
(defparameter *access-token* "")
(defparameter *sync-next-batch* nil)

(push '("application" . "json") drakma:*text-content-types*)

(defmacro define-matrix-send-request (name type)
  `(defun ,name (url the-json &key (parameters nil) (access-token *access-token*) (content-type "application/json"))
  "Make a request to a Matrix homeserver, for API calls."

  (let ((url (concatenate 'string
                          "https://" *homeserver* url
                          (when access-token
                            (format nil "?access_token=~A" *access-token*))
                          (when parameters parameters))))

    (let ((response (drakma:http-request
                     url
                     :method ,type
                     :content
                     the-json
                     :content-type content-type)))
      (jsown:parse response)))))

(define-matrix-send-request matrix-post-request :post)
(define-matrix-send-request matrix-put-request :put)

(defun matrix-get-request (url &key (parameters nil) (access-token *access-token*))
  "Make a GET request to a Matrix homeserver, for API calls."

  (let ((url (concatenate 'string
                          "https://" *homeserver* url
                          (when access-token
                            (format nil "?access_token=~A" *access-token*))
                          (when parameters parameters))))
    
    (let ((response (drakma:http-request
                     url
                     :method :get)))

      (jsown:parse response))))



(defun account-log-in (username password)
  "'Log in' by fetching the access-token of an account."

  (let ((response (matrix-post-request "/_matrix/client/r0/login"
                                       (jsown:to-json (cons ':obj (pairlis
                                                                   (list "type" "user" "password")
                                                                   (list "m.login.password" username password)))))))
    (setf *access-token* (jsown:val response "access_token"))))

(defun account-log-out ()
  (matrix-post-request "/_matrix/client/r0/logout"
                       "{}")

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
    
    (matrix-post-request "/_matrix/client/r0/createRoom"
                         json-to-submit)))


(defun msg-send (msg room-id txid)
  "Send a text message to a specific room."

  (matrix-put-request (concatenate 'string "/_matrix/client/r0/rooms/" room-id "/send/m.room.message/" txid)
                      (jsown:to-json (cons ':obj (pairlis
                                                  (list "msgtype" "body")
                                                  (list "m.text" msg))))))


(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (matrix-post-request (concatenate 'string "/_matrix/client/r0/rooms/" room-id "/invite")
                       (jsown:to-json (cons ':obj (pairlis
                                                   (list "user_id")
                                                   (list user-id))))))

(defun invitations (user-name &key (since *sync-next-batch*) (from nil from-p))
  ;; see filters in the spec /_matrix/client/r0/user/{userId}/filter

  (let ((invitations-filter (cdadr (post-filter
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

(defun post-filter (user-id filter)
  (let ((response (matrix-post-request
                   (concatenate 'string
                                "/_matrix/client/r0/user/"
                                user-id
                                "/filter")
                   filter)))
    response))

(defun room-join (room-id)
  "Join a Matrix room by id, not the same as alias, see the spec."

  (matrix-post-request (concatenate 'string "/_matrix/client/r0/rooms/"
                                    room-id
                                    "/join")
                       "{}"))

(defun account-sync (&key (since *sync-next-batch*) filter)
  "Fetch all of the data of a Matrix account.
  Updates *sync-next-batch*"

  (let ((response (matrix-get-request "/_matrix/client/r0/sync"
                                      :parameters
                                      (concatenate 'string
                                                   (when since
                                                     (concatenate 'string
                                                                  "&since="
                                                                  since))
                                                   (when filter
                                                     (concatenate 'string
                                                                  "&filter="
                                                                  filter))))))
    
    (setf *sync-next-batch* (jsown:val response "next_batch"))
    response))

(defun get-room-data (sync-data)
  "deprecated
Single out room data from data of :account-sync or :account-sync-since."

  (cdr (nth 2 (nth 7 sync-data))))

(defun room-messages (sync-data)
  "deprecated
Single out lists messages by room from data of :account-sync or :account-sync-since."

  (let ((rooms (get-room-data sync-data)))
    (mapcar (lambda (x) (nth 2 x)) rooms)))

(defun user-joined-rooms ()
  "Fetch rooms joined by the user. This is not filtered from sync, it's an actual api call."

  (jsown:val (matrix-get-request "/_matrix/client/r0/joined_rooms")
             "joined_rooms"))

(defun room-joined-members (room)
  "Fetch a list of joined members for a room"
  (let ((members
         (matrix-get-request (concatenate 'string "/_matrix/client/r0/rooms/"
                                          room
                                          "/joined_members"))))
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

(defun room-power-levels (room)
  "Fetch the power levels for the room"
  (matrix-get-request (concatenate 'string
                                   "/_matrix/client/r0/rooms/"
                                   room
                                   "/state/m.room.power_levels")))

(defun rooms-power-levels (rooms)
  "Fetch the power levels for all the rooms"
  (cons ':obj (pairlis
               rooms
               (mapcar #'list (mapcar #'room-power-levels rooms)))))

(defun change-power-level (room user-id power)
  "change the power level of a user"
  (let* ((current-levels (room-power-levels room))
         (current-users (jsown:val current-levels "users")))
    (setf (jsown:val current-users user-id) power)
    (setf (jsown:val current-levels "users") current-users)
    (matrix-put-request (concatenate 'string
                                     "/_matrix/client/r0/rooms/"
                                     room
                                     "/state/m.room.power_levels")
                        (jsown:to-json current-levels))))

(defun room-forget (room-id)
  "forget a room"
  (matrix-post-request (concatenate 'string
                                    "/_matrix/client/r0/rooms/"
                                    room-id
                                    "/forget")
                       "{}"))

(defun room-leave (room-id)
  "leave a room"
  (matrix-post-request (concatenate 'string
                                    "/_matrix/client/r0/rooms/"
                                    room-id
                                    "/leave")
                       "{}"))
