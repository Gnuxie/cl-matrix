(asdf:defsystem "cl-matrix.api.generation"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap" "plump" "lquery" "jsown" "cl-matrix.api.base")
    :components ((:file "package")
                 (:file "schemas"))
    :description
    "this system is used to generate cl-matrix.api.client and cl-matirx.api.media")
