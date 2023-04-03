import 
    std/[json, marshal],
    types/[types, endpoints],
    utils/[request],
    validate

proc getDevices*(token: string): Device =
    ## Gets all informations from `/auth/sessions`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(DEVICES, "GET", token)
    return to[Device](res)