import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { jsonError, resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

const DEFAULT_PAGE_SIZE = 30
const MAX_PAGE_SIZE = 200

export const dynamic = "force-dynamic"

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const parsed = Number.parseInt(input, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

export async function GET(request: NextRequest) {
    const sp = request.nextUrl.searchParams
    const search = (sp.get("search") || "").trim()
    const mapId = parseIntOr(sp.get("mapId"), 0)
    const tid = parseIntOr(sp.get("tid"), 0)
    const page = Math.max(1, parseIntOr(sp.get("page"), 1))
    const pageSize = Math.min(
        MAX_PAGE_SIZE,
        Math.max(1, parseIntOr(sp.get("pageSize"), DEFAULT_PAGE_SIZE))
    )

    try {
        const supabase = createAdminClient()

        let query = supabase
            .schema("data")
            .from("data_tbl_sceneitem_instance")
            .select(
                "id, name, tid, pos_map_id, pos_x, pos_y, pos_dir, owner_type, owner_id, layer",
                { count: "exact" }
            )

        if (search) {
            const isNumeric = /^\d+$/.test(search)
            if (isNumeric) {
                query = query.eq("id", Number(search))
            } else {
                query = query.ilike("name", `%${search}%`)
            }
        }

        if (mapId > 0) {
            query = query.eq("pos_map_id", mapId)
        }

        if (tid > 0) {
            query = query.eq("tid", tid)
        }

        const start = (page - 1) * pageSize
        const end = start + pageSize - 1

        const {
            data: rows,
            count: totalCount,
            error,
        } = await query.order("id", { ascending: true }).range(start, end)

        if (error) throw new Error(error.message)

        const total = totalCount || 0
        const totalPages = total === 0 ? 0 : Math.ceil(total / pageSize)

        const mapIds = [
            ...new Set(
                (rows || [])
                    .map(r => Number(r.pos_map_id || 0))
                    .filter(id => id > 0)
            ),
        ]
        const mapNameMap = new Map<number, string>()
        if (mapIds.length > 0) {
            const { data: maps } = await supabase
                .schema("data")
                .from("data_tbl_map")
                .select("id, name")
                .in("id", mapIds)
            if (maps) {
                for (const m of maps)
                    mapNameMap.set(Number(m.id), String(m.name || ""))
            }
        }

        return NextResponse.json({
            items: (rows || []).map(row => {
                const mid = Number(row.pos_map_id || 0)
                return {
                    id: Number(row.id),
                    name: String(row.name || ""),
                    tid: Number(row.tid || 0),
                    mapId: mid,
                    mapName: mapNameMap.get(mid) || "",
                    posX: Number(row.pos_x || 0),
                    posY: Number(row.pos_y || 0),
                    posDir: Number(row.pos_dir || 0),
                    ownerType: Number(row.owner_type || 0),
                    ownerId: Number(row.owner_id || 0),
                    layer: Number(row.layer || 0),
                }
            }),
            total,
            page,
            pageSize,
            totalPages,
        })
    } catch (error) {
        return NextResponse.json(
            {
                items: [],
                total: 0,
                page,
                pageSize,
                totalPages: 0,
                message: resolveErrorMessage(
                    error,
                    "Failed to load scene items"
                ),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

export async function PUT(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return jsonError({
            code: "admin_auth_required",
            message: API_MESSAGES.admin.loginRequired,
            status: HTTP_STATUS.UNAUTHORIZED,
        })
    }

    try {
        const body = await request.json()
        const id = Number(body.id || 0)
        const posX = Number(body.pos_x ?? body.posX ?? -1)
        const posY = Number(body.pos_y ?? body.posY ?? -1)

        if (id <= 0) {
            return jsonError({
                code: "invalid_id",
                message: "ID is required",
                status: HTTP_STATUS.BAD_REQUEST,
            })
        }
        if (posX < 0 || posY < 0) {
            return jsonError({
                code: "invalid_position",
                message: "pos_x and pos_y are required (>= 0)",
                status: HTTP_STATUS.BAD_REQUEST,
            })
        }

        const supabase = createAdminClient()

        const { data, error } = await supabase
            .schema("data")
            .from("data_tbl_sceneitem_instance")
            .update({ pos_x: posX, pos_y: posY })
            .eq("id", id)
            .select("id, name, tid, pos_map_id, pos_x, pos_y, pos_dir")
            .single()

        if (error) throw new Error(error.message)

        return NextResponse.json({
            ok: true,
            item: {
                id: Number(data.id),
                name: String(data.name || ""),
                tid: Number(data.tid || 0),
                mapId: Number(data.pos_map_id || 0),
                posX: Number(data.pos_x || 0),
                posY: Number(data.pos_y || 0),
                posDir: Number(data.pos_dir || 0),
            },
        })
    } catch (error) {
        return jsonError({
            code: "update_failed",
            message: resolveErrorMessage(error, "Failed to update scene item"),
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        })
    }
}
