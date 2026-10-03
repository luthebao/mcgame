import { NextRequest, NextResponse } from "next/server"

import { HTTP_STATUS } from "@/constants/http-status"
import { createAdminClient } from "@/lib/supabase/admin"

type GroupName = "server" | "tuning" | "gm"

const GROUP_TABLES: Record<GroupName, string> = {
    server: "server_settings",
    tuning: "game_tuning",
    gm: "gm_settings",
}

const LIST_FNS: Record<GroupName, string> = {
    server: "list_server_settings",
    tuning: "list_game_tuning",
    gm: "list_gm_settings",
}

type KVRow = {
    key: string
    value: unknown
    description: string | null
    category?: string | null
    updated_at: string
}

type PatchPayload = {
    key?: string
    value?: unknown
    description?: string
    category?: string
}

export const dynamic = "force-dynamic"

const KEY_MAX = 64
const DESC_MAX = 200
const CATEGORY_MAX = 32

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

function rejectControlBytes(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
        const code = value.charCodeAt(i)
        if (code === 0x09 || code === 0x0a) continue
        if (code < 0x20) return true
    }
    return false
}

function assertGroup(value: string): GroupName {
    if (value === "server" || value === "tuning" || value === "gm") return value
    throw new Error("invalid group")
}

function validateKey(raw: unknown): string {
    const key = String(raw || "").trim()
    if (!key) throw new Error("key is required")
    if (key.length > KEY_MAX) throw new Error("key too long")
    if (!/^[a-z0-9_]+$/i.test(key)) throw new Error("key must match [a-z0-9_]+")
    return key
}

export async function GET(
    _request: NextRequest,
    { params }: { params: Promise<{ group: string }> }
) {
    const { group: groupParam } = await params
    let group: GroupName
    try {
        group = assertGroup(groupParam)
    } catch {
        return badRequest("invalid group")
    }

    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc(LIST_FNS[group])
        if (error) throw new Error(error.message)
        return NextResponse.json({ ok: true, group, items: (data as KVRow[]) || [] })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "list failed")
    }
}

export async function PATCH(
    request: NextRequest,
    { params }: { params: Promise<{ group: string }> }
) {
    const { group: groupParam } = await params
    let group: GroupName
    try {
        group = assertGroup(groupParam)
    } catch {
        return badRequest("invalid group")
    }

    let payload: PatchPayload
    try {
        payload = (await request.json()) as PatchPayload
    } catch {
        return badRequest("invalid JSON body")
    }

    let key: string
    try {
        key = validateKey(payload.key)
    } catch (error) {
        return badRequest(error instanceof Error ? error.message : "invalid key")
    }

    if (payload.value === undefined) {
        return badRequest("value is required")
    }

    let description: string | null = null
    if (payload.description !== undefined) {
        const trimmed = String(payload.description).trim()
        if (trimmed.length > DESC_MAX || rejectControlBytes(trimmed)) {
            return badRequest("invalid description")
        }
        description = trimmed || null
    }

    let category: string | null = null
    if (group === "tuning") {
        const raw = payload.category !== undefined ? String(payload.category).trim() : ""
        if (raw) {
            if (raw.length > CATEGORY_MAX || rejectControlBytes(raw)) {
                return badRequest("invalid category")
            }
            if (!["rates", "events", "features"].includes(raw)) {
                return badRequest("category must be one of rates|events|features")
            }
            category = raw
        }
    }

    try {
        const supabase = createAdminClient()
        const { error: setError } = await supabase.rpc("set_kv_setting", {
            p_table: GROUP_TABLES[group],
            p_key: key,
            p_value: payload.value,
            p_description: description,
            p_category: category,
        })
        if (setError) throw new Error(setError.message)

        const { data: row, error: fetchError } = await supabase
            .from(GROUP_TABLES[group])
            .select("*")
            .eq("key", key)
            .maybeSingle()
        if (fetchError) throw new Error(fetchError.message)

        return NextResponse.json({ ok: true, group, item: row as KVRow | null })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "patch failed")
    }
}

export async function DELETE(
    request: NextRequest,
    { params }: { params: Promise<{ group: string }> }
) {
    const { group: groupParam } = await params
    let group: GroupName
    try {
        group = assertGroup(groupParam)
    } catch {
        return badRequest("invalid group")
    }

    let payload: { key?: string }
    try {
        payload = (await request.json()) as { key?: string }
    } catch {
        return badRequest("invalid JSON body")
    }

    let key: string
    try {
        key = validateKey(payload.key)
    } catch (error) {
        return badRequest(error instanceof Error ? error.message : "invalid key")
    }

    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase.rpc("delete_kv_setting", {
            p_table: GROUP_TABLES[group],
            p_key: key,
        })
        if (error) throw new Error(error.message)
        const removed = data === true
        if (!removed) {
            return NextResponse.json(
                { ok: false, error_code: "not_found", message: "key not found" },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }
        return NextResponse.json({ ok: true, group, key })
    } catch (error) {
        return internalError(error instanceof Error ? error.message : "delete failed")
    }
}
