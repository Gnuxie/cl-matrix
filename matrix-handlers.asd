(asdf:defsystem "matrix-handlers"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPLv3+"
  :depends-on ("drakma")
  :components ((:module "src"
                        :components
                        ((:file "handler")))))
