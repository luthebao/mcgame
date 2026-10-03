import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import {
    type IconIndex,
    buildIconIndex,
    readIconDataUrl,
    resolveHashedIcon,
    resolveIconDirectory,
} from "@/lib/icons/resolver"
import {
    BOX_ITEM_ALLOWED_KIND,
    BOX_ITEM_ALLOWED_TYPES,
    normalizeBoxItemTemplateType,
} from "@/lib/box-items"
import { createAdminClient } from "@/lib/supabase/admin"

type BoxItemSourceFilter =
    | "all"
    | "quest_reward"
    | "shop"
    | "creature_loot"
    | "award_config"

type BoxItemQuery = {
    search: string
    templateType: number | null
    sortBy: "item_id" | "name" | "template_type" | "required_level" | "kind"
    sortDir: "asc" | "desc"
    sourceFilter: BoxItemSourceFilter
    shopId: number | null
    page: number
    pageSize: number
}

type DbSourceRow = {
    item_id: number
    item_type: number
    template_table_id: number
    template_table_name: string
    template_type: number
    use_type: number
    kind: number
    bind_type: number
    tradable: number
    template_level: number
    name: string
    description: string | null
    icon_id: number | null
    required_level: number
    price: number
    max_stack: number
    dungeon_id: number
    meta: unknown
}

type BoxItemRow = {
    itemId: number
    name: string
    description: string
    iconId: number
    iconDataUrl: string
    templateType: number
    useType: number
    itemType: number
    kind: number
    requiredLevel: number
    maxStack: number
}

type BoxItemSearchResult = {
    items: BoxItemRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    lastRefresh: string
    lastError?: string
}

type AdminSupabaseClient = ReturnType<typeof createAdminClient>

const DEFAULT_PAGE_SIZE = 30
const MAX_PAGE_SIZE = 200
const MAX_REFERENCE_SCAN_ROWS = 10000

const SORT_COLUMN_MAP: Record<BoxItemQuery["sortBy"], string> = {
    item_id: "item_id",
    name: "name",
    template_type: "template_type",
    required_level: "required_level",
    kind: "kind",
}

