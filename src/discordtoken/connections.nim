import
    std/[json, marshal],
    types/[endpoints, types],
    utils/[request],
    validate

proc getConections*(token: string): seq[Connections] =
    ## Gets all the informations from `/users/@me/connections`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(endpoints.CONNECTIONS, "GET", token)
    return to[seq[types.Connections]](res)