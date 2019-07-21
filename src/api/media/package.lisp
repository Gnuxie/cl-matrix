(defpackage :CL-MATRIX.API.MEDIA (:use #:cl #:cl-matrix.autowrap.runtime #:cl-matrix.autowrap.authentication)
  (:import-from :CL-MATRIX.AUTOWRAP.AUTHENTICATION
  #:AUTH
  #:ACCESS-TOKEN
  #:HOMESERVER
  #:QUERY-PARAM)
  (:export
  #:get-download/servername/mediaid
  #:get-thumbnail/servername/mediaid
  #:post-upload
  #:get-download/servername/mediaid/filename
  #:get-config
  #:get-preview-url))
(in-package :CL-MATRIX.API.MEDIA)
