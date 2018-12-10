(defpackage :matrix-handlers
  (:use :cl)
  (:export
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
   :define-matrix-handler
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
   
   *access-token*
   *homeserver*))

(in-package :matrix-handlers)

(defparameter *homeserver* "matrix.org")
(defparameter *access-token* "")

(defmacro define-matrix-request (name type)
  `(defun ,name ,(remove-if #'null `(url ,(unless (equal type ':get) 'the-json) &key
                                        (parameters nil)
                                        (access-token *access-token*)
                                        ,(unless (equal type ':get)
                                          '(content-type "application/json"))))
  "Make a request to a Matrix homeserver, for API calls."

  (let ((url (concatenate 'string
                          "https://" *homeserver* url
                          (when access-token
                            (format nil "?access_token=~A" *access-token*))
                          (when parameters parameters))))

    (drakma:http-request
     ,@ (remove-if #'null
                   (append 
                    `(url
                     :method ,type)
                    (unless (equal type ':get)
                      '(:content the-json
                                :content-type content-type))))))))

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

         (handler-of-type (name type arguments new-concat-list &key (documentation nil documentation-p))
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

             (unless (equal type :get)
               (setf request (append request '(content))))

             (setf request (append request '(:parameters parameters)))

             `(; idk how this works (proclaim '(inline ,new-name))
               (defun ,new-name (,@(remove-if #'null `(,@arguments ,(unless (equal type :get) 'content) &key parameters callback)))
                 ,(when documentation-p documentation)
                 (if callback
                     (funcall callback ,request)
                     ,request))))))

    (defmacro define-matrix-handler (name accepted-methods endpoint &key (documentation nil))
      (let ((arguments (loop
                          :for item in endpoint
                          :collect (when (symbolp item) item)))

            (new-concat-list (endpoint-seperation endpoint)))
        
        `(progn
           ,@ (let ((handlers nil))
                (loop :for method in accepted-methods
                   :do
                     (setf handlers (append handlers (handler-of-type name method arguments new-concat-list :documentation documentation))))
                handlers))))))

;;; some methods (sync) will need access to paramaters and other keywords in matrix-request
;;; so we might want to add keyword arguments to let them through.

;;; also we might want to make a macro class idk for room events, see the spec.


;;; below we can just copy the api endpoints from the spec.
(define-matrix-handler login (:post :get)
  ("login"))

(define-matrix-handler logout (:post)
  ("logout"))

(define-matrix-handler logout-all (:post)
  ("logout" "all"))

(define-matrix-handler user-filter (:post)
  ("user" user-id "filter"))

(define-matrix-handler user-filter (:get)
  ("user" user-id "filter" filter-id))

(define-matrix-handler sync (:get)
  ("sync"))

(define-matrix-handler room-event (:get)
  ("rooms" room-id "event" event-id))

(define-matrix-handler room-state-key (:get)
  ("rooms" room-id "state" event-type state-key))

(define-matrix-handler room-state-event (:get)
  ("rooms" room-id "state" event-type))

(define-matrix-handler room-state (:get)
  ("rooms" room-id "state"))

(define-matrix-handler room-members (:get)
  ("rooms" room-id "members"))

(define-matrix-handler room-joined-members (:get)
  ("rooms" room-id "joined_members"))

(define-matrix-handler room-messages (:get)
  ("rooms" room-id "messages"))

(define-matrix-handler room-state-key (:put)
  ("rooms" room-id "state" event-type state-key))

(define-matrix-handler room-state (:put)
  ("rooms" room-id "state" event-type))

(define-matrix-handler room-send-event (:put)
  ("rooms" room-id "send" event-type txn-id))

(define-matrix-handler room-redact-event (:put)
  ("rooms" room-id "redact" event-id txn-id))

(define-matrix-handler create-room (:post)
  ("createRoom"))


(define-matrix-handler joined-rooms (:get)
  ("joined_rooms"))

(define-matrix-handler room-invite (:post)
  ("rooms" room-id "invite"))

(define-matrix-handler room-join (:post)
  ("rooms" room-id "join"))

(define-matrix-handler join (:post)
  ("join" room-id-or-alias))

(define-matrix-handler room-leave (:post)
  ("rooms" room-id "leave"))

(define-matrix-handler room-forget (:post)
  ("rooms" room-id "forget"))

(flet ((handler-p (sym)
         (let ((pack (find-package :matrix-handlers)))
           (and (eql (symbol-package sym) pack)
                (or (search "GET" (symbol-name sym))
                    (search "PUT"(symbol-name sym))
                    (search "POST"(symbol-name sym)))))))

  (let ((pack (find-package :matrix-handlers)))
    (do-all-symbols (sym pack)
      (when (handler-p sym)
        (format t ":~a~%" (string-downcase (symbol-name sym)))))))
