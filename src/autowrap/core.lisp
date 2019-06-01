#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package #:cl-matrix.autowrap)

(defun endpoint-seperation (endpoint)
  "add slashes to the endpoint arguments, this will be a list of symbols and strings"
  (let ((x endpoint)
        (new-endpoint nil))
    (loop :while (not (null (cdr x))) :do
         (push (car x) new-endpoint)
         (push "/" new-endpoint)
         (setf x (cdr x)))
    (push (car x) new-endpoint)
    (reverse new-endpoint)))

(defun endpoint-of-type (name type schema module arguments new-concat-list &key (documentation nil documentation-p))
  "creates a function for the endpoint with the http method given in type"
  (let ((authentication-sym (intern "AUTHENTICATION" (target-package schema)))
        (parameters-sym (intern "PARAMETERS" (target-package schema)))
        (content-sym (intern "CONTENT" (target-package schema)))
        (content-type-sym (intern "CONTENT-TYPE" (target-package schema))))
    (let ((request
           `(,(cond ((equal type :post) 'post-request)
                    ((equal type :put) 'put-request)
                    ((equal type :get) 'get-request)
                    ((equal type :delete) 'delete-request))
              (concatenate 'string ,(endpoint-area module)
                           ,@new-concat-list)))

          (new-name (intern (concatenate 'string (cond ((equal type :put) "PUT-")
                                                       ((equal type :post) "POST-")
                                                       ((equal type :get) "GET-")
                                                       ((equal type :delete) "DELETE-"))
                                         (symbol-name name))
                            (target-package schema))))

      (setf request (if (equal type :get)
                        (append request `(,authentication-sym :parameters (check-parameters ,parameters-sym)))
                        (append request `(,authentication-sym ,content-sym :parameters (check-parameters ,parameters-sym) :content-type ,content-type-sym))))

      `(defun ,new-name
           (,@(remove-if #'null `(,authentication-sym
                                  ,@arguments
                                  ,(unless (equal type :get) content-sym)
                                  &key ,parameters-sym ,(unless (eql type :get)
                                                          `(,content-type-sym "application/json")))))
         
         ,(when documentation-p documentation)
         ,(request-guard module request)))))

(defun endpoint-definition (name accepted-methods schema module endpoint &key (documentation nil))
  "when we ge to it, we will just push directly to the stream so that we won't lose formatting"
  (let ((arguments
         (loop :for item in endpoint :collect
              (when (symbolp item) item)))

        (new-concat-list (endpoint-seperation endpoint)))
        
    (let ((endpoints nil))
      (loop :for method in accepted-methods :do
           (push (endpoint-of-type name method schema module arguments new-concat-list :documentation documentation)
                 endpoints))
          endpoints)))
