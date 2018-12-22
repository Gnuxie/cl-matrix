(in-package :cl-user)
(defpackage :cl-matrix.listening
  (:use :cl)
  (:nicknames "CL-M.L")
  (:export
   :listen-to-sync-data
   
   :category
   :add-category
   :make-category
   :make-filter
   :add-listener-to-category
   
   :listener
   :make-listener))

(in-package :cl-matrix.listening)

(defparameter *listener-categories* nil)

(defclass category ()
  ((filter :accessor filter
           :initarg :filter
           :initform (error "must supply a filter")
           :documentation "a closure containing a jsown:fitler to use on a matrix response. See make-filter")

   (listeners :accessor listeners
              :initarg :listeners
              :initform nil
              :type list)

   (do-keys-p :accessor do-keys-p
                :initarg :do-keys-p
                :initform nil
                :type boolean
                :documentation "tells the iterator whether to do jsown:do-json-keys or map. i.e. whether the filter will return a json object or a list.")))

(defclass listener ()
  ((callback :accessor callback
             :initarg :callback
             :initform (error "must supply a callback")
             :type function)

   (category :accessor category
             :initarg :category
             :initform (error "must supply a category")
             :type category)))

(defun listen-to-sync-data (sync-data)
  (mapcar (lambda (cat)
            (let ((filtered (funcall (filter cat) sync-data))
                  (callbacks (mapcar #'callback (listeners cat))))
              
              (if (do-keys-p cat)
                  (mapcar #'(lambda (fun)
                              (jsown:do-json-keys (key val) filtered
                                (funcall fun key val)))
                          callbacks)
                  
                  (map-2 callbacks
                         filtered))))
        *listener-categories*))


(defun funmap (functions data)
  "utility function, funcalls a list of functions on the given item"
  (loop :for fun in functions
     :do (progn
           (funcall fun data))))

(defun map-2 (functions data)
  "maps a list of functions on a list of data, map squared."
  (mapcar (lambda (fn) (mapcar fn data))
          functions))

(defmethod add-category ((this category))
  "adds a category to the *listener-categories* that is used by listen-to-sync-data"
  (push this *listener-categories*))

(defun make-category (filter &optional do-keys-p)
  (make-instance 'category :filter filter :do-keys-p do-keys-p))

(defmacro make-filter (&body filter)
  "makes a closure with a jsown:filter to be used on a matrix-response by a category"
  (let ((data (gensym)))
    `(lambda (,data)
       (jsown:filter ,data
                     ,@filter))))

(defmethod add-listener-to-category ((cat category) (lnr listener))
  "adds a listener to a category object, not sure whether this should be implied by use of the constructor or not"
  (push lnr (listeners cat)))

(defun make-listener (callback category)
  (make-instance 'listener :callback callback :category category))
