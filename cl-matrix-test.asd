(defsystem "cl-matrix-test"
  :version "0.0"
  :author "Gnuxie <Gnuxie@protonmail.com>"
  :license "AGPL v3+"
  :depends-on ("cl-matrix" "parachute" "jsown" "alexandria" "uiop" "dunno")
  :components ((:module "test"
                        :components
                        ((:file "test-package")
                         (:module "config" :components ((:file "config")))
                         (:file "profile")
                         (:file "test")
                         (:file "media")
                         (:file "test-listening")
                         (:file "run")))))
