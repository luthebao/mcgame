import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import {
    boxItemAwardFallbackName,
    boxItemAwardTypeName,
    boxItemAwardUsesLookup,
    normalizeBoxItemAwardType,
} from "@/lib/box-item-awards"
import {
    buildIconIndex,
    readIconDataUrl,
    resolveHashedIcon,
    resolveIconDirectory,
} from "@/lib/icons/resolver"
import { resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type AwardOptionQuery = {
    type: number
    search: string
    limit: number
}

type ItemOptionRow = {
    item_id: number
    name: string
    icon_id: number | null
    required_level: number | null
    template_type: number | null
}

type CreatureOptionRow = {
    id: number
    name: string
    icon_code: number | null
    use_lv: number | null
}

type BuffOptionRow = {
    id: number
    name: string
    icon_code: number | null
    level: number | null
}

type TitleOptionRow = {
    id: number
    n: string
}

type SkillOptionRow = {
    id: number
    name: string
    icon_code: number | null
    req_level: number | null
    kind: number | null
}

type AwardOption = {
    id: number
    name: string
    iconId: number
    iconDataUrl: string
    subtitle: string
}

type AwardOptionsResponse = {
    ok: boolean
    items: AwardOption[]
    message?: string
}

const DEFAULT_LIMIT = 20
const MAX_LIMIT = 50

export const dynamic = "force-dynamic"

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function normalizeQuery(request: NextRequest): AwardOptionQuery {
    const searchParams = request.nextUrl.searchParams
    return {
        type: asInt(searchParams.get("type")),
        search: (searchParams.get("search") || "").trim(),
        limit: Math.min(
            MAX_LIMIT,
            Math.max(1, asInt(searchParams.get("limit"), DEFAULT_LIMIT))
        ),
    }
}

function isNumericSearch(search: string): boolean {
    return /^\d+$/.test(search)
}

async function withIconData(
    items: Array<Omit<AwardOption, "iconDataUrl">>
): Promise<AwardOption[]> {
    if (items.length === 0) return []

    const iconDir = await resolveIconDirectory()
    if (!iconDir) {
        return items.map(item => ({ ...item, iconDataUrl: "" }))
    }

    const iconIndex = await buildIconIndex(iconDir)
    return Promise.all(
        items.map(async item => {
            if (item.iconId <= 0) {
                return { ...item, iconDataUrl: "" }
            }

            const match = resolveHashedIcon(iconDir, iconIndex, item.iconId)
            if (!match) {
                return { ...item, iconDataUrl: "" }
            }

            return {
                ...item,
                iconDataUrl: await readIconDataUrl(
                    match.path,
                    match.logicalPath
                ),
            }
        })
    )
}

async function lookupItemOptions(
    query: AwardOptionQuery
): Promise<Array<Omit<AwardOption, "iconDataUrl">>> {
    const awardType = normalizeBoxItemAwardType(query.type)
    const supabase = createAdminClient()

    let baseQuery = supabase
        .from("vw_item_source")
        .select("item_id, name, icon_id, required_level, template_type")
        .eq("template_table_id", awardType)

    if (query.search) {
        if (isNumericSearch(query.search)) {
            baseQuery = baseQuery.eq("item_id", Number(query.search))
        } else {
            baseQuery = baseQuery.ilike("name", `%${query.search}%`)
        }
    }

    const { data, error } = await baseQuery
        .order("item_id", { ascending: true })
        .limit(query.limit)

    if (error) throw new Error(error.message)

    return ((data || []) as ItemOptionRow[]).map(row => {
        const id = asInt(row.item_id)
        const typeName = boxItemAwardTypeName(awardType)
        const requiredLevel = asInt(row.required_level)
        return {
            id,
            name: row.name || boxItemAwardFallbackName(awardType, id),
            iconId: Math.max(0, asInt(row.icon_id)),
            subtitle: `ID: ${id} | ${typeName}${requiredLevel > 0 ? ` | Lv ${requiredLevel}` : ""}`,
        }
    })
}

async function lookupCreatureOptions(
    query: AwardOptionQuery
): Promise<Array<Omit<AwardOption, "iconDataUrl">>> {
    const supabase = createAdminClient()
    let baseQuery = supabase
        .schema("data")
        .from("data_tbl_creature")
        .select("id, name, icon_code, use_lv")

    if (query.search) {
        if (isNumericSearch(query.search)) {
            baseQuery = baseQuery.eq("id", Number(query.search))
        } else {
            baseQuery = baseQuery.ilike("name", `%${query.search}%`)
        }
    }

    const { data, error } = await baseQuery
        .order("id", { ascending: true })
        .limit(query.limit)

    if (error) throw new Error(error.message)

    return ((data || []) as CreatureOptionRow[]).map(row => {
        const id = asInt(row.id)
        const requiredLevel = asInt(row.use_lv)
        return {
            id,
            name: row.name || boxItemAwardFallbackName(12, id),
            iconId: Math.max(0, asInt(row.icon_code)),
            subtitle: `ID: ${id}${requiredLevel > 0 ? ` | Lv ${requiredLevel}` : ""}`,
        }
    })
}

async function lookupBuffOptions(
    query: AwardOptionQuery
): Promise<Array<Omit<AwardOption, "iconDataUrl">>> {
    const supabase = createAdminClient()
    let baseQuery = supabase
        .schema("data")
        .from("data_tbl_buff")
        .select("id, name, icon_code, level")

    if (query.search) {
        if (isNumericSearch(query.search)) {
            baseQuery = baseQuery.eq("id", Number(query.search))
        } else {
            baseQuery = baseQuery.ilike("name", `%${query.search}%`)
        }
    }

    const { data, error } = await baseQuery
        .order("id", { ascending: true })
        .limit(query.limit)

    if (error) throw new Error(error.message)

    return ((data || []) as BuffOptionRow[]).map(row => {
        const id = asInt(row.id)
        const level = asInt(row.level)
        return {
            id,
            name: row.name || boxItemAwardFallbackName(32, id),
            iconId: Math.max(0, asInt(row.icon_code)),
            subtitle: `ID: ${id}${level > 0 ? ` | Lv ${level}` : ""}`,
        }
    })
}

async function lookupTitleOptions(
    query: AwardOptionQuery
): Promise<Array<Omit<AwardOption, "iconDataUrl">>> {
    const supabase = createAdminClient()
    let baseQuery = supabase
        .schema("data")
        .from("data_tbl_title")
        .select("id, n")

    if (query.search) {
        if (isNumericSearch(query.search)) {
            baseQuery = baseQuery.eq("id", Number(query.search))
        } else {
            baseQuery = baseQuery.ilike("n", `%${query.search}%`)
        }
    }

    const { data, error } = await baseQuery
        .order("id", { ascending: true })
        .limit(query.limit)

    if (error) throw new Error(error.message)

    return ((data || []) as TitleOptionRow[]).map(row => {
        const id = asInt(row.id)
        return {
            id,
            name: row.n || boxItemAwardFallbackName(33, id),
            iconId: 0,
            subtitle: `ID: ${id} | Danh hiệu`,
        }
    })
}

async function lookupSkillOptions(
    query: AwardOptionQuery
): Promise<Array<Omit<AwardOption, "iconDataUrl">>> {
    const supabase = createAdminClient()
    let baseQuery = supabase
        .schema("data")
        .from("data_tbl_skill")
        .select("id, name, icon_code, req_level, kind")

    if (query.search) {
        if (isNumericSearch(query.search)) {
            baseQuery = baseQuery.eq("id", Number(query.search))
        } else {
            baseQuery = baseQuery.ilike("name", `%${query.search}%`)
        }
    }

    const { data, error } = await baseQuery
        .order("id", { ascending: true })
        .limit(query.limit)

    if (error) throw new Error(error.message)

    return ((data || []) as SkillOptionRow[]).map(row => {
        const id = asInt(row.id)
        const requiredLevel = asInt(row.req_level)
        const kind = asInt(row.kind)
        return {
            id,
            name: row.name || boxItemAwardFallbackName(34, id),
            iconId: Math.max(0, asInt(row.icon_code)),
            subtitle: `ID: ${id}${requiredLevel > 0 ? ` | Lv ${requiredLevel}` : ""}${kind > 0 ? ` | Kind ${kind}` : ""}`,
        }
    })
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.admin.loginRequired },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    const query = normalizeQuery(request)
    const awardType = normalizeBoxItemAwardType(query.type)

    if (!boxItemAwardUsesLookup(awardType)) {
        return NextResponse.json(
            {
                ok: false,
                items: [],
                message: API_MESSAGES.boxItems.invalidAwardType,
            } satisfies AwardOptionsResponse,
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        let items: Array<Omit<AwardOption, "iconDataUrl">>
        switch (awardType) {
            case 12:
                items = await lookupCreatureOptions(query)
                break
            case 32:
                items = await lookupBuffOptions(query)
                break
            case 33:
                items = await lookupTitleOptions(query)
                break
            case 34:
                items = await lookupSkillOptions(query)
                break
            case 19:
            case 29:
                items = await lookupItemOptions(query)
                break
            default:
                items = []
        }

        return NextResponse.json({
            ok: true,
            items: await withIconData(items),
        } satisfies AwardOptionsResponse)
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.boxItems.awardOptionsLoadFailed
        )
        return NextResponse.json(
            { ok: false, items: [], message } satisfies AwardOptionsResponse,
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
