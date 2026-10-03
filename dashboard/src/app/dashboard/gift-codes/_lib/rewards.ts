import {
    GIFT_CODE_REWARD_OPTIONS,
    NUMERIC_GIFT_CODE_REWARD_OPTIONS,
    getGiftCodeRewardOption,
    isNumericGiftCodeRewardType,
    type GiftCodeRewardType,
    type NumericGiftCodeRewardType,
} from "@/constants/gift-code-reward-types"
import type {
    GiftCodeCampaignView,
    GiftCodeRewardInput,
} from "@/services/gift-code.service"

export { GIFT_CODE_REWARD_OPTIONS, NUMERIC_GIFT_CODE_REWARD_OPTIONS }
export type { GiftCodeRewardType }

export type GiftCodeRewardDraft = {
    id: string
    type: GiftCodeRewardType
    amount: string
    itemId: string
    count: string
    itemName: string
    itemIconPath: string
    itemSearch: string
    meta: Record<string, unknown> | null
}

export type GiftCodeFormState = {
    campaignKey: string
    name: string
    description: string
    startsAtDate?: Date
    endsAtDate?: Date
    maxTotalUses: string
    maxUsesPerPlayer: string
    codeMaxUses: string
    generatePrefix: string
    generateCount: string
    generateLength: string
    createdBy: string
    codesText: string
    rewards: GiftCodeRewardDraft[]
}

export function createRewardDraft(
    type: GiftCodeRewardType = "gold"
): GiftCodeRewardDraft {
    return {
        id: createDraftId(),
        type,
        amount: "",
        itemId: "",
        count: "1",
        itemName: "",
        itemIconPath: "",
        itemSearch: "",
        meta: null,
    }
}

export function createDefaultGiftCodeForm(): GiftCodeFormState {
    return {
        campaignKey: "",
        name: "",
        description: "",
        startsAtDate: undefined,
        endsAtDate: undefined,
        maxTotalUses: "0",
        maxUsesPerPlayer: "1",
        codeMaxUses: "1",
        generatePrefix: "",
        generateCount: "",
        generateLength: "8",
        createdBy: "admin-dashboard",
        codesText: "",
        rewards: [
            { ...createRewardDraft("gold"), amount: "500" },
            { ...createRewardDraft("silver"), amount: "100000" },
            { ...createRewardDraft("exp"), amount: "1000" },
        ],
    }
}

export function isNumericRewardType(
    type: string
): type is NumericGiftCodeRewardType {
    return isNumericGiftCodeRewardType(type)
}

export function getRewardOption(type: string) {
    return getGiftCodeRewardOption(type)
}

