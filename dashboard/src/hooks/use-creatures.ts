"use client"

import { useQuery } from "@tanstack/react-query"

import {
    creatureService,
    type CreatureSearchQuery,
} from "@/services/creature.service"

export function useCreatures(params: CreatureSearchQuery, enabled = true) {
    return useQuery({
        queryKey: ["creatures", params],
        queryFn: () => creatureService.search(params),
        enabled,
        staleTime: 30_000,
    })
}
