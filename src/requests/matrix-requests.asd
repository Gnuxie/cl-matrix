(asdf:defsystem "matrix-requests"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("matrix-autowrap" "documentation-utils" "jsown")
    :components ((:file "package")
                 (:file "conditions")
                 (:file "api")
)

    :description
    "requests module for cl-matrix")
