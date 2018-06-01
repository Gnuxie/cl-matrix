(defsystem "cl-matrix"
  :version "0.0"
  :author "Jaidyn Lev <jadedctrl@teknik.io>"
  :license "CSL v1+"
  :depends-on ("cl-json" "cl-strings" "s-http-client")
  :components ((:module "src"
                :components
		((:file "package")
		(:file "main"))))
  :description
	"A WIP Matrix library for Common Lisp.")
