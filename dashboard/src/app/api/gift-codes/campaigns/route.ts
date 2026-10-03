import { randomBytes } from "crypto"
import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES, API_MESSAGE_BUILDERS } from "@/constants/api-messages"
import {
    getGiftCodeRewardOption,
    isNumericGiftCodeRewardType,
} from "@/constants/gift-code-reward-types"
import { HTTP_STATUS } from "@/constants/http-status"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createClient } from "@/lib/supabase/server"

type GiftCodeGenerateSpec = {
    prefix?: string
    count?: number
    length?: number
}

type GiftCodeRewardInput = {
    type?: string
    amount?: number
    itemId?: number
    count?: number
    meta?: Record<string, unknown> | null
}

type GiftCodeCampaignCreateRequest = {
    campaignKey?: string
    name?: string
    description?: string
    startsAt?: string
    endsAt?: string
    maxTotalUses?: number
    maxUsesPerPlayer?: number
    codeMaxUses?: number
    codes?: string[]
    generate?: GiftCodeGenerateSpec | null
    rewards?: GiftCodeRewardInput[]
    createdBy?: string
}

type GiftCodeCampaignUpdateRequest = GiftCodeCampaignCreateRequest & {
    campaignId?: number | string
}

type GiftCodeCampaignDeleteRequest = {
    campaignId?: number | string
}

type GiftCodeCampaignToggleRequest = {
    campaignId?: number | string
    active?: boolean
    status?: number
}

type GiftCodeCodeView = {
    id: number
    code: string
    status: number
    maxUses: number
    redeemedCount: number
    lastRedeemedAt: string
}

type GiftCodeRewardView = {
    type: string
    amount: number
    payload: Record<string, unknown> | null
    description: string
}

type GiftCodeCampaignView = {
    id: number
    campaignKey: string
    name: string
    description: string
    status: number
    startsAt: string
    endsAt: string
    maxTotalUses: number
    maxUsesPerPlayer: number
    redeemedCount: number
    createdBy: string
    createdAt: string
    updatedAt: string
    codes: GiftCodeCodeView[]
    rewards: GiftCodeRewardView[]
}

type DbCampaignRow = {
    id: number | string
    campaign_key: string
    name: string
    description: string | null
    status: number
    starts_at: Date | string | null
    ends_at: Date | string | null
    max_total_uses: number
    max_uses_per_player: number
    redeemed_count: number
    created_by: string | null
    created_at: Date | string
    updated_at: Date | string
}

type DbCodeRow = {
    id: number | string
    campaign_id: number | string
    code: string
    status: number
    max_uses: number
    redeemed_count: number
    last_redeemed_at: Date | string | null
}

type DbRewardRow = {
    campaign_id: number | string
    reward_type: string
    amount: number
    payload: unknown
}

type CompiledReward = {
    type: string
    amount: number
    payload: Record<string, unknown> | null
    description: string
}

type DbItemTemplateRow = {
    item_id: number | string
    name: string
    icon_id: number | string | null
}

type SupabaseClient = Awaited<ReturnType<typeof createClient>>

const defaultGiftCodeListLimit = 50
const maxGiftCodeListLimit = 200
const defaultGiftCodeMaxUses = 1
const defaultGiftCodeGenLength = 12
const maxGiftCodeGenerateCount = 500

export const dynamic = "force-dynamic"

function asNumber(value: unknown): number {
    if (typeof value === "number" && Number.isFinite(value)) return value
    if (typeof value === "string" && value.trim()) {
        const parsed = Number(value)
        if (Number.isFinite(parsed)) return parsed
    }
    return 0
}

function formatRFC3339(value: Date | string | null | undefined): string {
    if (!value) return ""
    if (value instanceof Date) return value.toISOString()

    const parsed = new Date(value)
    if (Number.isNaN(parsed.getTime())) return ""
    return parsed.toISOString()
}

function normalizeGiftCode(raw: string): string {
    const code = raw.trim().toUpperCase()
    if (code.length < 4 || code.length > 64) {
        throw new Error(API_MESSAGES.giftCodes.giftCodeLengthInvalid)
    }
    if (!/^[A-Z0-9_-]+$/.test(code)) {
        throw new Error(API_MESSAGES.giftCodes.giftCodeCharactersInvalid)
    }
    return code
}

function slugifyGiftCodeCampaignKey(raw: string): string {
    const source = raw.trim().toLowerCase()
    if (!source) return ""

    let out = ""
    let lastDash = false
    for (const char of source) {
        if ((char >= "a" && char <= "z") || (char >= "0" && char <= "9")) {
            out += char
            lastDash = false
            continue
        }

        if (char === "-" || char === "_" || /\s/.test(char)) {
            if (!lastDash && out.length > 0) {
                out += "-"
                lastDash = true
            }
        }
    }

    return out.replace(/^-+|-+$/g, "")
}

