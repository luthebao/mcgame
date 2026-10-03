import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { buildQueryString, fetchAPI } from "./api"

export type LootRow = {
    cid: number
    name: string
    role: string
    mapIds: number[]
    level: number
    dropCount: number
}

export type LootListResult = {
    rows: LootRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    lastError?: string
}

export type LootDropRow = {
    id: number
    itemId: number
    itemName: string
    iconDataUrl: string
    rate: number
    quality: number
    bind: number
    qid: number
    type: number
    qtyMin: number
    qtyMax: number
}

export type LootDropInput = {
    itemId: number
    rate: number
    quality: number
    bind: number
    qid: number
    type: number
    qtyMin: number
    qtyMax: number
}

export type LootDetailResult = {
    cid: number
    name: string
    drops: LootDropRow[]
}

export type LootItemOption = {
    itemId: number
    name: string
    iconId: number
    iconDataUrl: string
    templateType: number
}

export const lootService = {
    async list(params: Record<string, unknown>) {
        const qs = buildQueryString(params)
        return fetchAPI<LootListResult>(
            `${DASHBOARD_API_ENDPOINTS.loot}${qs ? `?${qs}` : ""}`
        )
    },
    async detail(cid: number) {
        return fetchAPI<LootDetailResult>(DASHBOARD_API_ENDPOINTS.lootDetail(cid))
    },
    async save(cid: number, drops: LootDropInput[]) {
        return fetchAPI<{ ok: boolean; inserted: number; message?: string }>(
            DASHBOARD_API_ENDPOINTS.lootDetail(cid),
            { method: "PUT", body: JSON.stringify({ drops }) }
        )
    },
    async itemOptions(search: string) {
        const qs = buildQueryString({ search, limit: 50 })
        return fetchAPI<{ items: LootItemOption[] }>(
            `${DASHBOARD_API_ENDPOINTS.lootItemOptions}${qs ? `?${qs}` : ""}`
        )
    },
}
