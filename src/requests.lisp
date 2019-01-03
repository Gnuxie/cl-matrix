#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(defpackage :matrix-requests
  (:use :cl)
  (:export
   :get-login
   :get-room-state-event
   :post-room-leave
   :get-sync
   :post-room-forget
   :post-user-filter
   :get-user-filter
   :post-join
   :define-matrix-request
   :get-room-messages
   :post-login
   :define-matrix-endpoint
   :get-room-event
   :put-room-redact-event
   :post-room-invite
   :get-room-state-key
   :put-room-state
   :post-create-room
   :post-room-join
   :get-joined-rooms
   :matrix-post-request
   :get-room-joined-members
   :get-room-members
   :matrix-get-request
   :post-logout-all
   :put-room-send-event
   :get-room-state
   :put-room-state-key
   :post-logout
   :post-room-kick
   :post-room-ban
   :post-room-unban
   
   url-formats
   :access-token
   :homeserver))

(in-package :matrix-requests)

(defclass url-formats ()
  ((access-token :accessor access-token
                 :initarg :access-token
                 :initform nil
                 :type string)

   (homeserver   :accessor homeserver
                 :initarg :homeserver
                 :initform nil
                 :type string)))

(defmacro define-matrix-request (name type)
  `(defun ,name ,(remove-if #'null `(url url-format ,(unless (equal type ':get) 'the-json)
                                         &key
                                        (parameters nil)
                                        ,(unless (equal type ':get)
                                          '(content-type "application/json"))))
  "Make a request to a Matrix homeserver, for API calls."

  (with-accessors ((homeserver homeserver) (access-token access-token)) url-format
    (let ((url (concatenate 'string
                            "https://" homeserver url
                            (when access-token
                              (format nil "?access_token=~A" access-token))
                            (when parameters parameters))))

      (drakma:http-request
       ,@ (remove-if #'null
                     (append 
                      `(url
                        :method ,type)
                      (unless (equal type ':get)
                        '(:content the-json
                          :content-type content-type)))))))))


(define-matrix-request matrix-post-request :post)
(define-matrix-request matrix-put-request :put)
(define-matrix-request matrix-get-request :get)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (flet ((endpoint-seperation (endpoint)
           ;; splits the endpoint arguments with slashes
           (let ((x endpoint)
                 (new-endpoint nil))
             (loop
                :while (not (null (cdr x)))
                :do
                  (push (car x) new-endpoint)
                  (push "/" new-endpoint)
                  (setf x (cdr x)))
             (push (car x) new-endpoint)
             (reverse new-endpoint)))

         (endpoint-of-type (name type arguments new-concat-list &key (documentation nil documentation-p))
           ;; creates a function for the endpoint with the http method given in type
           (let ((request `(,(cond ((equal type :post) 'matrix-post-request)
                                   ((equal type :put) 'matrix-put-request)
                                   ((equal type :get) 'matrix-get-request))
                             (concatenate 'string "/_matrix/client/r0/"
                                          ,@new-concat-list)))

                 (new-name (intern (concatenate 'string (cond ((equal type :put) "PUT-")
                                                              ((equal type :post) "POST-")
                                                              ((equal type :get) "GET-"))
                                                (symbol-name name)))))

             (setf request (if (equal type :get)
                               (append request '(url-format :parameters parameters))
                               (append request '(url-format content :parameters parameters))))

             `((declaim (inline ,new-name))
               (defun ,new-name (,@(remove-if #'null `(url-format ,@arguments ,(unless (equal type :get) 'content)
                                                                   &key parameters
                                                                   callback)))
                 ,(when documentation-p documentation)
                 (if callback
                     (funcall callback ,request)
                     ,request))))))

    (defmacro define-matrix-endpoint (name accepted-methods endpoint &key (documentation nil))
      (let ((arguments (loop
                          :for item in endpoint
                          :collect (when (symbolp item) item)))

            (new-concat-list (endpoint-seperation endpoint)))
        
        `(progn
           ,@ (let ((endpoints nil))
                (loop :for method in accepted-methods :do
                     (setf endpoints (append endpoints (endpoint-of-type name method arguments new-concat-list :documentation documentation))))
                endpoints))))))

;;; also we might want to make a macro class idk for room events, see the spec.

;;; below we can just copy the api endpoints from the spec.
(define-matrix-endpoint login (:post :get)
  ("login"))

(define-matrix-endpoint logout (:post)
  ("logout"))

(define-matrix-endpoint logout-all (:post)
  ("logout" "all"))

(define-matrix-endpoint user-filter (:post)
  ("user" user-id "filter"))

(define-matrix-endpoint user-filter (:get)
  ("user" user-id "filter" filter-id))

(define-matrix-endpoint sync (:get)
  ("sync"))

(define-matrix-endpoint room-event (:get)
  ("rooms" room-id "event" event-id))

(define-matrix-endpoint room-state-key (:get)
  ("rooms" room-id "state" event-type state-key))

(define-matrix-endpoint room-state-event (:get)
  ("rooms" room-id "state" event-type))

(define-matrix-endpoint room-state (:get)
  ("rooms" room-id "state"))

(define-matrix-endpoint room-members (:get)
  ("rooms" room-id "members"))

(define-matrix-endpoint room-joined-members (:get)
  ("rooms" room-id "joined_members"))

(define-matrix-endpoint room-messages (:get)
  ("rooms" room-id "messages"))

(define-matrix-endpoint room-state-key (:put)
  ("rooms" room-id "state" event-type state-key))

(define-matrix-endpoint room-state (:put)
  ("rooms" room-id "state" event-type))

(define-matrix-endpoint room-send-event (:put)
  ("rooms" room-id "send" event-type txn-id))

(define-matrix-endpoint room-redact-event (:put)
  ("rooms" room-id "redact" event-id txn-id))

(define-matrix-endpoint create-room (:post)
  ("createRoom"))


(define-matrix-endpoint joined-rooms (:get)
  ("joined_rooms"))

(define-matrix-endpoint room-invite (:post)
  ("rooms" room-id "invite"))

(define-matrix-endpoint room-join (:post)
  ("rooms" room-id "join"))

(define-matrix-endpoint join (:post)
  ("join" room-id-or-alias))

(define-matrix-endpoint room-leave (:post)
  ("rooms" room-id "leave"))

(define-matrix-endpoint room-forget (:post)
  ("rooms" room-id "forget"))

(define-matrix-endpoint room-kick (:post)
  ("rooms" room-id "kick"))

(define-matrix-endpoint room-ban (:post)
  ("rooms" room-id "ban"))

(define-matrix-endpoint room-unban (:post)
  ("rooms" room-id "unban"))

(flet ((endpoint-p (sym)
         (let ((pack (find-package :matrix-requests)))
           (and (eql (symbol-package sym) pack)
                (or (search "GET" (symbol-name sym))
                    (search "PUT"(symbol-name sym))
                    (search "POST"(symbol-name sym)))))))

  (let ((pack (find-package :matrix-requests)))
    (do-all-symbols (sym pack)
      (when (endpoint-p sym)
        (format t "~%:~a" (string-downcase (symbol-name sym)))))))
