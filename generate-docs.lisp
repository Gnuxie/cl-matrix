(ql:update-dist "quicklisp" :prompt nil)
(ql:register-local-projects)
(ql:quickload :staple-markdown)
(ql:quickload :cl-matrix)
(asdf:load-system :cl-matrix.autowrap)

(sleep 0.5)

(staple:generate :cl-matrix :packages '(:cl-matrix
                                        :cl-matrix.base-events
                                        :cl-matrix.api.client
                                        :cl-matrix.api.media
                                        :cl-matrix.api.base
                                        :cl-matrix.autowrap)
                 :if-exists :supersede
                 :documents (list (asdf:system-relative-pathname :cl-matrix "README.md"))
                 :images (list (asdf:system-relative-pathname :cl-matrix "doc/cl-matrix-logo4.png"))
                 :output-directory (asdf:system-relative-pathname :cl-matrix "doc/"))
