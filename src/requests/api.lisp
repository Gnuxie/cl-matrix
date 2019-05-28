(in-package :MATRIX-REQUESTS)

;;; generated requests


(defun get-login (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login") authentication
      :parameters parameters))))

(defun post-login
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "login") authentication
      content :parameters parameters :content-type content-type))))

(defun post-logout
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "logout") authentication
      content :parameters parameters :content-type content-type))))

(defun post-logout/all
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "logout" "/" "all")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-register
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register") authentication
      content :parameters parameters :content-type content-type))))

(defun post-register/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "email" "/"
                   "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-register/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "msisdn" "/"
                   "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "email" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "msisdn" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/deactivate
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "deactivate")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-register/available (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "available")
      authentication :parameters parameters))))

(defun get-account/3pid (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      authentication :parameters parameters))))

(defun post-account/3pid
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/delete
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "delete")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "email" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "msisdn" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-account/whoami (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "whoami")
      authentication :parameters parameters))))

(defun post-user/userid/filter
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "filter")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-user/userid/filter/filterid
       (authentication |userId| |filterId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "filter" "/" |filterId|)
      authentication :parameters parameters))))

(defun get-sync (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "sync") authentication
      :parameters parameters))))

(defun get-events (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events") authentication
      :parameters parameters))))

(defun get-initialsync (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "initialSync") authentication
      :parameters parameters))))

(defun get-events/eventid (authentication |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/event/eventid
       (authentication |roomId| |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "event" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state/eventtype/statekey
       (authentication |roomId| |eventType| |stateKey| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType| "/" |stateKey|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state/eventtype
       (authentication |roomId| |eventType| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state")
      authentication :parameters parameters))))

(defun get-rooms/roomid/members (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "members")
      authentication :parameters parameters))))

(defun get-rooms/roomid/joined-members
       (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "joined_members")
      authentication :parameters parameters))))

(defun get-rooms/roomid/messages (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "messages")
      authentication :parameters parameters))))

(defun get-rooms/roomid/initialsync (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "initialSync")
      authentication :parameters parameters))))

(defun put-rooms/roomid/state/eventtype/statekey
       (authentication |roomId| |eventType| |stateKey| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType| "/" |stateKey|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/state/eventtype
       (authentication |roomId| |eventType| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/send/eventtype/txnid
       (authentication |roomId| |eventType| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "send" "/" |eventType| "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/redact/eventid/txnid
       (authentication |roomId| |eventId| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "redact" "/" |eventId| "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-createroom
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "createRoom") authentication
      content :parameters parameters :content-type content-type))))

(defun put-directory/room/roomalias
       (authentication |roomAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-directory/room/roomalias
       (authentication |roomAlias| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication :parameters parameters))))

(defun delete-directory/room/roomalias
       (authentication |roomAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-joined-rooms (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "joined_rooms") authentication
      :parameters parameters))))

(defun post-rooms/roomid/invite
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "invite")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/join
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "join")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-join/roomidoralias
       (authentication |roomIdOrAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "join" "/" |roomIdOrAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/leave
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "leave")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/forget
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "forget")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/kick
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "kick")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/ban
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "ban")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/unban
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "unban")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-directory/list/room/roomid (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" |roomId|)
      authentication :parameters parameters))))

(defun put-directory/list/room/roomid
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" |roomId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-publicrooms (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms") authentication
      :parameters parameters))))

(defun post-publicrooms
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms") authentication
      content :parameters parameters :content-type content-type))))

(defun post-user-directory/search
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user_directory" "/" "search")
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-profile/userid/displayname
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "displayname")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-profile/userid/displayname (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "displayname")
      authentication :parameters parameters))))

(defun put-profile/userid/avatar-url
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "avatar_url")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-profile/userid/avatar-url (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "avatar_url")
      authentication :parameters parameters))))

(defun get-profile/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId|)
      authentication :parameters parameters))))

(defun get-voip/turnserver (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "voip" "/" "turnServer")
      authentication :parameters parameters))))

(defun put-rooms/roomid/typing/userid
       (authentication |roomId| |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "typing" "/" |userId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/receipt/receipttype/eventid
       (authentication |roomId| |receiptType| |eventId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "receipt" "/" |receiptType| "/" |eventId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/read-markers
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "read_markers")
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-presence/userid/status
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" |userId| "/"
                   "status")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-presence/userid/status (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" |userId| "/"
                   "status")
      authentication :parameters parameters))))

(defun post-presence/list/userid
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   |userId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-presence/list/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   |userId|)
      authentication :parameters parameters))))

