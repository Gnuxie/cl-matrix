(asdf:defsystem "cl-matrix"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :maintainer "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPL v3+"
  :depends-on ("jsown" "drakma" "documentation-utils")
  :components ((:module "src"
                :components
                ((:file "requests")
                 (:file "package")
                 (:file "listening")
                 (:file "conditions")
                 (:file "callback")
                 (:file "main")
                 (:file "utils")
                 (:file "account")
                 (:file "room")
                 (:file "events")
                 (:file "client-listeners")
                 (:file "basic-listening")
                 (:module "docstrings"
                          :components
                          ((:file "cl-matrix-doc")
                           (:file "matrix-requests-doc")
                           )))))
  :description
        "A WIP Matrix library for Common Lisp.")