function normalizeCampaignKey(
    rawKey: string | undefined,
    fallbackName: string
): string {
    let key = (rawKey || "").trim()
    if (!key) {
        const slug = slugifyGiftCodeCampaignKey(fallbackName) || "giftcode"
        const suffix = new Date()
            .toISOString()
            .replace(/[-:.TZ]/g, "")
            .slice(0, 14)
        key = `${slug}-${suffix}`
    }

    key = key.toLowerCase()
    if (key.length > 64) {
        throw new Error(API_MESSAGES.giftCodes.campaignKeyTooLong)
    }
    if (!/^[a-z0-9_-]+$/.test(key)) {
        throw new Error(API_MESSAGES.giftCodes.campaignKeyCharactersInvalid)
    }
    return key
}

function parseGiftCodeTime(raw: string | undefined): Date | null {
    const trimmed = (raw || "").trim()
    if (!trimmed) return null

    const parsed = new Date(trimmed)
    if (Number.isNaN(parsed.getTime())) {
        throw new Error(API_MESSAGES.giftCodes.timestampInvalid)
    }
    return parsed
}

function cloneMeta(meta: unknown): Record<string, unknown> | null {
    if (!meta || typeof meta !== "object" || Array.isArray(meta)) {
        return null
    }
    return { ...(meta as Record<string, unknown>) }
}

function parseInteger(raw: unknown, fallback: number): number {
    if (typeof raw === "number" && Number.isFinite(raw)) {
        return Math.trunc(raw)
    }
    if (typeof raw === "string" && raw.trim()) {
        const parsed = Number.parseInt(raw, 10)
        if (Number.isFinite(parsed)) {
            return parsed
        }
    }
    return fallback
}

function describeGiftCodeReward(
    rewardType: string,
    amount: number,
    payload: Record<string, unknown> | null
): string {
    if (isNumericGiftCodeRewardType(rewardType)) {
        const option = getGiftCodeRewardOption(rewardType)
        return `${option?.label || rewardType} +${amount.toLocaleString("vi-VN")}`
    }

    switch (rewardType) {
        case "item": {
            const itemID = asNumber(payload?.item_id)
            const count = asNumber(payload?.count) || amount
            const itemName =
                typeof payload?.item_name === "string"
                    ? payload.item_name.trim()
                    : ""
            return `${itemName || `item ${itemID}`} x${count}`
        }
        default:
            return `${rewardType} +${amount}`
    }
}

function compileGiftCodeRewards(
    inputs: GiftCodeRewardInput[] | undefined
): CompiledReward[] {
    const rewardsInput = Array.isArray(inputs) ? inputs : []
    if (rewardsInput.length === 0) {
        throw new Error(API_MESSAGES.giftCodes.rewardsRequired)
    }

    return rewardsInput.map(reward => {
        const rewardType = String(reward.type || "")
            .trim()
            .toLowerCase()
        if (!rewardType) {
            throw new Error(API_MESSAGES.giftCodes.rewardTypeRequired)
        }

        if (isNumericGiftCodeRewardType(rewardType)) {
            const amount = parseInteger(reward.amount, 0)
            if (amount <= 0) {
                throw new Error(
                    API_MESSAGE_BUILDERS.giftCodes.rewardAmountMustBePositive(
                        rewardType
                    )
                )
            }
            const payload = cloneMeta(reward.meta)
            return {
                type: rewardType,
                amount,
                payload,
                description: describeGiftCodeReward(
                    rewardType,
                    amount,
                    payload
                ),
            }
        }

        if (rewardType === "item") {
            const itemID = parseInteger(reward.itemId, 0)
            if (itemID <= 0) {
                throw new Error(API_MESSAGES.giftCodes.itemIDRequired)
            }

            const count = Math.max(1, parseInteger(reward.count, 1))
            const payload = {
                ...(cloneMeta(reward.meta) || {}),
                item_id: itemID,
                count,
            }

            return {
                type: rewardType,
                amount: count,
                payload,
                description: describeGiftCodeReward(rewardType, count, payload),
            }
        }

        throw new Error(
            API_MESSAGE_BUILDERS.giftCodes.unsupportedRewardType(rewardType)
        )
    })
}

