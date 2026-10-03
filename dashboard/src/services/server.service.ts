/**
 * Server API service
 */

import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import { fetchAPI } from "./api"
import { Server } from "@/types"

export const serverService = {
    async getAll() {
        return fetchAPI<Server[]>(DASHBOARD_API_ENDPOINTS.servers)
    },

    async getById(id: string) {
        return fetchAPI<Server>(DASHBOARD_API_ENDPOINTS.serverByID(id))
    },

    async getStats() {
        return fetchAPI<Server[]>(DASHBOARD_API_ENDPOINTS.serverStats)
    },

    async restart(id: string) {
        return fetchAPI<Server>(DASHBOARD_API_ENDPOINTS.serverRestart(id), {
            method: "POST",
        })
    },

    async toggleMaintenance(id: string, enabled: boolean) {
        return fetchAPI<Server>(DASHBOARD_API_ENDPOINTS.serverMaintenance(id), {
            method: "POST",
            body: JSON.stringify({ enabled }),
        })
    },

    async broadcast(message: string, target?: "all" | "specific") {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.serverBroadcast, {
            method: "POST",
            body: JSON.stringify({ message, target }),
        })
    },
}
