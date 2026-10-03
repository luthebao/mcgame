import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import {
    boxItemAwardAllowsPersistedZeroAwardId,
    boxItemAwardFallbackName,
    boxItemAwardUsesFixedCount,
    boxItemAwardSupportsPreNameType,
    boxItemAwardSupportsQuality,
    boxItemAwardTypeName,
    normalizeBoxItemAwardPayload,
    normalizeBoxItemAwardPreNameType,
    normalizeBoxItemAwardQuality,
    normalizeBoxItemAwardType,
} from "@/lib/box-item-awards"
import { resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type DbAwardRow = {
    id: number
    item_id: number
    award_id: number
    type: number
    count: number
    rate: number
    quality: number
    pre_name_type: number
    payload: unknown
}

type AwardInput = {
    id?: number
    awardId?: number
    type?: number
    count?: number
    rate?: number
    quality?: number
    preNameType?: number
    payload?: unknown
}

type SaveAwardsRequest = {
    itemId?: number
    awards?: AwardInput[]
}

type DeleteAwardRequest = {
    id?: number
}

export const dynamic = "force-dynamic"

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function awardKey(type: number, awardId: number): string {
    return `${normalizeBoxItemAwardType(type)}:${awardId}`
}

function canPersistAward(type: number, awardId: number): boolean {
    const normalizedType = normalizeBoxItemAwardType(type)
    if (boxItemAwardAllowsPersistedZeroAwardId(normalizedType)) {
        return normalizedType === 31 || (awardId >= 0 && awardId <= 2)
    }
    return awardId > 0
}

function mapAwardRow(row: DbAwardRow, nameMap: Map<string, string>) {
    const aid = asInt(row.award_id)
    const aType = normalizeBoxItemAwardType(asInt(row.type))
    return {
        id: asInt(row.id),
        itemId: asInt(row.item_id),
        awardId: aid,
        awardName:
            nameMap.get(awardKey(aType, aid)) ||
            boxItemAwardFallbackName(aType, aid),
        type: aType,
        typeName: boxItemAwardTypeName(aType),
        count: asInt(row.count),
        rate: asInt(row.rate),
        quality: boxItemAwardSupportsQuality(aType) ? asInt(row.quality) : 0,
        preNameType: boxItemAwardSupportsPreNameType(aType)
            ? asInt(row.pre_name_type)
            : 0,
        payload: normalizeBoxItemAwardPayload(row.payload),
    }
}

async function resolveAwardNames(
    supabase: ReturnType<typeof createAdminClient>,
    awards: Array<{ award_id: number; type: number }>
) {
    const nameMap = new Map<string, string>()
    if (awards.length === 0) return nameMap

    const itemIDs: number[] = []
    const equipmentIDs: number[] = []
    const petIDs: number[] = []
    const buffIDs: number[] = []
    const titleIDs: number[] = []
    const skillIDs: number[] = []

    for (const award of awards) {
        const awardId = asInt(award.award_id)
        const awardType = normalizeBoxItemAwardType(asInt(award.type))

        if (!canPersistAward(awardType, awardId) || awardId <= 0) continue

        switch (awardType) {
            case 12:
                petIDs.push(awardId)
                break
            case 19:
                equipmentIDs.push(awardId)
                break
            case 32:
                buffIDs.push(awardId)
                break
            case 33:
                titleIDs.push(awardId)
                break
            case 34:
                skillIDs.push(awardId)
                break
            case 29:
                itemIDs.push(awardId)
                break
            default:
                break
        }
    }

    const uniqueItemIDs = Array.from(new Set(itemIDs))
    const uniqueEquipmentIDs = Array.from(new Set(equipmentIDs))
    const uniquePetIDs = Array.from(new Set(petIDs))
    const uniqueBuffIDs = Array.from(new Set(buffIDs))
    const uniqueTitleIDs = Array.from(new Set(titleIDs))
    const uniqueSkillIDs = Array.from(new Set(skillIDs))

    const [
        itemResult,
        equipmentResult,
        petResult,
        buffResult,
        titleResult,
        skillResult,
    ] = await Promise.all([
        uniqueItemIDs.length > 0
            ? supabase
                  .from("vw_item_source")
                  .select("item_id, name")
                  .eq("template_table_id", 29)
                  .in("item_id", uniqueItemIDs)
            : Promise.resolve({ data: null, error: null }),
        uniqueEquipmentIDs.length > 0
            ? supabase
                  .from("vw_item_source")
                  .select("item_id, name")
                  .eq("template_table_id", 19)
                  .in("item_id", uniqueEquipmentIDs)
            : Promise.resolve({ data: null, error: null }),
        uniquePetIDs.length > 0
            ? supabase
                  .schema("data")
                  .from("data_tbl_creature")
                  .select("id, name")
                  .in("id", uniquePetIDs)
            : Promise.resolve({ data: null, error: null }),
        uniqueBuffIDs.length > 0
            ? supabase
                  .schema("data")
                  .from("data_tbl_buff")
                  .select("id, name")
                  .in("id", uniqueBuffIDs)
            : Promise.resolve({ data: null, error: null }),
        uniqueTitleIDs.length > 0
            ? supabase
                  .schema("data")
                  .from("data_tbl_title")
                  .select("id, n")
                  .in("id", uniqueTitleIDs)
            : Promise.resolve({ data: null, error: null }),
        uniqueSkillIDs.length > 0
            ? supabase
                  .schema("data")
                  .from("data_tbl_skill")
                  .select("id, name")
                  .in("id", uniqueSkillIDs)
            : Promise.resolve({ data: null, error: null }),
    ])

    if (itemResult.error) throw new Error(itemResult.error.message)
    if (equipmentResult.error) throw new Error(equipmentResult.error.message)
    if (petResult.error) throw new Error(petResult.error.message)
    if (buffResult.error) throw new Error(buffResult.error.message)
    if (titleResult.error) throw new Error(titleResult.error.message)
    if (skillResult.error) throw new Error(skillResult.error.message)

    for (const row of (itemResult.data || []) as Array<{
        item_id: number
        name: string
    }>) {
        nameMap.set(awardKey(29, asInt(row.item_id)), row.name)
    }
    for (const row of (equipmentResult.data || []) as Array<{
        item_id: number
        name: string
    }>) {
        nameMap.set(awardKey(19, asInt(row.item_id)), row.name)
    }
    for (const row of (petResult.data || []) as Array<{
        id: number
        name: string
    }>) {
        nameMap.set(awardKey(12, asInt(row.id)), row.name)
    }
    for (const row of (buffResult.data || []) as Array<{
        id: number
        name: string
    }>) {
        nameMap.set(awardKey(32, asInt(row.id)), row.name)
    }
    for (const row of (titleResult.data || []) as Array<{
        id: number
        n: string
    }>) {
        nameMap.set(awardKey(33, asInt(row.id)), row.n)
    }
    for (const row of (skillResult.data || []) as Array<{
        id: number
        name: string
    }>) {
        nameMap.set(awardKey(34, asInt(row.id)), row.name)
    }

    return nameMap
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "admin_auth_required",
                message: API_MESSAGES.admin.loginRequired,
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    try {
        const itemId = asInt(request.nextUrl.searchParams.get("itemId"))
        if (itemId <= 0) {
            return NextResponse.json(
                { ok: false, message: API_MESSAGES.boxItems.invalidItemId },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const admin = createAdminClient()
        const { data: rows, error } = await admin
            .schema("data")
            .from("data_tbl_item_award")
            .select("*")
            .eq("item_id", itemId)
            .order("id", { ascending: true })

        if (error) throw new Error(error.message)

        const awardRows = (rows || []) as DbAwardRow[]
        const nameMap = await resolveAwardNames(admin, awardRows)
        const awards = awardRows.map(r => mapAwardRow(r, nameMap))

        return NextResponse.json({ ok: true, awards })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.boxItems.awardsLoadFailed
        )
        return NextResponse.json(
            { ok: false, message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

export async function POST(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "admin_auth_required",
                message: API_MESSAGES.admin.loginRequired,
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: SaveAwardsRequest
    try {
        payload = (await request.json()) as SaveAwardsRequest
    } catch {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.common.invalidRequestPayload },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const itemId = asInt(payload.itemId)
        if (itemId <= 0) {
            return NextResponse.json(
                { ok: false, message: API_MESSAGES.boxItems.invalidItemId },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const awards = payload.awards
        if (!Array.isArray(awards)) {
            return NextResponse.json(
                { ok: false, message: API_MESSAGES.boxItems.invalidAwardData },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const admin = createAdminClient()

        const { data: maxRow } = await admin
            .schema("data")
            .from("data_tbl_item_award")
            .select("id")
            .order("id", { ascending: false })
            .limit(1)
            .single()

        let nextId = asInt(maxRow?.id) + 1

        for (const award of awards) {
            const awardType = normalizeBoxItemAwardType(asInt(award.type, 29))
            const awardId =
                awardType === 31
                    ? 0
                    : boxItemAwardAllowsPersistedZeroAwardId(awardType)
                      ? asInt(award.awardId)
                      : Math.max(0, asInt(award.awardId))

            if (!canPersistAward(awardType, awardId)) {
                return NextResponse.json(
                    {
                        ok: false,
                        message: API_MESSAGES.boxItems.invalidAwardData,
                    },
                    { status: HTTP_STATUS.BAD_REQUEST }
                )
            }

            const existingId = asInt(award.id)
            const row = {
                id: existingId > 0 ? existingId : nextId++,
                item_id: itemId,
                award_id: awardId,
                type: awardType,
                count: boxItemAwardUsesFixedCount(awardType)
                    ? 1
                    : Math.max(1, asInt(award.count, 1)),
                rate: Math.max(0, asInt(award.rate, 100)),
                quality: boxItemAwardSupportsQuality(awardType)
                    ? normalizeBoxItemAwardQuality(award.quality)
                    : 0,
                pre_name_type: boxItemAwardSupportsPreNameType(awardType)
                    ? normalizeBoxItemAwardPreNameType(award.preNameType)
                    : 0,
                payload: normalizeBoxItemAwardPayload(award.payload),
            }

            const { error } = await admin
                .schema("data")
                .from("data_tbl_item_award")
                .upsert(row, { onConflict: "id" })

            if (error) throw new Error(error.message)
        }

        const { data: updatedRows, error: fetchError } = await admin
            .schema("data")
            .from("data_tbl_item_award")
            .select("*")
            .eq("item_id", itemId)
            .order("id", { ascending: true })

        if (fetchError) throw new Error(fetchError.message)

        const awardRows = (updatedRows || []) as DbAwardRow[]
        const nameMap = await resolveAwardNames(admin, awardRows)

        return NextResponse.json({
            ok: true,
            awards: awardRows.map(r => mapAwardRow(r, nameMap)),
        })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.boxItems.awardSaveFailed
        )
        return NextResponse.json(
            { ok: false, message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}

export async function DELETE(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "admin_auth_required",
                message: API_MESSAGES.admin.loginRequired,
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: DeleteAwardRequest
    try {
        payload = (await request.json()) as DeleteAwardRequest
    } catch {
        return NextResponse.json(
            { ok: false, message: API_MESSAGES.common.invalidRequestPayload },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const id = asInt(payload.id)
        if (id <= 0) {
            return NextResponse.json(
                { ok: false, message: API_MESSAGES.boxItems.invalidAwardId },
                { status: HTTP_STATUS.BAD_REQUEST }
            )
        }

        const admin = createAdminClient()
        const { error } = await admin
            .schema("data")
            .from("data_tbl_item_award")
            .delete()
            .eq("id", id)

        if (error) throw new Error(error.message)

        return NextResponse.json({ ok: true, deletedId: id })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.boxItems.awardDeleteFailed
        )
        return NextResponse.json(
            { ok: false, message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
