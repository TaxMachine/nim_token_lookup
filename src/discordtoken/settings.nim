import
    std/[json, marshal],
    types/[types, endpoints],
    utils/[request],
    validate

proc getSettings*(token: string): Settings =
    ## Gets all informations from `/users/@me/settings`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var 
        res = getInfo(endpoints.SETTINGS, "GET", token)
        parsed = parseJson(res)
    delete(parsed, "guild_folders")
    delete(parsed, "custom_status")
    return to[types.Settings]($parsed)
