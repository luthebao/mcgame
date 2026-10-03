/**
 * Item browser API service
 */

import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { fetchAPI, buildQueryString } from "./api"

export type ItemSortBy =
    | "item_id"
    | "name"
    | "item_type"
    | "icon_id"
    | "required_level"
    | "max_stack"
    | "template_type"
    | "use_type"
    | "kind"
    | "bind_type"
    | "template_level"
export type ItemSortDir = "asc" | "desc"

export interface ItemSearchQuery {
    search?: string
    kind?: string
    templateType?: string
    sortBy?: ItemSortBy
    sortDir?: ItemSortDir
    page?: number
    pageSize?: number
}

export interface ItemTypeSummary {
    value: number
    count: number
    name: string
}

export interface ItemMetaStat {
    type: number
    value: number
    growth: number
}

export interface ItemMetaSummary {
    color: number
    templateQuality: number
    equipPosition: number
    setId: number
    socketCount: number
    bindPropNum: number
    endureMax: number
    expireMinutes: number
    activeEquipId: number
    randomQuality: number[]
    stats: ItemMetaStat[]
}

export interface ItemBrowserRow {
    itemId: number
    itemType: number
    templateTableId: number
    templateTableName: string
    templateType: number
    useType: number
    kind: number
    bindType: number
    tradable: number
    templateLevel: number
    name: string
    description: string
    iconId: number
    hasIconId: boolean
    hasIconFile: boolean
    iconPath: string
    iconDataUrl: string
    requiredLevel: number
    price: number
    maxStack: number
    dungeonId: number
    meta: ItemMetaSummary
}

export interface ItemSearchResult {
    items: ItemBrowserRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    itemTypes: ItemTypeSummary[]
    iconDirectory: string
    iconCount: number
    itemCount: number
    lastRefresh: string
    lastError?: string
}

export interface GemOption {
    itemId: number
    name: string
    requiredLevel: number
    iconId: number
    gemType: number
    gemLevel: number
    statType: number
    value: number
}

export interface GemListResult {
    items: GemOption[]
    total: number
    lastRefresh: string
    message?: string
}

export interface EquipSuitDefaultItem {
    itemId: number
    name: string
    equipPos: number
    requiredLevel: number
}

export interface EquipSuitDefaultTip {
    count: number
    talent: number
    effect: number
    name: string
    description: string
}

export interface EquipSuitDefaultsResult {
    setId: number
    items: EquipSuitDefaultItem[]
    itemIds: number[]
    tips: EquipSuitDefaultTip[]
    name: string
    hasCompleteDefaults: boolean
    lastRefresh: string
    message?: string
}

export const itemService = {
    async search(params?: ItemSearchQuery) {
        const queryString = params ? buildQueryString(params) : ""
        return fetchAPI<ItemSearchResult>(
            `${DASHBOARD_API_ENDPOINTS.items}${queryString ? `?${queryString}` : ""}`
        )
    },

    async listGems() {
        return fetchAPI<GemListResult>(DASHBOARD_API_ENDPOINTS.itemGems)
    },

    async getEquipSuitDefaults(itemId: number, setId: number) {
        const queryString = buildQueryString({ itemId, setId })
        return fetchAPI<EquipSuitDefaultsResult>(
            `${DASHBOARD_API_ENDPOINTS.itemEquipSuitDefaults}?${queryString}`
        )
    },
}
