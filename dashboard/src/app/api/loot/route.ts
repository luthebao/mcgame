import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { createAdminClient } from "@/lib/supabase/admin"

export const dynamic = "force-dynamic"

type LootListParams = {
    search: string
    role: string
    mapId: number | null
    minLevel: number | null
    maxLevel: number | null
    sortBy: string
    sortDir: string
    page: number
    pageSize: number
}

const VALID_ROLES = new Set(["all", "normal", "map-boss", "npc", "other"])
const VALID_SORT = new Set(["cid", "name", "level", "drop_count"])
const MAX_SCAN_ROWS = 50000

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

function normalize(request: NextRequest): LootListParams {
    const sp = request.nextUrl.searchParams
    const rawRole = (sp.get("role") || "all").toLowerCase()
    const rawSort = (sp.get("sortBy") || "cid").toLowerCase()
    return {
        search: (sp.get("search") || "").slice(0, 100).trim(),
        role: VALID_ROLES.has(rawRole) ? rawRole : "all",
        mapId: parseOptionalInt(sp.get("mapId")),
        minLevel: parseOptionalInt(sp.get("minLevel")),
        maxLevel: parseOptionalInt(sp.get("maxLevel")),
        sortBy: VALID_SORT.has(rawSort) ? rawSort : "cid",
        sortDir: sp.get("sortDir")?.toLowerCase() === "desc" ? "desc" : "asc",
        page: Math.max(1, parseIntOr(sp.get("page"), 1)),
        pageSize: Math.min(200, Math.max(1, parseIntOr(sp.get("pageSize"), 30))),
    }
}

type StitchedRow = {
    cid: number
    name: string
    role: "normal" | "map-boss" | "npc" | "other"
    mapIds: number[]
    level: number
    dropCount: number
}

export async function GET(request: NextRequest) {
    const params = normalize(request)

    try {
        const supabase = createAdminClient()

        const { data: lootRows, error: lootErr } = await supabase
            .schema("data")
            .from("data_tbl_creature_loot")
            .select("cid")
            .limit(MAX_SCAN_ROWS)

        if (lootErr) throw new Error(lootErr.message)

        const dropCountByCid = new Map<number, number>()
        for (const row of (lootRows || []) as Array<{ cid: number | string }>) {
            const cid = Number(row.cid)
            if (!Number.isFinite(cid) || cid <= 0) continue
            dropCountByCid.set(cid, (dropCountByCid.get(cid) || 0) + 1)
        }
        const cids = Array.from(dropCountByCid.keys())
        if (cids.length === 0) {
            return NextResponse.json({
                rows: [],
                total: 0,
                page: params.page,
                pageSize: params.pageSize,
                totalPages: 0,
            })
        }

        const [creaturesRes, mapCreatureRes, npcRes] = await Promise.all([
            supabase
                .schema("data")
                .from("data_tbl_creature")
                .select("id, name")
                .in("id", cids)
                .limit(MAX_SCAN_ROWS),
            supabase
                .schema("data")
                .from("data_tbl_map_creature")
                .select("cid, mid, level, boss_flag")
                .in("cid", cids)
                .limit(MAX_SCAN_ROWS),
            supabase
                .schema("data")
                .from("data_tbl_npc_creature")
                .select("cid")
                .in("cid", cids)
                .limit(MAX_SCAN_ROWS),
        ])

        if (creaturesRes.error) throw new Error(creaturesRes.error.message)
        if (mapCreatureRes.error) throw new Error(mapCreatureRes.error.message)
        if (npcRes.error) throw new Error(npcRes.error.message)

        const nameByCid = new Map<number, string>()
        for (const c of (creaturesRes.data || []) as Array<{ id: number; name: string }>) {
            nameByCid.set(Number(c.id), c.name)
        }

        const mapInfoByCid = new Map<
            number,
            { mapIds: Set<number>; maxLevel: number; hasBossFlag: boolean; hasNormal: boolean }
        >()
        for (const m of (mapCreatureRes.data || []) as Array<{
            cid: number | string
            mid: number | string
            level: number | string
            boss_flag: number | string
        }>) {
            const cid = Number(m.cid)
            if (!Number.isFinite(cid)) continue
            const entry = mapInfoByCid.get(cid) || {
                mapIds: new Set<number>(),
                maxLevel: 0,
                hasBossFlag: false,
                hasNormal: false,
            }
            const mid = Number(m.mid)
            if (Number.isFinite(mid) && mid > 0) entry.mapIds.add(mid)
            const lvl = Number(m.level)
            if (Number.isFinite(lvl) && lvl > entry.maxLevel) entry.maxLevel = lvl
            const bossFlag = Number(m.boss_flag)
            if (bossFlag === 1) entry.hasBossFlag = true
            else entry.hasNormal = true
            mapInfoByCid.set(cid, entry)
        }

        const npcCids = new Set<number>()
        for (const n of (npcRes.data || []) as Array<{ cid: number | string }>) {
            const cid = Number(n.cid)
            if (Number.isFinite(cid)) npcCids.add(cid)
        }

        const stitched: StitchedRow[] = cids.map(cid => {
            const map = mapInfoByCid.get(cid)
            const isNpc = npcCids.has(cid)
            const role: StitchedRow["role"] = isNpc
                ? "npc"
                : map?.hasBossFlag
                  ? "map-boss"
                  : map?.hasNormal
                    ? "normal"
                    : "other"
            return {
                cid,
                name: nameByCid.get(cid) || `#${cid}`,
                role,
                mapIds: map ? Array.from(map.mapIds).sort((a, b) => a - b) : [],
                level: map?.maxLevel || 0,
                dropCount: dropCountByCid.get(cid) || 0,
            }
        })

        let filtered = stitched
        if (params.role !== "all") {
            filtered = filtered.filter(r => r.role === params.role)
        }
        if (params.mapId !== null) {
            filtered = filtered.filter(r => r.mapIds.includes(params.mapId as number))
        }
        if (params.minLevel !== null) {
            filtered = filtered.filter(r => r.level >= (params.minLevel as number))
        }
        if (params.maxLevel !== null) {
            filtered = filtered.filter(r => r.level <= (params.maxLevel as number))
        }
        if (params.search) {
            const needle = params.search.toLowerCase()
            const numeric = /^\d+$/.test(params.search) ? Number(params.search) : null
            filtered = filtered.filter(r => {
                if (numeric !== null && r.cid === numeric) return true
                return r.name.toLowerCase().includes(needle)
            })
        }

        const asc = params.sortDir === "asc" ? 1 : -1
        filtered.sort((a, b) => {
            const sortKey = params.sortBy
            let av: number | string = a.cid
            let bv: number | string = b.cid
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
        const message = resolveErrorMessage(error, "Không tải được danh sách rớt vật phẩm")
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
