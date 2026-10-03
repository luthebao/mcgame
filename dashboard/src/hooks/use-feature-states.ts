"use client"

import { useQuery } from "@tanstack/react-query"

import { executePlayerAction } from "@/hooks/use-player-detail"
import type { FeatureState } from "@/types/player-management"

async function fetchFeatureStates(playerId: number): Promise<FeatureState[]> {
    const res = await executePlayerAction(playerId, "get_feature_states")
    if (!res.ok || !res.data) {
        throw new Error(res.statusMessage || "Failed to load feature states")
    }
    return (res.data as { states?: FeatureState[] }).states ?? []
}

export function useFeatureStates(playerId: number, enabled = true) {
    return useQuery({
        queryKey: ["feature-states", String(playerId)],
        queryFn: () => fetchFeatureStates(playerId),
        enabled: enabled && Number.isFinite(playerId) && playerId > 0,
        staleTime: 30000,
        refetchOnWindowFocus: false,
    })
}
