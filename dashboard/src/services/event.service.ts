/**
 * Event API service
 */

import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import { fetchAPI } from "./api"
import { GameEvent } from "@/types"

export const eventService = {
    async getAll() {
        return fetchAPI<GameEvent[]>(DASHBOARD_API_ENDPOINTS.events)
    },

    async getById(id: string) {
        return fetchAPI<GameEvent>(DASHBOARD_API_ENDPOINTS.eventByID(id))
    },

    async create(data: Omit<GameEvent, "id" | "createdAt" | "updatedAt">) {
        return fetchAPI<GameEvent>(DASHBOARD_API_ENDPOINTS.events, {
            method: "POST",
            body: JSON.stringify(data),
        })
    },

    async update(id: string, data: Partial<GameEvent>) {
        return fetchAPI<GameEvent>(DASHBOARD_API_ENDPOINTS.eventByID(id), {
            method: "PATCH",
            body: JSON.stringify(data),
        })
    },

    async delete(id: string) {
        return fetchAPI<void>(DASHBOARD_API_ENDPOINTS.eventByID(id), {
            method: "DELETE",
        })
    },

    async toggleStatus(id: string, active: boolean) {
        return fetchAPI<GameEvent>(DASHBOARD_API_ENDPOINTS.eventToggle(id), {
            method: "PATCH",
            body: JSON.stringify({ active }),
        })
    },
}
