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
import { createAdminClient } from "@/lib/supabase/admin"

type ItemQuery = {
    search: string
    kind: number
    templateType: number
    sortBy:
        | "item_id"
        | "name"
        | "item_type"
        | "icon_id"
        | "required_level"
        | "max_stack"
        | "template_type"
        | "use_type"
        | "kind"
        | "bind_type"
        | "template_level"
    sortDir: "asc" | "desc"
    page: number
    pageSize: number
}

type DbItemRow = {
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

type ItemMetaStat = {
    type: number
    value: number
    growth: number
}

type ItemMetaSummary = {
    color: number
    templateQuality: number
    equipPosition: number
    setId: number
    socketCount: number
    bindPropNum: number
    endureMax: number
    expireMinutes: number
    activeEquipId: number
    randomQuality: number[]
    stats: ItemMetaStat[]
}

type ItemRow = {
    itemId: number
    itemType: number
    templateTableId: number
    templateTableName: string
    templateType: number
    useType: number
    kind: number
    bindType: number
    tradable: number
    templateLevel: number
    name: string
    description: string
    iconId: number
    hasIconId: boolean
    hasIconFile: boolean
    iconPath: string
    iconLogicalPath: string
    iconDataUrl: string
    requiredLevel: number
    price: number
    maxStack: number
    dungeonId: number
    meta: ItemMetaSummary
}

type ItemTypeSummary = {
    value: number
    count: number
    name: string
}

type ItemSearchResult = {
    items: ItemRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    itemTypes: ItemTypeSummary[]
    iconDirectory: string
    iconCount: number
    itemCount: number
    lastRefresh: string
    lastError?: string
}

const DEFAULT_PAGE_SIZE = 60
const MAX_PAGE_SIZE = 200

const SORT_COLUMN_MAP: Record<ItemQuery["sortBy"], string> = {
    item_id: "item_id",
    name: "name",
    item_type: "item_type",
    icon_id: "icon_id",
    required_level: "required_level",
    max_stack: "max_stack",
    template_type: "template_type",
    use_type: "use_type",
    kind: "kind",
    bind_type: "bind_type",
    template_level: "template_level",
}

export const dynamic = "force-dynamic"

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const parsed = Number.parseInt(input, 10)
    return Number.isFinite(parsed) ? parsed : fallback
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

function asNumber(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value)) return value
    if (typeof value === "string" && value.trim()) {
        const parsed = Number(value)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function normalizeItemQuery(request: NextRequest): ItemQuery {
    const searchParams = request.nextUrl.searchParams

    const sortByRaw = (searchParams.get("sortBy") || "item_id").toLowerCase()
    const sortDirRaw = (searchParams.get("sortDir") || "asc").toLowerCase()
    const kindRaw = searchParams.get("kind") || "all"
    const templateTypeRaw = searchParams.get("templateType") || "all"

    const sortBy: ItemQuery["sortBy"] =
        sortByRaw in SORT_COLUMN_MAP
            ? (sortByRaw as ItemQuery["sortBy"])
            : "item_id"

    const sortDir: ItemQuery["sortDir"] = sortDirRaw === "desc" ? "desc" : "asc"

    const page = Math.max(1, parseIntOr(searchParams.get("page"), 1))
    const pageSize = Math.min(
        MAX_PAGE_SIZE,
        Math.max(1, parseIntOr(searchParams.get("pageSize"), DEFAULT_PAGE_SIZE))
    )

    const kindParsed =
        kindRaw === "all" ? -1 : Number.parseInt(kindRaw, 10)
    const kind = Number.isFinite(kindParsed) ? kindParsed : -1

    const templateTypeParsed =
        templateTypeRaw === "all" ? -1 : Number.parseInt(templateTypeRaw, 10)
    const templateType = Number.isFinite(templateTypeParsed) ? templateTypeParsed : -1

    return {
        search: (searchParams.get("search") || "").trim(),
        kind,
        templateType,
        sortBy,
        sortDir,
        page,
        pageSize,
    }
}

function parseItemMetaPayload(raw: unknown): Record<string, unknown> {
    if (raw && typeof raw === "object" && !Array.isArray(raw))
        return raw as Record<string, unknown>
    if (typeof raw === "string" && raw.trim()) {
        try {
            const parsed = JSON.parse(raw)
            if (parsed && typeof parsed === "object" && !Array.isArray(parsed))
                return parsed as Record<string, unknown>
        } catch {
            return {}
        }
    }
    return {}
}

function parseQualityList(raw: unknown): number[] {
    const tokens =
        typeof raw === "string"
            ? raw.split(/[|,;]+/g)
            : raw === undefined || raw === null
              ? []
              : [String(raw)]

    const values = new Set<number>()
    for (const token of tokens) {
        const parsed = Number.parseInt(String(token).trim(), 10)
        if (Number.isFinite(parsed) && parsed >= 0) values.add(parsed)
    }

    return Array.from(values).sort((left, right) => left - right)
}

function parseItemMetaSummary(raw: unknown): ItemMetaSummary {
    const meta = parseItemMetaPayload(raw)
    const stats: ItemMetaStat[] = []

    for (let index = 1; index <= 5; index += 1) {
        const statType = asInt(meta[`stat_type_${index}`])
        const statValue = asInt(meta[`stat_value_${index}`])
        if (statType > 0 && statValue > 0) {
            stats.push({
                type: statType,
                value: statValue,
                growth: Math.max(0, asInt(meta[`growth_${index}`])),
            })
        }
    }

    return {
        color: Math.max(0, asInt(meta.color)),
        templateQuality: Math.max(0, asInt(meta.quality)),
        equipPosition: Math.max(0, asInt(meta.item_type)),
        setId: Math.max(0, asInt(meta.set_id)),
        socketCount: Math.max(0, asInt(meta.socket_count)),
        bindPropNum: Math.max(0, asInt(meta.bind_prop_num)),
        endureMax: Math.max(0, asInt(meta.endure_max)),
        expireMinutes: Math.max(0, asInt(meta.expire_minutes)),
        activeEquipId: Math.max(0, asInt(meta.active_equip_id)),
        randomQuality: parseQualityList(meta.random_quality),
        stats,
    }
}

function itemTypeName(itemType: number): string {
    switch (itemType) {
        case 1:
            return "Trang bị"
        case 3:
            return "Vật liệu"
        case 5:
            return "Vật phẩm"
        case 7:
            return "Tinh thể"
        case 11:
            return "Đá khảm"
        case 14:
            return "Lông vũ"
        default:
            return `Loại ${itemType}`
    }
}

function calcTotalPages(total: number, pageSize: number): number {
    if (total === 0) return 0
    return Math.ceil(total / pageSize)
}

function mapItemRows(
    rows: DbItemRow[],
    iconDirectory: string,
    iconIndex: IconIndex
): ItemRow[] {
    return rows.map(row => {
        const iconID = Math.max(0, asInt(row.icon_id))
        const hasIconID = iconID > 0
        const iconMatch = hasIconID
            ? resolveHashedIcon(iconDirectory, iconIndex, iconID)
            : null
        const iconPath = iconMatch?.path || ""

        return {
            itemId: asInt(row.item_id),
            itemType: asInt(row.item_type),
            templateTableId: asInt(row.template_table_id),
            templateTableName: row.template_table_name || "",
            templateType: asInt(row.template_type),
            useType: asInt(row.use_type),
            kind: asInt(row.kind),
            bindType: asInt(row.bind_type),
            tradable: asInt(row.tradable),
            templateLevel: asInt(row.template_level),
            name: row.name,
            description: row.description || "",
            iconId: iconID,
            hasIconId: hasIconID,
            hasIconFile: Boolean(iconPath),
            iconPath,
            iconLogicalPath: iconMatch?.logicalPath || "",
            iconDataUrl: "",
            requiredLevel: asInt(row.required_level),
            price: asNumber(row.price),
            maxStack: Math.max(1, asInt(row.max_stack, 1)),
            dungeonId: asInt(row.dungeon_id),
            meta: parseItemMetaSummary(row.meta),
        }
    })
}

async function attachIconData(rows: ItemRow[]): Promise<ItemRow[]> {
    return Promise.all(
        rows.map(async row => {
            if (!row.hasIconFile || !row.iconPath) return row
            const iconDataUrl = await readIconDataUrl(
                row.iconPath,
                row.iconLogicalPath || row.iconPath
            )
            return iconDataUrl ? { ...row, iconDataUrl } : row
        })
    )
}

function buildItemTypeSummary(rows: ItemRow[]): ItemTypeSummary[] {
    const counts = new Map<number, number>()
    for (const row of rows)
        counts.set(row.itemType, (counts.get(row.itemType) || 0) + 1)

    return Array.from(counts.entries())
        .map(([value, count]) => ({ value, count, name: itemTypeName(value) }))
        .sort((left, right) => left.value - right.value)
}

export async function GET(request: NextRequest) {
    const now = new Date().toISOString()
    const query = normalizeItemQuery(request)

    const fallbackResult: ItemSearchResult = {
        items: [],
        total: 0,
        page: query.page,
        pageSize: query.pageSize,
        totalPages: 0,
        itemTypes: [],
        iconDirectory: "",
        iconCount: 0,
        itemCount: 0,
        lastRefresh: now,
    }

    try {
        const supabase = createAdminClient()
        const iconDirectory = await resolveIconDirectory()
        const iconIndex = await buildIconIndex(iconDirectory)

        const sortCol = SORT_COLUMN_MAP[query.sortBy]
        const ascending = query.sortDir === "asc"

        let baseQuery = supabase
            .from("vw_item_source")
            .select("*", { count: "exact" })

        if (query.kind >= 0) {
            baseQuery = baseQuery.eq("kind", query.kind)
        }

        if (query.templateType >= 0) {
            baseQuery = baseQuery.eq("template_type", query.templateType)
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
        const res = await baseQuery
            .order(sortCol, { ascending })
            .order("item_id", { ascending })
            .range(start, end)
        let rows = (res.data || []) as DbItemRow[]
        const totalCount = res.count || 0
        const dbError = res.error

        if (dbError) throw new Error(dbError.message)

        const { count: itemCount } = await supabase
            .from("vw_item_source")
            .select("*", { count: "exact", head: true })

        const allRows = mapItemRows(rows, iconDirectory, iconIndex)

        const iconCount = new Set(
            allRows.filter(row => row.hasIconFile).map(row => row.iconId)
        ).size

        const total = totalCount
        const pageRows = allRows

        const pageCount = calcTotalPages(total, query.pageSize)
        const safePage = pageCount > 0 ? Math.min(query.page, pageCount) : 1
        const rowsWithIcons = await attachIconData(pageRows)

        const result: ItemSearchResult = {
            items: rowsWithIcons,
            total,
            page: safePage,
            pageSize: query.pageSize,
            totalPages: pageCount,
            itemTypes: buildItemTypeSummary(pageRows),
            iconDirectory,
            iconCount,
            itemCount: itemCount || 0,
            lastRefresh: now,
        }

        return NextResponse.json(result)
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.common.unknownError
        )
        return NextResponse.json(
            { ...fallbackResult, lastError: message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
