(in-package :cl-matrix-test)

(define-test media-test
  :parent cl-matrix-test
  :depends-on (login)

  (cl-matrix:with-account (*user-one*)
    (let ((room (cl-matrix:room-create))
          (image (alexandria:read-file-into-byte-vector (asdf:system-relative-pathname :cl-matrix "test/test-image.png"))))
      (let* ((content-uri (cdadr (cl-matrix:upload-media image :content-type "image/png")))
             (downloaded-image (cl-matrix:download-media content-uri)))
        (true (let ((the-same? t))
                (loop :for a :across image
                   :for b :across downloaded-image
                   :unless (equal a b) :do (setf the-same? nil))
                the-same?))))))