function generateGiftCodeValue(prefix: string, randomLen: number): string {
    const alphabet = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
    const length = randomLen > 0 ? randomLen : defaultGiftCodeGenLength
    const bytes = randomBytes(length)

    let code = prefix
    for (const value of bytes) {
        code += alphabet[value % alphabet.length]
    }
    return code
}

function resolveGiftCodeValues(
    explicitCodes: string[],
    generateSpec: GiftCodeGenerateSpec | null | undefined
): string[] {
    const explicit = explicitCodes.filter(
        code => String(code || "").trim() !== ""
    )
    const hasGenerate = Boolean(
        generateSpec && parseInteger(generateSpec.count, 0) > 0
    )

    if (explicit.length > 0 && hasGenerate) {
        throw new Error(API_MESSAGES.giftCodes.codesAndGeneratorConflict)
    }
    if (explicit.length === 0 && !hasGenerate) {
        throw new Error(API_MESSAGES.giftCodes.codesOrGeneratorRequired)
    }

    if (explicit.length > 0) {
        const dedupe = new Set<string>()
        const out: string[] = []
        for (const code of explicit) {
            const normalized = normalizeGiftCode(code)
            if (dedupe.has(normalized)) {
                throw new Error(
                    API_MESSAGE_BUILDERS.giftCodes.duplicateCode(normalized)
                )
            }
            dedupe.add(normalized)
            out.push(normalized)
        }
        return out
    }

    const count = parseInteger(generateSpec?.count, 0)
    if (count <= 0 || count > maxGiftCodeGenerateCount) {
        throw new Error(
            API_MESSAGE_BUILDERS.giftCodes.generateCountOutOfRange(
                maxGiftCodeGenerateCount
            )
        )
    }

    const length = parseInteger(generateSpec?.length, defaultGiftCodeGenLength)
    const prefix = String(generateSpec?.prefix || "")
        .trim()
        .toUpperCase()
    const generated = new Set<string>()

    while (generated.size < count) {
        generated.add(generateGiftCodeValue(prefix, length))
    }

    return Array.from(generated)
}

function parsePayloadObject(raw: unknown): Record<string, unknown> | null {
    if (!raw) return null
    if (typeof raw === "object" && !Array.isArray(raw)) {
        return raw as Record<string, unknown>
    }
    if (typeof raw === "string") {
        try {
            const parsed = JSON.parse(raw)
            if (
                parsed &&
                typeof parsed === "object" &&
                !Array.isArray(parsed)
            ) {
                return parsed as Record<string, unknown>
            }
        } catch {
            return null
        }
    }
    return null
}

async function validateGiftCodeItemRewards(
    supabase: SupabaseClient,
    rewards: CompiledReward[]
): Promise<CompiledReward[]> {
    const itemIDs = Array.from(
        new Set(
            rewards
                .filter(reward => reward.type === "item")
                .map(reward => asNumber(reward.payload?.item_id))
                .filter(itemID => itemID > 0)
        )
    )

    if (itemIDs.length === 0) {
        return rewards
    }

    const { data: templates, error } = await supabase
        .from("item_templates")
        .select("item_id, name, icon_id")
        .in("item_id", itemIDs)

    if (error) {
        throw new Error(error.message)
    }

    const templateMap = new Map<number, DbItemTemplateRow>()
    for (const row of templates || []) {
        templateMap.set(asNumber(row.item_id), row as DbItemTemplateRow)
    }

    for (const itemID of itemIDs) {
        if (!templateMap.has(itemID)) {
            throw new Error(
                API_MESSAGE_BUILDERS.giftCodes.missingItemTemplate(itemID)
            )
        }
    }

    return rewards.map(reward => {
        if (reward.type !== "item") {
            return reward
        }

        const itemID = asNumber(reward.payload?.item_id)
        const template = templateMap.get(itemID)
        if (!template) {
            return reward
        }

        const nextPayload = {
            ...(reward.payload || {}),
            item_id: itemID,
            count: asNumber(reward.payload?.count) || reward.amount,
            item_name: template.name,
        }

        return {
            ...reward,
            payload: nextPayload,
            description: describeGiftCodeReward(
                reward.type,
                reward.amount,
                nextPayload
            ),
        }
    })
}

async function deactivateEndedOrExhaustedCampaigns(
    supabase: SupabaseClient,
    ids: number[]
): Promise<void> {
    if (ids.length === 0) return

    const now = new Date().toISOString()
    await supabase
        .from("giftcode_campaigns")
        .update({ status: 0, updated_at: now })
        .in("id", ids)
        .eq("status", 1)
        .or(
            `ends_at.lt.${now},and(max_total_uses.gt.0,redeemed_count.gte.max_total_uses)`
        )
}

