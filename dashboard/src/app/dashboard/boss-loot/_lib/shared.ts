export type BossLootKind = "all" | "ground" | "flying" | "daily_only"
export type BossLootTier = "all" | "normal" | "mythic" | "special"
export type BossLootSortBy = "nid" | "name" | "level" | "drop_count"
export type BossLootSortDir = "asc" | "desc"

export type BossLootQueryState = {
    search: string
    kind: BossLootKind
    tier: BossLootTier
    mapId: number | null
    minLevel: number | null
    maxLevel: number | null
    sortBy: BossLootSortBy
    sortDir: BossLootSortDir
    page: number
    pageSize: number
}

export const DEFAULT_BOSS_LOOT_QUERY: BossLootQueryState = {
    search: "",
    kind: "all",
    tier: "all",
    mapId: null,
    minLevel: null,
    maxLevel: null,
    sortBy: "nid",
    sortDir: "asc",
    page: 1,
    pageSize: 30,
}

export const BOSS_LOOT_KIND_LABELS: Record<BossLootKind, string> = {
    all: "Tất cả",
    ground: "Trên đất",
    flying: "Trên không",
    daily_only: "Daily-only",
}

export const BOSS_LOOT_TIER_LABELS: Record<BossLootTier, string> = {
    all: "Tất cả tier",
    normal: "Thường",
    mythic: "Huyền thoại",
    special: "Đặc biệt",
}

export const BOSS_LOOT_RATE_MAX = 50000

export const BOSS_LOOT_REWARD_TYPES = [
    { value: 29, label: "Vật phẩm thường" },
    { value: 19, label: "Trang bị" },
    { value: 508, label: "Vật phẩm nhiệm vụ (508)" },
    { value: 509, label: "Vật phẩm nhiệm vụ (509)" },
    { value: 550, label: "Pet item bag (550)" },
    { value: 30, label: "Tiền tệ cơ bản (Bạc/Vàng/Danh vọng)" },
    { value: 31, label: "Kinh nghiệm" },
    { value: 35, label: "Tiền tệ wallet (warSprite, heiyaoshiPoint, …)" },
] as const

export const BOSS_LOOT_BASIC_CURRENCY_OPTIONS = [
    { value: 0, key: "money", label: "Bạc (Money)" },
    { value: 1, key: "gold", label: "Vàng (Gold)" },
    { value: 2, key: "honor", label: "Danh vọng (Honor)" },
]
