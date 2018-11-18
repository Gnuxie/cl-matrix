(in-package :cl-user)
(defpackage :cl-matrix-test
  (:use :cl :parachute)
  (:export :cl-matrix))

(in-package :cl-matrix-test)

(defvar *username* nil)
(defvar *password* nil)
(defvar *password2* nil)
(defvar *username2* nil)
(defvar *direct-chat* nil)
(defvar *user-one* nil)
(defvar *user-two* nil)

(defmacro detect-matrix-error (form)
  `(isnt string= "errcode" (caadr ,form)))

(defun load-config ()
  (with-open-file (in "../test/test.config")
    (with-standard-io-syntax
        (let ((config (read in)))
          (setf *username* (getf config :username))
          (setf *password* (getf config :password))
          (setf *password2* (getf config :password2))
          (setf *username2* (getf config :username2))))))

(load-config)

(define-test cl-matrix-test)
(define-test login
  :parent cl-matrix-test

  (fail (cl-matrix:account-log-in "fjfjfjf " "fjfjfjjf"))
  (setf *user-two* (cl-matrix:account-log-in *username2* *password2*))
  (setf *user-one* (cl-matrix:account-log-in *username* *password*))
  (of-type string *user-one*)
  (of-type string *user-two*))

(define-test room-create
  :parent cl-matrix-test
  :depends-on (login)
  ;; how can we do somehting like this within the limits of the framework?
  (let* ((response (cl-matrix:room-create :name "test1" :topic "test topic" :visibility "private"))
         (room-id (jsown:val response "room_id")))
    (of-type string room-id)
    
    ;; clean up, jsown specific
    (is = 1 (length (cl-matrix:room-leave room-id)))
    (is = 1 (length (cl-matrix:room-forget room-id)))

    ;; set up inchat test
    (setf *direct-chat* (jsown:val (cl-matrix:room-create :name "test direct"
                                                          :is-direct t
                                                          :invite (list *username2*)) "room_id"))))

(define-test direct-chat
  :parent cl-matrix-test
  :depends-on (room-create)

  (setf cl-matrix:*access-token* *user-two*)
  (let ((the-invitations (cl-matrix:invitations *username2* :since nil :from *username*)))
    (format t "~s~%" the-invitations)
    (detect-matrix-error the-invitations)
    
    (define-test invitations

      ;; verify that the chat is direct and that the invite was sent
      (let ((the-invite (find-if #'(lambda (x)
                                           (and (string= (jsown:val x "type") "m.room.member")
                                                (string= "invite" (jsown:filter x "content" "membership"))
                                                (string= *username* (jsown:val x "sender"))))
                                       (jsown:filter the-invitations *direct-chat* "invite_state" "events"))))
        (true the-invite))
      (is string= *direct-chat* (jsown:val (cl-matrix:room-join *direct-chat*) "room_id"))

))

  (define-test room-events
    :serial nil

    (define-test msg-send

      (setf cl-matrix:*access-token* *user-one*)
      ;; should probably introduce some random data here.
      (let ((send-response (cl-matrix:msg-send "the is the test message" *direct-chat* "1")))
        (detect-matrix-error send-response)
        (is string= "event_id" (caadr send-response))))

    (define-test power-levels
      (setf cl-matrix:*access-token* *user-one*)
      (let ((power-change-response (cl-matrix:change-power-level *direct-chat* *username2* "90")))
        (detect-matrix-error power-change-response)
        (is string= "event_id" (caadr power-change-response))

        (let ((direct-chat-levels (cl-matrix:room-power-levels *direct-chat*)))
          (is string= "90" (jsown:filter direct-chat-levels "users" *username2*) "verify that the power level changed"))))))

(test 'cl-matrix-test)



;; clean up direct chat test.
(defun cleanup-logout (&rest accounts)
  (dolist (account accounts)
    (setf cl-matrix:*access-token* account)
    (cl-matrix:room-leave *direct-chat*)
    (cl-matrix:room-forget *direct-chat*)

    (cl-matrix:account-log-out)))

(cleanup-logout *user-one* *user-two*)
