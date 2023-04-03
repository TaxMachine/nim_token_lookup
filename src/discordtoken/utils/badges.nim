import
    bitops

type
    Badges = tuple
        name: string
        id: int
        emoji: string

const badges: seq[Badges] = @[
    (
        "Discord Staff",
        1,
        "<:staff:874750808728666152>"
    ),
    (
        "Discord Partner",
        2,
        "<:partner:874750808678354964>"
    ),
    (
        "Hypesquad Event",
        4,
        "<:hypesquad_events:874750808594477056>"
    ),
    (
        "Bug Hunter",
        8,
        "<:bughunter_1:874750808426692658>"
    ),
    (
        "Bravery",
        64,
        "<:bravery:874750808388952075>"
    ),
    (
        "Brilliance",
        128,
        "<:brilliance:874750808338608199>"
    ),
    (
        "Balance",
        256,
        "<:balance:874750808267292683>"
    ),
    (
        "Early Supporter",
        512,
        "<:early_supporter:874750808414113823>"
    ),
    (
        "Gold Bug Hunter",
        16384,
        "<:bughunter_2:874750808430874664>"
    ),
    (
        "Early Verified Bot Developper",
        131072,
        "<:developer:874750808472825986>"
    ),
    (
        "Active Developper",
        4194304,
        "<:activedev:1041634224253444146>"
    ),
    (
        "Moderator Programs Alumni",
        4587584,
        "<:discordmod:1092242824394702930>"
    )
]

proc convertBadge*(flag: int): seq[Badges] =
    ## Converts the flag field from /users/@me to an object that contains (name of the badge, flag, emoji)
    var res: seq[Badges] = @[]
    for bag in badges:
        if flag == 0: res.add(("None", 0, ":x:"))
        elif (bag.id == (bag.id.bitand(flag))):
            res.add(bag)
    return res