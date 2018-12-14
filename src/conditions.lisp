(in-package :cl-matrix)

(define-condition cl-matrix-error (error) ())

(define-condition api-error (cl-matrix-error)
  ((description :initarg :description
                :reader error-description))
  (:report (lambda (condition stream)
             (write-string (format nil "API-ERROR~%~a" (error-description condition)) stream))))

(define-condition forbidden (api-error) ())

