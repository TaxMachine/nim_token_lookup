import
    std/[json, base64]

proc mkProperties*: string =
    ## Creates the `x-super-properties` header for requests
    var props: JsonNode = %*{
        "os": if defined(windows): "windows" else: "linux",
        "browser": "Discord Client",
        "release_channel": "stable",
        "client_version": "0.1.9",
        "os_version": "10.0.19044",
        "os_arch": "x64",
        "system_locale": "en-US",
        "client_build_number": 164497,
        "client_event_source": nil
    }
    return encode($props)