async function listCampaignsByIDs(
    supabase: SupabaseClient,
    ids: number[]
): Promise<GiftCodeCampaignView[]> {
    if (ids.length === 0) {
        return []
    }

    await deactivateEndedOrExhaustedCampaigns(supabase, ids)

    const { data: campaignRows, error: campaignsError } = await supabase
        .from("giftcode_campaigns")
        .select(
            "id, campaign_key, name, description, status, starts_at, ends_at, max_total_uses, max_uses_per_player, redeemed_count, created_by, created_at, updated_at"
        )
        .in("id", ids)
        .order("id", { ascending: false })

    if (campaignsError) {
        throw new Error(campaignsError.message)
    }

    if (!campaignRows || campaignRows.length === 0) {
        return []
    }

    const byCampaignID = new Map<number, GiftCodeCampaignView>()
    const campaignIDs: number[] = []

    for (const row of campaignRows) {
        const campaignID = asNumber(row.id)
        campaignIDs.push(campaignID)
        byCampaignID.set(campaignID, {
            id: campaignID,
            campaignKey: row.campaign_key,
            name: row.name,
            description: row.description || "",
            status: asNumber(row.status),
            startsAt: formatRFC3339(row.starts_at),
            endsAt: formatRFC3339(row.ends_at),
            maxTotalUses: asNumber(row.max_total_uses),
            maxUsesPerPlayer: asNumber(row.max_uses_per_player),
            redeemedCount: asNumber(row.redeemed_count),
            createdBy: row.created_by || "",
            createdAt: formatRFC3339(row.created_at),
            updatedAt: formatRFC3339(row.updated_at),
            codes: [],
            rewards: [],
        })
    }

    const [codesResult, rewardsResult] = await Promise.all([
        supabase
            .from("giftcode_codes")
            .select(
                "id, campaign_id, code, status, max_uses, redeemed_count, last_redeemed_at"
            )
            .in("campaign_id", campaignIDs)
            .order("campaign_id", { ascending: true })
            .order("id", { ascending: true }),
        supabase
            .from("giftcode_rewards")
            .select("campaign_id, sort_order, reward_type, amount, payload")
            .in("campaign_id", campaignIDs)
            .order("campaign_id", { ascending: true })
            .order("sort_order", { ascending: true })
            .order("id", { ascending: true }),
    ])

    if (codesResult.error) {
        throw new Error(codesResult.error.message)
    }
    if (rewardsResult.error) {
        throw new Error(rewardsResult.error.message)
    }

    for (const row of codesResult.data || []) {
        const campaignID = asNumber(row.campaign_id)
        const campaign = byCampaignID.get(campaignID)
        if (!campaign) continue

        campaign.codes.push({
            id: asNumber(row.id),
            code: row.code,
            status: asNumber(row.status),
            maxUses: asNumber(row.max_uses),
            redeemedCount: asNumber(row.redeemed_count),
            lastRedeemedAt: formatRFC3339(row.last_redeemed_at),
        })
    }

    for (const row of rewardsResult.data || []) {
        const campaignID = asNumber(row.campaign_id)
        const campaign = byCampaignID.get(campaignID)
        if (!campaign) continue

        const payload = parsePayloadObject(row.payload)
        campaign.rewards.push({
            type: row.reward_type,
            amount: asNumber(row.amount),
            payload,
            description: describeGiftCodeReward(
                row.reward_type,
                asNumber(row.amount),
                payload
            ),
        })
    }

    return campaignRows
        .map(row => byCampaignID.get(asNumber(row.id)))
        .filter((item): item is GiftCodeCampaignView => Boolean(item))
}

async function listCampaigns(
    supabase: SupabaseClient,
    limit: number
): Promise<GiftCodeCampaignView[]> {
    const requestedLimit = limit <= 0 ? defaultGiftCodeListLimit : limit
    const safeLimit = Math.min(maxGiftCodeListLimit, requestedLimit)

    const { data: idRows, error } = await supabase
        .from("giftcode_campaigns")
        .select("id")
        .order("id", { ascending: false })
        .limit(safeLimit)

    if (error) {
        throw new Error(error.message)
    }

    const ids = (idRows || []).map(row => asNumber(row.id))
    return listCampaignsByIDs(supabase, ids)
}

