#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package #:cl-user)
(defpackage #:cl-matrix.autowrap.runtime
  (:use #:cl #:cl-matrix.autowrap.authentication)
  (:export
   #:define-request
   #:post-request
   #:put-request
   #:get-request
   #:delete-request

   #:check-parameters))

(in-package #:cl-matrix.autowrap.runtime)

(push '("application" . "json") drakma:*text-content-types*)

(defun check-parameters (drakma-parameter-list)
  "this will be used to intercept drakma when someone gives a number as a query parameter
and drakma expects only string."
  (mapcar (lambda (p)
            (typecase (cdr p)
              (number (cons (car p) (princ-to-string (cdr p))))
              (t p)))
          drakma-parameter-list))

(defmacro define-request (name type)
  "Macro that will create a function wrapping a drakma:http-request with the name provided and of the type specified"
  `(defun ,name ,(remove-if #'null `(url authentication ,(unless (equal type :get) 'the-json)
                                         &key
                                        (parameters nil)
                                        ,(unless (equal type :get)
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
                      (unless (equal type :get)
                        '(:content the-json
                          :content-type content-type)))))))))


(define-request post-request :post)
(define-request put-request :put)
(define-request get-request :get)
(define-request delete-request :delete)
