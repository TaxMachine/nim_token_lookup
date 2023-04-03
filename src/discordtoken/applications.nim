import
    std/[json, marshal],
    types/[endpoints, types],
    utils/[request],
    validate

proc getApplications*(token: string): seq[Applications] =
    ## Gets all the informations from `/applications`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(endpoints.APPLICATIONS, "GET", token)
    return to[seq[types.Applications]](res)