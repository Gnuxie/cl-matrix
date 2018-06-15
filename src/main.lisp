(in-package :cl-matrix)

(defun matrix-post-request (url post-pairlis &optional (access-token nil) (content-type "application/json"))
  "Make a POST request to a Matrix homeserver, for API calls."

  (let ((url (concatenate `string
                          "http://" *homeserver* url
                          (if access-token
                            (format nil "?access_token=~A" *access-token*)))))
  (json:decode-json-from-string
    (s-http-client:do-http-request
      (concatenate `string "http://" *homeserver* url)
      :method :post
      :content
      (json:encode-json-alist-to-string
        post-partlis)
      :content-type content-type))))


(defun matrix-get-request (url &optional (access-token))
  "Make a GET request to a Matrix homeserver, for API calls."

  (let ((url (concatenate `string
                          "http://" *homeserver* url
                          (if access-token
                            (format nil "?access_token=~A" *access-token*)))))
    (json:decode-json-from-string
      (s-http-client:do-http-request
        url
        :method get))))



(defun account-log-in (username password)
  "'Log in' by fetching the access-token of an account."

  (cdr (assoc `:access--token
              (matrix-post-request "/_matrix/client/r0/login"
                                   (pairlis
                                     (list `type `user `password)
                                     (list "m.login.password" username password))))))



(defun room-create (room-name)
  "Create a Matrix room."

  (matrix-post-request "/_matrix/client/r0/createRoom" `T
                       (pairlis
                         (list `room_alias_name)
                         (list room-name))
                       `T))


(defun msg-send (msg room-id)
  "Send a text message to a specific room."

  (matrix-post-request (concatenate `string "/_matrix/client/r0/rooms/" room-id)
                       (pairlis
                         (list `msgtype `body)
                         (list "m.text" msg))
                       `T))


(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (matrix-post-request (concatenate `string "/_matrix/client/r0/rooms/" room-id "/invite")
                         (pairlis
                           (list `user_id)
                           (list user-id))
                         `T))


(defun room-join (room-id)
  "Join a Matrix room-- currently NOT WORKING."

  (matrix-get-request (concatenate `string "/_matrix/client/r0/rooms/"
                                    (s-http-client:uri-encode-for-query room-id)
                                    "/join")
                       `T))


(defun account-sync ()
  "Fetch all of the data of a Matrix account."

  (matrix-get-request "/_matrix/client/r0/sync" `T))


(defun account-sync-since (since-value)
  "Sync the account data since a certain special time-stamp."

  (matrix-get-request (concatenate `string
                                   "/_matrix/client/r0/sync?access_token="
                                   *access-token*
                                   "&since="
                                   since-value)
                      nil))


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

  (mapcar #`string-downcare
          (cdr (car (matrix-get-request "/_matrix/client/r0/joined_rooms" `T)))))
