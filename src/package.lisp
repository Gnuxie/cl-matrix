(defpackage :cl-matrix
	(:use :cl)
	(:export 
	:account-log-in
	:room-create
	:msg-send
	:user-invite
	:room-join
	:account-sync
	:account-sync-since
	:user-joined-rooms
	
	*access-token*
	*homeserver*
	))	

(in-package :cl-matrix)
