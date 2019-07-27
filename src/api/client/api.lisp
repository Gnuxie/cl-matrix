(in-package :CL-MATRIX.API.CLIENT)

;;; generated requests


(defun cl-matrix.api.client:get-login
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "login")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-login
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "login")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-logout
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "logout")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-logout/all
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "logout" "/" "all")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-register
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "register")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-register/email/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "email" "/"
                   "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-register/msisdn/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "msisdn" "/"
                   "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/password
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/password/email/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "email" "/" "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/password/msisdn/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "msisdn" "/" "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/deactivate
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "deactivate")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-register/available
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "available")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-account/3pid
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-account/3pid
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/3pid/delete
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "delete")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/3pid/email/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "email" "/" "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-account/3pid/msisdn/requesttoken
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "msisdn" "/" "requestToken")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-account/whoami
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "whoami")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-user/userid/filter
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "filter")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-user/userid/filter/filterid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|filterId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "filter" "/"
                   cl-matrix.api.client::|filterId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-sync
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "sync")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-initialsync
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "initialSync")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-events/eventid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|eventId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "events" "/"
                   cl-matrix.api.client::|eventId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/event/eventid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "event" "/"
                   cl-matrix.api.client::|eventId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/state/eventtype/statekey
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventType| cl-matrix.api.client::|stateKey|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "state" "/"
                   cl-matrix.api.client::|eventType| "/"
                   cl-matrix.api.client::|stateKey|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/state/eventtype
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventType|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "state" "/"
                   cl-matrix.api.client::|eventType|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/state
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "state")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/members
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "members")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/joined-members
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "joined_members")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/messages
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "messages")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/initialsync
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "initialSync")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-rooms/roomid/state/eventtype/statekey
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventType| cl-matrix.api.client::|stateKey|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "state" "/"
                   cl-matrix.api.client::|eventType| "/"
                   cl-matrix.api.client::|stateKey|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-rooms/roomid/state/eventtype
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventType| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "state" "/"
                   cl-matrix.api.client::|eventType|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-rooms/roomid/send/eventtype/txnid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventType| cl-matrix.api.client::|txnId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "send" "/"
                   cl-matrix.api.client::|eventType| "/"
                   cl-matrix.api.client::|txnId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-rooms/roomid/redact/eventid/txnid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventId| cl-matrix.api.client::|txnId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "redact" "/"
                   cl-matrix.api.client::|eventId| "/"
                   cl-matrix.api.client::|txnId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-createroom
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "createRoom")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-directory/room/roomalias
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomAlias|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   cl-matrix.api.client::|roomAlias|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-directory/room/roomalias
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomAlias|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   cl-matrix.api.client::|roomAlias|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:delete-directory/room/roomalias
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomAlias|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:delete-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   cl-matrix.api.client::|roomAlias|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-joined-rooms
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "joined_rooms")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-rooms/roomid/join
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "join")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-join/roomidoralias
       (cl-matrix.api.client::authentication
        cl-matrix.api.client::|roomIdOrAlias| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "join" "/"
                   cl-matrix.api.client::|roomIdOrAlias|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/leave
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "leave")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/forget
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "forget")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/kick
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "kick")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/ban
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "ban")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/unban
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "unban")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-directory/list/room/roomid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" cl-matrix.api.client::|roomId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-directory/list/room/roomid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" cl-matrix.api.client::|roomId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-publicrooms
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-publicrooms
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-user-directory/search
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "user_directory" "/" "search")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-profile/userid/displayname
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/"
                   cl-matrix.api.client::|userId| "/" "displayname")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-profile/userid/displayname
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/"
                   cl-matrix.api.client::|userId| "/" "displayname")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-profile/userid/avatar-url
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/"
                   cl-matrix.api.client::|userId| "/" "avatar_url")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-profile/userid/avatar-url
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/"
                   cl-matrix.api.client::|userId| "/" "avatar_url")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-profile/userid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/"
                   cl-matrix.api.client::|userId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-voip/turnserver
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "voip" "/" "turnServer")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-rooms/roomid/typing/userid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|userId| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "typing" "/"
                   cl-matrix.api.client::|userId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/receipt/receipttype/eventid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|receiptType| cl-matrix.api.client::|eventId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "receipt" "/"
                   cl-matrix.api.client::|receiptType| "/"
                   cl-matrix.api.client::|eventId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/read-markers
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "read_markers")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-presence/userid/status
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/"
                   cl-matrix.api.client::|userId| "/" "status")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-presence/userid/status
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/"
                   cl-matrix.api.client::|userId| "/" "status")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-presence/list/userid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   cl-matrix.api.client::|userId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-presence/list/userid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   cl-matrix.api.client::|userId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-sendtodevice/eventtype/txnid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|eventType|
        cl-matrix.api.client::|txnId| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "sendToDevice" "/"
                   cl-matrix.api.client::|eventType| "/"
                   cl-matrix.api.client::|txnId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-devices
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "devices")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-devices/deviceid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|deviceId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/"
                   cl-matrix.api.client::|deviceId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-devices/deviceid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|deviceId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/"
                   cl-matrix.api.client::|deviceId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:delete-devices/deviceid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|deviceId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:delete-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/"
                   cl-matrix.api.client::|deviceId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-delete-devices
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "delete_devices")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-keys/upload
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "upload")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-keys/query
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "query")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-keys/claim
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "claim")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-keys/changes
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "changes")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-pushers
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "pushers")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-pushers/set
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "pushers" "/" "set")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-notifications
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "notifications")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-pushrules/
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-pushrules/scope/kind/ruleid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:delete-pushrules/scope/kind/ruleid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:delete-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-pushrules/scope/kind/ruleid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-pushrules/scope/kind/ruleid/enabled
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId| "/" "enabled")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-pushrules/scope/kind/ruleid/enabled
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId| "/" "enabled")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-pushrules/scope/kind/ruleid/actions
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId| "/" "actions")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-pushrules/scope/kind/ruleid/actions
       (cl-matrix.api.client::authentication cl-matrix.api.client::|scope|
        cl-matrix.api.client::|kind| cl-matrix.api.client::|ruleId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/"
                   cl-matrix.api.client::|scope| "/"
                   cl-matrix.api.client::|kind| "/"
                   cl-matrix.api.client::|ruleId| "/" "actions")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-rooms/roomid/invite
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "invite")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:post-search
       (cl-matrix.api.client::authentication cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "search")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-events
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "events")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-user/userid/rooms/roomid/tags
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|roomId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "tags")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:put-user/userid/rooms/roomid/tags/tag
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|roomId| cl-matrix.api.client::|tag|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "tags" "/"
                   cl-matrix.api.client::|tag|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:delete-user/userid/rooms/roomid/tags/tag
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|roomId| cl-matrix.api.client::|tag|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:delete-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "tags" "/"
                   cl-matrix.api.client::|tag|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-user/userid/account-data/type
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|type| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "account_data" "/"
                   cl-matrix.api.client::|type|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:put-user/userid/rooms/roomid/account-data/type
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::|roomId| cl-matrix.api.client::|type|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "account_data" "/"
                   cl-matrix.api.client::|type|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-admin/whois/userid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "admin" "/" "whois" "/"
                   cl-matrix.api.client::|userId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-rooms/roomid/context/eventid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventId|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "context" "/"
                   cl-matrix.api.client::|eventId|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-login/cas/redirect
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "redirect")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-login/cas/ticket
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "ticket")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-rooms/roomid/report/eventid
       (cl-matrix.api.client::authentication cl-matrix.api.client::|roomId|
        cl-matrix.api.client::|eventId| cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/"
                   cl-matrix.api.client::|roomId| "/" "report" "/"
                   cl-matrix.api.client::|eventId|)
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))

