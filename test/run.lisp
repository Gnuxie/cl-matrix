(in-package :cl-matrix-test)

(reset)
(profiling)
(unwind-protect (progn (test 'cl-matrix-test)) 
  (report)
  (reset)
  (cleanup-logout *user-one* *user-two*))
