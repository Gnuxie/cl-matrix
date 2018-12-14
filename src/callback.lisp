(in-package :cl-matrix)

(defmacro define-callback (name args (&optional (response 'response) (errcode 'errcode) (error-msg 'error-msg)) &rest rest)
  ;; https://en.wikipedia.org/wiki/Anaphoric_macro
  (list 'defun name args
        (let ((response response)
              (errcode errcode)
              (error-msg error-msg))
          
          `(lambda (,response)
             (let ((,response (jsown:parse ,response)))
               (when (jsown:keyp ,response "error")
                 (let ((,errcode (jsown:val ,response "errcode"))
                       (,error-msg (jsown:val ,response "error")))

                   (cond ,@ (loop :for arg in rest
                               :collect (destructuring-bind (name &body body) arg
                                          `((search ,name ,errcode)
                                            ,@body)))

                            `(t (error 'api-error :description (format nil "errcode: ~a~%errmsg: ~a~%" ,errcode ,error-msg))))))
               ,response)))))

(define-callback generate-generic-callback (callee &rest args) ()
  ("M_LIMIT_EXCEEDED"
   (sleep (/ (jsown:val response "retry_after_ms") 1000))
   (apply callee args))

  ("FORBIDDEN"
   (error 'forbidden :description error-msg)))


