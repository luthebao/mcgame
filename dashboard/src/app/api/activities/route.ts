import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { jsonError, resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

export type ActivityRow = {
    id: number
    name: string | null
    style_name: string | null
    panel_key: string | null
    feature_key: string | null
    sort_type: number
    enable: boolean
    type: number
    flag: number
    note: string | null
}

type ActivityCreateBody = {
    id?: number
    name?: string | null
    style_name?: string | null
    panel_key?: string | null
    feature_key?: string | null
    sort_type?: number
    enable?: boolean
    type?: number
    flag?: number
    note?: string | null
}

type ActivityUpdateBody = ActivityCreateBody & { id: number }

type ActivityDeleteBody = { id: number }

export const dynamic = "force-dynamic"

const activityTableName = "data_tbl_activity"

const broadcastTimeoutMs = 2000

type BroadcastAction = "create" | "update" | "delete"

function resolveGameServerURL(): string | null {
    for (const variableName of ["GAME_SERVER_HTTP_URL", "ADMIN_SERVER_API_URL"]) {
        const raw = process.env[variableName]
        if (raw && raw.trim()) {
            return raw.trim().replace(/\/+$/, "")
        }
    }
    return null
}

function notifyGameServer(action: BroadcastAction, id: number): void {
    const baseURL = resolveGameServerURL()
    if (!baseURL) return

    const target = `${baseURL}/api/admin/activities/broadcast`

    fetch(target, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ action, id }),
        signal: AbortSignal.timeout(broadcastTimeoutMs),
        cache: "no-store",
    }).catch((error: unknown) => {
        console.warn(
            "[activities] broadcast notify failed (%s, id=%d): %s",
            action,
            id,
            error instanceof Error ? error.message : String(error)
        )
    })
}

function parseIntOr(value: unknown, fallback: number): number {
    const parsed = Number.parseInt(String(value), 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

function activityError(error: unknown, fallback: string): NextResponse {
    return NextResponse.json(
        {
            ok: false,
            message: resolveErrorMessage(error, fallback),
        },
        { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
    )
}

function missingIDError(): NextResponse {
    return NextResponse.json(
        { ok: false, message: "id is required" },
        { status: HTTP_STATUS.BAD_REQUEST }
    )
}

function buildActivityRow(id: number, body: ActivityCreateBody): ActivityRow {
    return {
        id,
        name: body.name ?? null,
        style_name: body.style_name ?? null,
        panel_key: body.panel_key ?? null,
        feature_key: body.feature_key ?? null,
        sort_type: parseIntOr(body.sort_type, 0),
        enable: body.enable ?? true,
        type: parseIntOr(body.type, 0),
        flag: parseIntOr(body.flag, 1),
        note: body.note ?? null,
    }
}

function buildActivityUpdate(body: ActivityUpdateBody): Partial<ActivityRow> {
    const update: Partial<ActivityRow> = {}

    if ("name" in body) update.name = body.name ?? null
    if ("style_name" in body) update.style_name = body.style_name ?? null
    if ("panel_key" in body) update.panel_key = body.panel_key ?? null
    if ("feature_key" in body) update.feature_key = body.feature_key ?? null
    if ("sort_type" in body) update.sort_type = parseIntOr(body.sort_type, 0)
    if ("enable" in body) update.enable = body.enable ?? true
    if ("type" in body) update.type = parseIntOr(body.type, 0)
    if ("flag" in body) update.flag = parseIntOr(body.flag, 1)
    if ("note" in body) update.note = body.note ?? null

    return update
}

async function requireAdminSession(
    request: NextRequest
): Promise<NextResponse | null> {
    const session = await readAdminSessionFromRequest(request)
    if (session) return null
    return jsonError({
        code: "admin_auth_required",
        message: API_MESSAGES.admin.loginRequired,
        status: HTTP_STATUS.UNAUTHORIZED,
    })
}

export async function GET() {
    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase
            .schema("data")
            .from(activityTableName)
            .select("*")
            .order("sort_type", { ascending: true })
            .order("id", { ascending: true })

        if (error) throw new Error(error.message)

        return NextResponse.json({
            ok: true,
            activities: data as ActivityRow[],
        })
    } catch (error) {
        return activityError(error, "Failed to load activities")
    }
}

export async function POST(request: NextRequest) {
    const authError = await requireAdminSession(request)
    if (authError) return authError

    try {
        const body = (await request.json()) as ActivityCreateBody

        const supabase = createAdminClient()

        let id: number
        if (typeof body.id === "number") {
            id = body.id
        } else {
            const { data: maxRow } = await supabase
                .schema("data")
                .from(activityTableName)
                .select("id")
                .order("id", { ascending: false })
                .limit(1)
                .single()

            id = Number(maxRow?.id ?? -1) + 1
        }

        const { data, error } = await supabase
            .schema("data")
            .from(activityTableName)
            .insert(buildActivityRow(id, body))
            .select()
            .single()

        if (error) throw new Error(error.message)

        const created = data as ActivityRow
        notifyGameServer("create", created.id)

        return NextResponse.json(
            { ok: true, activity: created },
            { status: HTTP_STATUS.CREATED }
        )
    } catch (error) {
        return activityError(error, "Failed to create activity")
    }
}

export async function PATCH(request: NextRequest) {
    const authError = await requireAdminSession(request)
    if (authError) return authError

    try {
        const body = (await request.json()) as ActivityUpdateBody

        if (typeof body.id !== "number") {
            return missingIDError()
        }

        const supabase = createAdminClient()
        const { data, error } = await supabase
            .schema("data")
            .from(activityTableName)
            .update(buildActivityUpdate(body))
            .eq("id", body.id)
            .select()
            .single()

        if (error) throw new Error(error.message)

        const updated = data as ActivityRow
        notifyGameServer("update", updated.id)

        return NextResponse.json({ ok: true, activity: updated })
    } catch (error) {
        return activityError(error, "Failed to update activity")
    }
}

export async function DELETE(request: NextRequest) {
    const authError = await requireAdminSession(request)
    if (authError) return authError

    try {
        const body = (await request.json()) as ActivityDeleteBody

        if (typeof body.id !== "number") {
            return missingIDError()
        }

        const supabase = createAdminClient()
        const { error } = await supabase
            .schema("data")
            .from(activityTableName)
            .delete()
            .eq("id", body.id)

        if (error) throw new Error(error.message)

        notifyGameServer("delete", body.id)

        return NextResponse.json({ ok: true, deletedId: body.id })
    } catch (error) {
        return activityError(error, "Failed to delete activity")
    }
}
