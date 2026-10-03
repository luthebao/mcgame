import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { buildQueryString, fetchAPI } from "./api"

export type CreatureImageFilter = "all" | "with" | "without"

export interface CreatureSearchQuery {
    search?: string
    imageFilter?: CreatureImageFilter
    page?: number
    pageSize?: number
    refresh?: number
}

export interface CreatureRow {
    name: string
    apprId: number
    hasImage: boolean
    imagePath: string
    imageDataUrl: string
}

export interface CreatureSearchResult {
    items: CreatureRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    mappingCount: number
    sourceFile: string
    imageDirectory: string
    imageCount: number
    lastRefresh: string
    lastError?: string
}

export const creatureService = {
    async search(params?: CreatureSearchQuery) {
        const queryString = params ? buildQueryString(params) : ""
        return fetchAPI<CreatureSearchResult>(
            `${DASHBOARD_API_ENDPOINTS.creatures}${queryString ? `?${queryString}` : ""}`
        )
    },
}
