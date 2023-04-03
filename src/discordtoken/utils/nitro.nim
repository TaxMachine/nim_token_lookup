import
    std/[times, strutils, math]

type
    BoostBadge = tuple
        months: int
        level: int
        emoji: string

proc convertNitro*(flag: int): string =
    ## Converts the premium_type field from /users/@me to a string that describes the subscription
    case flag:
        of 1:
            return "Nitro Classic"
        of 2:
            return "Nitro Boost"
        of 3:
            return "Nitro Basic"
        else:
            return "None"

const boostBadges: seq[BoostBadge] = @[
    (1, 1, "<:discordboost1:1092286848296042506>"),
    (2, 2, "<:discordboost2:1092286849495617537>"),
    (3, 3, "<:discordboost3:1092286851399823420>"),
    (6, 4, "<:discordboost4:1092286852339347456>"),
    (9, 5, "<:discordboost5:1092286853304029285>"),
    (12, 6, "<:discordboost6:1092286899101630504>"),
    (15, 7, "<:discordboost7:1092286844487606423>"),
    (18, 8, "<:discordboost8:1092286846052085901>"),
    (24, 9, "<:discordboost9:1092286847369084938>")
]

proc convertNitroBoost*(date: string): BoostBadge =
    ## Converts the Date in the field "premium_guild_since" in /users/{id}/profile to a BoostBadge object which contains (months, level, emoji)
    ## Takes a date string as a parameter which looks like this "2023-02-21T01:59:14.326000+00:00" but it splits at the .
    var
        # ok maybe not the best way to do it but im tired of this shit
        time = parseTime(date.split(".")[0], "yyyy-MM-dd'T'HH:mm:ss", utc())
        rightnow = now().toTime
        duration = rightnow - time
        number = (((float)duration.inWeeks) / 4.0).splitDecimal().intpart
    for badges in boostBadges:
        if number.toInt > badges.months:
            result = badges