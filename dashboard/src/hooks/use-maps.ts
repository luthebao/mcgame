"use client"

import { useQuery } from "@tanstack/react-query"

import { fetchAPI } from "@/services/api"

export type MapEntry = {
    id: number
    name: string
    safeX: number
    safeY: number
}

type MapsListResponse = {
    maps: MapEntry[]
}

export function useMapList() {
    return useQuery({
        queryKey: ["maps", "list"],
        queryFn: async () => {
            const res = await fetchAPI<MapsListResponse>("/maps/list")
            return res.maps
        },
        staleTime: 5 * 60 * 1000,
        gcTime: 10 * 60 * 1000,
    })
}
