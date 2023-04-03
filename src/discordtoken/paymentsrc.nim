import
    std/[json, marshal],
    types/[types, endpoints],
    utils/[request],
    validate

proc getPaymentsrc*(token: string): seq[Billing] =
    ## Gets all informations from `/users/@me/billing/payment-sources`
    if not validateToken(token): raise newException(IOError, "Invalid token")
    var res = getInfo(PAYMENTSRC, "GET", token)
    return to[seq[Billing]](res)