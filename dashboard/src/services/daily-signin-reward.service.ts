import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import { buildQueryString, fetchAPI } from "./api"

export type DailySigninRewardInc = 1 | 2 | 4

export interface DailySigninRewardRow {
    rewardId: number
    inc: number
    itemId: number
    itemName: string
    quantity: number
    weight: number
    note: string | null
}

export interface DailySigninRewardInput {
    reward_id?: number
    inc: number
    item_id: number
    quantity: number
    weight: number
    note: string | null
}

export interface DailySigninItemOption {
    itemId: number
    name: string
    iconId: number
    iconDataUrl: string
    subtitle: string
    templateTableId: number
    templateType: number
    kind: number
}

export interface DailySigninItemSearchParams {
    search?: string
    kind?: number | null
    templateType?: number | null
    limit?: number
}

interface RewardsResponse {
    ok: boolean
    rewards: DailySigninRewardRow[]
    message?: string
}

interface OptionsResponse {
    ok: boolean
    items: DailySigninItemOption[]
    message?: string
}

interface DeleteResponse {
    ok: boolean
    deletedId?: number
    message?: string
}

export const dailySigninRewardService = {
    async list(): Promise<DailySigninRewardRow[]> {
        const res = await fetchAPI<RewardsResponse>(
            DASHBOARD_API_ENDPOINTS.dailySigninRewards
        )
        return res.rewards || []
    },

    async save(
        rewards: DailySigninRewardInput[]
    ): Promise<DailySigninRewardRow[]> {
        const res = await fetchAPI<RewardsResponse>(
            DASHBOARD_API_ENDPOINTS.dailySigninRewards,
            {
                method: "POST",
                body: JSON.stringify({ rewards }),
            }
        )
        return res.rewards || []
    },

    async remove(rewardId: number): Promise<DeleteResponse> {
        return fetchAPI<DeleteResponse>(
            DASHBOARD_API_ENDPOINTS.dailySigninRewards,
            {
                method: "DELETE",
                body: JSON.stringify({ reward_id: rewardId }),
            }
        )
    },

    async searchItems(
        params: DailySigninItemSearchParams
    ): Promise<DailySigninItemOption[]> {
        const queryString = buildQueryString({
            search: params.search ?? "",
            kind:
                params.kind === null || params.kind === undefined
                    ? "all"
                    : params.kind,
            templateType:
                params.templateType === null ||
                params.templateType === undefined
                    ? "all"
                    : params.templateType,
            limit: params.limit ?? 30,
        })
        const res = await fetchAPI<OptionsResponse>(
            `${DASHBOARD_API_ENDPOINTS.dailySigninRewardOptions}?${queryString}`
        )
        return res.items || []
    },
}
