#+sbcl (setf sb-ext:*derive-function-types* t)

(ql:register-local-projects)
(ql:update-dist "quicklisp" :prompt nil)
(ql:quickload :cl-matrix-test)
(cl-matrix-test:ci-run)
