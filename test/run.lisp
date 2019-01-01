(in-package :cl-matrix-test)

(defun run (&key (report 'plain))
  (let ((full-test-report nil))
    (reset)
    (profiling)
    (unwind-protect (setf full-test-report
                          (test 'cl-matrix-test :report report))
      (report)
      (reset)
      (unwind-protect (cleanup-logout *user-one* *user-two*)
        full-test-report))))

(defun ci-run ()
  (let ((test-result (run)))
    (when (not (null (results-with-status ':FAILED test-result)))
      (uiop:quit -1))))
