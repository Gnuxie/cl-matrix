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
