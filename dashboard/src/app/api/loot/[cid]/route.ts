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

const CURRENCY_REWARD_TYPES = new Set([30, 31, 35])

type DropInput = {
    itemId: number
    rate: number
    quality: number
    bind: number
    qid: number
    type: number
    qtyMin: number
    qtyMax: number
}

function parseCid(value: string): number | null {
    const n = Number.parseInt(value, 10)
    return Number.isFinite(n) && n > 0 ? n : null
}

function sanitizeDrops(raw: unknown): DropInput[] | { error: string } {
    if (!Array.isArray(raw)) return { error: "drops must be an array" }
    if (raw.length > 200) return { error: "too many drop rows (max 200)" }

    const out: DropInput[] = []
    for (let i = 0; i < raw.length; i++) {
        const entry = raw[i] as Record<string, unknown>
        const itemId = Number(entry.itemId)
        const rate = Number(entry.rate)
        const quality = Number(entry.quality)
        const bind = Number(entry.bind)
        const qid = Number(entry.qid ?? 0)
        const type = Number(entry.type ?? 0)
        const qtyMin = Number(entry.qtyMin ?? 1)
        const qtyMax = Number(entry.qtyMax ?? qtyMin)

        const isCurrency = CURRENCY_REWARD_TYPES.has(type)

        if (isCurrency) {
            if (!Number.isFinite(itemId) || itemId < 0)
                return { error: `row ${i}: currency awardId must be ≥ 0` }
            if (type === 30 && (itemId < 0 || itemId > 2))
                return { error: `row ${i}: basic currency awardId must be 0..2` }
        } else if (!Number.isFinite(itemId) || itemId <= 0) {
            return { error: `row ${i}: invalid itemId` }
        }
        if (!Number.isFinite(rate) || rate < 0 || rate > 50000)
            return { error: `row ${i}: rate must be 0–50000` }
        if (!Number.isFinite(quality) || quality < 0 || quality > 25)
            return { error: `row ${i}: quality must be 0–25` }
        if (bind !== 0 && bind !== 1) return { error: `row ${i}: bind must be 0/1` }
        if (!Number.isFinite(type) || type < 0)
            return { error: `row ${i}: type must be ≥ 0` }
        if (!Number.isFinite(qid) || qid < -1)
            return { error: `row ${i}: qid must be ≥ -1` }
        if (!Number.isFinite(qtyMin) || qtyMin < 1)
            return { error: `row ${i}: qtyMin must be ≥ 1` }
        if (!Number.isFinite(qtyMax) || qtyMax < qtyMin)
            return { error: `row ${i}: qtyMax must be ≥ qtyMin` }

        out.push({ itemId, rate, quality, bind, qid, type, qtyMin, qtyMax })
    }
    return out
}

