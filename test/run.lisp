(in-package :cl-matrix-test)

(let ((full-test-report nil))
  (reset)
  (profiling)
  (unwind-protect (setf full-test-report
                        (test 'cl-matrix-test)) 
    (report)
    (reset)
    (cleanup-logout *user-one* *user-two*)
    full-test-report))
