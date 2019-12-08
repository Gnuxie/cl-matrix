(asdf:defsystem "cl-matrix"
  :version "0.1.1"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :maintainer "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPL v3+"
  :homepage  "https://gnuxie.gitlab.io/cl-matrix/"
  :depends-on ("jsown" "drakma" "method-hooks" "documentation-utils" "cl-matrix.api.client" "cl-matrix.api.media")
  :serial t
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "utils")
                 (:file "account")
                 (:file "main")
                 (:file "masks")
                 (:file "events")
                 (:file "base-events")
)))
  :description
        "A WIP Matrix client library for Common Lisp.")