function mapDatabaseError(error: unknown): {
    status: number
    code: string
    message: string
} {
    if (error instanceof Error) {
        const msg = error.message || ""
        if (
            msg.includes("uq_giftcode_campaigns_key_norm") ||
            (msg.includes("duplicate key") &&
                msg.includes("giftcode_campaigns"))
        ) {
            return {
                status: HTTP_STATUS.CONFLICT,
                code: "campaign_exists",
                message: API_MESSAGES.giftCodes.campaignExists,
            }
        }
        if (
            msg.includes("uq_giftcode_codes_code_norm") ||
            (msg.includes("duplicate key") && msg.includes("giftcode_codes"))
        ) {
            return {
                status: HTTP_STATUS.CONFLICT,
                code: "code_exists",
                message: API_MESSAGES.giftCodes.codeExists,
            }
        }
        return {
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
            code: "internal_error",
            message: error.message,
        }
    }

    return {
        status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        code: "internal_error",
        message: API_MESSAGES.common.unknownErrorLowercase,
    }
}

function isInvalidRequestMessage(message: string): boolean {
    return (
        message.includes("required") ||
        message.includes("invalid") ||
        message.includes("unsupported") ||
        message.includes("duplicate") ||
        message.includes("at least one") ||
        message.includes("must be") ||
        message.includes("cannot modify")
    )
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "admin_auth_required",
                message: "Admin login required",
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    const limitParam = request.nextUrl.searchParams.get("limit")
    const limit = parseInteger(limitParam, defaultGiftCodeListLimit)

    try {
        const supabase = await createClient()
        const items = await listCampaigns(supabase, limit)
        return NextResponse.json({ ok: true, items })
    } catch (error) {
        const mapped = mapDatabaseError(error)
        return NextResponse.json(
            {
                ok: false,
                error_code: mapped.code,
                message: mapped.message,
            },
            { status: mapped.status }
        )
    }
}

