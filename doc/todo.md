# todo

## \*sync-next-batch\*
this needs updating to work with our new account class

## test that nesting with-account works

## account-log-in is a really bad name

## sort out the errors and allow people to handle them

## sort out the jsown "key not available for given object"
so we can handle the case when there is no key e.g. when matrix returns an error instead,
imo this is really bad work from the jsown people, it should return something else than an error

## change the since value to only have the side effect on different filters, or just not have it
maybe we could do some lazy psuedo magic to do hide the since completly?

## keep names for filters, keep track of the ids for each one ?

## maybe have access tokens in a plist or something
e.g. you give the user-id with each event to use a valid access token for that id.

## power levels internally as int but should expect float or string because synapse isn't spec conforming :anger:
they can be string on synapse too so watch out

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
