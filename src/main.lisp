(in-package :cl-matrix)

(defparameter *homeserver* "matrix.org")
(defparameter *access-token* "")
(defparameter *sync-next-batch* nil)
(defparameter *invitations-filter* nil)

(push '("application" . "json") drakma:*text-content-types*)

(defmacro define-matrix-send-request (name type)
  `(defun ,name (url post-pairlis &key (parameters nil) (access-token *access-token*) (content-type "application/json"))
  "Make a request to a Matrix homeserver, for API calls."

  (let ((url (concatenate 'string
                          "https://" *homeserver* url
                          (when access-token
                            (format nil "?access_token=~A" *access-token*))
                          (when parameters parameters))))
    
    (jsown:parse (drakma:http-request
                                   url
                                   :method ,type
                                   :content
                                   (jsown:to-json post-pairlis)
                                   :content-type content-type)))))

(define-matrix-send-request matrix-post-request :post)
(define-matrix-send-request matrix-put-request :put)

(defun matrix-get-request (url &key (parameters nil) (access-token *access-token*))
  "Make a GET request to a Matrix homeserver, for API calls."

  (let ((url (concatenate 'string
                          "https://" *homeserver* url
                          (when access-token
                            (format nil "?access_token=~A" *access-token*))
                          (when parameters parameters))))
    
    (jsown:parse (drakma:http-request
                                   url
                                   :method :get))))



(defun account-log-in (username password)
  "'Log in' by fetching the access-token of an account."

  (let ((response (matrix-post-request "/_matrix/client/r0/login"
                                       (cons ':obj (pairlis
                                                    (list "type" "user" "password")
                                                    (list "m.login.password" username password))))))
    (setf *access-token* (jsown:val response "access_token"))))



(defun room-create (room-name)
  "Create a Matrix room."

  (matrix-post-request "/_matrix/client/r0/createRoom"
                       (push ':obj (pairlis
                                    (list "room_alias_name")
                                    (list room-name)))))


(defun msg-send (msg room-id txid)
  "Send a text message to a specific room."

  (matrix-put-request (concatenate 'string "/_matrix/client/r0/rooms/" room-id "/send/m.room.message/" txid)
                      (push ':obj (pairlis
                                   (list "msgtype" "body")
                                   (list "m.text" msg)))))


(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (matrix-post-request (concatenate 'string "/_matrix/client/r0/rooms/" room-id "/invite")
                       (push ':obj (pairlis
                                     (list "user_id")
                                     (list user-id)))))

(defun invitations (&optional (since *sync-next-batch*))
  ;; see filters in the spec /_matrix/client/r0/user/{userId}/filter
  ;;(jsown:val (jsown:val (account-sync :filter "{\"event\":{\"types\":\"invite\"}}") "rooms") "invites")

  (unless *invitations-filter* (setf *invitations-filter*
                                     (cdr (car (cdr (post-filter
                                                     "@richardstallman:matrix.org"
                                                     (jsown:parse "{\"event_fields\":[\"m.room.member\"]}")))))))

  (let ((invitations (jsown:val (jsown:val (account-sync :filter *invitations-filter*
                                                         :since since) "rooms") "invite")))
    invitations))

(defun post-filter (user-id filter)
  (let ((response (matrix-post-request
                   (concatenate 'string
                                "/_matrix/client/r0/user/"
                                user-id
                                "/filter")
                   filter)))
    response))

(defun room-join (room-id)
  "Join a Matrix room-- currently NOT WORKING."

  (matrix-get-request (concatenate 'string "/_matrix/client/r0/rooms/"
                                    room-id
                                    "/join")))

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
  "Single out room data from data of :account-sync or :account-sync-since."

  (cdr (nth 2 (nth 7 sync-data))))

(defun room-messages (sync-data)
  "Single out lists messages by room from data of :account-sync or :account-sync-since."

  (let ((rooms (get-room-data sync-data)))
    (mapcar (lambda (x) (nth 2 x)) rooms)))


(defun room-sync-to-intern-id (sync-id)
  "Convert malformed room IDs from sync data to 'internal ID'. Since in the JSON sync
  data, room-names are stored in all caps, while the actual room-names are in mixed-caps,
  cl-matrix converts both sync-data and actual room-names into all downcase for internal
  use."

  (string-downcase
    (cl-strings:replace-all
      (cl-strings:replace-all sync-id "-" "") "+" "")))


(defun user-joined-rooms ()
  "Fetch rooms joined by the user."

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
                        current-levels)))



