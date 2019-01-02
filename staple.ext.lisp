#|
(defmethod staple:format-documentation ((docstring string) (page staple:definitions-index-page))
  (let ((*package* (first (staple:packages page))))
    (staple:markup-code-snippets-ignoring-errors
     (staple:compile-source docstring :markdown))))
|#
#|
(defmethod staple:compile-source ((document pathname) (page staple:definitions-index-page))
  (staple:compile-source document :markdown))
|#

(defun strip-to-relative (some-path-string)
  (let ((chop-point (search "cl-matrix" some-path-string)))
    (format *standard-output* "~a~%" (subseq some-path-string (+ chop-point 10)))
    (subseq some-path-string (+ chop-point 10))))

(defmethod staple:resolve-source-link (source (page staple:definitions-index-page))
  (format NIL "http://gitlab.com/Gnuxie/cl-matrix/blob/master/~a#L~a"
          
          (strip-to-relative (namestring (getf source :file)))
    (getf source :row)))
