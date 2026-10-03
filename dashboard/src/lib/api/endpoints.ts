const defaultDashboardAPIBasePath = "/api"

function normalizeAPIBasePath(raw: string | undefined): string {
    const value = raw?.trim()
    if (!value) {
        return defaultDashboardAPIBasePath
    }

    const normalized = value.startsWith("/") ? value : `/${value}`
    if (normalized.endsWith("/") && normalized.length > 1) {
        return normalized.slice(0, -1)
    }

    return normalized
}

function normalizeAPIPath(pathname: string): string {
    return pathname.startsWith("/") ? pathname : `/${pathname}`
}

function joinPathSegments(...segments: Array<string | number>): string {
    const normalized = segments
        .map(segment =>
            String(segment)
                .trim()
                .replace(/^\/+|\/+$/g, "")
        )
        .filter(Boolean)

    return normalized.length > 0 ? `/${normalized.join("/")}` : "/"
}

export const DASHBOARD_API_ENDPOINTS = {
    adminChat: "/admin/chat",
    adminPlayers: "/admin/players",
    adminSession: "/admin/session",
    creatures: "/creatures",
    dressPanelCatalog: "/dress-panel/catalog",
    giftCodeCampaigns: "/gift-codes/campaigns",
    boxItems: "/box-items",
    boxItemAwards: "/box-items/awards",
    boxItemAwardOptions: "/box-items/award-options",
    items: "/items",
    itemDetail: (itemId: number, tableId?: number) =>
        `/items/${itemId}${tableId ? `?tableId=${tableId}` : ""}`,
    sceneItems: "/scene-items",
    activities: "/activities",
    dailySigninRewards: "/daily-signin-rewards",
    dailySigninRewardOptions: "/daily-signin-rewards/options",
    loot: "/loot",
    lootDetail: (cid: number | string) => `/loot/${cid}`,
    lootItemOptions: "/loot/item-options",
    bossLoot: "/boss-loot",
    bossLootDetail: (nid: number | string) => `/boss-loot/${nid}`,
    bossLootItemOptions: "/boss-loot/item-options",
    itemGems: "/items/gems",
    itemEquipSuitDefaults: "/items/equip-suit-defaults",
    mapChunks: (mapId: string | number) =>
        joinPathSegments("map", mapId, "chunks"),
    mapTiles: (mapId: string | number) =>
        joinPathSegments("map", mapId, "tiles"),
    mapTileAsset: (
        mapId: string | number,
        ...pathSegments: Array<string | number>
    ) => joinPathSegments("map", mapId, "tiles", ...pathSegments),
    players: "/players",
    playerByID: (playerId: string | number) =>
        joinPathSegments("players", playerId),
    playerInventory: (playerId: string | number) =>
        joinPathSegments("players", playerId, "inventory"),
    playerCurrency: (playerId: string | number) =>
        joinPathSegments("players", playerId, "currency"),
    playerLoginHistory: (playerId: string | number) =>
        joinPathSegments("players", playerId, "login-history"),
    playerBan: (playerId: string | number) =>
        joinPathSegments("players", playerId, "ban"),
    playerUnban: (playerId: string | number) =>
        joinPathSegments("players", playerId, "unban"),
    playerMute: (playerId: string | number) =>
        joinPathSegments("players", playerId, "mute"),
    playerKick: (playerId: string | number) =>
        joinPathSegments("players", playerId, "kick"),
    playerCompensate: (playerId: string | number) =>
        joinPathSegments("players", playerId, "compensate"),
    playerSendItem: "/players/send-item",
    playerAction: (playerId: string | number) =>
        joinPathSegments("players", playerId, "action"),
    economyTransactions: "/economy/transactions",
    economyStats: "/economy/stats",
    economyShop: "/economy/shop",
    economyShopPrice: (itemId: string | number) =>
        joinPathSegments("economy", "shop", itemId, "price"),
    economyCompensateAll: "/economy/compensate-all",
    events: "/events",
    eventByID: (eventId: string | number) =>
        joinPathSegments("events", eventId),
    eventToggle: (eventId: string | number) =>
        joinPathSegments("events", eventId, "toggle"),
    servers: "/servers",
    serverByID: (serverId: string | number) =>
        joinPathSegments("servers", serverId),
    serverStats: "/servers/stats",
    serverRestart: (serverId: string | number) =>
        joinPathSegments("servers", serverId, "restart"),
    serverMaintenance: (serverId: string | number) =>
        joinPathSegments("servers", serverId, "maintenance"),
    serverBroadcast: "/servers/broadcast",
    lines: "/lines",
    lineByID: (id: number) => joinPathSegments("lines", id),
    gameConfigServer: "/game-config/server",
    gameConfigTuning: "/game-config/tuning",
    gameConfigGM: "/game-config/gm",
} as const

export const ADMIN_SERVER_ENDPOINTS = {
    auth: "/api/admin/auth",
    chat: "/api/admin/chat",
    players: "/api/admin/players",
    playerSessions: "/api/admin/players/sessions",
    playerSendItem: "/api/admin/players/send-item",
    playerAction: "/api/admin/players/action",
} as const

export function buildDashboardAPIPath(pathname: string): string {
    return `${normalizeAPIBasePath(process.env.NEXT_PUBLIC_API_URL)}${normalizeAPIPath(pathname)}`
}
