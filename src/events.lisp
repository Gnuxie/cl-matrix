#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

;;; ok this is basically going to use the list :obj things from jsown for now, as with the events list in room.lisp
;;; for now I only really need gf's for id and event-type.
;;; the alternative was making a struct for events but it isn't really necessary yet.

(defmethod id ((event list))
  "we already have a gf for id which is an accessor for room, so this will be an accessor too"
  (jsown:val event "event_id"))

(defmethod event-type ((event list))
  (jsown:val event "type"))
