import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { createAdminClient } from "@/lib/supabase/admin"

export const dynamic = "force-dynamic"

const VALID_KIND = new Set(["all", "ground", "flying", "daily_only"])
const VALID_TIER = new Set(["all", "normal", "mythic", "special"])
const VALID_SORT = new Set(["nid", "name", "level", "drop_count"])
const MAX_SCAN_ROWS = 5000

type BossLootListParams = {
    search: string
    kind: string
    tier: string
    mapId: number | null
    minLevel: number | null
    maxLevel: number | null
    sortBy: string
    sortDir: string
    page: number
    pageSize: number
}

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const n = Number.parseInt(input, 10)
    return Number.isFinite(n) ? n : fallback
}

function parseOptionalInt(input: string | null): number | null {
    if (!input) return null
    const n = Number.parseInt(input, 10)
    return Number.isFinite(n) ? n : null
}

function normalize(request: NextRequest): BossLootListParams {
    const sp = request.nextUrl.searchParams
    const rawKind = (sp.get("kind") || "all").toLowerCase()
    const rawTier = (sp.get("tier") || "all").toLowerCase()
    const rawSort = (sp.get("sortBy") || "nid").toLowerCase()
    return {
        search: (sp.get("search") || "").slice(0, 100).trim(),
        kind: VALID_KIND.has(rawKind) ? rawKind : "all",
        tier: VALID_TIER.has(rawTier) ? rawTier : "all",
        mapId: parseOptionalInt(sp.get("mapId")),
        minLevel: parseOptionalInt(sp.get("minLevel")),
        maxLevel: parseOptionalInt(sp.get("maxLevel")),
        sortBy: VALID_SORT.has(rawSort) ? rawSort : "nid",
        sortDir: sp.get("sortDir")?.toLowerCase() === "desc" ? "desc" : "asc",
        page: Math.max(1, parseIntOr(sp.get("page"), 1)),
        pageSize: Math.min(200, Math.max(1, parseIntOr(sp.get("pageSize"), 30))),
    }
}

type StitchedRow = {
    nid: number
    name: string
    kind: "ground" | "flying" | "daily_only"
    tier: "normal" | "mythic" | "special"
    mapId: number
    level: number
    dailyBossId: number | null
    dropCount: number
}

export async function GET(request: NextRequest) {
    const params = normalize(request)

    try {
        const supabase = createAdminClient()

        const { data: bosses, error: bossErr } = await supabase
            .schema("data")
            .from("data_tbl_schedule_boss")
            .select("nid, name, kind, tier, map_id, level, daily_boss_id, is_active")
            .eq("is_active", true)
            .limit(MAX_SCAN_ROWS)

        if (bossErr) throw new Error(bossErr.message)

        const nids = (bosses || []).map(b => Number(b.nid)).filter(n => Number.isFinite(n))

        const dropCountByNid = new Map<number, number>()
        if (nids.length > 0) {
            const { data: lootRows, error: lootErr } = await supabase
                .schema("data")
                .from("data_tbl_boss_loot")
                .select("boss_nid")
                .in("boss_nid", nids)
                .limit(MAX_SCAN_ROWS)
            if (lootErr) throw new Error(lootErr.message)
            for (const row of (lootRows || []) as Array<{ boss_nid: number | string }>) {
                const nid = Number(row.boss_nid)
                if (!Number.isFinite(nid)) continue
                dropCountByNid.set(nid, (dropCountByNid.get(nid) || 0) + 1)
            }
        }

        const stitched: StitchedRow[] = (bosses || []).map(b => ({
            nid: Number(b.nid),
            name: String(b.name),
            kind: b.kind as StitchedRow["kind"],
            tier: b.tier as StitchedRow["tier"],
            mapId: Number(b.map_id),
            level: Number(b.level),
            dailyBossId: b.daily_boss_id === null ? null : Number(b.daily_boss_id),
            dropCount: dropCountByNid.get(Number(b.nid)) || 0,
        }))

        let filtered = stitched
        if (params.kind !== "all") filtered = filtered.filter(r => r.kind === params.kind)
        if (params.tier !== "all") filtered = filtered.filter(r => r.tier === params.tier)
        if (params.mapId !== null) filtered = filtered.filter(r => r.mapId === params.mapId)
        if (params.minLevel !== null) filtered = filtered.filter(r => r.level >= (params.minLevel as number))
        if (params.maxLevel !== null) filtered = filtered.filter(r => r.level <= (params.maxLevel as number))
        if (params.search) {
            const needle = params.search.toLowerCase()
            const numeric = /^\d+$/.test(params.search) ? Number(params.search) : null
            filtered = filtered.filter(r => {
                if (numeric !== null && (r.nid === numeric || r.dailyBossId === numeric)) return true
                return r.name.toLowerCase().includes(needle)
            })
        }

        const asc = params.sortDir === "asc" ? 1 : -1
        filtered.sort((a, b) => {
            const sortKey = params.sortBy
            let av: number | string = a.nid
            let bv: number | string = b.nid
            if (sortKey === "name") {
                av = a.name
                bv = b.name
            } else if (sortKey === "level") {
                av = a.level
                bv = b.level
            } else if (sortKey === "drop_count") {
                av = a.dropCount
                bv = b.dropCount
            }
            if (typeof av === "string" && typeof bv === "string") {
                return av.localeCompare(bv) * asc
            }
            return ((av as number) - (bv as number)) * asc
        })

        const total = filtered.length
        const totalPages = total === 0 ? 0 : Math.ceil(total / params.pageSize)
        const start = (params.page - 1) * params.pageSize
        const pageRows = filtered.slice(start, start + params.pageSize)

        return NextResponse.json({
            rows: pageRows,
            total,
            page: params.page,
            pageSize: params.pageSize,
            totalPages,
        })
    } catch (error) {
        const message = resolveErrorMessage(error, "Không tải được danh sách boss loot")
        return NextResponse.json(
            {
                rows: [],
                total: 0,
                page: params.page,
                pageSize: params.pageSize,
                totalPages: 0,
                lastError: message,
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