(defun post-upload
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/media/r0/" "upload") authentication
      content :parameters parameters :content-type content-type))))

(defun get-download/servername/mediaid
       (authentication |serverName| |mediaId| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/" |serverName| "/"
                   |mediaId|)
      authentication :parameters parameters))))

(defun get-download/servername/mediaid/filename
       (authentication |serverName| |mediaId| |fileName| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/" |serverName| "/"
                   |mediaId| "/" |fileName|)
      authentication :parameters parameters))))

(defun get-thumbnail/servername/mediaid
       (authentication |serverName| |mediaId| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "thumbnail" "/" |serverName|
                   "/" |mediaId|)
      authentication :parameters parameters))))

(defun get-preview-url (authentication &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "preview_url") authentication
      :parameters parameters))))

(defun get-config (authentication &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "config") authentication
      :parameters parameters))))

(defun put-sendtodevice/eventtype/txnid
       (authentication |eventType| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "sendToDevice" "/" |eventType|
                   "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-devices (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "devices") authentication
      :parameters parameters))))

(defun get-devices/deviceid (authentication |deviceId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication :parameters parameters))))

(defun put-devices/deviceid
       (authentication |deviceId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun delete-devices/deviceid
       (authentication |deviceId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-delete-devices
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "delete_devices")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/upload
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "upload")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/query
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "query")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/claim
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "claim")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-keys/changes (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "changes")
      authentication :parameters parameters))))

(defun get-pushers (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushers") authentication
      :parameters parameters))))

(defun post-pushers/set
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "pushers" "/" "set")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-notifications (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "notifications")
      authentication :parameters parameters))))

(defun get-pushrules/ (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules") authentication
      :parameters parameters))))

(defun get-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication :parameters parameters))))

(defun delete-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-pushrules/scope/kind/ruleid/enabled
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "enabled")
      authentication :parameters parameters))))

(defun put-pushrules/scope/kind/ruleid/enabled
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "enabled")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-pushrules/scope/kind/ruleid/actions
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "actions")
      authentication :parameters parameters))))

(defun put-pushrules/scope/kind/ruleid/actions
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "actions")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/invite
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "invite")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-search
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "search") authentication
      content :parameters parameters :content-type content-type))))

(defun get-events (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events") authentication
      :parameters parameters))))

(defun get-user/userid/rooms/roomid/tags
       (authentication |userId| |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags")
      authentication :parameters parameters))))

(defun put-user/userid/rooms/roomid/tags/tag
       (authentication |userId| |roomId| |tag| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags" "/" |tag|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun delete-user/userid/rooms/roomid/tags/tag
       (authentication |userId| |roomId| |tag| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags" "/" |tag|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-user/userid/account-data/type
       (authentication |userId| |type| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "account_data" "/" |type|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-user/userid/rooms/roomid/account-data/type
       (authentication |userId| |roomId| |type| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "account_data" "/" |type|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-admin/whois/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "admin" "/" "whois" "/"
                   |userId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/context/eventid
       (authentication |roomId| |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "context" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-login/cas/redirect (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "redirect")
      authentication :parameters parameters))))

(defun get-login/cas/ticket (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "ticket")
      authentication :parameters parameters))))

(defun post-rooms/roomid/report/eventid
       (authentication |roomId| |eventId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "report" "/" |eventId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-thirdparty/protocols (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocols")
      authentication :parameters parameters))))

(defun get-thirdparty/protocol/protocol
       (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocol"
                   "/" |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/location/protocol
       (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location"
                   "/" |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/user/protocol (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user" "/"
                   |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/location (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location")
      authentication :parameters parameters))))

(defun get-thirdparty/user (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user")
      authentication :parameters parameters))))

(defun post-user/userid/openid/request-token
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "openid" "/" "request_token")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-login (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login") authentication
      :parameters parameters))))

(defun post-login
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "login") authentication
      content :parameters parameters :content-type content-type))))

(defun post-logout
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "logout") authentication
      content :parameters parameters :content-type content-type))))

(defun post-logout/all
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "logout" "/" "all")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-register
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register") authentication
      content :parameters parameters :content-type content-type))))

(defun post-register/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "email" "/"
                   "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-register/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "msisdn" "/"
                   "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "email" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/password/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "password" "/"
                   "msisdn" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/deactivate
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "deactivate")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-register/available (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "register" "/" "available")
      authentication :parameters parameters))))

(defun get-account/3pid (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      authentication :parameters parameters))))

(defun post-account/3pid
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/delete
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "delete")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/email/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "email" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-account/3pid/msisdn/requesttoken
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "3pid" "/"
                   "msisdn" "/" "requestToken")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-account/whoami (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "account" "/" "whoami")
      authentication :parameters parameters))))

