# todo

## account-log-in is a really bad name

## sort out the errors and allow people to handle them

## sort out the jsown "key not available for given object"
so we can handle the case when there is no key e.g. when matrix returns an error instead,
imo this is really bad work from the jsown people, it should return something else than an error

## change the since value to only have the side effect on different filters, or just not have it
maybe we could do some lazy psuedo magic to do hide the since completly?

## keep names for filters, keep track of the ids for each one ?

## how to handle the access token, what if someone needs to use multiple accounts?
the since value will mess up here also

## maybe have access tokens in a plist or something
e.g. you give the user-id with each event to use a valid access token for that id.

## make tx-id unix stimestamp

/dev/ponies
Encrypted by an unverified device
txid is used to track messages

Encrypted by an unverified device
either make it a unix timestamp or random data
22:26Encrypted by an unverified device
and by unix timestamp i mean in microseconds
Sourcerer Gnuxie 🐝💜
Encrypted by a verified device
ohhhhhhhh

/dev/ponies
Encrypted by an unverified device
riot uses m+unixtimestamp.milisecondsextra

Sourcerer Gnuxie 🐝💜
Encrypted by a verified device
cool, thankies devie

## power levels need to be handled internally as float
they can be string on synapse too so watch out

# Done

## sort out testing this thing because i don't think the password can be here.
passwords are now loaded from a property list.

## json should be encoded to string before it is passed to the matrix-send-request

## there is a pathname issue with the test config

