import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import {
    buildIconIndex,
    readIconDataUrl,
    resolveHashedIcon,
    resolveIconDirectory,
} from "@/lib/icons/resolver"
import { resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type ItemRow = {
    item_id: number
    name: string
    icon_id: number | null
    template_table_id: number | null
    template_type: number | null
    required_level: number | null
    kind: number | null
}

type ItemOption = {
    itemId: number
    name: string
    iconId: number
    iconDataUrl: string
    subtitle: string
    templateTableId: number
    templateType: number
    kind: number
}

const DEFAULT_LIMIT = 30
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

function isNumericSearch(search: string): boolean {
    return /^\d+$/.test(search)
}

async function attachIcons(
    items: Array<Omit<ItemOption, "iconDataUrl">>
): Promise<ItemOption[]> {
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
            if (!match) return { ...item, iconDataUrl: "" }
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

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.admin.loginRequired },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    const searchParams = request.nextUrl.searchParams
    const search = (searchParams.get("search") || "").trim()
    const limit = Math.min(
        MAX_LIMIT,
        Math.max(1, asInt(searchParams.get("limit"), DEFAULT_LIMIT))
    )
    const kindParam = searchParams.get("kind")
    const typeParam = searchParams.get("templateType")
    const kindFilter =
        kindParam && kindParam !== "all" && Number.isFinite(Number(kindParam))
            ? Number(kindParam)
            : null
    const typeFilter =
        typeParam && typeParam !== "all" && Number.isFinite(Number(typeParam))
            ? Number(typeParam)
            : null

    try {
        const supabase = createAdminClient()
        let query = supabase
            .from("vw_item_source")
            .select(
                "item_id, name, icon_id, template_table_id, template_type, required_level, kind"
            )

        if (kindFilter !== null) {
            query = query.eq("kind", kindFilter)
        }
        if (typeFilter !== null) {
            query = query.eq("template_type", typeFilter)
        }

        if (search) {
            if (isNumericSearch(search)) {
                query = query.eq("item_id", Number(search))
            } else {
                query = query.ilike("name", `%${search}%`)
            }
        }

        const { data, error } = await query
            .order("item_id", { ascending: true })
            .limit(limit)

        if (error) throw new Error(error.message)

        const rows = (data || []) as ItemRow[]
        const items: Array<Omit<ItemOption, "iconDataUrl">> = rows.map(row => {
            const itemId = asInt(row.item_id)
            const requiredLevel = asInt(row.required_level)
            const tableId = asInt(row.template_table_id, 29)
            const tplType = asInt(row.template_type)
            const kind = asInt(row.kind)
            const subtitleParts = [
                `ID ${itemId}`,
                tableId > 0 ? `Tbl ${tableId}` : "",
                kind > 0 ? `Kind ${kind}` : "",
                tplType > 0 ? `Type ${tplType}` : "",
                requiredLevel > 0 ? `Lv ${requiredLevel}` : "",
            ].filter(Boolean)
            return {
                itemId,
                name: row.name || `Item #${itemId}`,
                iconId: Math.max(0, asInt(row.icon_id)),
                subtitle: subtitleParts.join(" | "),
                templateTableId: tableId,
                templateType: tplType,
                kind,
            }
        })

        return NextResponse.json({
            ok: true,
            items: await attachIcons(items),
        })
    } catch (error) {
        return NextResponse.json(
            {
                ok: false,
                items: [],
                message: resolveErrorMessage(
                    error,
                    API_MESSAGES.boxItems.awardOptionsLoadFailed
                ),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
