import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { buildQueryString, fetchAPI } from "./api"

export type BossLootRow = {
    nid: number
    name: string
    kind: "ground" | "flying" | "daily_only"
    tier: "normal" | "mythic" | "special"
    mapId: number
    level: number
    dailyBossId: number | null
    dropCount: number
}

export type BossLootListResult = {
    rows: BossLootRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    lastError?: string
}

export type BossLootDropRow = {
    id: number
    rewardType: number
    awardId: number
    itemId: number
    itemName: string
    iconDataUrl: string
    rate: number
    quality: number
    qtyMin: number
    qtyMax: number
    bound: boolean
    qid: number
    tierFilter: string | null
    sourceFilter: string | null
    notes: string | null
}

export type BossLootDropInput = {
    rewardType: number
    awardId: number
    rate: number
    quality: number
    qtyMin: number
    qtyMax: number
    bound: boolean
    qid: number
    tierFilter: string | null
    sourceFilter: string | null
    notes: string | null
}

export type BossLootDetailResult = {
    nid: number
    name: string
    kind: string
    tier: string
    mapId: number
    level: number
    dailyBossId: number | null
    drops: BossLootDropRow[]
}

export type BossLootItemOption = {
    itemId: number
    name: string
    iconId: number
    iconDataUrl: string
    templateType: number
}

export const bossLootService = {
    async list(params: Record<string, unknown>) {
        const qs = buildQueryString(params)
        return fetchAPI<BossLootListResult>(
            `${DASHBOARD_API_ENDPOINTS.bossLoot}${qs ? `?${qs}` : ""}`
        )
    },
    async detail(nid: number) {
        return fetchAPI<BossLootDetailResult>(
            DASHBOARD_API_ENDPOINTS.bossLootDetail(nid)
        )
    },
    async save(nid: number, drops: BossLootDropInput[]) {
        return fetchAPI<{ ok: boolean; inserted: number; message?: string }>(
            DASHBOARD_API_ENDPOINTS.bossLootDetail(nid),
            { method: "PUT", body: JSON.stringify({ drops }) }
        )
    },
    async itemOptions(search: string) {
        const qs = buildQueryString({ search, limit: 50 })
        return fetchAPI<{ items: BossLootItemOption[] }>(
            `${DASHBOARD_API_ENDPOINTS.bossLootItemOptions}${qs ? `?${qs}` : ""}`
        )
    },
}
