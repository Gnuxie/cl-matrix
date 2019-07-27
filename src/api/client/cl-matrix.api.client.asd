(asdf:defsystem "cl-matrix.api.client"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap.runtime" "cl-matrix.api.base" "documentation-utils" "jsown")
    :components ((:file "package")
                 (:file "api"))

    :description
    "client-server endpoints module for cl-matrix")
