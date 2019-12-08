(in-package :cl-matrix-test)

(defvar *direct-chat* nil)
(defvar *pagination-chat* nil)
(defvar *logging-stream* t)

(defmacro detect-matrix-error (form)
  `(progn (when (jsown:keyp ,form "errcode")
            (format t "~a" (jsown:val ,form "errcode"))
            (isnt string= "errcode" (caadr ,form)))))

(define-test cl-matrix-test
  :serial nil)
(define-test login
  :parent cl-matrix-test

  (fail (cl-matrix:login "fjfjfjf " "fjfjfjjf"))
  (true (< 0 (length (cl-matrix:access-token *user-one*))))
  (true (< 0 (length (cl-matrix:access-token *user-two*)))))

(define-test room-create
  :parent cl-matrix-test
  :depends-on (login)
  ;; how can we do somehting like this within the limits of the framework?
  (let ((room-id
         (cl-matrix:room-create *user-one* :name "test1"
                                :topic "test topic"
                                :visibility "private")))
    (of-type string room-id)
    
    (is = 1 (length
             (cl-matrix:room-leave *user-one* room-id)))
    (is = 1 (length
             (cl-matrix:room-forget *user-one* room-id)))))

(define-test direct-chat
  :parent cl-matrix-test
  :depends-on (room-create)

  (let* ((direct-chat
          (cl-matrix:room-create *user-one*
                                 :name "test direct"
                                 :preset "private_chat"
                                 :is-direct t
                                 :invite (list (cl-matrix:username *user-two*))))
         (the-invitations
          (cl-matrix:invitations *user-two* :since nil
                                 :from (cl-matrix:username *user-one*))))
    (format t "~s~%" the-invitations)
    (detect-matrix-error the-invitations)
    
    (define-test invitations

      ;; verify that the chat is direct and that the invite was sent
      (let ((the-invite
             (find-if #'(lambda (x)
                          (and (string= (jsown:val x "type") "m.room.member")
                               (string= "invite" (jsown:filter x "content" "membership"))
                               (string= (cl-matrix:username *user-one*)
                                        (jsown:val x "sender"))))
                      (jsown:filter the-invitations
                                    direct-chat
                                    "invite_state"
                                    "events"))))
        (true the-invite))
      (is string= direct-chat
          (jsown:val (cl-matrix:room-join *user-two* direct-chat) "room_id")))

    (define-test room-events
      :serial nil

      (define-test msg-send

        ;; should probably introduce some random data here.
        (let ((send-response (cl-matrix:msg-send *user-one*
                                                 "the is the test message"
                                                 direct-chat)))
          (detect-matrix-error send-response)
          (is string= "event_id" (caadr send-response))))

      (define-test power-levels
        (let ((power-change-response
               (cl-matrix:change-power-level
                *user-one* *direct-chat* (cl-matrix:username *user-two*) "90")))
          (detect-matrix-error power-change-response)
          (is string= "event_id" (caadr power-change-response))

          (let ((direct-chat-levels
                 (cl-matrix:room-state *user-one* *direct-chat* "m.room.power_levels")))
            (is string= "90"
                (jsown:filter direct-chat-levels
                              "users"
                              (cl-matrix:username *user-two*))
                "verify that the power level changed")))))))

(defun send-lots-of-test-messages (account room &key (amount 30) (start 0))
  (loop :for i :from start :below (+ start amount) :do
       (cl-matrix:msg-send account (format nil "~d" i) room)))

(defun setup-room-pagination-test ()
  (format t "setting up pagination test~%")
  (let ((pagination-chat
         (cl-matrix:room-create *user-one*
                                :name "pagination test"
                                :preset "private_chat"
                                :is-direct t
                                :invite (list (cl-matrix:username *user-two*)))))

    (cl-matrix:room-join *user-two* pagination-chat)

    (format t "sending lots of messages...~%")
    (send-lots-of-test-messages *user-one* pagination-chat :amount 20)
    (format t "done~%")
    (format t "room: ~a~%" pagination-chat)
    (format t "pagination test setup complete~%")
    pagination-chat))

(define-test pagination-chat
  :parent cl-matrix-test
  :depends-on (direct-chat)

  (let ((pagination-chat (setup-room-pagination-test))
        (token-before (cl-matrix:now-token *user-one*)))
    (true (member pagination-chat (cl-matrix:joined-rooms *user-two*)

                  :test #'string=))
    (format t "room: ~a~%" pagination-chat)
    (format t "collecting events before...~%")
    (let* ((history-generator
            (cl-matrix:history-generator *user-one*
                                         pagination-chat
                                         :start-token token-before
                                         :direction "b"))
           (events-before (funcall history-generator 100)))
      (format t "done~%sending new messages~%")
      (send-lots-of-test-messages *user-one* pagination-chat :amount 10 :start 20)
      (format t "done~%fetching new messages~%")
      (let* ((history-generator2
              (cl-matrix:history-generator *user-one*
                                           pagination-chat
                                           :start-token token-before))
             (new-events (reverse (funcall history-generator2 40)))
             (events-after-forwards (append new-events events-before)))

        (format t "events differance~%~s"
                (set-difference events-after-forwards events-before))
        (format t "~%end of events differance~%")
        (format t "events after forward~%~s" events-after-forwards)
        (format t "~%end~%")
        (sleep 2)

        (is string= "29"
            (jsown:filter
             (first (remove-if-not #'(lambda (x) (string= "m.room.message" x))
                                   events-after-forwards
                                   :key #'cl-matrix:event-type))
             "content" "body"))

        (is string= "0"
            (jsown:filter
             (car (last (remove-if-not #'(lambda (x) (string= "m.room.message" x))
                                       events-after-forwards
                                       :key #'cl-matrix:event-type)))
             "content" "body"))))))

(defun leave-forget-all-rooms (&rest accounts)
  (dolist (account accounts)
    (dolist (room (cl-matrix:joined-rooms account))
      (format t "~a~%" room)
      (cl-matrix:room-leave account room)
      (cl-matrix:room-forget account room))
    (cl-matrix:logout account)))

