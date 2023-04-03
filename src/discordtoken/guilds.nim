import
    std/[json, marshal],
    types/[types, endpoints],
    utils/[request],
    validate

proc getGuilds*(token: string): seq[Guilds] =
    ## Gets all informations from `/users/@me/guilds`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(endpoints.GUILDS, "GET", token)
    return to[seq[types.Guilds]](res)
