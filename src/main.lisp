#| This file is part of cl-matrix
   Copyright (C) 2018 Jaidyn Lev
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defparameter *account* (make-instance 'auth :homeserver "matrix.org"))

(defun login (username password &optional (scheme "https://"))
  "calls the api endpoint post-login with the username and password.
makes a new cl-matrix:account object with the username and password.
sets the access-token slot of the account object to the one returned in the response.
returns the account object.

See make-account
See with-account"

  (let ((new-account (make-instance 'account :username username :homeserver (get-hostname username)
                                    :protocol scheme)))
    (let ((response
           (post-login new-account
                       (jsown:to-json
                        (cons :obj (pairlis
                                    (list "type" "user" "password" "initial_device_display_name")
                                    (list "m.login.password" username password "(λ () 'cl-matrix)")))))))
      
      (setf (access-token new-account) (jsown:val response "access_token"))
      new-account)))

(defun logout ()
  (post-logout *account* "{}")

  (setf (access-token *account*) ""))

(defun logout-all ()
  (post-logout/all *account* "{}")
  (setf (access-token *account*) ""))

(defun room-create (&key
                    (room-alias nil room-alias-p)
                    (visibility "private" visibility-p)
                    (name nil room-name-p)
                    (topic nil topic-p)
                    (invite nil invite-p)
                      (preset nil preset-p)
                      (initial-state nil initial-state-p)
                      (power-level-content-override nil power-level-content-override-p)
                      (is-direct nil is-direct-p))
  "Create a Matrix room. Please refer to the specification to see what should be given in the keyword args.

Returns the room-id for the created room."

  (let ((json-to-submit (jsown:to-json
                         (cons :obj (alist-without-nulls
                                      "room_alias_name" room-alias room-alias-p
                                      "visibility" visibility visibility-p
                                      "name" name room-name-p
                                      "topic" topic topic-p
                                      "invite" invite invite-p
                                      "preset" preset preset-p
                                      "initial_state" initial-state initial-state-p
                                      "power_level_content_override" power-level-content-override power-level-content-override-p
                                      "is_direct" is-direct is-direct-p)))))

    (jsown:val (post-createroom *account* json-to-submit) "room_id")))

(defun msg-send (msg room-id &key (txid (random-timestamp)) (type "m.text") event-id)
  "Send a text message to a specific room."

  (let ((json
         (remove-if #'null `(:obj ("msgtype" . ,type)
                             ("body" . ,msg)
                             ,(when event-id
                               `("m.relates_to" . (:obj ("m.in_reply_to" . (:obj ("event_id" . ,event-id))))))))))
    
    (put-rooms/roomid/send/eventtype/txnid *account* room-id "m.room.message" (princ-to-string txid)
                                           (jsown:to-json json))))

(defun room-redact (room-id event-id reason &key (txid (random-timestamp)))
  "redact an event in a room. txid is a `(random-timestamp)` by default."
  (let ((json (format nil "{\"reason\": \"~a\"}" reason)))
    (put-rooms/roomid/redact/eventid/txnid *account* room-id event-id txid json)))

(defun user-invite (user-id room-id)
  "Invite a user to a chat-room."

  (post-rooms/roomid/invite *account* room-id
                    (jsown:to-json (cons :obj (pairlis
                                                (list "user_id")
                                                (list user-id))))))

(defun invitations (&key since (from nil from-p))
  "attampts to return just the invitations from sync.

See UPLOAD-FILTER
See ACCOUNT-SYNC
See filters in the spec /_matrix/client/r0/user/{userId}/filter"

  (let ((invitations-filter (upload-filter
                             (if from-p
                                 (format nil
                                         "{\"event_fields\":[\"m.room.member\"], \"account_data\":{\"limit\":0, \"not_types\":[\"*\"]},\"room\":{\"account_data\":{\"senders\":[~s]}, \"state\":{\"lazy_load_members\":true},\"timeline\":{\"limit\":0}}}"
                                         from)
                                 "{\"event_fields\":[\"m.room.member\"], \"room\":{\"state\":{\"lazy_load_members\":true},\"timeline\":{\"limit\":0}}}"))))

    (let ((invitations (jsown:filter (account-sync :filter invitations-filter
                                                   :since since)
                                     
                                     "rooms" "invite")))
      invitations)))

(defun upload-filter (filter)
  (jsown:val (post-user/userid/filter *account*
                                (cl-matrix:username *account*)
                                filter)
             "filter_id"))

(defun room-join (&rest room-ids)
  "Join a Matrix room by id, not the same as alias, see the spec."

  (flet ((join-room (room-id)
           (post-rooms/roomid/join *account* room-id "{}")))
    (mapc #'join-room room-ids)))

(defun account-sync (&key since filter)
  "see the spec, read 8.2 syncing to understand how this works."

  (let ((response (get-sync *account*
                            :parameters
                            `(("since" . ,since) ("filter" . ,filter)))))
    
    (values response (jsown:val response "next_batch"))))

(defun now-token ()
  "returns a pagination token for now using sync, useful to get the starting token for sync if the user has a lot of rooms and messages.

This is really useful if the account is in a lot of rooms and sync will try return GiB's of messages with no filter."

  (let ((filter (upload-filter "{\"room\":{\"state\":{\"lazy_load_members\":true},\"timeline\":{\"limit\":0}}}")))
    (nth-value 1 (account-sync :filter filter))))

(defun user-joined-rooms ()
  "Fetch rooms joined by the user. This is not filtered from sync, it's an actual api call."

  (jsown:val (get-joined-rooms *account*)
             "joined_rooms"))

(defun room-joined-members (room)
  "Fetch a list of joined members for a room"
  (get-rooms/roomid/members *account* room))

(defun rooms-joined-members ( rooms)
  "Fetch the members information for all the supplied rooms"
  (let ((members (mapcar #'room-joined-members rooms)))
    (cons :obj (pairlis rooms
                        members))))

(defun rooms-joined-members-ids (rooms)
  "Fetch the joined members as user-ids"

  (let ((members (rooms-joined-members rooms)))

    
    (cons :obj (pairlis rooms
                        (mapcar #'(lambda (x)
                                     (list (jsown:keywords (jsown:val
                                                            (cdr x)
                                                            "joined"))))
                                 (cdr members))))))

(defun room-state (room-id &optional event-type state-key)
  "Get the state events for the current state of a room."
  (cond ((and event-type state-key)
         (get-rooms/roomid/state/eventtype/statekey *account* room-id event-type state-key))

        (event-type (get-rooms/roomid/state/eventtype *account* room-id event-type))
        
        (t (get-rooms/roomid/state *account* room-id))))

(defun rooms-state (rooms &optional event-type state-key)
  (cons :obj (pairlis rooms
                      (mapcar #'(lambda (x) (room-state x (when event-type event-type) (when state-key state-key))) rooms))))

(defun change-power-level (room user-id power)
  "change the power level of a user"
  (let* ((current-levels (room-state room "m.room.power_levels"))
         (current-users (jsown:val current-levels "users")))
    (setf (jsown:val current-users user-id) power)
    (setf (jsown:val current-levels "users") current-users)
    (put-rooms/roomid/state/eventtype *account*
                    room
                    "m.room.power_levels"
                    (jsown:to-json current-levels))))

(defun room-forget (room-id)
  "forget a room"
  (post-rooms/roomid/forget *account*
                    room-id
                    "{}"))

(defun room-leave (room-id)
  "leave a room"
  (post-rooms/roomid/leave *account*
                   room-id
                   "{}"))

(defun room-kick (user-id reason &rest room-ids)
  (let ((json (jsown:to-json (list* ':obj (pairlis
                                           '("reason" "user_id")
                                           (list reason user-id))))))
    (dolist (room-id room-ids)
      (post-rooms/roomid/kick *account* room-id json))))

(defun room-ban (user-id reason &rest room-ids)
  (let ((json (jsown:to-json (cons :obj (pairlis
                                           '("reason" "user_id")
                                           (list reason user-id))))))
    (dolist (room-id room-ids)
      (post-rooms/roomid/ban *account* room-id json))))

(defun room-put-state (event-type content &rest room-ids)
  "add a state event to each room."
  (dolist (room-id room-ids)
    (put-rooms/roomid/state/eventtype *account*
                    room-id
                    event-type
                    content)))

;;; we aren't doing anything if this fails? is that good or bad? should come back to it.
;;; maybe let the user do the unless part? bind the other syms to nil unless capture.
(defmacro destructure-mxc-uri ((capture-sym domain-sym id-sym) mxc-uri &body body)
  `(let ((,capture-sym (nth-value 1 (cl-ppcre:scan-to-strings "mxc:\\/\\/([^\\/]*)\\/(\\S*)" ,mxc-uri))))
     (unless (null ,capture-sym)
       (let ((,domain-sym (aref ,capture-sym 0))
             (,id-sym (aref ,capture-sym 1)))
         ,@body))))

(defun download-media (mxc-url &optional filename)
  (declare (type string mxc-url))
  (destructure-mxc-uri (result domain id) mxc-url
    (if filename
        (cl-matrix.api.media:get-download/servername/mediaid/filename *account* domain id filename)
        (cl-matrix.api.media:get-download/servername/mediaid *account* domain id))))

;;; maybe we could fetch the media config and check it's within the upload size?
;;; doesn't matter really, we do have a condition for it either way.
(defun upload-media (content &key (content-type "application/json") filename)
  (if filename
      (cl-matrix.api.media:post-upload *account* content :content-type content-type :parameters `(("filename" . ,filename)))
      (cl-matrix.api.media:post-upload *account* content :content-type content-type)))

;;; also for this and download-media, do we need to return all the headers or just the ones that are important in the spec
;;; and we could also return these as values not as the assoc list from drakma / dexador
(defun thumbnail (mxc-url &key width height method)
  "get a thumbnail, method must be one of \"crop\" or \"scale\"

the arguments have to be string
will return the headers as a second value."
  (declare (type string mxc-url))
  (destructure-mxc-uri (result domain id) mxc-url
    (get-thumbnail/servername/mediaid *account* domain id
                                      :parameters
                                      (delete-if #'null
                                                 `(("width" . ,width)
                                                   ("height" . ,height)
                                                   ("method" . ,method))
                                                 :key #'cdr))))

(defun preview-url (url &optional ts)
  (declare (type string url))
  (get-preview-url *account* :parameters
                   (delete-if #'null
                              `(("url" . ,url)
                                ("ts" . ,ts))
                              :key #'cdr)))

(defun room-messages (room-id from dir &key to limit filter)
  "see the spec for this one.
returns the response, the start token and then the end token

if moving backwards the most recent events will appear first in the chunk.
if moving forwards the most recent events will appear last in the chunk.

This is because the paginator has to return the events nearest the from token first, ie, the events nearest the from token will be closer to the front."
  (let ((response
         (get-rooms/roomid/messages *account*
                            room-id
                            :parameters
                            `(("from" . ,from)
                              ("dir" . ,dir)
                              ("to" . ,to)
                              ("filter" . ,filter)
                              ("limit" . ,limit)))))

    (values (jsown:val response "chunk") (jsown:val response "start") (jsown:val response "end"))))

(defun n-messages (room-id from dir n &key to filter)
  "returns a minimum number of messages from a room, if there that many

alright, i don't think this is necessary.

returns values the event-list, the end of the chunk and the number of messages returned.

TODO maybe make n optional, returning all messages by default?
maybe allow user defined predicates for terminating pagination.

This is deprecated in favour of the history-generator, which is much easier to use."
  (let ((messages nil)
        (current-number 0)
        (morep t))
    (loop :while (and morep (> n current-number)) :do
         (multiple-value-bind (new-messages start end) (room-messages room-id from dir :to to :limit (princ-to-string (- n current-number)) :filter filter)
           (declare (ignorable start))
           (if (null new-messages)
               (setf morep nil)
               (progn
                 (setf messages (append messages new-messages))
                 (incf current-number (length new-messages))
                 (setf from end)))))

    (values messages from current-number)))

(defun get-creation-event (room-id)
  "the room-creation event and the pagination token that will be the very start of the rooms timeline."
  (multiple-value-bind (chunk start next)
      (room-messages room-id "END" "b" :filter "{\"types\":[\"m.room.create\"]}")
    (declare (ignore start))
    (values (car chunk) next)))

(defun history-generator (room-id &key start-token filter to (direction "f"))
  "returns a closure that accepts a limit and returns a list of events.
When no more events can be found, will return NIL."
  (let ((start-token (or start-token (nth-value 1 (get-creation-event room-id))))
        (room-id room-id))
    (lambda (&optional (limit "50"))
      (multiple-value-bind (chunk start next)
          (room-messages room-id start-token direction :limit limit :filter filter :to to)
        (declare (ignore start))
        (setf start-token next)
        chunk))))

(defun random-timestamp ()
  (+ (* 100000 (get-universal-time)) (random 100000)))
