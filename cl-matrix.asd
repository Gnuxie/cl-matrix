(asdf:defsystem "cl-matrix"
  :version "0.1.1"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :maintainer "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPL v3+"
  :homepage  "https://gnuxie.gitlab.io/cl-matrix/"
  :depends-on ("jsown" "drakma" "method-hooks" "documentation-utils" "cl-matrix.api.client" "cl-matrix.api.media")
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
                           )))))
  :description
        "A WIP Matrix library for Common Lisp.")
