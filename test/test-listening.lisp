(in-package :cl-matrix-test)

(defparameter *listening-room* nil)
(defparameter *listener-worked-p* nil)
(defparameter *base-dispatcher* (base-dispatcher:make-base-dispatcher))

(define-test listening-test
  :parent cl-matrix-test
  :depends-on (pagination-chat)
  )

(defun set-up-listening ()
  (cl-matrix:with-account (*user-one*)
    (setf *base-dispatcher* (base-dispatcher:make-base-dispatcher))
    (setf *after-setup-token*
          (jsown:val (cl-matrix:account-sync) "next_batch"))
    
    (setf *listening-room*
          (jsown:val (cl-matrix:room-create :invite (list (cl-matrix:username *user-two*))) "room_id"))

    (format t "listening room:~%~s." *listening-room*)))

(define-test room-event-listening
  :parent listening-test

    (set-up-listening)

    (let ((test-worked-p nil))
      (cl-m.l:add-listener (base-dispatcher:events *base-dispatcher*)
                           (cl-m.l:make-listener
                            (lambda (instance room-id event)
                              (when (string= "m.room.message" (cl-matrix:event-type event))
                                (when (string= (cl-matrix:username *user-two*) (jsown:val event "sender"))
                                  (setf test-worked-p t))))))

      (cl-matrix:with-account (*user-two*)
        (cl-matrix:room-join *listening-room*)
        (cl-matrix:msg-send "listener test message" *listening-room*))
      
      (cl-matrix:with-account (*user-one*)
        (cl-m.l:invoke-callback *base-dispatcher* (cl-matrix:account-sync :since *after-setup-token*)))

      (true test-worked-p)))
