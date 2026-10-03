import { API_MESSAGES } from "@/constants/api-messages"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { fetchAPI } from "./api"

export type GiftCodeGenerateSpec = {
    prefix?: string
    count: number
    length?: number
}

export type GiftCodeRewardInput = {
    type: string
    amount?: number
    itemId?: number
    count?: number
    meta?: Record<string, unknown>
}

export type GiftCodeCampaignCreatePayload = {
    campaignKey?: string
    name: string
    description?: string
    startsAt?: string
    endsAt?: string
    maxTotalUses?: number
    maxUsesPerPlayer?: number
    codeMaxUses?: number
    codes?: string[]
    generate?: GiftCodeGenerateSpec
    rewards: GiftCodeRewardInput[]
    createdBy?: string
}

export type GiftCodeCodeView = {
    id: number
    code: string
    status: number
    maxUses: number
    redeemedCount: number
    lastRedeemedAt: string
}

export type GiftCodeRewardView = {
    type: string
    amount: number
    payload: Record<string, unknown> | null
    description: string
}

export type GiftCodeCampaignView = {
    id: number
    campaignKey: string
    name: string
    description: string
    status: number
    startsAt: string
    endsAt: string
    maxTotalUses: number
    maxUsesPerPlayer: number
    redeemedCount: number
    createdBy: string
    createdAt: string
    updatedAt: string
    codes: GiftCodeCodeView[]
    rewards: GiftCodeRewardView[]
}

type GiftCodeCampaignListResponse = {
    ok: boolean
    items?: GiftCodeCampaignView[]
    message?: string
}

type GiftCodeCampaignCreateResponse = {
    ok: boolean
    campaign?: GiftCodeCampaignView
    message?: string
}

type GiftCodeCampaignToggleResponse = {
    ok: boolean
    campaign?: GiftCodeCampaignView
    message?: string
}

type GiftCodeCampaignUpdateResponse = {
    ok: boolean
    campaign?: GiftCodeCampaignView
    message?: string
}

type GiftCodeCampaignDeleteResponse = {
    ok: boolean
    campaignId?: number
    message?: string
}

export const giftCodeService = {
    async listCampaigns(limit = 50): Promise<GiftCodeCampaignView[]> {
        const response = await fetchAPI<GiftCodeCampaignListResponse>(
            `${DASHBOARD_API_ENDPOINTS.giftCodeCampaigns}?limit=${limit}`
        )
        if (!response.ok) {
            throw new Error(
                response.message ||
                    API_MESSAGES.client.giftCodeCampaignsLoadFailed
            )
        }
        return Array.isArray(response.items) ? response.items : []
    },

    async createCampaign(
        payload: GiftCodeCampaignCreatePayload
    ): Promise<GiftCodeCampaignView> {
        const response = await fetchAPI<GiftCodeCampaignCreateResponse>(
            DASHBOARD_API_ENDPOINTS.giftCodeCampaigns,
            {
                method: "POST",
                body: JSON.stringify(payload),
            }
        )
        if (!response.ok || !response.campaign) {
            throw new Error(
                response.message ||
                    API_MESSAGES.client.giftCodeCampaignCreateFailed
            )
        }
        return response.campaign
    },

    async updateCampaign(
        campaignId: number,
        payload: GiftCodeCampaignCreatePayload
    ): Promise<GiftCodeCampaignView> {
        const response = await fetchAPI<GiftCodeCampaignUpdateResponse>(
            DASHBOARD_API_ENDPOINTS.giftCodeCampaigns,
            {
                method: "PUT",
                body: JSON.stringify({
                    campaignId,
                    ...payload,
                }),
            }
        )
        if (!response.ok || !response.campaign) {
            throw new Error(
                response.message ||
                    API_MESSAGES.client.giftCodeCampaignUpdateFailed
            )
        }
        return response.campaign
    },

    async toggleCampaignStatus(
        campaignId: number,
        active: boolean
    ): Promise<GiftCodeCampaignView> {
        const response = await fetchAPI<GiftCodeCampaignToggleResponse>(
            DASHBOARD_API_ENDPOINTS.giftCodeCampaigns,
            {
                method: "PATCH",
                body: JSON.stringify({ campaignId, active }),
            }
        )
        if (!response.ok || !response.campaign) {
            throw new Error(
                response.message ||
                    API_MESSAGES.client.giftCodeCampaignStatusUpdateFailed
            )
        }
        return response.campaign
    },

    async deleteCampaign(campaignId: number): Promise<void> {
        const response = await fetchAPI<GiftCodeCampaignDeleteResponse>(
            DASHBOARD_API_ENDPOINTS.giftCodeCampaigns,
            {
                method: "DELETE",
                body: JSON.stringify({ campaignId }),
            }
        )
        if (!response.ok) {
            throw new Error(
                response.message ||
                    API_MESSAGES.client.giftCodeCampaignDeleteFailed
            )
        }
    },
}