(defun post-user/userid/filter
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "filter")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-user/userid/filter/filterid
       (authentication |userId| |filterId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "filter" "/" |filterId|)
      authentication :parameters parameters))))

(defun get-sync (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "sync") authentication
      :parameters parameters))))

(defun get-events (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events") authentication
      :parameters parameters))))

(defun get-initialsync (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "initialSync") authentication
      :parameters parameters))))

(defun get-events/eventid (authentication |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/event/eventid
       (authentication |roomId| |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "event" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state/eventtype/statekey
       (authentication |roomId| |eventType| |stateKey| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType| "/" |stateKey|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state/eventtype
       (authentication |roomId| |eventType| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/state (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state")
      authentication :parameters parameters))))

(defun get-rooms/roomid/members (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "members")
      authentication :parameters parameters))))

(defun get-rooms/roomid/joined-members
       (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "joined_members")
      authentication :parameters parameters))))

(defun get-rooms/roomid/messages (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "messages")
      authentication :parameters parameters))))

(defun get-rooms/roomid/initialsync (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "initialSync")
      authentication :parameters parameters))))

(defun put-rooms/roomid/state/eventtype/statekey
       (authentication |roomId| |eventType| |stateKey| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType| "/" |stateKey|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/state/eventtype
       (authentication |roomId| |eventType| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "state" "/" |eventType|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/send/eventtype/txnid
       (authentication |roomId| |eventType| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "send" "/" |eventType| "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-rooms/roomid/redact/eventid/txnid
       (authentication |roomId| |eventId| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "redact" "/" |eventId| "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-createroom
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "createRoom") authentication
      content :parameters parameters :content-type content-type))))

(defun put-directory/room/roomalias
       (authentication |roomAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-directory/room/roomalias
       (authentication |roomAlias| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication :parameters parameters))))

(defun delete-directory/room/roomalias
       (authentication |roomAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "room" "/"
                   |roomAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-joined-rooms (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "joined_rooms") authentication
      :parameters parameters))))

(defun post-rooms/roomid/invite
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "invite")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/join
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "join")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-join/roomidoralias
       (authentication |roomIdOrAlias| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "join" "/" |roomIdOrAlias|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/leave
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "leave")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/forget
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "forget")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/kick
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "kick")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/ban
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "ban")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/unban
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "unban")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-directory/list/room/roomid (authentication |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" |roomId|)
      authentication :parameters parameters))))

(defun put-directory/list/room/roomid
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "directory" "/" "list" "/"
                   "room" "/" |roomId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-publicrooms (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms") authentication
      :parameters parameters))))

(defun post-publicrooms
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "publicRooms") authentication
      content :parameters parameters :content-type content-type))))

(defun post-user-directory/search
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user_directory" "/" "search")
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-profile/userid/displayname
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "displayname")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-profile/userid/displayname (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "displayname")
      authentication :parameters parameters))))

(defun put-profile/userid/avatar-url
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "avatar_url")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-profile/userid/avatar-url (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId| "/"
                   "avatar_url")
      authentication :parameters parameters))))

(defun get-profile/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "profile" "/" |userId|)
      authentication :parameters parameters))))

(defun get-voip/turnserver (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "voip" "/" "turnServer")
      authentication :parameters parameters))))

(defun put-rooms/roomid/typing/userid
       (authentication |roomId| |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "typing" "/" |userId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/receipt/receipttype/eventid
       (authentication |roomId| |receiptType| |eventId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "receipt" "/" |receiptType| "/" |eventId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/read-markers
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "read_markers")
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-presence/userid/status
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" |userId| "/"
                   "status")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-presence/userid/status (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" |userId| "/"
                   "status")
      authentication :parameters parameters))))

(defun post-presence/list/userid
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   |userId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-presence/list/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "presence" "/" "list" "/"
                   |userId|)
      authentication :parameters parameters))))

(defun post-upload
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/media/r0/" "upload") authentication
      content :parameters parameters :content-type content-type))))

(defun get-download/servername/mediaid
       (authentication |serverName| |mediaId| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/" |serverName| "/"
                   |mediaId|)
      authentication :parameters parameters))))

(defun get-download/servername/mediaid/filename
       (authentication |serverName| |mediaId| |fileName| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "download" "/" |serverName| "/"
                   |mediaId| "/" |fileName|)
      authentication :parameters parameters))))

(defun get-thumbnail/servername/mediaid
       (authentication |serverName| |mediaId| &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "thumbnail" "/" |serverName|
                   "/" |mediaId|)
      authentication :parameters parameters))))

