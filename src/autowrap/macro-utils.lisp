#| Copyright (C) 2018-2019 Gnuxie <Gnuxie@protonmail.com> |#

(in-package :matrix-autowrap)
(defmacro array-bind ((&rest vars) array &body body)
  (let ((i 0))
    `(let (,@(loop :for var in vars
                :collect `(,var (aref ,array ,i))
                :do (incf i)))
       ,@body)))

(defmacro ppcre-bind ((matchedp &rest groups) expression &body body)
  (let ((array-sym (gensym)))
    `(multiple-value-bind (,matchedp ,array-sym) ,expression
       (when ,matchedp
         (array-bind (,@groups) ,array-sym
           ,@body)))))