(defun cl-matrix.api.client:get-thirdparty/protocols
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocols")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-thirdparty/protocol/protocol
       (cl-matrix.api.client::authentication cl-matrix.api.client::|protocol|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocol"
                   "/" cl-matrix.api.client::|protocol|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-thirdparty/location/protocol
       (cl-matrix.api.client::authentication cl-matrix.api.client::|protocol|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location"
                   "/" cl-matrix.api.client::|protocol|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-thirdparty/user/protocol
       (cl-matrix.api.client::authentication cl-matrix.api.client::|protocol|
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user" "/"
                   cl-matrix.api.client::|protocol|)
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-thirdparty/location
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:get-thirdparty/user
       (cl-matrix.api.client::authentication
        &key cl-matrix.api.client::parameters)
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user")
      cl-matrix.api.client::authentication :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)))))

(defun cl-matrix.api.client:post-user/userid/openid/request-token
       (cl-matrix.api.client::authentication cl-matrix.api.client::|userId|
        cl-matrix.api.client::content
        &key cl-matrix.api.client::parameters
        (cl-matrix.api.client::content-type "application/json"))
  nil
  (cl-matrix.api.base:handle-json-only-request
   (lambda ()
     (cl-matrix.autowrap.runtime:post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/"
                   cl-matrix.api.client::|userId| "/" "openid" "/"
                   "request_token")
      cl-matrix.api.client::authentication cl-matrix.api.client::content
      :parameters
      (cl-matrix.autowrap.runtime:check-parameters
       cl-matrix.api.client::parameters)
      :content-type cl-matrix.api.client::content-type))))