(asdf:defsystem "cl-matrix.autowrap.runtime"
    :version "0.0"
    :author "Gnuxie <Gnuxie@protonmail.com>"
    :license "AGPL v3+"
    :depends-on ("drakma")
    :components ((:file "authentication")
                 (:file "runtime"))

    :description
    "runtime components for cl-matrix.autowrap")
