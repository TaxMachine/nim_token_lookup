import
    std/[json, marshal],
    types/[types, endpoints],
    utils/[request],
    validate

proc getProfile*(token: string): Profile =
    ## Gets all informations from `/users/{userId}/profile`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(PROFILE(token), "GET", token)
    return to[types.Profile](res)