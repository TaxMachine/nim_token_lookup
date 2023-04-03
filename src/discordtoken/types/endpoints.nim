import
    std/[strutils, base64]

const
    API_VERSION*: int = 9
    DISCORD_API*: string = "https://discord.com/api/v" & $API_VERSION
    USERAGENT*: string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/1.0.9011 Chrome/91.0.4472.164 Electron/13.6.6 Safari/537.36"
    DEVICES*: string = DISCORD_API & "/auth/sessions"
    ATME*: string = DISCORD_API & "/users/@me"
    SETTINGS*: string = DISCORD_API & "/users/@me/settings"
    PAYMENTSRC*: string = DISCORD_API & "/users/@me/billing/payment-sources"
    FRIENDS*: string = DISCORD_API & "/users/@me/relationships"
    GUILDS*: string = DISCORD_API & "/users/@me/guilds"
    APPLICATIONS*: string = DISCORD_API & "/applications"
    CONNECTIONS*: string = DISCORD_API & "/users/@me/connections"
    GIFTS*: string = DISCORD_API & "/users/@me/entitlements/gifts"
proc PROFILE*(token: string): string = return DISCORD_API & "/users/" & decode(token.split(".")[0]) & "/profile"