(in-package :cl-matrix)

(defun account-log-in (username password)
	(let ((access-token "")
		(error "")
		(result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://" *homeserver* "/_matrix/client/r0/login")
				:method :post
				:content
				(json:encode-json-alist-to-string
					(pairlis
						(list `type `user `password)
						(list "m.login.password" username password)))
				:content-type "application/json"))))

	(setq access-token (cdr (assoc `:access--token result))	)
	(setq error (cdr (assoc `:errcode result)))

	(if access-token
		access-token)))


(defun room-create (room-name)
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/createRoom?access_token="
						*access-token*)
				:method :post
				:content
				(json:encode-json-alist-to-string
					(pairlis
						(list `room_alias_name)
						(list room-name)))
				:content-type "application/json"))))
	result))
;;	(if result
;;		(cdr (assoc `:room--id result)))))


(defun msg-send (msg room-id)
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/rooms/"
						room-id
						"/send/m.room.message?access_token="
						*access-token*)
				:method :post
				:content
				(json:encode-json-alist-to-string
					(pairlis
						(list `msgtype `body)
						(list "m.text" msg)))
				:content-type "application/json"))))
	(if result
		(cdr (assoc `:event--id result)))))

(defun user-invite (user-id room-id)
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/rooms/"
						room-id
						"/invite?access_token="
						*access-token*)
				:method :post
				:content
				(json:encode-json-alist-to-string
					(pairlis
						(list `user_id)
						(list user-id)))
				:content-type "application/json"))))
	result))

;; non-working `o`
(defun room-join (room-id)
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/rooms/"
						(s-http-client:uri-encode-for-query room-id)
						"/join?access_token="
						*access-token*)
				:method :get))))
	result))


(defun account-sync ()
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/sync?access_token="
						*access-token*)
				:method :get))))
	result))

(defun account-sync-since (since-value)
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/sync?access_token="
						*access-token*
						"&since="
						since-value)
				:method :get))))
	result))

(defun get-room-data (sync-data)
	(cdr (nth 2 (nth 7 sync-data))))

	
(defun room-messages (sync-data)
	(let ((rooms (get-room-data sync-data))
		(x 0))
	
	(mapcar (lambda (x) (nth 2 x)) rooms)))


(defun room-sync-to-intern-id (sync-id)
	(string-downcase (cl-strings:replace-all (cl-strings:replace-all sync-id "-" "") "+" "")))

(defun room-sync-to-room-id (sync-id)
;;	(!S-N-BCO-OBNVE-+NV+-RVB-CY-T:MATRIX.ORG
	(loop
		:for x
		:from 0
		:to (- (length sync-id) 1)
		:do 

		(setq char (char sync-id x))

		(if (not (or (eq char #\-) (eq char #\+)))
			(if (eq upcase-state 1)
				(setq char-list (append char-list (list (char (string-upcase (string char)) 0))))
				(setq char-list (append char-list (list (char (string-downcase (string char)) 0))))))

		(if (eq upcase-state 1)
			(if (eq super-upcase 0)
				(setq upcase-state 0)
				(setq super-upcase 0)))

		(if (eq upcase-state 1)
			(setq upcase-state 0))

		(if (eq char #\-)
			(setq upcase-state 1)))

		(if (eq char #\+)
			(setq upcase-state 1))
		(if (eq char #\+)
			(setq super-upcase 1))


		(list-to-string char-list))

(defun list-to-string (list)
   "Converts a list of characters to a string."
        (reduce `string-concat
                (mapcar `string list)))


(defun user-joined-rooms ()
	(let
		((result (json:decode-json-from-string
			(s-http-client:do-http-request
				(concatenate `string "http://"
						*homeserver*
						"/_matrix/client/r0/joined_rooms?access_token="
						*access-token*)
				:method :get))))
	(setq result
		(mapcar #'string-downcase (cdr (car result))))

	result))
	
