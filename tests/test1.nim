# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest, options, os

import discordtoken, discordtoken/types/types

let
  token = getEnv("token")
  acc = getAccount(token)
  settings = getSettings(token)
  devices = getDevices(token)
  friends = getFriends(token)
  guilds = getGuilds(token)
  profile = getProfile(token)

suite "Discord token":
  test "Token Validation":
    check(validateToken(token) == true)
    check(validateToken("penis") == false)

  test "/users/@me":
    check(acc.id == some "795785229699645491")
    check(acc.username == some "wiga")
    check(acc.discriminator == some "0184")
    check(acc.avatar == some "a6870e8b4abe4c8ecee65d1b17f01791")
  
  test "/users/@me/settings":
    check(settings.locale == "en-US")
    check(settings.show_current_game == true)
    check(settings.restricted_guilds == [])

  test "/auth/sessions":
    check(devices.user_sessions.len > 0)

  test "/users/@me/relationships":
    check(friends.len > 0)

  test "/users/@me/guilds":
    check(guilds.len > 0)

  test "/users/{id}/profile":
    check(profile.user.username == "wiga")
    check(profile.user_profile.banner == "fb106dd00edd42e7fce90b5916d16c74")
