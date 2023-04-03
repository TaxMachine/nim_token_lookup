import
    std/[json, options],
    types/[types, endpoints],
    utils/[request],
    validate

proc getAccount*(token: string): User =
    ## Gets all informations from `/users/@me`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var 
        res = getInfo(ATME, "GET", token)
        parsed = parseJson(res)
    delete(parsed, "linked_users")
    return User(
        global_name: some parsed["global_name"].getStr,
        display_name: some parsed["display_name"].getStr,
        avatar_decoration: some parsed["avatar_decoration"].getStr,
        purchased_flags: some parsed["purchased_flags"].getInt,
        premium_usage_flags: some parsed["premium_usage_flags"].getInt,
        banner: some parsed["banner"].getStr,
        banner_color: some parsed["banner_color"].getStr,
        accent_color: some parsed["accent_color"].getInt,
        bio: some parsed["bio"].getStr,
        nsfw_allowed: some parsed["nsfw_allowed"].getBool,
        phone: some parsed["phone"].getStr,
        id: some parsed["id"].getStr,
        username: some parsed["username"].getStr,
        discriminator: some parsed["discriminator"].getStr,
        avatar: some parsed["avatar"].getStr,
        mfa_enabled: some parsed["mfa_enabled"].getBool,
        locale: some parsed["locale"].getStr,
        verified: some parsed["verified"].getBool,
        email: some parsed["email"].getStr,
        flags: some parsed["flags"].getInt,
        premium_type: some parsed["premium_type"].getInt,
        public_flags: some parsed["public_flags"].getInt
    )