export function parseInteger(value: string, fallback: number): number {
    const parsed = Number.parseInt(value, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

export function parseCodesInput(raw: string): string[] {
    return Array.from(
        new Set(
            String(raw || "")
                .split(/[\n,;]+/g)
                .map(value => value.trim())
                .filter(Boolean)
        )
    )
}

export function parseDateOrUndefined(value: string): Date | undefined {
    if (!value) return undefined
    const parsed = new Date(value)
    return Number.isNaN(parsed.getTime()) ? undefined : parsed
}

export function asNumberValue(value: unknown, fallback: number): number {
    if (typeof value === "number" && Number.isFinite(value)) return value
    if (typeof value === "string" && value.trim()) {
        const parsed = Number(value)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

export function mapRewardForEdit(
    reward: GiftCodeCampaignView["rewards"][number]
): GiftCodeRewardDraft {
    const payload =
        reward.payload && typeof reward.payload === "object"
            ? { ...reward.payload }
            : null

    if (reward.type === "item") {
        const itemId = asNumberValue(payload?.item_id, 0)
        const count = asNumberValue(payload?.count, reward.amount || 1)
        const itemName =
            typeof payload?.item_name === "string" ? payload.item_name : ""
        const itemIconPath =
            typeof payload?.item_icon_path === "string"
                ? payload.item_icon_path
                : ""

        if (payload) {
            delete payload.item_id
            delete payload.count
            delete payload.item_name
            delete payload.item_icon_path
        }

        return {
            ...createRewardDraft("item"),
            itemId: itemId > 0 ? String(itemId) : "",
            count: String(Math.max(1, count)),
            itemName,
            itemIconPath,
            itemSearch: itemName || (itemId > 0 ? String(itemId) : ""),
            meta: payload && Object.keys(payload).length > 0 ? payload : null,
        }
    }

    if (isNumericRewardType(reward.type)) {
        return {
            ...createRewardDraft(reward.type),
            amount: String(Math.max(0, reward.amount || 0)),
            meta: payload && Object.keys(payload).length > 0 ? payload : null,
        }
    }

    return {
        ...createRewardDraft("gold"),
        type: "gold",
        amount: String(Math.max(0, reward.amount || 0)),
        meta: payload && Object.keys(payload).length > 0 ? payload : null,
    }
}

export function mapCampaignToForm(
    campaign: GiftCodeCampaignView
): GiftCodeFormState {
    const rewards = Array.isArray(campaign.rewards) ? campaign.rewards : []
    const codes = Array.isArray(campaign.codes) ? campaign.codes : []
    const codeMaxUses = codes.length > 0 ? String(codes[0].maxUses) : "1"

    return {
        campaignKey: campaign.campaignKey,
        name: campaign.name,
        description: campaign.description || "",
        startsAtDate: parseDateOrUndefined(campaign.startsAt),
        endsAtDate: parseDateOrUndefined(campaign.endsAt),
        maxTotalUses: String(campaign.maxTotalUses),
        maxUsesPerPlayer: String(campaign.maxUsesPerPlayer),
        codeMaxUses,
        generatePrefix: "",
        generateCount: "",
        generateLength: "8",
        createdBy: campaign.createdBy || "admin-dashboard",
        codesText: codes.map(item => item.code).join("\n"),
        rewards:
            rewards.length > 0
                ? rewards.map(mapRewardForEdit)
                : createDefaultGiftCodeForm().rewards,
    }
}

export function buildRewardInputFromDraft(
    draft: GiftCodeRewardDraft
): GiftCodeRewardInput {
    const meta =
        draft.meta && Object.keys(draft.meta).length > 0
            ? { ...draft.meta }
            : undefined

    if (draft.type === "item") {
        const itemMeta = {
            ...(meta || {}),
            ...(draft.itemName ? { item_name: draft.itemName } : {}),
        }

        return {
            type: "item",
            itemId: parseInteger(draft.itemId, 0),
            count: Math.max(1, parseInteger(draft.count, 1)),
            meta: Object.keys(itemMeta).length > 0 ? itemMeta : undefined,
        }
    }

    return {
        type: draft.type,
        amount: Math.max(0, parseInteger(draft.amount, 0)),
        meta,
    }
}

export function summarizeRewardDraft(draft: GiftCodeRewardDraft): string {
    const option = getRewardOption(draft.type)

    if (draft.type === "item") {
        const itemId = parseInteger(draft.itemId, 0)
        const count = Math.max(1, parseInteger(draft.count, 1))
        const itemTitle =
            draft.itemName.trim() ||
            (itemId > 0 ? `Item #${itemId}` : "No item selected")
        return `${itemTitle} x${count}`
    }

    const amount = Math.max(0, parseInteger(draft.amount, 0))
    return `${option?.label || draft.type}: ${amount.toLocaleString("en-US")}`
}

function createDraftId(): string {
    if (
        typeof globalThis.crypto !== "undefined" &&
        typeof globalThis.crypto.randomUUID === "function"
    ) {
        return globalThis.crypto.randomUUID()
    }
    return `reward-${Date.now()}-${Math.random().toString(16).slice(2, 10)}`
}
