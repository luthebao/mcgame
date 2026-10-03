"use client"

import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query"
import { toast } from "sonner"

import { fetchAPI } from "@/services/api"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import type {
    PlayerActionRequest,
    PlayerActionResponse,
    PlayerDetailData,
} from "@/types/player-management"

async function fetchPlayerDetail(playerId: string): Promise<PlayerDetailData> {
    const actionPayload: PlayerActionRequest = {
        action: "player_detail",
        targetId: Number(playerId),
    }

    const response = await fetchAPI<PlayerActionResponse>(
        DASHBOARD_API_ENDPOINTS.playerAction(playerId),
        {
            method: "POST",
            body: JSON.stringify(actionPayload),
        }
    )

    if (!response.ok || !response.data) {
        throw new Error(
            response.statusMessage || "Failed to load player detail"
        )
    }

    return response.data as PlayerDetailData
}

export async function executePlayerAction(
    playerId: number,
    action: string,
    payload?: Record<string, unknown>
): Promise<PlayerActionResponse> {
    const actionPayload: PlayerActionRequest = {
        action,
        targetId: playerId,
        payload,
    }

    return fetchAPI<PlayerActionResponse>(
        DASHBOARD_API_ENDPOINTS.playerAction(String(playerId)),
        {
            method: "POST",
            body: JSON.stringify(actionPayload),
        }
    )
}

export function usePlayerDetail(playerId: string) {
    return useQuery({
        queryKey: ["player-detail", playerId],
        queryFn: () => fetchPlayerDetail(playerId),
        refetchInterval: 5000,
        staleTime: 3000,
        enabled: Boolean(playerId),
    })
}

function humanizeAction(action: string): string {
    const words = action.replace(/[_-]+/g, " ").trim().split(/\s+/)
    return words
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ")
}

export function usePlayerAction(playerId: number) {
    const queryClient = useQueryClient()

    return useMutation({
        mutationFn: ({
            action,
            payload,
        }: {
            action: string
            payload?: Record<string, unknown>
        }) => executePlayerAction(playerId, action, payload),
        onSuccess: response => {
            void queryClient.invalidateQueries({
                queryKey: ["player-detail", String(playerId)],
            })
            toast.success(`${humanizeAction(response.action)} succeeded`, {
                description: response.statusMessage,
            })
        },
        onError: (error: Error) => {
            toast.error(error.message)
        },
    })
}
