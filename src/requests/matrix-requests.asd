(asdf:defsystem "matrix-requests"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("matrix-autowrap" "plump" "lquery")
    :components ((:file "package")
                 (:file "conditions")
                 (:file "requests")
                 (:file "api-building")
)

    :description
    "requests module for cl-matrix")
