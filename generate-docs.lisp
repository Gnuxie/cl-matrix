(ql:update-dist "quicklisp" :prompt nil)
(ql:quickload :staple-markdown)
(ql:quickload :cl-matrix)

(sleep 0.5)

(staple:generate :cl-matrix :packages '(:cl-matrix :cl-matrix.base-events :matrix-requests)
                 :if-exists ':SUPERSEDE
                 :documents (list (asdf:system-relative-pathname :cl-matrix "README.md"))
                 :images (list (asdf:system-relative-pathname :cl-matrix "doc/cl-matrix-logo4.png")))
