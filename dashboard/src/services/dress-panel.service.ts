import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { fetchAPI } from "./api"

export type DressPanelBookOption = {
    id: number
    name: string
    type: number
    itemId: number
    itemName: string
    recipeId: number
    recipeName: string
}

export type DressPanelRecipeOption = {
    id: number
    name: string
    type: number
    product: number
    productName: string
}

export type DressPanelCatalogResponse = {
    ok: boolean
    bookOptions: DressPanelBookOption[]
    recipeOptions: DressPanelRecipeOption[]
    message?: string
}

export const dressPanelService = {
    async getCatalog() {
        return fetchAPI<DressPanelCatalogResponse>(
            DASHBOARD_API_ENDPOINTS.dressPanelCatalog,
            {
                cache: "no-store",
            }
        )
    },
}
