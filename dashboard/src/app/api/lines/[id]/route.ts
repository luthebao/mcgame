import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { createAdminClient } from "@/lib/supabase/admin"

const ALLOWED_STATUS = ["online", "offline", "maintenance"] as const

type GatewayConfigRow = {
    id: number
    name: string
    url: string
    max_clients: number
    auction: boolean
    guild: boolean
    status: string
    sort_order: number
    created_at: string
    updated_at: string
}

type LineUpdatePayload = {
    name?: string
    url?: string
    maxClients?: number
    auction?: boolean
    guild?: boolean
    status?: string
    sortOrder?: number
}

export const dynamic = "force-dynamic"

const NAME_MAX = 80
const URL_MAX = 200
const MAX_CLIENTS_MAX = 100000

function rejectControlBytes(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
        const code = value.charCodeAt(i)
        if (code === 0x09 || code === 0x0a) continue
        if (code < 0x20) return true
    }
    return false
}

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value)) {
        return Math.trunc(value)
    }
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function asBool(value: unknown, fallback = false): boolean {
    if (typeof value === "boolean") return value
    if (typeof value === "string") {
        const lower = value.trim().toLowerCase()
        if (lower === "true" || lower === "1") return true
        if (lower === "false" || lower === "0") return false
    }
    return fallback
}

function badRequest(message: string): NextResponse {
    return NextResponse.json(
        { ok: false, error_code: "invalid_request", message },
        { status: HTTP_STATUS.BAD_REQUEST }
    )
}

function internalError(message: string): NextResponse {
    return NextResponse.json(
        { ok: false, error_code: "internal_error", message },
        { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
    )
}

async function loadExistingLine(id: number): Promise<GatewayConfigRow | null> {
    const supabase = createAdminClient()
    const { data, error } = await supabase
        .from("gateway_config")
        .select("*")
        .eq("id", id)
        .maybeSingle()
    if (error) throw new Error(error.message)
    return (data as GatewayConfigRow | null) ?? null
}

function parseID(idParam: string): number | null {
    const id = asInt(idParam, -1)
    if (id < 0 || id > 32767) return null
    return id
}

export async function PATCH(
    request: NextRequest,
    { params }: { params: Promise<{ id: string }> }
) {
    const { id: idParam } = await params
    const id = parseID(idParam)
    if (id === null) return badRequest("invalid id")

    let payload: LineUpdatePayload
    try {
        payload = (await request.json()) as LineUpdatePayload
    } catch {
        return badRequest("invalid JSON body")
    }

    try {
        const existing = await loadExistingLine(id)
        if (!existing) {
            return NextResponse.json(
                { ok: false, error_code: "not_found", message: "line not found" },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }

        const name = payload.name !== undefined ? String(payload.name).trim() : existing.name
        if (!name || name.length > NAME_MAX || rejectControlBytes(name)) {
            return badRequest("invalid name")
        }

        const url = payload.url !== undefined ? String(payload.url).trim() : existing.url
        if (!url || url.length > URL_MAX || rejectControlBytes(url)) {
            return badRequest("invalid url")
        }
        if (!/^rtmpe?:\/\//i.test(url)) {
            return badRequest("url must start with rtmp:// or rtmpe://")
        }

        const maxClients =
            payload.maxClients !== undefined ? asInt(payload.maxClients, existing.max_clients) : existing.max_clients
        if (maxClients < 0 || maxClients > MAX_CLIENTS_MAX) {
            return badRequest("invalid max_clients")
        }

        const status = payload.status !== undefined ? String(payload.status).trim() : existing.status
        if (!ALLOWED_STATUS.includes(status as (typeof ALLOWED_STATUS)[number])) {
            return badRequest("invalid status")
        }

        const sortOrder =
            payload.sortOrder !== undefined ? asInt(payload.sortOrder, existing.sort_order) : existing.sort_order

        const auction = payload.auction !== undefined ? asBool(payload.auction, existing.auction) : existing.auction
        const guild = payload.guild !== undefined ? asBool(payload.guild, existing.guild) : existing.guild

        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc("upsert_gateway_config", {
            p_id: id,
            p_name: name,
            p_url: url,
            p_max_clients: maxClients,
            p_auction: auction,
            p_guild: guild,
            p_status: status,
            p_sort_order: sortOrder,
        })
        if (error) throw new Error(error.message)
        return NextResponse.json({ ok: true, line: data as GatewayConfigRow })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "update failed")
    }
}

export async function DELETE(
    _request: NextRequest,
    { params }: { params: Promise<{ id: string }> }
) {
    const { id: idParam } = await params
    const id = parseID(idParam)
    if (id === null) return badRequest("invalid id")

    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc("delete_gateway_config", { p_id: id })
        if (error) throw new Error(error.message)
        const removed = data === true
        if (!removed) {
            return NextResponse.json(
                { ok: false, error_code: "not_found", message: "line not found" },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }
        return NextResponse.json({ ok: true, id })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "delete failed")
    }
}
