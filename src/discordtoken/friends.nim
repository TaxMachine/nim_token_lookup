import
    std/[json, marshal],
    types/[endpoints, types],
    utils/[request],
    validate

proc getFriends*(token: string): seq[Friends] =
    ## Gets all the informations from `/users/@me/relationships`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(endpoints.FRIENDS, "GET", token)
    return to[seq[types.Friends]](res)