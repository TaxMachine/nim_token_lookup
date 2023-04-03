import
    std/[httpclient],
    ../types/[properties, endpoints]

proc getInfo*(url: string, `method`: string, token: string): string =
    var parsedMethod: HttpMethod
    case `method`:
        of "GET":
            parsedMethod = HttpGet
        of "POST":
            parsedMethod = HttpPost
        of "PUT":
            parsedMethod = HttpPut
        of "DELETE":
            parsedMethod = HttpDelete
        of "PATCH":
            parsedMethod = HttpPatch
        else:
            parsedMethod = HttpGet
    var
        client = newHttpClient(userAgent = USERAGENT)
    client.headers = newHttpHeaders({
        "Authorization": token,
        "x-super-properties": mkProperties(),
        "Content-Type": "application/json"
    })
    return client.request(url, parsedMethod).body