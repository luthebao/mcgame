"use client"

import type {
    BoxItemSortBy,
    BoxItemSortDir,
    BoxItemSourceFilter,
} from "@/services/box-item.service"

export type BoxItemQueryState = {
    search: string
    templateType: number | null
    sortBy: BoxItemSortBy
    sortDir: BoxItemSortDir
    sourceFilter: BoxItemSourceFilter
    shopId: number | null
    page: number
    pageSize: number
}

export const DEFAULT_BOX_ITEM_QUERY: BoxItemQueryState = {
    search: "",
    templateType: null,
    sortBy: "item_id",
    sortDir: "asc",
    sourceFilter: "all",
    shopId: null,
    page: 1,
    pageSize: 30,
}

export const PAGE_SIZE_OPTIONS = [20, 30, 60, 100]
