import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { createAdminClient } from "@/lib/supabase/admin"

type EquipSuitDefaultItem = {
    itemId: number
    name: string
    equipPos: number
    requiredLevel: number
}

type EquipSuitDefaultTip = {
    count: number
    talent: number
    effect: number
    name: string
    description: string
}

const DEFAULT_EQUIP_SUIT_DISPLAY_NAME = "Set bonus"

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

function selectDefaultSetItems(
    items: EquipSuitDefaultItem[],
    currentItemId: number
): EquipSuitDefaultItem[] {
    const byEquipPos = new Map<number, EquipSuitDefaultItem[]>()
    for (const item of items) {
        const equipPos = Math.max(0, item.equipPos)
        const bucket = byEquipPos.get(equipPos) || []
        bucket.push(item)
        byEquipPos.set(equipPos, bucket)
    }

    const suffix = ((currentItemId % 100) + 100) % 100
    const selected: EquipSuitDefaultItem[] = []

    for (const equipPos of Array.from(byEquipPos.keys()).sort(
        (left, right) => left - right
    )) {
        const candidates = (byEquipPos.get(equipPos) || []).sort(
            (left, right) => left.itemId - right.itemId
        )
        if (candidates.length === 0) continue
        if (candidates.length === 1) {
            selected.push(candidates[0])
            continue
        }
        const sameVariant = candidates.find(
            c => ((c.itemId % 100) + 100) % 100 === suffix
        )
        selected.push(sameVariant || candidates[0])
    }

    return selected
}

function describeSuitStat(statType: number, value: number): string {
    if (statType <= 0 || value <= 0) return ""
    return `Attribute ${statType} +${value}`
}

function buildSuitTips(
    suit: Record<string, unknown> | null,
    equippedCount: number
): EquipSuitDefaultTip[] {
    if (!suit || equippedCount <= 0) return []

    const segments = [
        describeSuitStat(asInt(suit.suit_prop1), asInt(suit.suit_prop_num1)),
        describeSuitStat(asInt(suit.suit_prop2), asInt(suit.suit_prop_num2)),
        describeSuitStat(asInt(suit.suit_prop3), asInt(suit.suit_prop_num3)),
        describeSuitStat(asInt(suit.suit_prop4), asInt(suit.suit_prop_num4)),
        describeSuitStat(asInt(suit.suit_prop5), asInt(suit.suit_prop_num5)),
    ].filter(Boolean)

    const description = String(
        suit.skill_description || suit.description || ""
    ).trim()
    const mergedDescription = [description, ...segments]
        .filter(Boolean)
        .join(" | ")
    if (!mergedDescription) return []

    return [
        {
            count: equippedCount,
            talent: asInt(suit.id),
            effect: 0,
            name:
                String(suit.name || "").trim() ||
                DEFAULT_EQUIP_SUIT_DISPLAY_NAME,
            description: mergedDescription,
        },
    ]
}

export async function GET(request: NextRequest) {
    const itemId = Math.max(
        0,
        asInt(request.nextUrl.searchParams.get("itemId"))
    )
    const setId = Math.max(0, asInt(request.nextUrl.searchParams.get("setId")))

    if (itemId <= 0 || setId <= 0) {
        return NextResponse.json(
            {
                items: [],
                itemIds: [],
                tips: [],
                name: "",
                hasCompleteDefaults: false,
                message: API_MESSAGES.items.equipSuitDefaultsRequestInvalid,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const supabase = createAdminClient()

        const [setItemsRes, suitRes] = await Promise.all([
            supabase
                .schema("data")
                .from("data_tbl_equipt_template")
                .select("id, name, req_level, position, suit_id")
                .eq("suit_id", setId)
                .order("id", { ascending: true }),
            supabase
                .schema("data")
                .from("data_tbl_equipt_suit")
                .select(
                    "id, name, skill_description, suit_prop1, suit_prop2, suit_prop3, suit_prop4, suit_prop5, suit_prop_num1, suit_prop_num2, suit_prop_num3, suit_prop_num4, suit_prop_num5"
                )
                .eq("id", setId)
                .limit(1)
                .single(),
        ])

        if (setItemsRes.error) throw new Error(setItemsRes.error.message)

        const allSetItems: EquipSuitDefaultItem[] = (
            setItemsRes.data || []
        ).map(row => ({
            itemId: asInt(row.id),
            name: row.name || "",
            equipPos: Math.max(0, asInt(row.position)),
            requiredLevel: asInt(row.req_level),
        }))

        const selectedItems = selectDefaultSetItems(allSetItems, itemId)
        const selectedItemIds = selectedItems.map(item => item.itemId)
        const suit = suitRes.data as Record<string, unknown> | null
        const tips = buildSuitTips(suit, selectedItems.length)
        const name =
            String(suit?.name || "").trim() ||
            (selectedItemIds.length > 0 ? DEFAULT_EQUIP_SUIT_DISPLAY_NAME : "")

        return NextResponse.json({
            setId,
            items: selectedItems,
            itemIds: selectedItemIds,
            tips,
            name,
            hasCompleteDefaults: selectedItemIds.length > 0 && tips.length > 0,
            lastRefresh: new Date().toISOString(),
        })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.items.equipSuitDefaultsLoadFailed
        )
        return NextResponse.json(
            {
                items: [],
                itemIds: [],
                tips: [],
                name: "",
                hasCompleteDefaults: false,
                message,
                lastRefresh: new Date().toISOString(),
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
