(in-package :cl-matrix)

(defclass account ()
  ((access-token :accessor access-token
                 :initarg :access-token
                 :initform ""
                 :type string
                 :documentation "The access token for the account, set once the user has logged in")

   (username :accessor username
             :initarg :username
             :initform ""
             :type string
             :documentation "The username for the account should be in the format \"@<username>:<homeserver>\"")

   (password :accessor password
             :initarg :password
             :initform ""
             :type string
             :documentation "The password for the account")

   (homeserver :accessor homeserver
               :initarg :homeserver
               :initform ""
               :type string
               :documentation "The homeserver for the account")

   (rooms :accessor %rooms
          :initarg :rooms
          :initform (make-hash-table :test 'equal :size 200)
          :type hash-table
          :documentation "a hash table containing room-ids that point to different room instances")))

(defmethod print-object ((this-account account) stream)
  (print-unreadable-object (this-account stream :type t :identity t)
    (format stream "~a" (username this-account))))

(defun get-hostname (user-id) (elt (nth-value 1 (cl-ppcre:scan-to-strings "@.*:(.*)" user-id)) 0))

(defun make-account (username password &optional (homeserver (get-hostname username)))
  (make-instance 'account :username username :password password :homeserver homeserver))

(defgeneric change-account (this-account)
  (:documentation "changes to the account"))

(defmethod change-account ((this-account account))
  (setf *access-token* (access-token this-account)))

(defmethod change-account :before ((this-account account))
  (setf *homeserver* (homeserver this-account))
  (setf *account* this-account)
  (when (= 0 (length (access-token this-account)))
    (setf (access-token this-account) (account-log-in (username this-account) (password this-account)))))

(defmacro with-account ((this-account &optional logout-p) &body body)
  (let ((old-token (gensym))
        (old-home (gensym))
        (old-account (gensym)))

    `(let ((,old-home *homeserver*)
           (,old-token *access-token*)
           (,old-account *account*))

       (unwind-protect (progn (change-account ,this-account)
                              ,@body)
         ,(when logout-p '(account-log-out) `(setf (access-token ,this-account) ""))
         (setf *homeserver* ,old-home)
         (setf *access-token* ,old-token)
         (setf *account* ,old-account)))))

(defun get-room (room-id)
  (gethash room-id (%rooms *account*)))

(defun add-room (room-id room)
  (setf (gethash room-id (%rooms *account*)) room))
