import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import { fetchAPI } from "./api"

export type ActivityRow = {
    id: number
    name: string | null
    style_name: string | null
    panel_key: string | null
    feature_key: string | null
    sort_type: number
    enable: boolean
    type: number
    flag: number
    note: string | null
}

export type ActivityInput = Omit<ActivityRow, "id"> & { id?: number }

type ActivityListResponse = { ok: boolean; activities: ActivityRow[] }
type ActivityResponse = { ok: boolean; activity: ActivityRow }
type ActivityDeleteResponse = { ok: boolean; deletedId: number }

export const activityService = {
    async list(): Promise<ActivityRow[]> {
        const res = await fetchAPI<ActivityListResponse>(
            DASHBOARD_API_ENDPOINTS.activities
        )
        return res.activities || []
    },

    async create(input: ActivityInput): Promise<ActivityRow> {
        const res = await fetchAPI<ActivityResponse>(
            DASHBOARD_API_ENDPOINTS.activities,
            { method: "POST", body: JSON.stringify(input) }
        )
        return res.activity
    },

    async update(
        id: number,
        input: Partial<ActivityInput>
    ): Promise<ActivityRow> {
        const res = await fetchAPI<ActivityResponse>(
            DASHBOARD_API_ENDPOINTS.activities,
            { method: "PATCH", body: JSON.stringify({ ...input, id }) }
        )
        return res.activity
    },

    async remove(id: number): Promise<ActivityDeleteResponse> {
        return fetchAPI<ActivityDeleteResponse>(
            DASHBOARD_API_ENDPOINTS.activities,
            { method: "DELETE", body: JSON.stringify({ id }) }
        )
    },
}
