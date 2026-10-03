import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type DbRewardRow = {
    reward_id: number
    inc: number
    item_id: number
    quantity: number
    weight: number
    note: string | null
}

type RewardInput = {
    reward_id?: number
    inc?: number
    item_id?: number
    quantity?: number
    weight?: number
    note?: string | null
}

type SaveRewardsRequest = {
    rewards?: RewardInput[]
}

type DeleteRewardRequest = {
    reward_id?: number
}

export const dynamic = "force-dynamic"

const ALLOWED_INC = new Set([1, 2, 4])

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

async function resolveItemNames(
    supabase: ReturnType<typeof createAdminClient>,
    itemIds: number[]
): Promise<Map<number, string>> {
    const map = new Map<number, string>()
    const unique = Array.from(new Set(itemIds.filter(id => id > 0)))
    if (unique.length === 0) return map

    const { data, error } = await supabase
        .from("vw_item_source")
        .select("item_id, name")
        .in("item_id", unique)

    if (error) throw new Error(error.message)

    for (const row of (data || []) as Array<{ item_id: number; name: string }>) {
        map.set(asInt(row.item_id), row.name)
    }
    return map
}

function mapRow(row: DbRewardRow, names: Map<number, string>) {
    const itemId = asInt(row.item_id)
    return {
        rewardId: asInt(row.reward_id),
        inc: asInt(row.inc),
        itemId,
        itemName: names.get(itemId) || `Item #${itemId}`,
        quantity: asInt(row.quantity),
        weight: asInt(row.weight),
        note: row.note ?? null,
    }
}

async function fetchAllRewards(
    supabase: ReturnType<typeof createAdminClient>
) {
    const { data, error } = await supabase
        .schema("data")
        .from("daily_signin_rewards")
        .select("*")
        .order("inc", { ascending: true })
        .order("reward_id", { ascending: true })

    if (error) throw new Error(error.message)

    const rows = (data || []) as DbRewardRow[]
    const names = await resolveItemNames(
        supabase,
        rows.map(r => asInt(r.item_id))
    )
    return rows.map(r => mapRow(r, names))
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.admin.loginRequired },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    try {
        const supabase = createAdminClient()
        const rewards = await fetchAllRewards(supabase)
        return NextResponse.json({ ok: true, rewards })
    } catch (error) {
        return NextResponse.json(
            {
                ok: false,
                message: resolveErrorMessage(
                    error,
                    API_MESSAGES.dailySigninRewards.loadFailed
                ),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

export async function POST(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.admin.loginRequired },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: SaveRewardsRequest
    try {
        payload = (await request.json()) as SaveRewardsRequest
    } catch {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.common.invalidRequestPayload },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    if (!Array.isArray(payload.rewards)) {
        return NextResponse.json(
            {
                ok: false,
                message: API_MESSAGES.dailySigninRewards.invalidPayload,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    type NormalizedReward = {
        reward_id: number
        inc: number
        item_id: number
        quantity: number
        weight: number
        note: string | null
    }

    const normalized: NormalizedReward[] = []
    for (const raw of payload.rewards) {
        const inc = asInt(raw.inc)
        if (!ALLOWED_INC.has(inc)) {
            return NextResponse.json(
                { ok: false, message: API_MESSAGES.dailySigninRewards.invalidInc },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const itemId = asInt(raw.item_id)
        if (itemId <= 0) {
            return NextResponse.json(
                {
                    ok: false,
                    message: API_MESSAGES.dailySigninRewards.invalidItemId,
                },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const quantity = asInt(raw.quantity, 1)
        if (quantity <= 0) {
            return NextResponse.json(
                {
                    ok: false,
                    message: API_MESSAGES.dailySigninRewards.invalidQuantity,
                },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const rewardId = Math.max(0, asInt(raw.reward_id))
        const weight = Math.max(0, asInt(raw.weight, 1))
        const noteRaw = typeof raw.note === "string" ? raw.note.trim() : ""

        normalized.push({
            reward_id: rewardId,
            inc,
            item_id: itemId,
            quantity,
            weight,
            note: noteRaw === "" ? null : noteRaw,
        })
    }

    try {
        const supabase = createAdminClient()

        const { data: existing, error: existingError } = await supabase
            .schema("data")
            .from("daily_signin_rewards")
            .select("reward_id")

        if (existingError) throw new Error(existingError.message)

        const existingIds = new Set(
            ((existing || []) as Array<{ reward_id: number }>).map(r =>
                asInt(r.reward_id)
            )
        )

        let nextId = 1
        for (const id of existingIds) if (id >= nextId) nextId = id + 1

        const keptIds = new Set<number>()
        const upserts: DbRewardRow[] = []
        for (const reward of normalized) {
            const id =
                reward.reward_id > 0 && existingIds.has(reward.reward_id)
                    ? reward.reward_id
                    : nextId++
            keptIds.add(id)
            upserts.push({
                reward_id: id,
                inc: reward.inc,
                item_id: reward.item_id,
                quantity: reward.quantity,
                weight: reward.weight,
                note: reward.note,
            })
        }

        if (upserts.length > 0) {
            const { error: upsertError } = await supabase
                .schema("data")
                .from("daily_signin_rewards")
                .upsert(upserts, { onConflict: "reward_id" })

            if (upsertError) throw new Error(upsertError.message)
        }

        const removedIds = Array.from(existingIds).filter(
            id => !keptIds.has(id)
        )
        if (removedIds.length > 0) {
            const { error: deleteError } = await supabase
                .schema("data")
                .from("daily_signin_rewards")
                .delete()
                .in("reward_id", removedIds)

            if (deleteError) throw new Error(deleteError.message)
        }

        const rewards = await fetchAllRewards(supabase)
        return NextResponse.json({ ok: true, rewards })
    } catch (error) {
        return NextResponse.json(
            {
                ok: false,
                message: resolveErrorMessage(
                    error,
                    API_MESSAGES.dailySigninRewards.saveFailed
                ),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

export async function DELETE(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.admin.loginRequired },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: DeleteRewardRequest
    try {
        payload = (await request.json()) as DeleteRewardRequest
    } catch {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.common.invalidRequestPayload },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const rewardId = asInt(payload.reward_id)
    if (rewardId <= 0) {
        return NextResponse.json(
            {
                ok: false,
                message: API_MESSAGES.dailySigninRewards.invalidRewardId,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const supabase = createAdminClient()
        const { error } = await supabase
            .schema("data")
            .from("daily_signin_rewards")
            .delete()
            .eq("reward_id", rewardId)

        if (error) throw new Error(error.message)

        return NextResponse.json({ ok: true, deletedId: rewardId })
    } catch (error) {
        return NextResponse.json(
            {
                ok: false,
                message: resolveErrorMessage(
                    error,
                    API_MESSAGES.dailySigninRewards.deleteFailed
                ),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
