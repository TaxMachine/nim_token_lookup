import std/[options]

type
    User* = object
        ## Type for `/users/@me` object
        id*: Option[string]
        username*: Option[string]
        global_name*: Option[string]
        avatar*: Option[string]
        display_name*: Option[string]
        avatar_decoration*: Option[string]
        discriminator*: Option[string]
        public_flags*: Option[int]
        flags*: Option[int]
        purchased_flags*: Option[int]
        premium_usage_flags*: Option[int]
        banner*: Option[string]
        banner_color*: Option[string]
        accent_color*: Option[int]
        bio*: Option[string]
        locale*: Option[string]
        nsfw_allowed*: Option[bool]
        mfa_enabled*: Option[bool]
        premium_type*: Option[int]
        email*: Option[string]
        verified*: Option[bool]
        phone*: Option[string]

    Client_info = object
        os*: string
        platform*: string
        location*: string

    Client = object
        id_hash*: string
        approx_last_used_time*: string
        client_info*: Client_info

    Device* = object
        ## Type for `/auth/sessions` object
        user_sessions*: seq[Client]

    Profile_user = object
        id*: string
        username*: string
        avatar*: string
        avatar_decoration*: string
        discriminator*: string
        public_flags*: int
        flags*: int
        banner*: string
        banner_color*: string
        accent_color*: int
        bio*: string
        global_name*: string
        display_name*: string

    Connected_accounts = object
        `type`*: string
        id*: string
        name*: string
        verified*: bool

    Mutual_guilds = object
        id*: string
        nick*: string

    User_profile = object
        bio*: string
        accent_color*: int
        banner*: string
        theme_colors*: seq[int]
        popout_animation_particle_type*: string
        emoji*: string

    Profile* = object
        ## Type for `/users/{userId}/profile` object
        user*: Profile_user
        connected_accounts*: seq[Connected_accounts]
        premium_since*: string
        premium_type*: int
        premium_guild_since*: string
        profile_themes_experiment_bucket*: int
        mutual_guilds*: seq[Mutual_guilds]
        user_profile*: User_profile

    Friend_source_flags = object
        all*: bool

    Settings* = object
        ## Type for `/users/@me/settings` object
        locale*: string
        show_current_game*: bool
        restricted_guilds*: seq[string]
        default_guilds_restricted*: bool
        inline_attachment_media*: bool
        inline_embed_media*: bool
        gif_auto_play*: bool
        render_embeds*: bool
        render_reactions*: bool
        animate_emoji*: bool
        enable_tts_command*: bool
        message_display_compact*: bool
        convert_emoticons*: bool
        explicit_content_filter*: int
        disable_games_tab*: bool
        theme*: string
        developer_mode*: bool
        detect_platform_accounts*: bool
        status*: string
        afk_timeout*: int
        timezone_offset*: int
        stream_notifications_enabled*: bool
        allow_accessibility_detection*: bool
        contact_sync_enabled*: bool
        native_phone_integration_enabled*: bool
        animate_stickers*: int
        friend_discovery_flags*: int
        view_nsfw_guilds*: bool
        view_nsfw_commands*: bool
        passwordless*: bool
        friend_source_flags*: Friend_source_flags
        activity_restricted_guild_ids*: seq[string]
        activity_joining_restricted_guild_ids*: seq[string]
        dm_spam_filter*: int
        family_center_enabled*: bool

    Billing_address = object
        line1*: string
        line2*: string
        city*: string
        state*: string
        zip*: string

    Billing* = object
        ## Type for `/users/@me/billing/payment-sources` object
        id*: string
        `type`*: string
        flags*: int
        email*: string
        card_type*: string
        card_last_four*: string
        exp_month*: string
        exp_year*: string
        name_on_card*: string
        billing_address*: Billing_address

    Friends_user = object
        id*: string
        username*: string
        avatar*: string
        avatar_decoration*: string
        discriminator*: string
        public_flags*: int
        global_name*: string
        display_name*: string

    Friends* = object
        ## Type for `/users/@me/relationships` object
        id*: string
        `type`*: int
        nickname*: string
        user*: Friends_user

    Guilds* = object
        ## Type for `/users/@me/guilds` object
        id*: string
        name*: string
        icon*: string
        owner*: bool
        permissions*: string
        features*: seq[string]

    Applications_owner = object
        id*: string
        username*: string
        avatar*: string
        avatar_decoration*: string
        discriminator*: string
        public_flags*: int
        flags*: int

    Applications_bot = object
        id*: string
        username*: string
        avatar*: string
        avatar_decoration*: string
        discriminator*: string
        public_flags*: int
        bot*: bool

    Applications* = object
        ## Type for `/applications` object
        id*: string
        name*: string
        icon*: string
        description*: string
        summary*: string
        `type`*: string
        hook*: bool
        guild_id*: string
        bot_public*: bool
        bot_require_code_grant*: bool
        verify_key*: string
        owner*: Applications_owner
        flags*: int
        redirect_uris*: seq[string]
        rpc_application_state*: int
        store_application_state*: int
        creator_monetization_state*: int
        verification_state*: int
        interactions_endpoint_url*: string
        integration_public*: bool
        integration_require_code_grant*: bool
        discoverability_state*: int
        discovery_eligibility_flags*: int
        role_connections_verification_url*: string
        bot*: Applications_bot

    Connections* = object
        ## Type for `/users/@me/connections` object
        `type`*: string
        id*: string
        name*: string
        visibility*: int
        friend_sync*: bool
        show_activity*: bool
        verified*: bool
        two_way_link*: bool
        metadata_visibility*: int
        access_token*: string
        revoked*: bool
        integrations*: seq[string]

    Gifts* = object
        ## Type for `/users/@me/entitlements/gifts` object
        id*: string
        `type`*: string
        item_id*: string
        item_type*: string
        item_name*: string
        sender_id*: string
        sender_username*: string
        recipient_id*: string
        recipient_username*: string
        created_at*: string