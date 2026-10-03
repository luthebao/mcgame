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
const VALID_TIERS = new Set(["normal", "mythic", "special"])
const VALID_SOURCES = new Set(["schedule", "daily"])

type DropInput = {
    rewardType: number
    awardId: number
    rate: number
    quality: number
    bound: boolean
    qid: number
    qtyMin: number
    qtyMax: number
    tierFilter: string | null
    sourceFilter: string | null
    notes: string | null
}

function parseNid(value: string): number | null {
    const n = Number.parseInt(value, 10)
    return Number.isFinite(n) && n > 0 ? n : null
}

function sanitizeDrops(raw: unknown): DropInput[] | { error: string } {
    if (!Array.isArray(raw)) return { error: "drops must be an array" }
    if (raw.length > 200) return { error: "too many drop rows (max 200)" }

    const out: DropInput[] = []
    for (let i = 0; i < raw.length; i++) {
        const entry = raw[i] as Record<string, unknown>
        const rewardType = Number(entry.rewardType ?? entry.type ?? 0)
        const awardId = Number(entry.awardId ?? entry.itemId ?? 0)
        const rate = Number(entry.rate)
        const quality = Number(entry.quality ?? 0)
        const qid = Number(entry.qid ?? 0)
        const qtyMin = Number(entry.qtyMin ?? 1)
        const qtyMax = Number(entry.qtyMax ?? qtyMin)
        const bound = entry.bound === true || entry.bound === 1
        const tierFilterRaw = (entry.tierFilter ?? null) as string | null
        const sourceFilterRaw = (entry.sourceFilter ?? null) as string | null
        const notes = typeof entry.notes === "string" ? (entry.notes as string).slice(0, 500) : null

        const isCurrency = CURRENCY_REWARD_TYPES.has(rewardType)

        if (!Number.isFinite(rewardType) || rewardType < 0)
            return { error: `row ${i}: rewardType must be >= 0` }
        if (isCurrency) {
            if (!Number.isFinite(awardId) || awardId < 0)
                return { error: `row ${i}: awardId must be >= 0` }
            if (rewardType === 30 && (awardId < 0 || awardId > 2))
                return { error: `row ${i}: basic currency awardId must be 0..2` }
        } else {
            if (!Number.isFinite(awardId) || awardId <= 0)
                return { error: `row ${i}: itemId/awardId must be > 0` }
        }
        if (!Number.isFinite(rate) || rate < 1 || rate > 50000)
            return { error: `row ${i}: rate must be 1–50000` }
        if (!Number.isFinite(quality) || quality < 0 || quality > 25)
            return { error: `row ${i}: quality must be 0–25` }
        if (!Number.isFinite(qid) || qid < -1)
            return { error: `row ${i}: qid must be ≥ -1` }
        if (!Number.isFinite(qtyMin) || qtyMin < 1)
            return { error: `row ${i}: qtyMin must be ≥ 1` }
        if (!Number.isFinite(qtyMax) || qtyMax < qtyMin)
            return { error: `row ${i}: qtyMax must be ≥ qtyMin` }
        const tierFilter = tierFilterRaw && VALID_TIERS.has(tierFilterRaw) ? tierFilterRaw : null
        const sourceFilter = sourceFilterRaw && VALID_SOURCES.has(sourceFilterRaw) ? sourceFilterRaw : null

        out.push({
            rewardType,
            awardId,
            rate,
            quality,
            bound,
            qid,
            qtyMin,
            qtyMax,
            tierFilter,
            sourceFilter,
            notes,
        })
    }
    return out
}

