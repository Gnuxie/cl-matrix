#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :matrix-requests)

(define-condition cl-matrix-error (error)
  ((description :initarg :description
                :reader error-description))
  (:report (lambda (condition stream)
             (write-string (format nil "~a~%~a" (type-of condition) (error-description condition)) stream))))

(define-condition api-error (cl-matrix-error) ())

(define-condition forbidden (api-error) ())

(define-condition bad-state (api-error) ())

(define-condition gdpr-consent (api-error)
  ((consent-uri :initarg :consent-uri
                :reader consent-uri)))

(define-condition room-in-use (api-error) ())
(define-condition invalid-room-state (api-error) ())
(define-condition guest-access-forbidden (api-error) ())
(define-condition too-large (api-error) ())
(define-condition unknown-token (api-error) ())

(docs:define-docs
  (type cl-matrix-error
        "Base Condition for all conditions defined in this package.")

  (type api-error
    "A base condition for all conditions raised by the matrix server in it's response content e.g. when the server returns an error object, this is different to when a HTTP error happens.

Contains a slot DESCRIPTION with a reader ERROR-DESCRIPTION which should contain the value of errcode and error from the error json object.
Will report the content of the ERROR-DESCRIPTION to a stream.

if the type of api-error has not been defined then this condition should be raised.

See https://matrix.org/docs/spec/client_server/latest.html#api-standards")

  (type forbidden
    "A condition for the matrix api error of FORBIDDEN

See https://matrix.org/docs/spec/client_server/latest.html#api-standards"))

(defmacro json-parsing (recurse-form json)
  `(if (jsown:keyp ,json "error")
       (let ((errcode (jsown:val ,json "errcode"))
             (error-msg (jsown:val ,json "error")))
         (cond ((string= "M_LIMIT_EXCEEDED" errcode)
                (sleep (/ (jsown:val ,json "retry_after_ms") 1000))
                ,recurse-form)

               ((string= "M_NOT_FOUND" errcode)
                nil)

               ((string= "M_FORBIDDEN" errcode)
                (error 'forbidden :description error-msg))

               ((string= "M_BAD_STATE" errcode)
                (error 'bad-state :description error-msg))

               ((string= "M_ROOM_IN_USE" errcode)
                (error 'room-in-use :description error-msg))

               ((string= "M_INVALID_ROOM_STATE" errcode)
                (error 'invalid-room-state :description error-msg))

               ((string= "M_GUEST_ACCESS_FORBIDDEN" errcode)
                (error 'guest-access-forbidden :description error-msg))

               ((string= "M_TOO_LARGE" errcode)
                (error 'too-large :description error-msg))

               ((string= "M_UNKNOWN_TOKEN" errcode)
                (error 'unknown-token :description error-msg))

               ((string= "M_CONSENT_NOT_GIVEN" errcode)
                (error 'gdpr-consent :description error-msg
                       :consent-uri (jsown:val ,json "consent_uri")))

               (t (error 'api-error :description (format nil "errcode: ~a~%errmsg: ~a~%" errcode error-msg)))))
        ,json))

;;; as i understand, if the result is expected to not be json, then even if there is an error, as long as it's rate limited
;;; the end request will be of the original content type, so we shouldn't have to worry about the mismatch in values.
(defun handle-http-request (request)
  (multiple-value-bind (data status headers) (funcall request)
    (let ((content-type (cdr (assoc :content-type headers))))
      (cond ((string= "application/json" content-type)
             (let ((response (jsown:parse data)))
               (json-parsing (handle-http-request request) response)))
            (t (case status
                 (200 (values data headers))
                 (t (error 'api-error :description (format nil "http status: ~a~%with no error json given" status)))))))))

(defun handle-json-only-request (request)
  (let ((response (jsown:parse (funcall request))))
    (json-parsing (handle-json-only-request request) response)))
