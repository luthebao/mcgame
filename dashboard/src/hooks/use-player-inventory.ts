"use client"

import { useQuery } from "@tanstack/react-query"

import { fetchAPI } from "@/services/api"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import type {
    InventoryData,
    PetsData,
    PlayerActionRequest,
    PlayerActionResponse,
} from "@/types/player-management"

async function fetchInventory(playerId: number): Promise<InventoryData> {
    const body: PlayerActionRequest = {
        action: "get_inventory",
        targetId: playerId,
    }
    const res = await fetchAPI<PlayerActionResponse>(
        DASHBOARD_API_ENDPOINTS.playerAction(String(playerId)),
        { method: "POST", body: JSON.stringify(body) }
    )
    if (!res.ok || !res.data) {
        throw new Error(res.statusMessage || "Failed to load inventory")
    }
    return res.data as InventoryData
}

async function fetchPets(playerId: number): Promise<PetsData> {
    const body: PlayerActionRequest = { action: "get_pets", targetId: playerId }
    const res = await fetchAPI<PlayerActionResponse>(
        DASHBOARD_API_ENDPOINTS.playerAction(String(playerId)),
        { method: "POST", body: JSON.stringify(body) }
    )
    if (!res.ok || !res.data) {
        throw new Error(res.statusMessage || "Failed to load pets")
    }
    return res.data as PetsData
}

export function usePlayerInventory(playerId: number, enabled = true) {
    return useQuery({
        queryKey: ["player-inventory", playerId],
        queryFn: () => fetchInventory(playerId),
        enabled: enabled && Number.isFinite(playerId) && playerId > 0,
        staleTime: 3000,
    })
}

export function usePlayerPets(playerId: number, enabled = true) {
    return useQuery({
        queryKey: ["player-pets", playerId],
        queryFn: () => fetchPets(playerId),
        enabled: enabled && Number.isFinite(playerId) && playerId > 0,
        staleTime: 3000,
    })
}
