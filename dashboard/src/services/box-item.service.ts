import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import type { BoxItemAwardPayload } from "@/lib/box-item-awards"

import { fetchAPI, buildQueryString } from "./api"

export type BoxItemSortBy =
    | "item_id"
    | "name"
    | "template_type"
    | "required_level"
    | "kind"
export type BoxItemSortDir = "asc" | "desc"
export type BoxItemSourceFilter =
    | "all"
    | "quest_reward"
    | "shop"
    | "creature_loot"
    | "award_config"

export interface BoxItemSearchQuery {
    search?: string
    templateType?: number | null
    sortBy?: BoxItemSortBy
    sortDir?: BoxItemSortDir
    sourceFilter?: BoxItemSourceFilter
    shopId?: number | null
    page?: number
    pageSize?: number
}

export interface BoxItemRow {
    itemId: number
    name: string
    description: string
    iconId: number
    iconDataUrl: string
    templateType: number
    useType: number
    itemType: number
    kind: number
    requiredLevel: number
    maxStack: number
}

export interface BoxItemSearchResult {
    items: BoxItemRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    lastRefresh: string
    lastError?: string
}

export interface ItemAwardRow {
    id: number
    itemId: number
    awardId: number
    awardName: string
    type: number
    typeName: string
    count: number
    rate: number
    quality: number
    preNameType: number
    payload: BoxItemAwardPayload
}

export interface ItemAwardInput {
    id?: number
    awardId: number
    type: number
    count: number
    rate: number
    quality: number
    preNameType: number
    payload: BoxItemAwardPayload
}

export interface ItemAwardOption {
    id: number
    name: string
    iconId: number
    iconDataUrl: string
    subtitle: string
}

interface AwardsResponse {
    ok: boolean
    awards: ItemAwardRow[]
    message?: string
}

interface AwardOptionsResponse {
    ok: boolean
    items: ItemAwardOption[]
    message?: string
}

interface DeleteResponse {
    ok: boolean
    deletedId?: number
    message?: string
}

export const boxItemService = {
    async search(params?: BoxItemSearchQuery) {
        const queryString = params ? buildQueryString(params) : ""
        return fetchAPI<BoxItemSearchResult>(
            `${DASHBOARD_API_ENDPOINTS.boxItems}${queryString ? `?${queryString}` : ""}`
        )
    },

    async getItem(itemId: number) {
        const result = await this.search({
            search: String(itemId),
            page: 1,
            pageSize: 1,
        })
        return result.items.find(item => item.itemId === itemId) || null
    },

    async getAwards(itemId: number) {
        const res = await fetchAPI<AwardsResponse>(
            `${DASHBOARD_API_ENDPOINTS.boxItemAwards}?itemId=${itemId}`
        )
        return res.awards || []
    },

    async saveAwards(itemId: number, awards: ItemAwardInput[]) {
        const res = await fetchAPI<AwardsResponse>(
            DASHBOARD_API_ENDPOINTS.boxItemAwards,
            {
                method: "POST",
                body: JSON.stringify({ itemId, awards }),
            }
        )
        return res.awards || []
    },

    async searchAwardOptions(type: number, search: string, limit = 20) {
        const queryString = buildQueryString({ type, search, limit })
        const res = await fetchAPI<AwardOptionsResponse>(
            `${DASHBOARD_API_ENDPOINTS.boxItemAwardOptions}?${queryString}`
        )
        return res.items || []
    },

    async deleteAward(id: number) {
        return fetchAPI<DeleteResponse>(DASHBOARD_API_ENDPOINTS.boxItemAwards, {
            method: "DELETE",
            body: JSON.stringify({ id }),
        })
    },
}
