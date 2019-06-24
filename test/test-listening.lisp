(in-package :cl-matrix-test)

(defparameter *listening-room* nil)
(defparameter *listener-worked-p* nil)

(define-test listening-test
  :parent cl-matrix-test
  :depends-on (pagination-chat)
  )

(defun set-up-listening ()
  (cl-matrix:with-account (*user-one*)
    (setf *after-setup-token*
          (jsown:val (cl-matrix:account-sync) "next_batch"))
    
    (setf *listening-room*
          (cl-matrix:room-create :invite (list (cl-matrix:username *user-two*))))

    (format t "listening room:~%~s." *listening-room*)))

(define-test room-event-listening
  :parent listening-test

    (set-up-listening)

    (let ((test-worked-p nil))
      (method-hooks:defhook cl-m.base-events:room-event room-event-test ((account cl-matrix:account) room-id data)
        (when (string= "m.room.message" (cl-matrix:event-type data))
          (when (string= (cl-matrix:username *user-two*) (jsown:val data "sender"))
            (setf test-worked-p t))))

      (cl-matrix:with-account (*user-two*)
        (cl-matrix:room-join *listening-room*)
        (cl-matrix:msg-send "listener test message" *listening-room*))

      (method-hooks:defhook cl-m.base-events:sync test-worked-h :after ((account cl-matrix:account) data)
        (true test-worked-p))
      
      (cl-matrix:with-account (*user-one*)
        (cl-m.base-events:issue-sync-event (cl-matrix:account-sync :since *after-setup-token*)))))
