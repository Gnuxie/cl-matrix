(asdf:defsystem "cl-matrix.api.media"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap.runtime" "cl-matrix.api.base" "documentation-utils" "jsown")
    :components ((:file "package")
                 (:file "api"))

    :description
    "media endpoints module for cl-matrix")
