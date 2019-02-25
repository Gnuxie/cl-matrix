(in-package :matrix-requests)
(defmacro build-api ()
  `(matrix-autowrap:define-api matrix-requests-schema :matrix-requests))
(build-api)