(defun get-preview-url (authentication &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "preview_url") authentication
      :parameters parameters))))

(defun get-config (authentication &key parameters)
  nil
  (handle-http-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/media/r0/" "config") authentication
      :parameters parameters))))

(defun put-sendtodevice/eventtype/txnid
       (authentication |eventType| |txnId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "sendToDevice" "/" |eventType|
                   "/" |txnId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-devices (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "devices") authentication
      :parameters parameters))))

(defun get-devices/deviceid (authentication |deviceId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication :parameters parameters))))

(defun put-devices/deviceid
       (authentication |deviceId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun delete-devices/deviceid
       (authentication |deviceId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "devices" "/" |deviceId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-delete-devices
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "delete_devices")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/upload
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "upload")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/query
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "query")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-keys/claim
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "claim")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-keys/changes (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "keys" "/" "changes")
      authentication :parameters parameters))))

(defun get-pushers (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushers") authentication
      :parameters parameters))))

(defun post-pushers/set
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "pushers" "/" "set")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-notifications (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "notifications")
      authentication :parameters parameters))))

(defun get-pushrules/ (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules") authentication
      :parameters parameters))))

(defun get-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication :parameters parameters))))

(defun delete-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-pushrules/scope/kind/ruleid
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-pushrules/scope/kind/ruleid/enabled
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "enabled")
      authentication :parameters parameters))))

(defun put-pushrules/scope/kind/ruleid/enabled
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "enabled")
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-pushrules/scope/kind/ruleid/actions
       (authentication |scope| |kind| |ruleId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "actions")
      authentication :parameters parameters))))

(defun put-pushrules/scope/kind/ruleid/actions
       (authentication |scope| |kind| |ruleId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "pushrules" "/" |scope| "/"
                   |kind| "/" |ruleId| "/" "actions")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-rooms/roomid/invite
       (authentication |roomId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "invite")
      authentication content :parameters parameters :content-type
      content-type))))

(defun post-search
       (authentication content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "search") authentication
      content :parameters parameters :content-type content-type))))

(defun get-events (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "events") authentication
      :parameters parameters))))

(defun get-user/userid/rooms/roomid/tags
       (authentication |userId| |roomId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags")
      authentication :parameters parameters))))

(defun put-user/userid/rooms/roomid/tags/tag
       (authentication |userId| |roomId| |tag| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags" "/" |tag|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun delete-user/userid/rooms/roomid/tags/tag
       (authentication |userId| |roomId| |tag| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::delete-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "tags" "/" |tag|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-user/userid/account-data/type
       (authentication |userId| |type| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "account_data" "/" |type|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun put-user/userid/rooms/roomid/account-data/type
       (authentication |userId| |roomId| |type| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::put-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "rooms" "/" |roomId| "/" "account_data" "/" |type|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-admin/whois/userid (authentication |userId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "admin" "/" "whois" "/"
                   |userId|)
      authentication :parameters parameters))))

(defun get-rooms/roomid/context/eventid
       (authentication |roomId| |eventId| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "context" "/" |eventId|)
      authentication :parameters parameters))))

(defun get-login/cas/redirect (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "redirect")
      authentication :parameters parameters))))

(defun get-login/cas/ticket (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "login" "/" "cas" "/"
                   "ticket")
      authentication :parameters parameters))))

(defun post-rooms/roomid/report/eventid
       (authentication |roomId| |eventId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "rooms" "/" |roomId| "/"
                   "report" "/" |eventId|)
      authentication content :parameters parameters :content-type
      content-type))))

(defun get-thirdparty/protocols (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocols")
      authentication :parameters parameters))))

(defun get-thirdparty/protocol/protocol
       (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "protocol"
                   "/" |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/location/protocol
       (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location"
                   "/" |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/user/protocol (authentication |protocol| &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user" "/"
                   |protocol|)
      authentication :parameters parameters))))

(defun get-thirdparty/location (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "location")
      authentication :parameters parameters))))

(defun get-thirdparty/user (authentication &key parameters)
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::get-request
      (concatenate 'string "/_matrix/client/r0/" "thirdparty" "/" "user")
      authentication :parameters parameters))))

(defun post-user/userid/openid/request-token
       (authentication |userId| content
        &key parameters (content-type "application/json"))
  nil
  (handle-json-only-request
   (lambda ()
     (matrix-autowrap::post-request
      (concatenate 'string "/_matrix/client/r0/" "user" "/" |userId| "/"
                   "openid" "/" "request_token")
      authentication content :parameters parameters :content-type
      content-type))))