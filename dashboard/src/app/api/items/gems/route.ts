import { NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { createAdminClient } from "@/lib/supabase/admin"

type GemOption = {
    itemId: number
    name: string
    requiredLevel: number
    iconId: number
    gemType: number
    gemLevel: number
    statType: number
    value: number
}

export const dynamic = "force-dynamic"

export async function GET() {
    try {
        const supabase = createAdminClient()

        const { data: rows, error } = await supabase
            .schema("data")
            .from("data_tbl_item_template")
            .select(
                "id, name, req_level, icon_code, type, level, prop_type, propl_num"
            )
            .gt("prop_type", 0)
            .gt("propl_num", 0)
            .eq("type", 503)
            .order("req_level", { ascending: true })
            .order("id", { ascending: true })

        if (error) throw new Error(error.message)

        const items: GemOption[] = (rows || []).map(row => ({
            itemId: Number(row.id) || 0,
            name: row.name || "",
            requiredLevel: Number(row.req_level) || 0,
            iconId: Number(row.icon_code) || 0,
            gemType: Number(row.type) || 0,
            gemLevel: Math.max(
                1,
                Number(row.propl_num) || 0,
                Number(row.level) || 0
            ),
            statType: Number(row.prop_type) || 0,
            value: Number(row.propl_num) || 0,
        }))

        return NextResponse.json({
            items,
            total: items.length,
            lastRefresh: new Date().toISOString(),
        })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.items.gemOptionsLoadFailed
        )
        return NextResponse.json(
            {
                items: [],
                total: 0,
                lastRefresh: new Date().toISOString(),
                message,
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
