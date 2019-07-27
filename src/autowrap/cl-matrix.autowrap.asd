(asdf:defsystem "cl-matrix.autowrap"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("cl-matrix.autowrap.runtime")
    :serial T
    :components ((:file "api-schema")
                 (:file "package")
                 (:file "core")
                 (:file "produce-spec")
                 (:file "reading"))

    :description
    "A WIP REST api autowrapper. Can build a wrapper based on simple a schema")
