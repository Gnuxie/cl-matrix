(in-package :cl-user)
(defpackage :cl-matrix.listening
  (:use :cl)
  (:export
   :listen-to-sync-data
   
   :catagory
   :add-catagory
   :make-catagory
   :make-filter
   :add-listener-to-catagory
   
   :listener
   :make-listener))

(in-package :cl-matrix.listening)

(defvar *listener-catagories* nil)

(defclass catagory ()
  ((filter :accessor filter
           :initarg :filter
           :initform (error "must supply a filter")
           :documentation "a closure containing a jsown:fitler to use on a matrix response. See make-filter")

   (listeners :accessor listeners
              :initarg :listeners
              :initform nil
              :type list)))

(defclass listener ()
  ((callback :accessor callback
             :initarg :callback
             :initform (error "must supply a callback")
             :type function)

   (catagory :accessor catagory
             :initarg :catagory
             :initform (error "must supply a catagory")
             :type catagory)))

(defun listen-to-sync-data (sync-data)
  (mapcar (lambda (cat) (funmap (mapcar #'callback (listeners cat))
                              (funcall (filter cat) sync-data)))
        *listener-catagories*))


(defun funmap (functions data)
  "utility function, funcalls a list of functions on the given item"
  (loop :for fun in functions
     :do (progn
           (funcall fun data))))

(defun map-2 (functions data)
  "maps a list of functions on a list of data"
  (mapcar (lambda (fn) (mapcar fn data))
          functions))

(defmethod add-catagory ((this catagory))
  "adds a catagory to the *listener-catagories* that is used by listen-to-sync-data"
  (push this *listener-catagories*))

(defun make-catagory (filter)
  (make-instance 'catagory :filter filter))

(defmacro make-fitler (&body filter)
  "makes a closure with a jsown:filter to be used on a matrix-response by a catagory"
  (let ((data (gensym)))
    `(lambda (,data)
       (jsown:filter ,data
                     ,@filter))))

(defmethod add-listener-to-catagory ((cat catagory) (lnr listener))
  "adds a listener to a catagory object, not sure whether this should be implied by use of the constructor or not"
  (push lnr (listeners cat)))

(defun make-listener (callback category)
  (make-instance 'listener :callback callback :catagory category))
