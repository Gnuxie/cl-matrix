(asdf:defsystem "generate-matrix-requests"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap" "plump" "lquery" "jsown")
    :components ((:file "generation-package")
                 (:file "conditions")
                 (:file "generate"))
    :description
    "generate the requests module for cl-matrix")
