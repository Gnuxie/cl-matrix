(defpackage :MATRIX-REQUESTS (:use #:cl #:matrix-autowrap #:matrix-autowrap.authentication)
  (:import-from :MATRIX-AUTOWRAP.AUTHENTICATION
  #:AUTH
  #:ACCESS-TOKEN
  #:HOMESERVER
  #:QUERY-PARAM)
  (:export
  #:post-keys/upload
  #:get-account/3pid
  #:put-sendtodevice/eventtype/txnid
  #:put-pushrules/scope/kind/ruleid/actions
  #:get-rooms/roomid/initialsync
  #:get-joined-rooms
  #:get-initialsync
  #:get-pushrules/scope/kind/ruleid
  #:post-logout
  #:delete-directory/room/roomalias
  #:get-thirdparty/user/protocol
  #:get-presence/list/userid
  #:get-rooms/roomid/members
  #:get-pushrules/
  #:put-directory/list/room/roomid
  #:get-login/cas/redirect
  #:post-account/3pid/msisdn/requesttoken
  #:post-account/password/email/requesttoken
  #:post-pushers/set
  #:get-rooms/roomid/event/eventid
  #:post-presence/list/userid
  #:put-user/userid/rooms/roomid/account-data/type
  #:get-rooms/roomid/joined-members
  #:get-register/available
  #:post-account/3pid
  #:put-profile/userid/displayname
  #:get-rooms/roomid/state/eventtype
  #:get-sync
  #:post-user/userid/filter
  #:get-pushers
  #:post-keys/claim
  #:put-presence/userid/status
  #:post-delete-devices
  #:get-events/eventid
  #:get-thirdparty/location
  #:post-account/deactivate
  #:get-directory/list/room/roomid
  #:get-notifications
  #:post-register/msisdn/requesttoken
  #:get-profile/userid/displayname
  #:post-rooms/roomid/read-markers
  #:get-profile/userid
  #:put-devices/deviceid
  #:get-admin/whois/userid
  #:post-rooms/roomid/leave
  #:get-devices
  #:get-devices/deviceid
  #:get-user/userid/filter/filterid
  #:get-thirdparty/user
  #:delete-devices
  #:post-account/3pid/email/requesttoken
  #:get-presence/userid/status
  #:post-register/email/requesttoken
  #:post-account/password
  #:get-keys/changes
  #:get-pushrules/scope/kind/ruleid/enabled
  #:get-directory/room/roomalias
  #:post-account/3pid/delete
  #:get-rooms/roomid/messages
  #:get-user/userid/rooms/roomid/tags
  #:delete-devices/deviceid
  #:post-rooms/roomid/kick
  #:get-events
  #:delete-pushrules/scope/kind/ruleid
  #:post-createroom
  #:get-publicrooms
  #:post-join/roomidoralias
  #:post-login
  #:post-rooms/roomid/ban
  #:post-rooms/roomid/invite
  #:post-publicrooms
  #:put-pushrules/scope/kind/ruleid
  #:post-rooms/roomid/unban
  #:post-user-directory/search
  #:get-profile/userid/avatar-url
  #:get-thirdparty/location/protocol
  #:post-rooms/roomid/join
  #:put-rooms/roomid/state/eventtype/statekey
  #:get-rooms/roomid/state
  #:get-thirdparty/protocols
  #:put-rooms/roomid/state/eventtype
  #:post-register
  #:post-keys/query
  #:get-pushrules/scope/kind/ruleid/actions
  #:put-pushrules/scope/kind/ruleid/enabled
  #:get-thirdparty/protocol/protocol
  #:put-rooms/roomid/redact/eventid/txnid
  #:get-login
  #:put-profile/userid/avatar-url
  #:put-rooms/roomid/send/eventtype/txnid
  #:get-rooms/roomid/state/eventtype/statekey
  #:post-user/userid/openid/request-token
  #:put-rooms/roomid/typing/userid
  #:put-user/userid/rooms/roomid/tags/tag
  #:put-user/userid/account-data/type
  #:post-rooms/roomid/report/eventid
  #:post-logout/all
  #:get-voip/turnserver
  #:post-rooms/roomid/forget
  #:get-rooms/roomid/context/eventid
  #:post-account/password/msisdn/requesttoken
  #:delete-user/userid/rooms/roomid/tags/tag
  #:put-directory/room/roomalias
  #:post-search
  #:get-account/whoami
  #:get-login/cas/ticket
  #:post-rooms/roomid/receipt/receipttype/eventid
  #:AUTH
  #:ACCESS-TOKEN
  #:HOMESERVER
  #:QUERY-PARAM))
(in-package :MATRIX-REQUESTS)
