(in-package :cl-matrix-test)

(defparameter *listening-room* nil)
(defparameter *listener-worked-p* nil)
(defparameter *after-setup-token* nil)

(define-test listening-test
  :parent cl-matrix-test
  :depends-on (pagination-chat)
  )

(defun set-up-listening ()
  (setf *after-setup-token*
        (jsown:val (cl-matrix:sync *user-one*) "next_batch"))
  
  (setf *listening-room*
        (cl-matrix:room-create *user-one*
                               :invite (list (cl-matrix:username *user-two*))))

  (format t "listening room:~%~s." *listening-room*))

(define-test room-event-listening
  :parent listening-test

    (set-up-listening)

    (let ((test-worked-p nil))
      (method-hooks:defhook cl-m.base-events:room-event room-event-test ((account cl-matrix:account) room-id data)
        (declare (ignore account room-id))                  
        (when (string= "m.room.message" (cl-matrix:event-type data))
          (when (string= (cl-matrix:username *user-two*) (jsown:val data "sender"))
            (setf test-worked-p t))))

      (cl-matrix:room-join *user-two* *listening-room*)
      (cl-matrix:msg-send *user-two* "listener test message" *listening-room*)

      (method-hooks:defhook cl-m.base-events:sync-hook test-worked-h
        :after ((account cl-matrix:account) data)
        (declare (ignore account data))
        (true test-worked-p))
      
      (cl-m.base-events:issue-sync-event
       *user-one* (cl-matrix:sync *user-one* :since *after-setup-token*))))
