(asdf:defsystem "cl-matrix"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :maintainer "Gnuxie <Gnuxie@protonmail.com>"
  :license "CSL v1+"
  :depends-on ("jsown" "matrix-handlers" "drakma")
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "listening")
                 (:file "basic-listening")
                 (:file "conditions")
                 (:file "callback")
                 (:file "main")
                 (:file "utils")
                 (:file "account")
                 (:file "room")
                 (:file "events"))))
  :description
        "A WIP Matrix library for Common Lisp.")
