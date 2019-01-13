#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defmacro define-callback (name args (&optional (response 'response) (errcode 'errcode) (error-msg 'error-msg)) &rest rest)
  ;; https://en.wikipedia.org/wiki/Anaphoric_macro
  (list 'defun name args
        (let ((response response)
              (errcode errcode)
              (error-msg error-msg)
              (arg (gensym)))
          
          `(lambda (,arg)
             (let ((,response (jsown:parse ,arg)))
               (if (jsown:keyp ,response "error")
                   (let ((,errcode (jsown:val ,response "errcode"))
                         (,error-msg (jsown:val ,response "error")))

                     (cond ,@ (loop :for arg in rest
                                 :collect (destructuring-bind (name &body body) arg
                                            `((search ,name ,errcode)
                                              ,@body)))

                              (t (error 'api-error :description (format nil "errcode: ~a~%errmsg: ~a~%" ,errcode ,error-msg)))))
                   
                   ,response))))))

(define-callback generate-generic-callback (callee &rest args) ()
  ("LIMIT_EXCEEDED"
   (sleep (/ (jsown:val response "retry_after_ms") 1000))
   (apply callee args))

  ("FORBIDDEN"
   (error 'forbidden :description error-msg)))

(define-callback state-event-callback (callee &rest args) ()
  ("NOT_FOUND"
   nil)

  ("FORBIDDEN"
   (error 'forbidden :description error-msg)))


