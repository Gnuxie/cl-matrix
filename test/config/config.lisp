#|
    Copyright (C) 2019 Gnuxie <Gnuxie@protonmail.com>
|#

(in-package #:cl-matrix-test)

(defvar *user-one* nil)
(defvar *user-two* nil)

(dunno:define-config test-config ()
    ((:user-one :dynamic-var cl-matrix-test::*user-one*)
     (:user-two :dynamic-var cl-matrix-test::*user-two*)))

(defgeneric load-config (specializer)
  (:method (specializer)
    (uiop:run-program
     (format nil "/bin/bash ~a"
             (asdf:system-relative-pathname :cl-matrix-test
                                            "test/config/local-synapse.sh")))
    (test-config
     `((:user-one . ,(cl-matrix:login "@ci-1:localhost" "pass"
                                      :origin "http://localhost:8008"))
       (:user-two . ,(cl-matrix:login "@ci-2:localhost" "pass"
                                      :origin "http://localhost:8008")))))
  (:method ((specializer (eql :ci)))
    (test-config
     `((:user-one . ,(cl-matrix:login "@cl-matrix-test-ci-1:matrix.org"
                                      "please do not change this"))
       (:user-two . ,(cl-matrix:login "@cl-matrix-test-ci-2:matrix.org"
                                      "please do not change this"))))))

