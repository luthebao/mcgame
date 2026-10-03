"use client"

import { useQuery } from "@tanstack/react-query"

import { executePlayerAction } from "@/hooks/use-player-detail"
import type { Relationship } from "@/types/player-management"

async function fetchRelationships(playerId: number): Promise<Relationship[]> {
    const res = await executePlayerAction(playerId, "get_relationships")
    if (!res.ok || !res.data) {
        throw new Error(res.statusMessage || "Failed to load relationships")
    }
    return (res.data as { relationships?: Relationship[] }).relationships ?? []
}

export function useRelationships(playerId: number, enabled = true) {
    return useQuery({
        queryKey: ["relationships", String(playerId)],
        queryFn: () => fetchRelationships(playerId),
        enabled: enabled && Number.isFinite(playerId) && playerId > 0,
        staleTime: 30000,
        refetchOnWindowFocus: false,
    })
}