export async function PATCH(request: NextRequest) {
    let payload: GiftCodeCampaignToggleRequest
    try {
        payload = (await request.json()) as GiftCodeCampaignToggleRequest
    } catch {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_payload",
                message: API_MESSAGES.common.invalidRequestPayloadLowercase,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const campaignID = parseInteger(payload.campaignId, 0)
    if (campaignID <= 0) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_request",
                message: API_MESSAGES.giftCodes.campaignIDRequired,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    let active: boolean | null = null
    if (typeof payload.active === "boolean") {
        active = payload.active
    } else if (
        typeof payload.status === "number" &&
        Number.isFinite(payload.status)
    ) {
        active = Math.trunc(payload.status) === 1
    }

    if (active === null) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_request",
                message: API_MESSAGES.giftCodes.activeRequired,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const supabase = await createClient()
        const now = new Date().toISOString()
        const nextStatus = active ? 1 : 0

        const { data: updateData, error: updateError } = await supabase
            .from("giftcode_campaigns")
            .update({ status: nextStatus, updated_at: now })
            .eq("id", campaignID)
            .select("id")

        if (updateError) {
            throw new Error(updateError.message)
        }

        if (!updateData || updateData.length === 0) {
            return NextResponse.json(
                {
                    ok: false,
                    error_code: "not_found",
                    message: API_MESSAGES.giftCodes.campaignNotFound,
                },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }

        const campaigns = await listCampaignsByIDs(supabase, [campaignID])
        const campaign = campaigns[0]
        if (!campaign) {
            throw new Error(API_MESSAGES.giftCodes.updatedCampaignNotFound)
        }

        return NextResponse.json({
            ok: true,
            campaign,
        })
    } catch (error) {
        const mapped = mapDatabaseError(error)
        return NextResponse.json(
            {
                ok: false,
                error_code: mapped.code,
                message: mapped.message,
            },
            { status: mapped.status }
        )
    }
}

export async function PUT(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "admin_auth_required",
                message: "Admin login required",
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: GiftCodeCampaignUpdateRequest
    try {
        payload = (await request.json()) as GiftCodeCampaignUpdateRequest
    } catch {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_payload",
                message: API_MESSAGES.common.invalidRequestPayloadLowercase,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const campaignID = parseInteger(payload.campaignId, 0)
    if (campaignID <= 0) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_request",
                message: API_MESSAGES.giftCodes.campaignIDRequired,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const name = String(payload.name || "").trim()
        if (!name) {
            throw new Error(API_MESSAGES.giftCodes.campaignNameRequired)
        }

        const campaignKey = normalizeCampaignKey(payload.campaignKey, name)
        const startsAt = parseGiftCodeTime(payload.startsAt)
        const endsAt = parseGiftCodeTime(payload.endsAt)
        if (startsAt && endsAt && endsAt.getTime() < startsAt.getTime()) {
            throw new Error(API_MESSAGES.giftCodes.endsAtBeforeStartsAt)
        }

        const maxTotalUses = parseInteger(payload.maxTotalUses, 0)
        let maxUsesPerPlayer = parseInteger(payload.maxUsesPerPlayer, 1)
        if (maxUsesPerPlayer === 0) {
            maxUsesPerPlayer = 1
        }
        if (maxUsesPerPlayer < 0 || maxTotalUses < 0) {
            throw new Error(API_MESSAGES.giftCodes.usageLimitsInvalid)
        }

        let codeMaxUses = parseInteger(
            payload.codeMaxUses,
            defaultGiftCodeMaxUses
        )
        if (codeMaxUses === 0) {
            codeMaxUses = defaultGiftCodeMaxUses
        }
        if (codeMaxUses < 0) {
            throw new Error(API_MESSAGES.giftCodes.codeMaxUsesInvalid)
        }

        const compiledRewards = compileGiftCodeRewards(payload.rewards)
        const explicitCodes = Array.isArray(payload.codes) ? payload.codes : []
        const generateCount = parseInteger(payload.generate?.count, 0)
        const shouldReplaceCodes = explicitCodes.length > 0 || generateCount > 0
        const nextCodes = shouldReplaceCodes
            ? resolveGiftCodeValues(explicitCodes, payload.generate)
            : []

        const supabase = await createClient()
        const rewards = await validateGiftCodeItemRewards(
            supabase,
            compiledRewards
        )

        const { data: existingCampaign, error: existingError } = await supabase
            .from("giftcode_campaigns")
            .select("id, redeemed_count")
            .eq("id", campaignID)
            .single()

        if (existingError || !existingCampaign) {
            throw new Error(API_MESSAGES.giftCodes.campaignNotFound)
        }

        const now = new Date().toISOString()
        const createdBy = String(payload.createdBy || "").trim()
        const description = String(payload.description || "").trim()

        const { error: updateError } = await supabase
            .from("giftcode_campaigns")
            .update({
                campaign_key: campaignKey,
                name,
                description,
                starts_at: startsAt ? startsAt.toISOString() : null,
                ends_at: endsAt ? endsAt.toISOString() : null,
                max_total_uses: maxTotalUses,
                max_uses_per_player: maxUsesPerPlayer,
                created_by: createdBy,
                updated_at: now,
            })
            .eq("id", campaignID)

        if (updateError) {
            throw new Error(updateError.message)
        }

        const { error: deleteRewardsError } = await supabase
            .from("giftcode_rewards")
            .delete()
            .eq("campaign_id", campaignID)

        if (deleteRewardsError) {
            throw new Error(deleteRewardsError.message)
        }

        const rewardRows = rewards.map((reward, index) => ({
            campaign_id: campaignID,
            sort_order: index,
            reward_type: reward.type,
            amount: reward.amount,
            payload: reward.payload || {},
            created_at: now,
        }))

        const { error: insertRewardsError } = await supabase
            .from("giftcode_rewards")
            .insert(rewardRows)

        if (insertRewardsError) {
            throw new Error(insertRewardsError.message)
        }

        if (shouldReplaceCodes) {
            const { data: existingCodeRows, error: existingCodesError } =
                await supabase
                    .from("giftcode_codes")
                    .select("redeemed_count")
                    .eq("campaign_id", campaignID)

            if (existingCodesError) {
                throw new Error(existingCodesError.message)
            }

            const hasRedeemedCode = (existingCodeRows || []).some(
                row => asNumber(row.redeemed_count) > 0
            )
            if (
                hasRedeemedCode ||
                asNumber(existingCampaign.redeemed_count) > 0
            ) {
                throw new Error(
                    API_MESSAGES.giftCodes.redeemedCampaignCodesImmutable
                )
            }

            const { error: deleteCodesError } = await supabase
                .from("giftcode_codes")
                .delete()
                .eq("campaign_id", campaignID)

            if (deleteCodesError) {
                throw new Error(deleteCodesError.message)
            }

            const codeRows = nextCodes.map(code => ({
                campaign_id: campaignID,
                code,
                status: 1,
                max_uses: codeMaxUses,
                redeemed_count: 0,
                created_at: now,
                updated_at: now,
                meta: {},
            }))

            const { error: insertCodesError } = await supabase
                .from("giftcode_codes")
                .insert(codeRows)

            if (insertCodesError) {
                throw new Error(insertCodesError.message)
            }
        } else {
            const { data: codesToUpdate, error: codeFetchError } =
                await supabase
                    .from("giftcode_codes")
                    .select("id, redeemed_count")
                    .eq("campaign_id", campaignID)

            if (codeFetchError) {
                throw new Error(codeFetchError.message)
            }

            for (const codeRow of codesToUpdate || []) {
                const effectiveMaxUses = Math.max(
                    asNumber(codeRow.redeemed_count),
                    codeMaxUses
                )
                const { error: codeUpdateError } = await supabase
                    .from("giftcode_codes")
                    .update({ max_uses: effectiveMaxUses, updated_at: now })
                    .eq("id", codeRow.id)

                if (codeUpdateError) {
                    throw new Error(codeUpdateError.message)
                }
            }
        }

        const campaigns = await listCampaignsByIDs(supabase, [campaignID])
        const updatedCampaign = campaigns[0]
        if (!updatedCampaign) {
            throw new Error(API_MESSAGES.giftCodes.updatedCampaignNotFound)
        }

        return NextResponse.json({
            ok: true,
            campaign: updatedCampaign,
        })
    } catch (error) {
        if (error instanceof Error) {
            if (error.message === API_MESSAGES.giftCodes.campaignNotFound) {
                return NextResponse.json(
                    {
                        ok: false,
                        error_code: "not_found",
                        message: error.message,
                    },
                    { status: HTTP_STATUS.NOT_FOUND }
                )
            }

            if (isInvalidRequestMessage(error.message)) {
                return NextResponse.json(
                    {
                        ok: false,
                        error_code: "invalid_request",
                        message: error.message,
                    },
                    { status: HTTP_STATUS.BAD_REQUEST }
                )
            }
        }

        const mapped = mapDatabaseError(error)
        return NextResponse.json(
            {
                ok: false,
                error_code: mapped.code,
                message: mapped.message,
            },
            { status: mapped.status }
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
                message: "Admin login required",
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: GiftCodeCampaignDeleteRequest
    try {
        payload = (await request.json()) as GiftCodeCampaignDeleteRequest
    } catch {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_payload",
                message: API_MESSAGES.common.invalidRequestPayloadLowercase,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    const campaignID = parseInteger(payload.campaignId, 0)
    if (campaignID <= 0) {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_request",
                message: API_MESSAGES.giftCodes.campaignIDRequired,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const supabase = await createClient()

        const { data: existingCampaign, error: existingError } = await supabase
            .from("giftcode_campaigns")
            .select("id, redeemed_count")
            .eq("id", campaignID)
            .single()

        if (existingError || !existingCampaign) {
            throw new Error(API_MESSAGES.giftCodes.campaignNotFound)
        }

        const redeemedCount = asNumber(existingCampaign.redeemed_count)
        if (redeemedCount > 0) {
            throw new Error(
                API_MESSAGES.giftCodes.redeemedCampaignDeleteForbidden
            )
        }

        const { count: redemptionsCount, error: redemptionsError } =
            await supabase
                .from("giftcode_redemptions")
                .select("*", { count: "exact", head: true })
                .eq("campaign_id", campaignID)

        if (redemptionsError) {
            throw new Error(redemptionsError.message)
        }
        if ((redemptionsCount || 0) > 0) {
            throw new Error(
                API_MESSAGES.giftCodes.redeemedCampaignDeleteForbidden
            )
        }

        const { error: deleteError } = await supabase
            .from("giftcode_campaigns")
            .delete()
            .eq("id", campaignID)

        if (deleteError) {
            throw new Error(deleteError.message)
        }

        return NextResponse.json({
            ok: true,
            campaignId: campaignID,
        })
    } catch (error) {
        if (error instanceof Error) {
            if (error.message === API_MESSAGES.giftCodes.campaignNotFound) {
                return NextResponse.json(
                    {
                        ok: false,
                        error_code: "not_found",
                        message: error.message,
                    },
                    { status: HTTP_STATUS.NOT_FOUND }
                )
            }

            if (
                error.message ===
                API_MESSAGES.giftCodes.redeemedCampaignDeleteForbidden
            ) {
                return NextResponse.json(
                    {
                        ok: false,
                        error_code: "conflict",
                        message: error.message,
                    },
                    { status: HTTP_STATUS.CONFLICT }
                )
            }
        }

        const mapped = mapDatabaseError(error)
        return NextResponse.json(
            {
                ok: false,
                error_code: mapped.code,
                message: mapped.message,
            },
            { status: mapped.status }
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
                message: "Admin login required",
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    let payload: GiftCodeCampaignCreateRequest
    try {
        payload = (await request.json()) as GiftCodeCampaignCreateRequest
    } catch {
        return NextResponse.json(
            {
                ok: false,
                error_code: "invalid_payload",
                message: API_MESSAGES.common.invalidRequestPayloadLowercase,
            },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const name = String(payload.name || "").trim()
        if (!name) {
            throw new Error(API_MESSAGES.giftCodes.campaignNameRequired)
        }

        const campaignKey = normalizeCampaignKey(payload.campaignKey, name)
        const startsAt = parseGiftCodeTime(payload.startsAt)
        const endsAt = parseGiftCodeTime(payload.endsAt)
        if (startsAt && endsAt && endsAt.getTime() < startsAt.getTime()) {
            throw new Error(API_MESSAGES.giftCodes.endsAtBeforeStartsAt)
        }

        const maxTotalUses = parseInteger(payload.maxTotalUses, 0)
        let maxUsesPerPlayer = parseInteger(payload.maxUsesPerPlayer, 1)
        if (maxUsesPerPlayer === 0) {
            maxUsesPerPlayer = 1
        }
        if (maxUsesPerPlayer < 0 || maxTotalUses < 0) {
            throw new Error(API_MESSAGES.giftCodes.usageLimitsInvalid)
        }

        let codeMaxUses = parseInteger(
            payload.codeMaxUses,
            defaultGiftCodeMaxUses
        )
        if (codeMaxUses === 0) {
            codeMaxUses = defaultGiftCodeMaxUses
        }
        if (codeMaxUses < 0) {
            throw new Error(API_MESSAGES.giftCodes.codeMaxUsesInvalid)
        }

        const compiledRewards = compileGiftCodeRewards(payload.rewards)
        const codes = resolveGiftCodeValues(
            Array.isArray(payload.codes) ? payload.codes : [],
            payload.generate
        )

        const supabase = await createClient()
        const rewards = await validateGiftCodeItemRewards(
            supabase,
            compiledRewards
        )

        const now = new Date().toISOString()
        const createdBy = String(payload.createdBy || "").trim()
        const description = String(payload.description || "").trim()

        const { data: createdData, error: createError } = await supabase
            .from("giftcode_campaigns")
            .insert({
                campaign_key: campaignKey,
                name,
                description,
                status: 1,
                starts_at: startsAt ? startsAt.toISOString() : null,
                ends_at: endsAt ? endsAt.toISOString() : null,
                max_total_uses: maxTotalUses,
                max_uses_per_player: maxUsesPerPlayer,
                redeemed_count: 0,
                created_by: createdBy,
                created_at: now,
                updated_at: now,
                meta: {},
            })
            .select("id")
            .single()

        if (createError || !createdData) {
            throw new Error(
                createError?.message ||
                    API_MESSAGES.giftCodes.createdCampaignNotFound
            )
        }

        const campaignID = asNumber(createdData.id)
        if (!campaignID) {
            throw new Error(API_MESSAGES.giftCodes.createdCampaignNotFound)
        }

        const rewardRows = rewards.map((reward, index) => ({
            campaign_id: campaignID,
            sort_order: index,
            reward_type: reward.type,
            amount: reward.amount,
            payload: reward.payload || {},
            created_at: now,
        }))

        const { error: insertRewardsError } = await supabase
            .from("giftcode_rewards")
            .insert(rewardRows)

        if (insertRewardsError) {
            throw new Error(insertRewardsError.message)
        }

        const codeRows = codes.map(code => ({
            campaign_id: campaignID,
            code,
            status: 1,
            max_uses: codeMaxUses,
            redeemed_count: 0,
            created_at: now,
            updated_at: now,
            meta: {},
        }))

        const { error: insertCodesError } = await supabase
            .from("giftcode_codes")
            .insert(codeRows)

        if (insertCodesError) {
            throw new Error(insertCodesError.message)
        }

        const campaigns = await listCampaignsByIDs(supabase, [campaignID])
        const createdCampaign = campaigns[0]
        if (!createdCampaign) {
            throw new Error(API_MESSAGES.giftCodes.createdCampaignNotFound)
        }

        return NextResponse.json(
            {
                ok: true,
                campaign: createdCampaign,
            },
            { status: HTTP_STATUS.CREATED }
        )
    } catch (error) {
        if (error instanceof Error) {
            if (isInvalidRequestMessage(error.message)) {
                return NextResponse.json(
                    {
                        ok: false,
                        error_code: "invalid_request",
                        message: error.message,
                    },
                    { status: HTTP_STATUS.BAD_REQUEST }
                )
            }
        }

        const mapped = mapDatabaseError(error)
        return NextResponse.json(
            {
                ok: false,
                error_code: mapped.code,
                message: mapped.message,
            },
            { status: mapped.status }
        )
    }
}
