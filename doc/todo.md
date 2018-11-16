# todo

## json should be encoded to string before it is passed to the matrix-send-request

## account-log-in is a really bad name

## sort out the errors and allow people to handle them

## sort out the jsown "key not available for given object"
so we can handle the case when there is no key e.g. when matrix returns an error instead,
imo this is really bad work from the jsown people, it should return something else than an error

## how to handle the access token, what if someone needs to use multiple accounts?
the since value will mess up here also

# Done

## sort out testing this thing because i don't think the password can be here.
passwords are now loaded from a property list.