export async function GET(
    _request: NextRequest,
    context: { params: Promise<{ cid: string }> }
) {
    const { cid: cidStr } = await context.params
    const cid = parseCid(cidStr)
    if (cid === null) {
        return NextResponse.json({ error: "invalid cid" }, { status: HTTP_STATUS.BAD_REQUEST })
    }

    try {
        const supabase = createAdminClient()
        const [creatureRes, dropsRes] = await Promise.all([
            supabase
                .schema("data")
                .from("data_tbl_creature")
                .select("id, name")
                .eq("id", cid)
                .maybeSingle(),
            supabase
                .schema("data")
                .from("data_tbl_creature_loot")
                .select("id, b, item_id, qid, quality, rate, type, qty_min, qty_max")
                .eq("cid", cid)
                .order("id", { ascending: true }),
        ])

        if (creatureRes.error) throw new Error(creatureRes.error.message)
        if (dropsRes.error) throw new Error(dropsRes.error.message)
        if (!creatureRes.data) {
            return NextResponse.json({ error: "creature not found" }, { status: HTTP_STATUS.NOT_FOUND })
        }

        const rawDrops = (dropsRes.data || []) as Array<{
            id: number
            b: number | string
            item_id: number | string
            qid: number | string
            quality: number | string
            rate: number | string
            type: number | string
            qty_min: number | string
            qty_max: number | string
        }>

        const itemIds = Array.from(
            new Set(
                rawDrops
                    .filter(d => !CURRENCY_REWARD_TYPES.has(Number(d.type)))
                    .map(d => Number(d.item_id))
                    .filter(n => n > 0)
            )
        )
        const nameByItemId = new Map<number, string>()
        const iconIdByItemId = new Map<number, number>()
        if (itemIds.length > 0) {
            const namesRes = await supabase
                .from("vw_item_source")
                .select("item_id, name, icon_id")
                .in("item_id", itemIds)
            if (namesRes.error) throw new Error(namesRes.error.message)
            for (const row of (namesRes.data || []) as Array<{
                item_id: number | string
                name: string
                icon_id: number | string | null
            }>) {
                const id = Number(row.item_id)
                nameByItemId.set(id, row.name)
                iconIdByItemId.set(id, Math.max(0, Number(row.icon_id || 0)))
            }
        }

        const iconDir = await resolveIconDirectory()
        const iconIndex = await buildIconIndex(iconDir)
        const iconDataUrlByItemId = new Map<number, string>()
        for (const itemId of itemIds) {
            const iconId = iconIdByItemId.get(itemId) || 0
            if (iconId <= 0) continue
            const match = resolveHashedIcon(iconDir, iconIndex, iconId)
            if (!match) continue
            iconDataUrlByItemId.set(
                itemId,
                await readIconDataUrl(match.path, match.logicalPath)
            )
        }

        const drops = rawDrops.map(d => {
            const itemId = Number(d.item_id)
            const type = Number(d.type)
            return {
                id: Number(d.id),
                itemId,
                itemName: nameByItemId.get(itemId) || "",
                iconDataUrl: iconDataUrlByItemId.get(itemId) || "",
                rate: Number(d.rate),
                quality: Number(d.quality),
                bind: Number(d.b),
                qid: Number(d.qid),
                type,
                qtyMin: Number(d.qty_min),
                qtyMax: Number(d.qty_max),
            }
        })

        return NextResponse.json({
            cid: Number((creatureRes.data as { id: number }).id),
            name: (creatureRes.data as { name: string }).name,
            drops,
        })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không tải được chi tiết rớt vật phẩm")
        return NextResponse.json({ error: message }, { status: HTTP_STATUS.INTERNAL_SERVER_ERROR })
    }
}

export async function PUT(
    request: NextRequest,
    context: { params: Promise<{ cid: string }> }
) {
    const { cid: cidStr } = await context.params
    const cid = parseCid(cidStr)
    if (cid === null) {
        return NextResponse.json(
            { ok: false, message: "invalid cid" },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    let body: { drops?: unknown }
    try {
        body = (await request.json()) as { drops?: unknown }
    } catch {
        return NextResponse.json(
            { ok: false, message: "invalid JSON body" },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const parsed = sanitizeDrops(body.drops)
    if (!Array.isArray(parsed)) {
        return NextResponse.json(
            { ok: false, message: parsed.error },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const insertable = parsed.filter(d => d.rate >= 1 && d.rate <= 50000)

    try {
        const supabase = createAdminClient()

        const creatureCheck = await supabase
            .schema("data")
            .from("data_tbl_creature")
            .select("id")
            .eq("id", cid)
            .maybeSingle()
        if (creatureCheck.error) throw new Error(creatureCheck.error.message)
        if (!creatureCheck.data) {
            return NextResponse.json(
                { ok: false, message: "creature not found" },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }

        const maxRes = await supabase
            .schema("data")
            .from("data_tbl_creature_loot")
            .select("id")
            .order("id", { ascending: false })
            .limit(1)
        if (maxRes.error) throw new Error(maxRes.error.message)
        const currentMaxId = Number(
            ((maxRes.data || [])[0] as { id?: number } | undefined)?.id || 0
        )

        const delRes = await supabase
            .schema("data")
            .from("data_tbl_creature_loot")
            .delete()
            .eq("cid", cid)
        if (delRes.error) throw new Error(delRes.error.message)

        if (insertable.length === 0) {
            return NextResponse.json({ ok: true, inserted: 0 })
        }

        const rows = insertable.map((d, idx) => ({
            id: currentMaxId + 1 + idx,
            b: d.bind,
            cid,
            item_id: d.itemId,
            qid: d.qid,
            quality: d.quality,
            rate: d.rate,
            type: d.type,
            qty_min: d.qtyMin,
            qty_max: d.qtyMax,
        }))

        const insRes = await supabase
            .schema("data")
            .from("data_tbl_creature_loot")
            .insert(rows)
        if (insRes.error) throw new Error(insRes.error.message)

        return NextResponse.json({ ok: true, inserted: rows.length })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không lưu được cấu hình rớt vật phẩm")
        return NextResponse.json(
            { ok: false, message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
