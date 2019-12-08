
("POST /account/3pid/unbind" "GET /_matrix/client/versions"
 "GET /.well-known/matrix/client" "GET /_matrix/client/r0/login"
 "POST /_matrix/client/r0/login" "POST /_matrix/client/r0/logout"
 "POST /_matrix/client/r0/logout/all" "POST /_matrix/client/r0/register"
 "POST /_matrix/client/r0/register/email/requestToken"
 "POST /_matrix/client/r0/register/msisdn/requestToken"
 "POST /_matrix/client/r0/account/password"
 "POST /_matrix/client/r0/account/password/email/requestToken"
 "POST /_matrix/client/r0/account/password/msisdn/requestToken"
 "POST /_matrix/client/r0/account/deactivate"
 "GET /_matrix/client/r0/register/available"
 "GET /_matrix/client/r0/account/3pid" "POST /_matrix/client/r0/account/3pid"
 "POST /_matrix/client/r0/account/3pid/add"
 "POST /_matrix/client/r0/account/3pid/bind"
 "POST /_matrix/client/r0/account/3pid/delete"
 "POST /_matrix/client/r0/account/3pid/unbind"
 "POST /_matrix/client/r0/account/3pid/email/requestToken"
 "POST /_matrix/client/r0/account/3pid/msisdn/requestToken"
 "POST /validate/email/submitToken" "GET /_matrix/client/r0/account/whoami"
 "GET /_matrix/client/r0/capabilities"
 "POST /_matrix/client/r0/user/{userId}/filter"
 "GET /_matrix/client/r0/user/{userId}/filter/{filterId}"
 "GET /_matrix/client/r0/sync" "GET /_matrix/client/r0/initialSync"
 "GET /_matrix/client/r0/events/{eventId}"
 "GET /_matrix/client/r0/rooms/{roomId}/event/{eventId}"
 "GET /_matrix/client/r0/rooms/{roomId}/state/{eventType}/{stateKey}"
 "GET /_matrix/client/r0/rooms/{roomId}/state"
 "GET /_matrix/client/r0/rooms/{roomId}/members"
 "GET /_matrix/client/r0/rooms/{roomId}/joined_members"
 "GET /_matrix/client/r0/rooms/{roomId}/messages"
 "GET /_matrix/client/r0/rooms/{roomId}/initialSync"
 "PUT /_matrix/client/r0/rooms/{roomId}/state/{eventType}/{stateKey}" "PUT"
 "POST" "PUT /_matrix/client/r0/rooms/{roomId}/send/{eventType}/{txnId}"
 "PUT /_matrix/client/r0/rooms/{roomId}/redact/{eventId}/{txnId}"
 "POST /_matrix/client/r0/createRoom" "GET"
 "PUT /_matrix/client/r0/directory/room/{roomAlias}"
 "GET /_matrix/client/r0/directory/room/{roomAlias}"
 "DELETE /_matrix/client/r0/directory/room/{roomAlias}"
 "GET /_matrix/client/r0/joined_rooms"
 "POST /_matrix/client/r0/rooms/{roomId}/join"
 "POST /_matrix/client/r0/join/{roomIdOrAlias}"
 "POST /_matrix/client/r0/rooms/{roomId}/leave"
 "POST /_matrix/client/r0/rooms/{roomId}/forget"
 "POST /_matrix/client/r0/rooms/{roomId}/kick"
 "POST /_matrix/client/r0/rooms/{roomId}/ban"
 "POST /_matrix/client/r0/rooms/{roomId}/unban"
 "GET /_matrix/client/r0/directory/list/room/{roomId}"
 "PUT /_matrix/client/r0/directory/list/room/{roomId}"
 "GET /_matrix/client/r0/publicRooms" "POST /_matrix/client/r0/publicRooms"
 "POST /_matrix/client/r0/user_directory/search"
 "PUT /_matrix/client/r0/profile/{userId}/displayname"
 "GET /_matrix/client/r0/profile/{userId}/displayname"
 "PUT /_matrix/client/r0/profile/{userId}/avatar_url"
 "GET /_matrix/client/r0/profile/{userId}/avatar_url"
 "GET /_matrix/client/r0/profile/{userId}"
 "GET /_matrix/client/r0/voip/turnServer"
 "PUT /_matrix/client/r0/rooms/{roomId}/typing/{userId}"
 "POST /_matrix/client/r0/rooms/{roomId}/receipt/{receiptType}/{eventId}"
 "POST /_matrix/client/r0/rooms/{roomId}/read_markers"
 "PUT /_matrix/client/r0/presence/{userId}/status"
 "GET /_matrix/client/r0/presence/{userId}/status"
 "POST /_matrix/media/r0/upload"
 "GET /_matrix/media/r0/download/{serverName}/{mediaId}"
 "GET /_matrix/media/r0/download/{serverName}/{mediaId}/{fileName}"
 "GET /_matrix/media/r0/thumbnail/{serverName}/{mediaId}"
 "GET /_matrix/media/r0/preview_url" "GET /_matrix/media/r0/config"
 "PUT /_matrix/client/r0/sendToDevice/{eventType}/{txnId}"
 "GET /_matrix/client/r0/devices" "GET /_matrix/client/r0/devices/{deviceId}"
 "PUT /_matrix/client/r0/devices/{deviceId}"
 "DELETE /_matrix/client/r0/devices/{deviceId}"
 "POST /_matrix/client/r0/delete_devices" "POST /_matrix/client/r0/keys/upload"
 "POST /_matrix/client/r0/keys/query" "POST /_matrix/client/r0/keys/claim"
 "GET /_matrix/client/r0/keys/changes" "GET /_matrix/client/r0/pushers"
 "POST /_matrix/client/r0/pushers/set" "GET /_matrix/client/r0/notifications"
 "GET /_matrix/client/r0/pushrules/"
 "GET /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}"
 "DELETE /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}"
 "PUT /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}"
 "GET /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/enabled"
 "PUT /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/enabled"
 "GET /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/actions"
 "PUT /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/actions"
 "POST /_matrix/client/r0/rooms/{roomId}/invite"
 "POST /_matrix/client/r0/search" "GET /_matrix/client/r0/events"
 "GET /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags"
 "PUT /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags/{tag}"
 "DELETE /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags/{tag}"
 "PUT /_matrix/client/r0/user/{userId}/account_data/{type}"
 "GET /_matrix/client/r0/user/{userId}/account_data/{type}"
 "PUT /_matrix/client/r0/user/{userId}/rooms/{roomId}/account_data/{type}"
 "GET /_matrix/client/r0/user/{userId}/rooms/{roomId}/account_data/{type}"
 "GET /_matrix/client/r0/admin/whois/{userId}"
 "GET /_matrix/client/r0/rooms/{roomId}/context/{eventId}"
 "GET /_matrix/client/r0/login/sso/redirect"
 "POST /_matrix/client/r0/rooms/{roomId}/report/{eventId}"
 "GET /_matrix/client/r0/thirdparty/protocols"
 "GET /_matrix/client/r0/thirdparty/protocol/{protocol}"
 "GET /_matrix/client/r0/thirdparty/location/{protocol}"
 "GET /_matrix/client/r0/thirdparty/user/{protocol}"
 "GET /_matrix/client/r0/thirdparty/location"
 "GET /_matrix/client/r0/thirdparty/user"
 "POST /_matrix/client/r0/user/{userId}/openid/request_token"
 "GET /openid/userinfo" "POST /_matrix/client/r0/rooms/{roomId}/upgrade")