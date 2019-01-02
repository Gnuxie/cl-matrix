(ql:quickload :staple-markdown)

(staple:generate :cl-matrix :packages '(:cl-matrix :cl-matrix.listening :cl-matrix.base-dispatcher :matrix-requests)
                 :if-exists ':SUPERSEDE
                 :documents (list (asdf:system-relative-pathname :cl-matrix "README.md"))
)
