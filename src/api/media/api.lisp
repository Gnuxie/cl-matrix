(in-package :CL-MATRIX.API.MEDIA)

;;; generated requests


(defun cl-matrix.api.media::post-upload
       (cl-matrix.api.media::authentication cl-matrix.api.media::content
        &key cl-matrix.api.media::parameters
        (cl-matrix.api.media::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/media/r0/" "upload")
      cl-matrix.api.media::authentication cl-matrix.api.media::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)
      :content-type cl-matrix.api.media::content-type))))

(defun cl-matrix.api.media::get-download/servername/mediaid
       (cl-matrix.api.media::authentication cl-matrix.api.media::|serverName|
        cl-matrix.api.media::|mediaId|
        &key cl-matrix.api.media::parameters)
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/"
                   cl-matrix.api.media::|serverName| "/"
                   cl-matrix.api.media::|mediaId|)
      cl-matrix.api.media::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)))))

(defun cl-matrix.api.media::get-download/servername/mediaid/filename
       (cl-matrix.api.media::authentication cl-matrix.api.media::|serverName|
        cl-matrix.api.media::|mediaId| cl-matrix.api.media::|fileName|
        &key cl-matrix.api.media::parameters)
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/"
                   cl-matrix.api.media::|serverName| "/"
                   cl-matrix.api.media::|mediaId| "/"
                   cl-matrix.api.media::|fileName|)
      cl-matrix.api.media::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)))))

(defun cl-matrix.api.media::get-thumbnail/servername/mediaid
       (cl-matrix.api.media::authentication cl-matrix.api.media::|serverName|
        cl-matrix.api.media::|mediaId|
        &key cl-matrix.api.media::parameters)
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/media/r0/" "thumbnail" "/"
                   cl-matrix.api.media::|serverName| "/"
                   cl-matrix.api.media::|mediaId|)
      cl-matrix.api.media::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)))))

(defun cl-matrix.api.media::get-preview-url
       (cl-matrix.api.media::authentication
        &key cl-matrix.api.media::parameters)
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/media/r0/" "preview_url")
      cl-matrix.api.media::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)))))

(defun cl-matrix.api.media::get-config
       (cl-matrix.api.media::authentication
        &key cl-matrix.api.media::parameters)
  nil
  (cl-matrix.api.base:handle-http-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/media/r0/" "config")
      cl-matrix.api.media::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.media::parameters)))))