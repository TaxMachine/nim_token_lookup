import
    std/[json, marshal],
    types/[endpoints, types],
    utils/[request],
    validate

proc getGifts*(token: string): seq[Gifts] =
    ## Gets all the informations from `/users/@me/entitlements/gifts`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(endpoints.GIFTS, "GET", token)
    return to[seq[types.Gifts]](res)