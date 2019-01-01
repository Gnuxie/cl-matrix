#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defun alist-without-nulls (&rest key-val-present-triples)
  (loop :for (k v p) :on key-val-present-triples :by #'cdddr
     :when p :collect (cons k v)))
