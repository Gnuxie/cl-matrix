
(asdf:defsystem "cl-matrix"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :maintainer "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPL v3+"
  :homepage  "https://gnuxie.gitlab.io/cl-matrix/"
  :depends-on ("jsown" "drakma" "deeds" "documentation-utils" "matrix-requests")
  :components ((:module "src"
                :components
                (
                 (:file "package")
                 (:file "main")
                 (:file "utils")
                 (:file "account")
                 (:file "events")
                 (:file "base-events")
                 (:module "docstrings"
                          :components
                          ((:file "cl-matrix-doc")
                           (:file "matrix-requests-doc")
                           )))))
  :description
        "A WIP Matrix library for Common Lisp.")
