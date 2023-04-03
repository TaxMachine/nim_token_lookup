import
    std/[httpclient],
    types/[endpoints]

proc validateToken*(token: string): bool =
    var
        client = newHttpClient()
    client.headers = newHttpHeaders({"Authorization": token})
    return if client.request(ATME, HttpGet).status == $Http200: true else: false