export const dynamic = "force-dynamic"

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const parsed = Number.parseInt(input, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

function parseOptionalInt(input: string | null): number | null {
    if (!input) return null

    const trimmed = input.trim()
    if (!trimmed) return null

    const parsed = Number.parseInt(trimmed, 10)
    return Number.isFinite(parsed) ? parsed : null
}

function parseSourceFilter(input: string | null): BoxItemSourceFilter {
    switch (input) {
        case "quest_reward":
        case "shop":
        case "creature_loot":
        case "award_config":
            return input
        default:
            return "all"
    }
}

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function collectDistinctPositiveInts(values: unknown[]): number[] {
    const unique = new Set<number>()

    for (const value of values) {
        const parsed = asInt(value)
        if (parsed > 0) unique.add(parsed)
    }

    return Array.from(unique)
}

function normalizeQuery(request: NextRequest): BoxItemQuery {
    const sp = request.nextUrl.searchParams

    const sortByRaw = (sp.get("sortBy") || "item_id").toLowerCase()
    const sortDirRaw = (sp.get("sortDir") || "asc").toLowerCase()

    const sortBy: BoxItemQuery["sortBy"] =
        sortByRaw in SORT_COLUMN_MAP
            ? (sortByRaw as BoxItemQuery["sortBy"])
            : "item_id"

    const sortDir: BoxItemQuery["sortDir"] =
        sortDirRaw === "desc" ? "desc" : "asc"

    return {
        search: (sp.get("search") || "").trim(),
        templateType: normalizeBoxItemTemplateType(
            parseOptionalInt(sp.get("templateType"))
        ),
        sortBy,
        sortDir,
        sourceFilter: parseSourceFilter(sp.get("sourceFilter")),
        shopId: parseOptionalInt(sp.get("shopId")),
        page: Math.max(1, parseIntOr(sp.get("page"), 1)),
        pageSize: Math.min(
            MAX_PAGE_SIZE,
            Math.max(1, parseIntOr(sp.get("pageSize"), DEFAULT_PAGE_SIZE))
        ),
    }
}

async function loadFilteredItemIDs(
    supabase: AdminSupabaseClient,
    query: BoxItemQuery
): Promise<number[] | null> {
    switch (query.sourceFilter) {
        case "all":
            return null
        case "quest_reward": {
            const { data, error } = await supabase
                .schema("data")
                .from("data_tbl_quest_award")
                .select("item_id")
                .limit(MAX_REFERENCE_SCAN_ROWS)

            if (error) throw new Error(error.message)
            return collectDistinctPositiveInts(
                (data || []).map(row => row.item_id)
            )
        }
        case "shop": {
            let request = supabase
                .schema("data")
                .from("data_tbl_shop_slot")
                .select("item_id")

            if (query.shopId !== null) {
                request = request.eq("sid", query.shopId)
            }

            const { data, error } = await request.limit(MAX_REFERENCE_SCAN_ROWS)
            if (error) throw new Error(error.message)
            return collectDistinctPositiveInts(
                (data || []).map(row => row.item_id)
            )
        }
        case "creature_loot": {
            const { data, error } = await supabase
                .schema("data")
                .from("data_tbl_creature_loot")
                .select("item_id")
                .limit(MAX_REFERENCE_SCAN_ROWS)

            if (error) throw new Error(error.message)
            return collectDistinctPositiveInts(
                (data || []).map(row => row.item_id)
            )
        }
        case "award_config": {
            const { data, error } = await supabase
                .schema("data")
                .from("data_tbl_item_award")
                .select("item_id")
                .limit(MAX_REFERENCE_SCAN_ROWS)

            if (error) throw new Error(error.message)
            return collectDistinctPositiveInts(
                (data || []).map(row => row.item_id)
            )
        }
    }
}

export async function GET(request: NextRequest) {
    const now = new Date().toISOString()
    const query = normalizeQuery(request)

    const fallback: BoxItemSearchResult = {
        items: [],
        total: 0,
        page: query.page,
        pageSize: query.pageSize,
        totalPages: 0,
        lastRefresh: now,
    }

    try {
        const supabase = createAdminClient()
        const matchingItemIds = await loadFilteredItemIDs(supabase, query)

        if (matchingItemIds && matchingItemIds.length === 0) {
            return NextResponse.json(fallback satisfies BoxItemSearchResult)
        }

        const sortCol = SORT_COLUMN_MAP[query.sortBy]
        const ascending = query.sortDir === "asc"

        let baseQuery = supabase
            .from("vw_item_source")
            .select("*", { count: "exact" })
            .gt("use_type", 0)
            .eq("template_table_id", 29)
            .eq("kind", BOX_ITEM_ALLOWED_KIND)
            .in("template_type", BOX_ITEM_ALLOWED_TYPES)

        if (query.templateType !== null) {
            baseQuery = baseQuery.eq("template_type", query.templateType)
        }

        if (matchingItemIds) {
            baseQuery = baseQuery.in("item_id", matchingItemIds)
        }

        if (query.search) {
            const isNumeric = /^\d+$/.test(query.search)
            if (isNumeric) {
                baseQuery = baseQuery.eq("item_id", Number(query.search))
            } else {
                baseQuery = baseQuery.ilike("name", `%${query.search}%`)
            }
        }

        const start = (query.page - 1) * query.pageSize
        const end = start + query.pageSize - 1

        const [{ data: rows, count: totalCount, error: dbError }, iconDir] =
            await Promise.all([
                baseQuery
                    .order(sortCol, { ascending })
                    .order("item_id", { ascending })
                    .range(start, end),
                resolveIconDirectory(),
            ])

        if (dbError) throw new Error(dbError.message)

        const iconIndex = await buildIconIndex(iconDir)
        const total = totalCount || 0
        const totalPages = total === 0 ? 0 : Math.ceil(total / query.pageSize)
        const safePage = totalPages > 0 ? Math.min(query.page, totalPages) : 1

        const items: BoxItemRow[] = await Promise.all(
            ((rows || []) as DbSourceRow[]).map(row =>
                mapBoxItemRow(row, iconDir, iconIndex)
            )
        )

        return NextResponse.json({
            items,
            total,
            page: safePage,
            pageSize: query.pageSize,
            totalPages,
            lastRefresh: now,
        } satisfies BoxItemSearchResult)
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.boxItems.loadFailed
        )
        return NextResponse.json(
            { ...fallback, lastError: message } satisfies BoxItemSearchResult,
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

async function mapBoxItemRow(
    row: DbSourceRow,
    iconDir: string,
    iconIndex: IconIndex
): Promise<BoxItemRow> {
    const iconId = Math.max(0, asInt(row.icon_id))

    let iconDataUrl = ""
    if (iconId > 0) {
        const match = resolveHashedIcon(iconDir, iconIndex, iconId)
        if (match) {
            iconDataUrl = await readIconDataUrl(match.path, match.logicalPath)
        }
    }

    return {
        itemId: asInt(row.item_id),
        name: row.name,
        description: row.description || "",
        iconId,
        iconDataUrl,
        templateType: asInt(row.template_type),
        useType: asInt(row.use_type),
        itemType: asInt(row.item_type),
        kind: asInt(row.kind),
        requiredLevel: asInt(row.required_level),
        maxStack: Math.max(1, asInt(row.max_stack, 1)),
    }
}
