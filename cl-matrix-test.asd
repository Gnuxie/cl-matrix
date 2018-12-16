(defsystem "cl-matrix-test"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com>"
  :license "CSL v1+"
  :depends-on ("cl-matrix" "parachute" "jsown")
  :components ((:module "test"
                        :components
                        ((:file "test-package")
                         (:file "profile")
                         (:file "test")))))
