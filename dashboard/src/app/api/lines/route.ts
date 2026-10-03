import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { createAdminClient } from "@/lib/supabase/admin"

const ALLOWED_STATUS = ["online", "offline", "maintenance"] as const
type LineStatus = (typeof ALLOWED_STATUS)[number]

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

type LineCreatePayload = {
    id?: number
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

function validateLinePayload(payload: LineCreatePayload, requireID: boolean) {
    const name = String(payload.name || "").trim()
    if (!name) {
        throw new Error("name is required")
    }
    if (name.length > NAME_MAX || rejectControlBytes(name)) {
        throw new Error("invalid name")
    }

    const url = String(payload.url || "").trim()
    if (!url) {
        throw new Error("url is required")
    }
    if (url.length > URL_MAX || rejectControlBytes(url)) {
        throw new Error("invalid url")
    }
    if (!/^rtmpe?:\/\//i.test(url)) {
        throw new Error("url must start with rtmp:// or rtmpe://")
    }

    const maxClients = asInt(payload.maxClients, 1000)
    if (maxClients < 0 || maxClients > MAX_CLIENTS_MAX) {
        throw new Error("invalid max_clients")
    }

    const status = String(payload.status || "online").trim() as LineStatus
    if (!ALLOWED_STATUS.includes(status)) {
        throw new Error("invalid status")
    }

    let id: number | null = null
    if (requireID) {
        id = asInt(payload.id, -1)
        if (id < 0 || id > 32767) {
            throw new Error("invalid id (smallint range)")
        }
    }

    const sortOrder = asInt(payload.sortOrder, 0)
    if (sortOrder < 0 || sortOrder > 32767) {
        throw new Error("invalid sort_order")
    }

    return {
        id,
        name,
        url,
        maxClients,
        auction: asBool(payload.auction, false),
        guild: asBool(payload.guild, false),
        status,
        sortOrder,
    }
}

export async function GET(_request: NextRequest) {
    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc("list_gateway_config")
        if (error) throw new Error(error.message)
        return NextResponse.json({ ok: true, items: (data as GatewayConfigRow[]) || [] })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "list failed")
    }
}

export async function POST(request: NextRequest) {
    let payload: LineCreatePayload
    try {
        payload = (await request.json()) as LineCreatePayload
    } catch {
        return badRequest("invalid JSON body")
    }

    let normalized
    try {
        normalized = validateLinePayload(payload, true)
    } catch (error) {
        return badRequest(error instanceof Error ? error.message : "invalid request")
    }
    if (normalized.id === null) {
        return badRequest("id is required")
    }

    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc("upsert_gateway_config", {
            p_id: normalized.id,
            p_name: normalized.name,
            p_url: normalized.url,
            p_max_clients: normalized.maxClients,
            p_auction: normalized.auction,
            p_guild: normalized.guild,
            p_status: normalized.status,
            p_sort_order: normalized.sortOrder,
        })
        if (error) throw new Error(error.message)
        return NextResponse.json(
            { ok: true, line: data as GatewayConfigRow },
            { status: HTTP_STATUS.CREATED }
        )
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "create failed")
    }
}
