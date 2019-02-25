#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(defpackage :matrix-autowrap
  (:use :cl :matrix-autowrap.api-schema :matrix-autowrap.authentication)
  (:export

   #:define-request
   #:guard-request
   #:define-endpoint

   #:build-package
   #:export-auto-api
   #:define-api
))

(in-package :matrix-autowrap)
(push '("application" . "json") drakma:*text-content-types*)

(defmacro define-request (name type)
  `(defun ,name ,(remove-if #'null `(url authentication ,(unless (equal type ':get) 'the-json)
                                         &key
                                        (parameters nil)
                                        ,(unless (equal type ':get)
                                          '(content-type "application/json"))))

  (with-accessors ((homeserver homeserver) (access-token access-token)) authentication
    (let ((url (concatenate 'string
                            "https://" homeserver url)))

      (drakma:http-request
       ,@ (remove-if #'null
                     (append 
                      `(url
                        :method ,type
                        :additional-headers (when (not (string= "" access-token))
                                              `(("Authorization" . ,(format nil "Bearer ~a" access-token))))
                        :parameters parameters)
                      (unless (equal type ':get)
                        '(:content the-json
                          :content-type content-type)))))))))


(define-request post-request :post)
(define-request put-request :put)
(define-request get-request :get)
(define-request delete-request :delete)

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

         (endpoint-of-type (name type schema arguments new-concat-list &key (documentation nil documentation-p))
           ;; creates a function for the endpoint with the http method given in type
           (let ((request `(,(cond ((equal type :post) 'post-request)
                                   ((equal type :put) 'put-request)
                                   ((equal type :get) 'get-request)
                                   ((equal type :delete) 'delete-request))
                             (concatenate 'string ,(endpoint-area schema)
                                          ,@new-concat-list)))

                 (new-name (intern (concatenate 'string (cond ((equal type :put) "PUT-")
                                                              ((equal type :post) "POST-")
                                                              ((equal type :get) "GET-")
                                                              ((equal type :delete) "DELETE-"))
                                                (symbol-name name)))))

             (setf request (if (equal type :get)
                               (append request '(authentication :parameters parameters))
                               (append request '(authentication content :parameters parameters))))

             `(; declaimations here
               (defun ,new-name (,@(remove-if #'null `(authentication ,@arguments ,(unless (equal type :get) 'content)
                                                                   &key parameters)))
                 ,(when documentation-p documentation)
                 ,(request-guard schema request))))))
    

    (defmacro define-endpoint (name accepted-methods schema endpoint &key (documentation nil))
      (let ((arguments (loop
                          :for item in endpoint
                          :collect (when (symbolp item) item)))

            (new-concat-list (endpoint-seperation endpoint)))
        
        `(progn
           ,@ (let ((endpoints nil))
                (loop :for method in accepted-methods :do
                     (setf endpoints (append endpoints (endpoint-of-type name method schema arguments new-concat-list :documentation documentation))))
                endpoints))))))

