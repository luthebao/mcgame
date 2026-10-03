import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import {
    buildIconIndex,
    readIconDataUrl,
    resolveHashedIcon,
    resolveIconDirectory,
} from "@/lib/icons/resolver"
import { createAdminClient } from "@/lib/supabase/admin"

export const dynamic = "force-dynamic"

type ItemOption = {
    itemId: number
    name: string
    iconId: number
    iconDataUrl: string
    templateType: number
}

export async function GET(request: NextRequest) {
    const sp = request.nextUrl.searchParams
    const search = (sp.get("search") || "").slice(0, 100).trim()
    const limit = Math.min(100, Math.max(1, Number.parseInt(sp.get("limit") || "50", 10) || 50))

    try {
        const supabase = createAdminClient()

        let q = supabase
            .from("vw_item_source")
            .select("item_id, name, icon_id, template_type")
            .order("item_id", { ascending: true })
            .limit(limit)

        if (search) {
            const isNumeric = /^\d+$/.test(search)
            q = isNumeric
                ? q.eq("item_id", Number(search))
                : q.ilike("name", `%${search}%`)
        }

        const { data, error } = await q
        if (error) throw new Error(error.message)

        const iconDir = await resolveIconDirectory()
        const iconIndex = await buildIconIndex(iconDir)

        const items: ItemOption[] = await Promise.all(
            ((data || []) as Array<{
                item_id: number
                name: string
                icon_id: number | null
                template_type: number
            }>).map(async row => {
                const iconId = Math.max(0, Number(row.icon_id || 0))
                let iconDataUrl = ""
                if (iconId > 0) {
                    const match = resolveHashedIcon(iconDir, iconIndex, iconId)
                    if (match) iconDataUrl = await readIconDataUrl(match.path, match.logicalPath)
                }
                return {
                    itemId: Number(row.item_id),
                    name: row.name,
                    iconId,
                    iconDataUrl,
                    templateType: Number(row.template_type),
                }
            })
        )

        return NextResponse.json({ items })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không tải được danh sách vật phẩm")
        return NextResponse.json(
            { items: [], lastError: message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
