(defpackage :CL-MATRIX.API.CLIENT (:use #:cl #:cl-matrix.autowrap.runtime #:cl-matrix.autowrap.authentication)
  (:import-from :CL-MATRIX.AUTOWRAP.AUTHENTICATION
  #:AUTH
  #:ACCESS-TOKEN
  #:HOMESERVER
  #:QUERY-PARAM)
  (:export
  #:delete-pushrules/scope/kind/ruleid
  #:get-account/3pid
  #:get-rooms/roomid/initialsync
  #:get-joined-rooms
  #:get-thirdparty/user/protocol
  #:get-initialsync
  #:get-pushrules/scope/kind/ruleid
  #:get-user/userid/account-data/type
  #:get-capabilities
  #:delete-directory/room/roomalias
  #:post-rooms/roomid/ban
  #:post-account/3pid
  #:get-rooms/roomid/context/eventid
  #:get-rooms/roomid/members
  #:get-pushrules/
  #:put-directory/list/room/roomid
  #:get-pushrules/scope/kind/ruleid/enabled
  #:post-account/3pid/msisdn/requesttoken
  #:post-account/password/email/requesttoken
  #:post-keys/upload
  #:post-pushers/set
  #:get-account/whoami
  #:post-rooms/roomid/upgrade
  #:get-register/available
  #:put-pushrules/scope/kind/ruleid/actions
  #:put-profile/userid/displayname
  #:get-pushrules/scope/kind/ruleid/actions
  #:get-sync
  #:post-rooms/roomid/receipt/receipttype/eventid
  #:put-rooms/roomid/typing/userid
  #:post-user/userid/filter
  #:get-pushers
  #:put-presence/userid/status
  #:post-delete-devices
  #:get-events/eventid
  #:get-thirdparty/location
  #:post-account/deactivate
  #:get-directory/list/room/roomid
  #:post-register/msisdn/requesttoken
  #:get-profile/userid/displayname
  #:post-rooms/roomid/read-markers
  #:get-profile/userid
  #:put-devices/deviceid
  #:post-account/3pid/unbind
  #:post-rooms/roomid/leave
  #:get-profile/userid/avatar-url
  #:get-devices
  #:get-devices/deviceid
  #:get-user/userid/filter/filterid
  #:get-thirdparty/user
  #:post-account/3pid/email/requesttoken
  #:get-presence/userid/status
  #:post-register/email/requesttoken
  #:post-account/password
  #:get-keys/changes
  #:post-keys/claim
  #:get-directory/room/roomalias
  #:post-account/3pid/delete
  #:get-rooms/roomid/messages
  #:get-rooms/roomid/event/eventid
  #:get-rooms/roomid/state
  #:post-account/3pid/add
  #:get-user/userid/rooms/roomid/tags
  #:delete-devices/deviceid
  #:post-rooms/roomid/kick
  #:post-logout
  #:get-admin/whois/userid
  #:post-rooms/roomid/invite
  #:post-join/roomidoralias
  #:get-rooms/roomid/joined-members
  #:post-publicrooms
  #:get-notifications
  #:put-pushrules/scope/kind/ruleid
  #:post-rooms/roomid/unban
  #:post-createroom
  #:put-pushrules/scope/kind/ruleid/enabled
  #:post-account/3pid/bind
  #:post-search
  #:get-thirdparty/location/protocol
  #:post-user/userid/openid/request-token
  #:post-rooms/roomid/join
  #:get-login/sso/redirect
  #:put-rooms/roomid/state/eventtype/statekey
  #:get-publicrooms
  #:get-user/userid/rooms/roomid/account-data/type
  #:get-thirdparty/protocols
  #:post-register
  #:post-keys/query
  #:delete-devices
  #:post-login
  #:put-rooms/roomid/redact/eventid/txnid
  #:put-profile/userid/avatar-url
  #:put-rooms/roomid/send/eventtype/txnid
  #:get-rooms/roomid/state/eventtype/statekey
  #:put-user/userid/rooms/roomid/tags/tag
  #:put-user/userid/account-data/type
  #:post-logout/all
  #:get-voip/turnserver
  #:put-user/userid/rooms/roomid/account-data/type
  #:post-rooms/roomid/forget
  #:post-user-directory/search
  #:post-account/password/msisdn/requesttoken
  #:get-events
  #:put-sendtodevice/eventtype/txnid
  #:delete-user/userid/rooms/roomid/tags/tag
  #:put-directory/room/roomalias
  #:get-thirdparty/protocol/protocol
  #:get-login
  #:post-rooms/roomid/report/eventid))
(in-package :CL-MATRIX.API.CLIENT)
