(asdf:defsystem "matrix-requests"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap.runtime" "documentation-utils" "jsown")
    :components ((:file "package")
                 (:file "conditions")
                 (:file "api")
)

    :description
    "requests module for cl-matrix")
