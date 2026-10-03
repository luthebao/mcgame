"use client"

import { useQuery } from "@tanstack/react-query"

import { fetchAPI, buildQueryString } from "@/services/api"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import type { ItemSearchResult, GemOption } from "@/services/item.service"

type ItemQueryParams = {
    search?: string
    itemType?: string | number
    petFilter?: string
    iconFilter?: string
    sortBy?: string
    sortDir?: string
    page?: number
    pageSize?: number
}

async function fetchItems(params: ItemQueryParams): Promise<ItemSearchResult> {
    const qs = buildQueryString(params)
    return fetchAPI<ItemSearchResult>(
        `${DASHBOARD_API_ENDPOINTS.items}${qs ? `?${qs}` : ""}`,
        { cache: "no-store" }
    )
}

async function fetchGems(): Promise<GemOption[]> {
    const res = await fetchAPI<{ items: GemOption[] }>(
        DASHBOARD_API_ENDPOINTS.itemGems,
        { cache: "no-store" }
    )
    return res.items || []
}

export function useItems(params: ItemQueryParams, enabled = true) {
    return useQuery({
        queryKey: ["items", params],
        queryFn: () => fetchItems(params),
        enabled,
        staleTime: 30_000,
    })
}

export function useGemOptions() {
    return useQuery({
        queryKey: ["gem-options"],
        queryFn: fetchGems,
        staleTime: 5 * 60_000,
    })
}
