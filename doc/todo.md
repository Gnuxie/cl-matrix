# todo

## test ordering can cause issues
if the listening test is done before pagination test then pagination fails
i suspect it's just the way they are setup and torn down but it does need fixing
more tests are needed for listening

## paginate until predicate method for rooms messages, maybe even use this as the default
maybe some kind of take 20 messages system too

## test that nesting with-account works
matrix-migrate does this, so we know it works, it just needs a test.

## account-log-in is a really bad name

## sort out the jsown "key not available for given object"
so we can handle the case when there is no key e.g. when matrix returns an error instead,
imo this is really bad work from the jsown people, it should return something else than an error

## keep names for filters, keep track of the ids for each one ?

## power levels internally as int but should expect float or string because synapse isn't spec conforming :anger:
they can be string on synapse too so watch out

## add query parameters to handlers

## add struct for events holding type and id

## usocket timeout exception is not handelled

# Partial

## sort out the errors and allow people to handle them

## rate limiting for all methods

see msg-send

# Done

## sort out testing this thing because i don't think the password can be here.
passwords are now loaded from a property list.

## json should be encoded to string before it is passed to the matrix-send-request

## there is a pathname issue with the test config

## make tx-id unix timestamp
tx-id is now (+ (* 10000 (get-universal-time)) (random 10000))
(see (random-timestamp))
as without an external library there is no way to get milliseconds
this could be better or worse.

## how to handle the access token, what if someone needs to use multiple accounts?
account class and with-account macro added

## endpoint handler macro
see handler.lisp

## internal room representation
