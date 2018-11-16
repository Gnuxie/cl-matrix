(defsystem "cl-matrix"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com> Jaidyn Lev <jadedctrl@teknik.io>"
  :license "CSL v1+"
  :depends-on ("jsown" "cl-strings" "drakma")
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "main")
                 (:file "utils"))))
  :description
        "A WIP Matrix library for Common Lisp.")
