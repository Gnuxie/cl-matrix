# v2.0.0

## cl-matrix
 * removed joined-rooms in favour of just using #'cl-matrix.api.client:get-joined-rooms
 * removed room-joined-members in favour of #'cl-matrix.api.clientget-rooms/roomid/members
 * removed rooms-joined-members because it's unnecessary.
 * removed rooms-state because it's unnecessary.
 * removed room-forget and room-leave in favour of cl-matrix.api.client funs.
 * removed room-put-state in favour of #'cl-matrix.api.client:put-rooms/roomid/state/eventtype
 * removed n-messages in favour of the history generator.



# v0.2.0

If I've missed something or broken something of yours, you can always come talk to me in `#cl-matrix:matrix.org`.

## cl-matrix
 * functions added for handling media (preview-url, thumbnail, upload-media, download-media. 
 * removed function all-messages because it was just silly., see the new history-generator.
 * added history-generator which can paginate forwards or backwards from a token.
 * added function get-creation-event which is used to get the first event inside a room.

## account
 * removed password from cl-matrix:account 
 * make-account accepts a protocol so you can specify http instead of https
 
## matrix-requests

matrix-requests has been changed to cl-matrix.api.client, cl-matrix.api.base, cl-matrix.api.media, cl-matrix.api.generation

the function signatures are exactly the same, the conditions are the same, the generation from autowrap has just become cleaner.

## matrix-autowrap -> cl-matrix.autowrap

schema and module have been merged into the same class.

## cl-matrix.autowrap.authentication 

protocol slot has been added see the reference index for details on that.

## events
the base events package has been moved to method-hooks but this package should only act as an example, there are hook-points for things you will probably never use.


# v0.1.0 2019.07.27
