/**
 * Player API service
 */

import { fetchAPI, buildQueryString } from "./api"
import { AdminPlayerListResponse, Player } from "@/types"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

export type SendPlayerItemPayload = {
    playerId: number
    itemId: number
    templateTableId: number
    count: number
    createdBy?: string
    options?: {
        binded?: boolean
        color?: number
        strengthenLevel?: number
        endureLeft?: number
        endureMax?: number
        maker?: string
        element?: number
        preNameType?: number
        holeNum?: number
        bindMainPropNum1?: number
        bindMainPropNum2?: number
        propLines?: Array<{
            slot: "main1" | "main2" | "prop1" | "prop2" | "active"
            type: number
            value: number
        }>
        gems?: number[]
        flag?: string
        flag2?: string
        flag3?: string
        rawProperties?: Record<string, unknown>
    }
}

export type SendPlayerItemResult = {
    ok: boolean
    player: {
        id: number
        name: string
        level: number
        bagSlots: number
    }
    item: {
        itemId: number
        name: string
        itemType: number
        templateTableId: number
        templateTableName: string
    }
    requestedCount: number
    grantedCount: number
    stackedCount: number
    insertedCount: number
    createdStacks: number
    updatedStacks: number
    insertedItems: Array<{
        instanceId: number
        slotIndex: number
        sid: number
        stackCount: number
    }>
    deliveryMode: "database_only" | "live_session"
    refreshRecommended: boolean
    appliedOptions?: {
        binded: boolean
        color: number
        strengthenLevel: number
        holeNum: number
        propLineCount: number
        gemsCount: number
        rawPropertyCount: number
    }
    statusMessage: string
}

export const playerService = {
    async getAll(
        params?: { search?: string; limit?: number },
        options?: RequestInit
    ) {
        const queryString = params ? buildQueryString(params) : ""
        return fetchAPI<AdminPlayerListResponse>(
            `${DASHBOARD_API_ENDPOINTS.adminPlayers}${queryString ? `?${queryString}` : ""}`,
            options
        )
    },

    async getById(id: string) {
        return fetchAPI<Player>(DASHBOARD_API_ENDPOINTS.playerByID(id))
    },

    async getInventory(playerId: string) {
        return fetchAPI<Player["inventory"]>(
            DASHBOARD_API_ENDPOINTS.playerInventory(playerId)
        )
    },

    async getCurrency(playerId: string) {
        return fetchAPI<Player["currency"]>(
            DASHBOARD_API_ENDPOINTS.playerCurrency(playerId)
        )
    },

    async getLoginHistory(playerId: string) {
        return fetchAPI<Player["loginHistory"]>(
            DASHBOARD_API_ENDPOINTS.playerLoginHistory(playerId)
        )
    },

    async ban(playerId: string, reason: string, duration?: number) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.playerBan(playerId), {
            method: "POST",
            body: JSON.stringify({ reason, duration }),
        })
    },

    async unban(playerId: string) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.playerUnban(playerId), {
            method: "POST",
        })
    },

    async mute(playerId: string, duration: number) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.playerMute(playerId), {
            method: "POST",
            body: JSON.stringify({ duration }),
        })
    },

    async kick(playerId: string) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.playerKick(playerId), {
            method: "POST",
        })
    },

    async compensate(
        playerId: string,
        reward: {
            currency?: string
            amount?: number
            items?: Array<{ itemId: string; quantity: number }>
        }
    ) {
        return fetchAPI<void>(
            DASHBOARD_API_ENDPOINTS.playerCompensate(playerId),
            {
                method: "POST",
                body: JSON.stringify(reward),
            }
        )
    },

    async sendItem(payload: SendPlayerItemPayload) {
        return fetchAPI<SendPlayerItemResult>(
            DASHBOARD_API_ENDPOINTS.playerSendItem,
            {
                method: "POST",
                body: JSON.stringify(payload),
            }
        )
    },
}
