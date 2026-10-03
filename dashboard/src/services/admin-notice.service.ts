import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

import { fetchAPI } from "./api"

export type AdminBroadcastNoticePayload = {
    message: string
    sender?: string
    senderColor?: string
    messageColor?: string
}

export type AdminBroadcastNoticeResponse = {
    ok: boolean
}

export const adminNoticeService = {
    async broadcast(payload: AdminBroadcastNoticePayload) {
        return fetchAPI<AdminBroadcastNoticeResponse>(
            DASHBOARD_API_ENDPOINTS.adminChat,
            {
                method: "POST",
                body: JSON.stringify(payload),
            }
        )
    },
}
