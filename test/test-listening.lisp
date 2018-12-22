(in-package :cl-matrix-test)

(defparameter *listening-room* nil)
(defparameter *listener-worked-p* nil)
(defparameter *after-setup-token* nil)

(define-test listening-test
  :parent cl-matrix-test
  :depends-on (pagination-chat))

(defun set-up ()
  (cl-matrix:with-account (*user-one*)
    (when (not *after-setup-token*)
      (setf *after-setup-token*
            (jsown:val (cl-matrix:account-sync) "next_batch"))
      
      (setf *listening-room*
            (jsown:val (cl-matrix:room-create :invite (list (cl-matrix:username *user-two*))) "room_id"))

      (format t "listening room:~%~s." *listening-room*))))


(define-test key-val-listening
  :parent listening-test

  (set-up)
  (cl-matrix:with-account (*user-one*)
    (let ((cat
           (cl-m.l:make-category
            (cl-m.l:make-filter
              "rooms" "join")
            t)))
      
      (cl-m.l:add-category cat)
      (cl-m.l:add-listener-to-category cat
                                       (cl-m.l:make-listener
                                        (lambda (room-id stuff)
                                          (when (string= *listening-room*
                                                         room-id)
                                            (setf *listener-worked-p* t)))
                                        cat)))

    (cl-m.l:listen-to-sync-data 
     (cl-matrix:account-sync :since *after-setup-token*))

    (format t "key-val-test-done~%")
    (true *listener-worked-p*)))

(define-test list-listening
  :parent listening-test
  :depends-on (key-val-listening)

  (set-up)

  ;; should change the dependancy because technically this is only required for it's setup bit.

  ;; also what if the room is forgotten, this listener will fail.
  (let ((cat (cl-m.l:make-category (cl-m.l:make-filter "rooms" "join"
                                                       *listening-room* "timeline" "events")))
        (test-worked-p nil))
    
    (cl-m.l:add-category cat)
    ;; think about this, we need to be able to put the m.room.message part in the catagory filter.
    (cl-m.l:add-listener-to-category cat
                                     (cl-m.l:make-listener
                                      (lambda (event)
                                        (when (string= "m.room.message" (cl-matrix:event-type event))
                                          (when (string= (cl-matrix:username *user-two*) (jsown:val event "sender"))
                                            (setf test-worked-p t))))
                                      cat))

    (cl-matrix:with-account (*user-two*)
      (cl-matrix:room-join *listening-room*)
      (cl-matrix:msg-send "listener test message" *listening-room*))

    (cl-matrix:with-account (*user-one*)
      (cl-m.l:listen-to-sync-data
       (cl-matrix:account-sync :since *after-setup-token*)))

    (true test-worked-p)))
