(in-package :cl-matrix-test)

(defvar *direct-chat* nil)
(defvar *pagination-chat* nil)
(defvar *user-one* nil)
(defvar *user-two* nil)
(defvar *logging-stream* t)

;;; we could have a list of rooms in a property list or something so we can do the
;;; clean up properly
;;; maybe have who is in them too stored

(defmacro detect-matrix-error (form)
  `(progn (when (jsown:keyp ,form "errcode")
            (format t "~a" (jsown:val ,form "errcode"))
            (isnt string= "errcode" (caadr ,form)))))

(defun load-config ()
  (with-open-file (in (merge-pathnames "test/test.config" (asdf:system-source-directory :cl-matrix)))
    (with-standard-io-syntax
        (let ((config (read in)))
          (setf *user-one* (cl-matrix:login (getf config :username) (getf config :password)))
          (setf *user-two* (cl-matrix:login (getf config :username2) (getf config :password2)))))))

(load-config)

(define-test cl-matrix-test
  :serial nil)
(define-test login
  :parent cl-matrix-test

  (fail (cl-matrix:login "fjfjfjf " "fjfjfjjf"))
  (cl-matrix:with-account (*user-one*)
    (true (< 0 (length (cl-matrix:access-token *user-one*)))))
  (cl-matrix:with-account (*user-two*)
    (true (< 0 (length (cl-matrix:access-token *user-two*)))))

  (define-test logout
    (let ((token nil))
      (cl-matrix:with-account (*user-one*)
        (setf token (cl-matrix:access-token *user-one*))
        (cl-matrix:logout))

      (setf (cl-matrix:access-token *user-one*) token)
      (cl-matrix:with-account (*user-one*)
        (fail (cl-matrix:room-create)))
      (setf (cl-matrix:access-token *user-one*) nil)
      (setf *user-one* (cl-matrix:login (cl-matrix:username *user-one*) (cl-matrix:password *user-one*))))))

(define-test room-create
  :parent cl-matrix-test
  :depends-on (login)
  ;; how can we do somehting like this within the limits of the framework?
  (cl-matrix:with-account (*user-one*) 
    (let* ((response (cl-matrix:room-create :name "test1" :topic "test topic" :visibility "private"))
           (room-id (jsown:val response "room_id")))
      (of-type string room-id)
      
      ;; clean up, jsown specific
      (is = 1 (length (cl-matrix:room-leave room-id)))
      (is = 1 (length (cl-matrix:room-forget room-id)))

      ;; set up inchat test
      (setf *direct-chat* (jsown:val (cl-matrix:room-create :name "test direct"
                                                            :preset "private_chat"
                                                            :is-direct t
                                                            :invite (list (cl-matrix:username *user-two*))) "room_id")))))

(define-test direct-chat
  :parent cl-matrix-test
  :depends-on (room-create)

  (cl-matrix:with-account (*user-two*)
    (let ((the-invitations (cl-matrix:invitations (cl-matrix:username *user-two*) :since nil :from (cl-matrix:username *user-one*))))
      (format t "~s~%" the-invitations)
      (detect-matrix-error the-invitations)
      
      (define-test invitations

        ;; verify that the chat is direct and that the invite was sent
        (let ((the-invite (find-if #'(lambda (x)
                                       (and (string= (jsown:val x "type") "m.room.member")
                                            (string= "invite" (jsown:filter x "content" "membership"))
                                            (string= (cl-matrix:username *user-one*) (jsown:val x "sender"))))
                                   (jsown:filter the-invitations *direct-chat* "invite_state" "events"))))
          (true the-invite))
        (is string= *direct-chat* (jsown:val (cl-matrix:room-join *direct-chat*) "room_id")))))

  (define-test room-events
    :serial nil

    (define-test msg-send

      (cl-matrix:with-account (*user-one*)
        ;; should probably introduce some random data here.
        (let ((send-response (cl-matrix:msg-send "the is the test message" *direct-chat*)))
          (detect-matrix-error send-response)
          (is string= "event_id" (caadr send-response)))))

    (define-test power-levels
      (cl-matrix:with-account (*user-one*)
        (let ((power-change-response (cl-matrix:change-power-level *direct-chat* (cl-matrix:username *user-two*) "90")))
          (detect-matrix-error power-change-response)
          (is string= "event_id" (caadr power-change-response))

          (let ((direct-chat-levels (cl-matrix:room-power-levels *direct-chat*)))
            (is string= "90" (jsown:filter direct-chat-levels "users" (cl-matrix:username *user-two*)) "verify that the power level changed")))))))

(defun send-lots-of-test-messages (room &key (amount 30) (start 0))
  (let ((i start)
        (end (+ start amount)))
    
    (loop :while (< i end)
       :do
         (cl-matrix:msg-send (format nil "~d" i) room)
         (incf i))))

(defun setup-room-pagination-test ()
  (format t "setting up pagination test~%")
  (cl-matrix:with-account (*user-one*)
    (setf *pagination-chat* (jsown:val (cl-matrix:room-create :name "pagination test"
                                                              :preset "private_chat"
                                                              :is-direct t
                                                              :invite (list (cl-matrix:username *user-two*)))
                                       "room_id"))

    (cl-matrix:with-account (*user-two*)
      (cl-matrix:room-join *pagination-chat*))

    (format t "sending lots of messages...~%")
    (send-lots-of-test-messages *pagination-chat* :amount 20)
    (format t "done~%")

    (format t "room: ~a~%" *pagination-chat*)

    (cl-matrix:startup-sync)
    (format t "pagination test setup complete~%")))

(define-test pagination-chat
  :parent cl-matrix-test
  :depends-on (direct-chat)

  (setup-room-pagination-test)
  (cl-matrix:with-account (*user-one*)
    (true (member *pagination-chat* (cl-matrix:user-joined-rooms) :test #'string=)))
  (format t "room: ~a~%" *pagination-chat*)
  (format t "collecting events before...~%")
  (cl-matrix:with-account (*user-one*)
    (let ((events-before (cl-matrix:events *pagination-chat*)))
      (format t "done~%sending new messages~%")
      (send-lots-of-test-messages *pagination-chat* :amount 10 :start 20)
      (format t "done~%fetching new messages~%")
      (cl-matrix:messages *pagination-chat* "f")
      (let ((events-after-forwards (cl-matrix:events *pagination-chat*)))
        (format t "events differance~%~s" (set-difference events-after-forwards events-before))
        (format t "~%end of events differance~%")
        (format t "events after forward~%~s" events-after-forwards)
        (format t "~%end~%")
        (sleep 2)

        (is string= "29" (jsown:filter (first (cl-matrix:filter #'(lambda (x) (string= "m.room.message" x))
                                                           events-after-forwards :key #'cl-matrix:event-type))
                                       "content" "body")))

      (format t "fetching old messages~%")
      (cl-matrix:messages *pagination-chat* "b")
      (format t "done~%")
      (let ((events-after-backwards (cl-matrix:events *pagination-chat*)))
        (format t "events-after-backwards~%~s~%" events-after-backwards)
        (is string= "0" (jsown:filter (car (last (cl-matrix:filter #'(lambda (x) (string= "m.room.message" x))
                                                                   events-after-backwards :key #'cl-matrix:event-type)))
                                      "content" "body"))))))

(defun leave-forget-all-rooms (&rest accounts)
  (dolist (account accounts)
    (cl-matrix:with-account (account)
      (dolist (room  (cl-matrix:user-joined-rooms))
        (format t "~a~%" room)
        (cl-matrix:room-leave room)
        (cl-matrix:room-forget room))
      (cl-matrix:logout))))

