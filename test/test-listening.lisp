(in-package :cl-matrix-test)

(defparameter *listening-room* nil)
(defparameter *listener-worked-p* nil)

(define-test listening-test
  :parent cl-matrix-test
  :depends-on (pagination-chat))

(define-test key-val-listening
  :parent listening-test
  
  (cl-matrix:with-account (*user-one*)
    (let ((next-batch
           (jsown:val (cl-matrix:account-sync) "next_batch")))
      
      (setf *listening-room*
            (jsown:val (cl-matrix:room-create) "room_id"))

      (format t "listening room:~%~s." *listening-room*)
      (let ((cat
             (cl-m.l:make-catagory
              (cl-m.l:make-filter
               "rooms" "join")
              t)))
        
        (cl-m.l:add-catagory cat)
        (cl-m.l:add-listener-to-catagory cat
                                         (cl-m.l:make-listener
                                          (lambda (room-id stuff)
                                            (when (string= *listening-room*
                                                           room-id)
                                              (setf *listener-worked-p* t)))
                                          cat)))

      (cl-m.l:listen-to-sync-data 
       (cl-matrix:account-sync :since next-batch))

      (true *listener-worked-p*))))
