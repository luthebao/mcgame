import { NextRequest, NextResponse } from "next/server"

import { createAdminClient } from "@/lib/supabase/admin"

export const dynamic = "force-dynamic"

export async function GET(request: NextRequest) {
    const search = (request.nextUrl.searchParams.get("search") || "").trim()
    const id = request.nextUrl.searchParams.get("id") || ""
    const limit = Math.min(
        50,
        Math.max(1, Number(request.nextUrl.searchParams.get("limit")) || 20)
    )

    const supabase = createAdminClient()

    if (id && !search) {
        const { data } = await supabase
            .schema("player")
            .from("characters_full")
            .select("id, name, level, account_id")
            .eq("id", Number(id))
            .single()

        if (!data) return NextResponse.json({ items: [] })

        return NextResponse.json({
            items: [
                {
                    id: Number(data.id),
                    name: String(data.name || ""),
                    level: Number(data.level) || 1,
                    accountId: String(data.account_id || ""),
                },
            ],
        })
    }

    let query = supabase
        .schema("player")
        .from("characters_full")
        .select("id, name, level, account_id")
        .order("last_active", { ascending: false, nullsFirst: false })
        .limit(limit)

    if (search) {
        const isNumeric = /^\d+$/.test(search)
        if (isNumeric) {
            query = query.eq("id", Number(search))
        } else {
            query = query.ilike("name", `%${search}%`)
        }
    }

    const { data } = await query

    return NextResponse.json({
        items: (data || []).map(r => ({
            id: Number(r.id),
            name: String(r.name || ""),
            level: Number(r.level) || 1,
            accountId: String(r.account_id || ""),
        })),
    })
}
