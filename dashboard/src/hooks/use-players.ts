"use client"

import { useQuery } from "@tanstack/react-query"

import { fetchAPI, buildQueryString } from "@/services/api"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"

export type PlayerListItem = {
    id: number
    playerUid: number
    playerName: string
    accountName: string
    serverId: number
    serverKey: string
    level: number
    sex: number
    mapId: number
    instanceId: number
    position: { x: number; y: number }
    online: boolean
    createdAt: string
    updatedAt: string
    lastMoveAt: string | null
    lastLoginAt: string | null
    lastSeenAt: string
}

type PlayerListResponse = {
    items: PlayerListItem[]
    total: number
    onlineCount: number
    refreshedAt: string
}

async function fetchPlayers(search: string, limit: number) {
    const qs = buildQueryString({ search: search || undefined, limit })
    const endpoint = `${DASHBOARD_API_ENDPOINTS.players}${qs ? `?${qs}` : ""}`
    return fetchAPI<PlayerListResponse>(endpoint)
}

export function usePlayers(search: string, limit: number) {
    return useQuery({
        queryKey: ["players", search, limit],
        queryFn: () => fetchPlayers(search, limit),
        refetchInterval: 5000,
        staleTime: 3000,
    })
}
