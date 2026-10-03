/**
 * Economy API service
 */

import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import { fetchAPI } from "./api"
import { Transaction } from "@/types"

export const economyService = {
    async getTransactions(params?: {
        playerId?: string
        type?: string
        suspicious?: boolean
    }) {
        const queryString = params
            ? new URLSearchParams(params as any).toString()
            : ""
        return fetchAPI<Transaction[]>(
            `${DASHBOARD_API_ENDPOINTS.economyTransactions}${queryString ? `?${queryString}` : ""}`
        )
    },

    async getStats() {
        return fetchAPI<{
            totalTransactions: number
            totalRevenue: number
            suspiciousTransactions: number
        }>(DASHBOARD_API_ENDPOINTS.economyStats)
    },

    async getShopItems() {
        return fetchAPI<any[]>(DASHBOARD_API_ENDPOINTS.economyShop)
    },

    async updateShopPrice(itemId: string, price: number) {
        return fetchAPI<void>(
            DASHBOARD_API_ENDPOINTS.economyShopPrice(itemId),
            {
                method: "PATCH",
                body: JSON.stringify({ price }),
            }
        )
    },

    async compensateAllPlayers(data: {
        gold?: number
        gems?: number
        coins?: number
        items?: Array<{ itemId: string; quantity: number }>
    }) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.economyCompensateAll, {
            method: "POST",
            body: JSON.stringify(data),
        })
    },
}
