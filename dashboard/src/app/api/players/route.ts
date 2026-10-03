import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { ADMIN_SERVER_ENDPOINTS } from "@/lib/api/endpoints"
import { jsonError, resolveErrorMessage } from "@/lib/api/response"
import { fetchAdminServerJSON } from "@/lib/server/admin-server"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type PlayerListQuery = {
    search: string
    limit: number
}

type OnlineSessionItem = {
    characterId: number
    accountId: string
    username: string
    mapId: number
    channelId: number
    lastActiveAt: string
    connectedAt: string
    position: { x: number; y: number }
}

type OnlineSessionsResponse = {
    ok?: boolean
    items?: OnlineSessionItem[]
    total?: number
    refreshedAt?: string
}

type PlayerListItem = {
    id: number
    playerUid: number
    playerName: string
    accountName: string
    serverId: number
    serverKey: string
    level: number
    sex: number
    mapId: number
    instanceId: number
    position: { x: number; y: number }
    online: boolean
    createdAt: string
    updatedAt: string
    lastMoveAt: string | null
    lastLoginAt: string | null
    lastSeenAt: string
}

type PlayerListResponse = {
    items: PlayerListItem[]
    total: number
    limit: number
    onlineCount: number
    refreshedAt: string
}

const DEFAULT_LIMIT = 200
const MAX_LIMIT = 500
const DEFAULT_SERVER_ID = 1
const DEFAULT_SERVER_KEY = "mcgame"

