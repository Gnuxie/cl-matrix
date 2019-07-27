(asdf:defsystem "cl-matrix.api.base"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("jsown")
    :components ((:file "package")
                 (:file "conditions"))
    :description
    "this system contains common utilites used throughout the api modules")