export async function GET(
    _request: NextRequest,
    context: { params: Promise<{ nid: string }> }
) {
    const { nid: nidStr } = await context.params
    const nid = parseNid(nidStr)
    if (nid === null) {
        return NextResponse.json({ error: "invalid nid" }, { status: HTTP_STATUS.BAD_REQUEST })
    }

    try {
        const supabase = createAdminClient()
        const [bossRes, dropsRes] = await Promise.all([
            supabase
                .schema("data")
                .from("data_tbl_schedule_boss")
                .select("nid, name, kind, tier, map_id, level, daily_boss_id, is_active")
                .eq("nid", nid)
                .maybeSingle(),
            supabase
                .schema("data")
                .from("data_tbl_boss_loot")
                .select("id, boss_nid, item_id, quality, rate, qty_min, qty_max, bound, type, tier_filter, source_filter, qid, notes, is_active")
                .eq("boss_nid", nid)
                .order("id", { ascending: true }),
        ])

        if (bossRes.error) throw new Error(bossRes.error.message)
        if (dropsRes.error) throw new Error(dropsRes.error.message)
        if (!bossRes.data) {
            return NextResponse.json({ error: "boss not found" }, { status: HTTP_STATUS.NOT_FOUND })
        }

        const rawDrops = (dropsRes.data || []) as Array<{
            id: number
            boss_nid: number | string
            item_id: number | string
            quality: number | string
            rate: number | string
            qty_min: number | string
            qty_max: number | string
            bound: boolean
            type: number | string
            tier_filter: string | null
            source_filter: string | null
            qid: number | string | null
            notes: string | null
            is_active: boolean
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
            const rewardType = Number(d.type)
            return {
                id: Number(d.id),
                rewardType,
                awardId: itemId,
                itemId,
                itemName: nameByItemId.get(itemId) || "",
                iconDataUrl: iconDataUrlByItemId.get(itemId) || "",
                rate: Number(d.rate),
                quality: Number(d.quality),
                qtyMin: Number(d.qty_min),
                qtyMax: Number(d.qty_max),
                bound: !!d.bound,
                qid: d.qid === null ? 0 : Number(d.qid),
                tierFilter: d.tier_filter,
                sourceFilter: d.source_filter,
                notes: d.notes,
            }
        })

        const boss = bossRes.data as {
            nid: number
            name: string
            kind: string
            tier: string
            map_id: number
            level: number
            daily_boss_id: number | null
        }

        return NextResponse.json({
            nid: Number(boss.nid),
            name: boss.name,
            kind: boss.kind,
            tier: boss.tier,
            mapId: Number(boss.map_id),
            level: Number(boss.level),
            dailyBossId: boss.daily_boss_id === null ? null : Number(boss.daily_boss_id),
            drops,
        })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không tải được chi tiết boss loot")
        return NextResponse.json({ error: message }, { status: HTTP_STATUS.INTERNAL_SERVER_ERROR })
    }
}

export async function PUT(
    request: NextRequest,
    context: { params: Promise<{ nid: string }> }
) {
    const { nid: nidStr } = await context.params
    const nid = parseNid(nidStr)
    if (nid === null) {
        return NextResponse.json(
            { ok: false, message: "invalid nid" },
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

    try {
        const supabase = createAdminClient()

        const bossCheck = await supabase
            .schema("data")
            .from("data_tbl_schedule_boss")
            .select("nid, is_active")
            .eq("nid", nid)
            .maybeSingle()
        if (bossCheck.error) throw new Error(bossCheck.error.message)
        if (!bossCheck.data) {
            return NextResponse.json(
                { ok: false, message: "boss not found" },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }

        const delRes = await supabase
            .schema("data")
            .from("data_tbl_boss_loot")
            .delete()
            .eq("boss_nid", nid)
        if (delRes.error) throw new Error(delRes.error.message)

        if (parsed.length === 0) {
            return NextResponse.json({ ok: true, inserted: 0 })
        }

        const rows = parsed.map(d => ({
            boss_nid: nid,
            item_id: d.awardId,
            quality: d.quality,
            rate: d.rate,
            qty_min: d.qtyMin,
            qty_max: d.qtyMax,
            bound: d.bound,
            type: d.rewardType,
            tier_filter: d.tierFilter,
            source_filter: d.sourceFilter,
            qid: d.qid,
            notes: d.notes,
            is_active: true,
        }))

        const insRes = await supabase
            .schema("data")
            .from("data_tbl_boss_loot")
            .insert(rows)
        if (insRes.error) throw new Error(insRes.error.message)

        return NextResponse.json({ ok: true, inserted: rows.length })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không lưu được cấu hình boss loot")
        return NextResponse.json(
            { ok: false, message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