export const dynamic = "force-dynamic"

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const parsed = Number.parseInt(input, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function toISOStringOrNull(value: unknown): string | null {
    if (!value) return null
    if (value instanceof Date)
        return Number.isNaN(value.getTime()) ? null : value.toISOString()
    if (typeof value === "string") {
        const parsed = new Date(value)
        return Number.isNaN(parsed.getTime()) ? value : parsed.toISOString()
    }
    return null
}

function parsePlayerListQuery(request: NextRequest): PlayerListQuery {
    const searchParams = request.nextUrl.searchParams
    return {
        search: (searchParams.get("search") || "").trim(),
        limit: Math.min(
            MAX_LIMIT,
            Math.max(1, parseIntOr(searchParams.get("limit"), DEFAULT_LIMIT))
        ),
    }
}

async function loadOnlineSessions(session: {
    secret: string
    user: string
}): Promise<Map<number, OnlineSessionItem>> {
    try {
        const payload = await fetchAdminServerJSON<OnlineSessionsResponse>(
            session,
            ADMIN_SERVER_ENDPOINTS.playerSessions
        )
        const sessionMap = new Map<number, OnlineSessionItem>()
        for (const item of payload.items || []) {
            const characterID = asInt(item.characterId, 0)
            if (characterID > 0) sessionMap.set(characterID, item)
        }
        return sessionMap
    } catch {
        return new Map()
    }
}

function fallbackAccountLabel(accountID: string): string {
    const normalized = accountID.trim()
    if (!normalized) return "-"
    return normalized.length <= 18
        ? normalized
        : `${normalized.slice(0, 8)}...${normalized.slice(-4)}`
}

function resolveServerID(sessionItem: OnlineSessionItem | undefined): number {
    return sessionItem && sessionItem.channelId > 0
        ? sessionItem.channelId
        : DEFAULT_SERVER_ID
}

function resolveServerKey(sessionItem: OnlineSessionItem | undefined): string {
    if (sessionItem && sessionItem.channelId > 0)
        return `line-${sessionItem.channelId}`
    return DEFAULT_SERVER_KEY
}

function mapPlayerItem(
    row: Record<string, unknown>,
    account: Record<string, unknown> | undefined,
    sessionItem: OnlineSessionItem | undefined,
    refreshedAt: string
): PlayerListItem {
    const id = asInt(row.id)
    const createdAt = toISOStringOrNull(row.created_at) || refreshedAt
    const fallbackLastSeenAt = toISOStringOrNull(row.last_active) || createdAt
    const sessionLastActive = toISOStringOrNull(sessionItem?.lastActiveAt)
    const online = Boolean(sessionItem)

    return {
        id,
        playerUid: id,
        playerName: String(row.name || "").trim() || `Player ${id}`,
        accountName:
            String(account?.username || "").trim() ||
            fallbackAccountLabel(String(row.account_id || "")),
        serverId: resolveServerID(sessionItem),
        serverKey: resolveServerKey(sessionItem),
        level: asInt(row.level, 1),
        sex: asInt(row.gender, 0),
        mapId: sessionItem
            ? asInt(sessionItem.mapId, asInt(row.map_id, 0))
            : asInt(row.map_id, 0),
        instanceId: 0,
        position: {
            x: sessionItem
                ? asInt(sessionItem.position?.x, asInt(row.pos_x, 0))
                : asInt(row.pos_x, 0),
            y: sessionItem
                ? asInt(sessionItem.position?.y, asInt(row.pos_y, 0))
                : asInt(row.pos_y, 0),
        },
        online,
        createdAt,
        updatedAt: sessionLastActive || fallbackLastSeenAt,
        lastMoveAt: sessionLastActive,
        lastLoginAt: toISOStringOrNull(account?.last_login),
        lastSeenAt: sessionLastActive || fallbackLastSeenAt,
    }
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return jsonError({
            code: "admin_auth_required",
            message: API_MESSAGES.admin.loginRequired,
            status: HTTP_STATUS.UNAUTHORIZED,
        })
    }

    const query = parsePlayerListQuery(request)
    const refreshedAt = new Date().toISOString()

    try {
        const supabase = createAdminClient()

        let charactersQuery = supabase
            .schema("player")
            .from("characters_full")
            .select(
                "id, account_id, name, level, gender, map_id, pos_x, pos_y, created_at, last_active"
            )
            .order("last_active", { ascending: false, nullsFirst: false })
            .order("id", { ascending: false })
            .limit(query.limit)

        let countQuery = supabase
            .schema("player")
            .from("characters_full")
            .select("*", { count: "exact", head: true })

        if (query.search) {
            const isNumeric = /^\d+$/.test(query.search)
            if (isNumeric) {
                charactersQuery = charactersQuery.eq("id", Number(query.search))
                countQuery = countQuery.eq("id", Number(query.search))
            } else {
                charactersQuery = charactersQuery.ilike(
                    "name",
                    `%${query.search}%`
                )
                countQuery = countQuery.ilike("name", `%${query.search}%`)
            }
        }

        const [listRes, countRes, onlineSessionMap] = await Promise.all([
            charactersQuery,
            countQuery,
            loadOnlineSessions(session),
        ])

        if (listRes.error) throw new Error(listRes.error.message)

        const rows = listRes.data || []
        const accountIDs = rows
            .map(r => String(r.account_id || ""))
            .filter(Boolean)

        let accountMap = new Map<string, Record<string, unknown>>()
        if (accountIDs.length > 0) {
            const uniqueIDs = Array.from(new Set(accountIDs))
            const { data: accounts } = await supabase
                .from("accounts")
                .select("id, username, email, last_login")
                .in("id", uniqueIDs)

            if (accounts) {
                for (const acc of accounts) {
                    accountMap.set(
                        String(acc.id),
                        acc as Record<string, unknown>
                    )
                }
            }
        }

        const items = rows.map(row =>
            mapPlayerItem(
                row as Record<string, unknown>,
                accountMap.get(String(row.account_id || "")),
                onlineSessionMap.get(asInt(row.id)),
                refreshedAt
            )
        )

        const response: PlayerListResponse = {
            items,
            total: countRes.count || 0,
            limit: query.limit,
            onlineCount: onlineSessionMap.size,
            refreshedAt,
        }

        return NextResponse.json(response)
    } catch (error) {
        return jsonError({
            code: "players_load_failed",
            message: resolveErrorMessage(
                error,
                API_MESSAGES.common.unexpectedError
            ),
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        })
    }
}
