#| This file is part of cl-matrix
   Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#
(in-package :cl-matrix)

(defun alist-without-nulls* (&rest key-val-present-triples)
  (loop :for (k v p) :on key-val-present-triples :by #'cdddr
     :when p :collect (cons k v)))

(defmacro alist-without-nulls (&rest syms)
  "transform the given symbols into an alist without nulls

(alist-without-nulls user-id reason) ==>
(remove-if #'null `((\"user_id\" . ,user-id)
                    (\"reason\" . ,reason))
           :key #'cdr)
"
  (flet ((key<-symbol (symbol)
           (substitute #\_ #\- (string-downcase symbol))))
    
    `(remove-if #'null
                (list
                 ,@(mapcar (lambda (symbol)
                             `(cons ,(key<-symbol symbol) ,symbol))
                           syms))
                :key #'cdr)))
