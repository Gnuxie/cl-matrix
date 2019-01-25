#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :matrix-requests)

(defclass auth ()
  ((access-token :accessor access-token
                 :initarg :access-token
                 :initform nil
                 :type string)

   (homeserver   :accessor homeserver
                 :initarg :homeserver
                 :initform nil
                 :type string)))

(defmacro define-matrix-request (name type)
  `(defun ,name ,(remove-if #'null `(url authentication ,(unless (equal type ':get) 'the-json)
                                         &key
                                        (parameters nil)
                                        ,(unless (equal type ':get)
                                          '(content-type "application/json"))))
  "Make a request to a Matrix homeserver, for API calls."

  (with-accessors ((homeserver homeserver) (access-token access-token)) authentication
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

(defmacro guard-request (request)
  `(labels ((handle-request (request)
              (let ((response (jsown:parse request)))
                (if (jsown:keyp response "error")
                    (let ((errcode (jsown:val response "errcode"))
                          (error-msg (jsown:val response "error")))
                      (cond ((search "M_LIMIT_EXCEEDED" errcode)
                             (sleep (/ (jsown:val response "retry_after_ms") 1000))
                             (handle-request ,request))

                            ((search "FORBIDDEN" errcode)
                             (error 'forbidden :description error-msg))

                            ((search "BAD_STATE" errcode)
                             (error 'bad-state :description error-msg))

                            ((search "NOT_FOUND" errcode)
                             nil)

                            (t (error 'api-error :description (format nil "errcode: ~a~%errmsg: ~a~%" errcode error-msg)))))
                    response))))
                   
     (handle-request ,request)))

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
                               (append request '(authentication :parameters parameters))
                               (append request '(authentication content :parameters parameters))))

             `((declaim (inline ,new-name))
               (defun ,new-name (,@(remove-if #'null `(authentication ,@arguments ,(unless (equal type :get) 'content)
                                                                   &key parameters)))
                 ,(when documentation-p documentation)
                 (guard-request ,request))))))
    

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
