import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { fetchAPI, buildQueryString } from "./api"

export interface SceneItemRow {
    id: number
    name: string
    tid: number
    mapId: number
    mapName: string
    posX: number
    posY: number
    posDir: number
    ownerType: number
    ownerId: number
    layer: number
}

export interface SceneItemSearchQuery {
    search?: string
    mapId?: number
    page?: number
    pageSize?: number
}

export interface SceneItemSearchResult {
    items: SceneItemRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    message?: string
}

export interface SceneItemUpdateResult {
    ok: boolean
    item: SceneItemRow
}

export const sceneItemService = {
    async search(params?: SceneItemSearchQuery) {
        const queryString = params ? buildQueryString(params) : ""
        return fetchAPI<SceneItemSearchResult>(
            `${DASHBOARD_API_ENDPOINTS.sceneItems}${queryString ? `?${queryString}` : ""}`
        )
    },

    async updatePosition(id: number, posX: number, posY: number) {
        return fetchAPI<SceneItemUpdateResult>(
            DASHBOARD_API_ENDPOINTS.sceneItems,
            {
                method: "PUT",
                body: JSON.stringify({ id, pos_x: posX, pos_y: posY }),
            }
        )
    },
}
