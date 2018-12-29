(in-package :cl-user)
(defpackage :cl-matrix.listening
  (:use :cl)
  (:nicknames "CL-M.L")
  (:export

   listener
   :listeners
   :callback
   :description
   :parent
   
   :make-listener

   :invoke-callback
   
   dispatcher
   :add-listener
   :make-dispatcher))

(in-package :cl-matrix.listening)

(defclass listener ()
  ((callback :accessor callback
             :initarg :callback
             :type function
             :documentation "a function the dispatcher will call.")

   (description :accessor description
                :initarg :description
                :type string
                :initform ""
                :documentation "a description for the purpose of the listener.")

   (parent     :accessor parent
               :initarg :parent
               :initform nil
               :type dispatcher
               :documentation "a reference to the parent dispatcher")))

(defmethod print-object ((instance listener) stream)
  (print-unreadable-object (instance stream :type t :identity t)
    (format stream "~a" (description instance))))

(defun make-listener (callback &optional parent description)
  (make-instance 'listener :callback callback :parent parent :description description))

(defclass dispatcher (listener)
  ((listeners :accessor listeners
              :initarg :listeners
              :type list))
  (:documentation "a listener that dispatches more listeners, it's child listeners are specified in the slot listeners.
an example would be having the callback for the dispatcher set to only dispatch listeners when an event type is string= \"m.room.message\"
as opposed to having each listener performing this check themselves. Whoever creates the dispatcher takes the responsibility for deciding how it's listeners are to be called ie the expected argument list etc."))

(defmethod invoke-callback ((instance listener) &rest args)
  (apply (callback instance) instance args))

(defmethod add-listener ((this dispatcher) (a-listener listener))
  "add a listener to a dispatcher"
  (push a-listener (listeners this)))

(defun make-dispatcher (callback &key parent listeners (description ""))
  (let ((instance (make-instance 'dispatcher :callback callback :parent parent :listeners listeners :description description)))
    (when parent (add-listener parent instance))
    instance))
