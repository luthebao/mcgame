export const API_MESSAGES = {
    common: {
        apiError: "API Error",
        unexpectedError: "An unexpected error occurred",
        invalidRequestPayload: "Invalid request payload",
        invalidRequestPayloadLowercase: "invalid request payload",
        invalidRequest: "Invalid request",
        unknownError: "Unknown error",
        unknownErrorLowercase: "unknown error",
        missingDatabaseURL:
            "Database connection failed. Check Supabase configuration.",
    },
    admin: {
        loginRequired: "Admin login required",
        adminSecretRequired: "Admin secret is required",
        adminServerEnvRequired:
            "Set GAME_SERVER_HTTP_URL or ADMIN_SERVER_API_URL in dashboard env",
        failedToReachAdminServer: "Failed to reach admin server",
    },
    creatures: {
        monsterApprFileNotFound: "monster_appr.json not found",
        monsterApprParseFailed: "failed to parse monster_appr.json",
        imageDirectoryNotFound: "creature image directory not found",
        imageDirectoryScanFailed: "failed to scan image directory",
    },
    boxItems: {
        loadFailed: "Failed to load box items",
        awardsLoadFailed: "Failed to load item awards",
        awardSaveFailed: "Failed to save item award",
        awardDeleteFailed: "Failed to delete item award",
        awardOptionsLoadFailed: "Failed to load award options",
        invalidItemId: "itemId must be a positive integer",
        invalidAwardId: "award id must be a positive integer",
        invalidAwardData: "invalid award data",
        invalidAwardType: "award type is not supported",
    },
    dailySigninRewards: {
        loadFailed: "Failed to load daily sign-in rewards",
        saveFailed: "Failed to save daily sign-in rewards",
        deleteFailed: "Failed to delete daily sign-in reward",
        invalidPayload: "rewards payload is invalid",
        invalidInc: "inc must be 1, 2 or 4",
        invalidItemId: "itemId must be a positive integer",
        invalidQuantity: "quantity must be a positive integer",
        invalidRewardId: "reward id must be a positive integer",
    },
    items: {
        dressPanelOptionsLoadFailed: "Failed to load dress panel options",
        equipSuitDefaultsRequestInvalid:
            "itemId and setId must be positive integers.",
        equipSuitDefaultsLoadFailed: "Failed to load equip suit defaults",
        gemOptionsLoadFailed: "Failed to load gem options",
    },
    map: {
        chunksLoadFailed: "Failed to load map chunks",
        tilesLoadFailed: "Failed to load map data",
    },
    giftCodes: {
        giftCodeLengthInvalid: "gift code must be 4-64 chars",
        giftCodeCharactersInvalid: "gift code contains invalid characters",
        campaignKeyTooLong: "campaign key too long",
        campaignKeyCharactersInvalid:
            "campaign key contains invalid characters",
        timestampInvalid: "invalid timestamp",
        rewardsRequired: "at least one reward is required",
        rewardTypeRequired: "reward type is required",
        itemIDRequired: "itemId is required",
        codesOrGeneratorRequired:
            "at least one code or a generator is required",
        codesAndGeneratorConflict: "use explicit codes or generate, not both",
        campaignIDRequired: "campaignId is required",
        activeRequired: "active is required",
        campaignNotFound: "campaign not found",
        updatedCampaignNotFound: "updated campaign not found",
        createdCampaignNotFound: "created campaign not found",
        campaignNameRequired: "campaign name is required",
        endsAtBeforeStartsAt: "endsAt must be after startsAt",
        usageLimitsInvalid: "usage limits must be non-negative",
        codeMaxUsesInvalid: "code max uses must be non-negative",
        redeemedCampaignCodesImmutable:
            "cannot modify codes for redeemed campaign",
        redeemedCampaignDeleteForbidden: "cannot delete redeemed campaign",
        campaignExists: "campaign key already exists",
        codeExists: "gift code already exists",
    },
    sendPlayerItem: {
        invalidOptionsObject: "options must be an object",
        invalidTemplateTableId: "templateTableId must be 19 or 29",
        invalidPropLinesArray: "options.propLines must be an array",
        invalidPropLineItem: "each options.propLines item must be an object",
        invalidPropLineSlot:
            "propLines[].slot must be one of main1, main2, prop1, prop2, active",
        invalidPropLineType: "propLines[].type must be a positive integer",
        invalidPropLineValue: "propLines[].value must be >= 0",
        invalidGemsArray: "options.gems must be an array",
        invalidGemValue: "all options.gems values must be positive integers",
        invalidRawPropertiesObject: "options.rawProperties must be an object",
        invalidColor: "options.color must be >= 0",
        invalidStrengthenLevel: "options.strengthenLevel must be >= 0",
        invalidEndureLeft: "options.endureLeft must be >= 0",
        invalidEndureMax: "options.endureMax must be >= 0",
        invalidElement: "options.element must be >= 0",
        invalidPreNameType: "options.preNameType must be >= 0",
        invalidHoleNum: "options.holeNum must be between 0 and 10",
        invalidBindMainPropNum:
            "options.bindMainPropNum1 and options.bindMainPropNum2 must be >= 0",
        invalidPlayerID: "playerId must be a positive integer",
        invalidItemID: "itemId must be a positive integer",
        invalidCount: "count must be a positive integer",
        countTooLarge: "count is too large",
        itemSavedToDatabase:
            "Item has been saved to DB. If the character is online, relog or inventory refresh may be needed.",
    },
    client: {
        giftCodeCampaignsLoadFailed: "Failed to load gift code campaigns",
        giftCodeCampaignCreateFailed: "Failed to create campaign",
        giftCodeCampaignUpdateFailed: "Failed to update campaign",
        giftCodeCampaignStatusUpdateFailed: "Failed to update campaign status",
        giftCodeCampaignDeleteFailed: "Failed to delete campaign",
    },
} as const

export const API_MESSAGE_BUILDERS = {
    giftCodes: {
        rewardAmountMustBePositive: (rewardType: string) =>
            `reward amount must be positive for ${rewardType}`,
        unsupportedRewardType: (rewardType: string) =>
            `unsupported reward type: ${rewardType}`,
        duplicateCode: (code: string) => `duplicate code: ${code}`,
        generateCountOutOfRange: (maxCount: number) =>
            `generate count must be between 1 and ${maxCount}`,
        missingItemTemplate: (itemID: number) =>
            `item reward references missing item template: ${itemID}`,
        resolveServerKeyFailed: (serverKey: string) =>
            `resolve server key ${serverKey} failed`,
    },
    sendPlayerItem: {
        playerNotFound: (playerID: number) => `Character ${playerID} not found`,
        itemTemplateNotFound: (itemID: number, templateTableId?: number) =>
            templateTableId
                ? `Item template ${itemID} not found in table ${templateTableId}`
                : `Item template ${itemID} not found`,
        inventoryFull: (requiredSlots: number, availableSlots: number) =>
            `Player inventory is full. Required ${requiredSlots} slot(s), available ${availableSlots}.`,
    },
} as const
