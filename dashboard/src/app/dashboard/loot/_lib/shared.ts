export type LootRole =
    | "all"
    | "normal"
    | "map-boss"
    | "npc"
    | "other"

export type LootSortBy = "cid" | "name" | "level" | "drop_count"
export type LootSortDir = "asc" | "desc"

export type LootQueryState = {
    search: string
    role: LootRole
    mapId: number | null
    minLevel: number | null
    maxLevel: number | null
    sortBy: LootSortBy
    sortDir: LootSortDir
    page: number
    pageSize: number
}

export const DEFAULT_LOOT_QUERY: LootQueryState = {
    search: "",
    role: "all",
    mapId: null,
    minLevel: null,
    maxLevel: null,
    sortBy: "cid",
    sortDir: "asc",
    page: 1,
    pageSize: 30,
}

export const LOOT_ROLE_LABELS: Record<LootRole, string> = {
    all: "Tất cả",
    normal: "Quái thường",
    "map-boss": "Boss bản đồ",
    npc: "NPC chiến đấu",
    other: "Khác",
}

export const LOOT_RATE_MAX = 50000
