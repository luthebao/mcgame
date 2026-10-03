"use client"

import type { GemOption, ItemBrowserRow } from "@/services/item.service"

export type ItemQueryState = {
    search: string
    kind: string
    templateType: string
    sortBy:
        | "item_id"
        | "name"
        | "item_type"
        | "icon_id"
        | "required_level"
        | "max_stack"
        | "template_type"
        | "use_type"
        | "kind"
        | "bind_type"
        | "template_level"
    sortDir: "asc" | "desc"
    page: number
    pageSize: number
}

export type EditablePropSlot = "main1" | "main2" | "prop1" | "prop2" | "active"

export type EditablePropLine = {
    slot: EditablePropSlot
    label: string
    type: string
    value: string
}

type LabelOption = {
    value: number
    label: string
}

export type QilingDraftLine = {
    slot: 0 | 1 | 2
    type: string
    value: string
    max: string
}

export const DEFAULT_ITEMS_QUERY: ItemQueryState = {
    search: "",
    kind: "all",
    templateType: "all",
    sortBy: "item_id",
    sortDir: "asc",
    page: 1,
    pageSize: 20,
}

export const PAGE_SIZE_OPTIONS = [20, 30, 60, 100, 200]

const DEFAULT_QUALITY_OPTIONS = [0, 5, 8, 12, 15, 20]

export const QUALITY_LABELS: Record<number, string> = {
    0: "Common",
    5: "C",
    8: "B",
    12: "A",
    15: "S",
    20: "SSS",
}

export const ITEM_KIND_LABELS: Record<number, string> = {
    1: "Vũ khí",
    2: "Trợ thủ",
    3: "Trang bị",
    4: "Trang sức",
    5: "Vật phẩm",
    6: "Nguyên liệu",
    7: "Pet",
    8: "Thần khí",
    9: "Trang bị pet",
    10: "Phi hành",
    11: "Thời trang",
    12: "Dụng cụ",
    13: "Cánh",
    14: "Lông Vũ",
}

export const ITEM_TYPE_LABELS: Record<number, string> = {
    100: "Chùy",
    101: "Trượng",
    102: "Súng",
    103: "Kiếm",
    104: "Cầm",
    105: "Bổng",
    200: "Thuẫn",
    201: "Sách",
    202: "Hộ uyển",
    203: "Chủy thủ",
    204: "Cầm cung",
    205: "Găng tay",
    300: "Mũ",
    301: "Áo",
    302: "Quần",
    303: "Đai",
    304: "Giày",
    305: "Hộ vai",
    400: "Dây chuyền",
    401: "Nhẫn",
    402: "Trang sức 1",
    403: "Trang sức 2",
    500: "Sách cuộn",
    501: "Thuốc",
    502: "Thức ăn",
    503: "Bảo thạch",
    504: "Thăng tinh thạch",
    505: "Sách kỹ năng",
    506: "Yếu quyết",
    507: "Vật liệu luyện hóa",
    508: "Vật phẩm nhiệm vụ",
    509: "Chìa khóa",
    510: "Thâm Lam Tinh",
    511: "Thâm Hồng Tinh",
    512: "Thăng cấp trang bị pet",
    513: "Sửa trang bị pet",
    514: "Hoán Thần Thạch",
    515: "Ngư cụ",
    516: "Công thức tạo",
    517: "Túi tiện dụng",
    518: "Cường Hóa Cánh",
    519: "MW Prop Reset",
    520: "Target Item",
    521: "Bí Kíp Tinh Linh",
    522: "MW Stage Eight",
    523: "Thăng Hoa",
    524: "Phong Ấn",
    527: "Kỳ Lân Các",
    550: "Khác",
    551: "Thêm Sao",
    552: "Tốc Độ Sao",
    600: "Kim cương",
    601: "Kim loại",
    602: "Gỗ",
    603: "Ngọc",
    604: "Vải",
    605: "Da",
    610: "Cá",
    611: "Nông sản",
    612: "Dược thảo",
    700: "Hệ người",
    701: "Hệ dã thú",
    702: "Hệ thực vật",
    703: "Hệ máy",
    704: "Hệ ác ma",
    705: "Hệ rồng",
    800: "Thần khí chính",
    801: "Thần khí phụ",
    900: "Sừng",
    901: "Vòng",
    902: "Chuông",
    903: "Cánh",
    904: "Giáp",
    905: "Vai",
    906: "Thuộc tính I",
    907: "Thuộc tính II",
    1000: "Phi hành",
    1100: "Thời trang",
    1200: "Găng thu thập",
    1201: "Cần câu",
    1300: "Cánh",
    1400: "Công thức dung hợp Lông Vũ",
    1401: "Lông vũ loại A",
    1402: "Lông vũ loại B",
    1403: "Lông vũ loại C",
    1404: "Lông vũ loại D",
}

export const KIND_TO_TYPES: Record<number, number[]> = {
    1: [100, 101, 102, 103, 104, 105],
    2: [200, 201, 202, 203, 204, 205],
    3: [300, 301, 302, 303, 304, 305],
    4: [400, 401, 402, 403],
    5: [500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 527, 550, 551, 552],
    6: [600, 601, 602, 603, 604, 605, 610, 611, 612],
    7: [700, 701, 702, 703, 704, 705],
    8: [800, 801],
    9: [900, 901, 902, 903, 904, 905, 906, 907],
    10: [1000],
    11: [1100],
    12: [1200, 1201],
    13: [1300],
    14: [1400, 1401, 1402, 1403, 1404],
}

export function getTypesForKind(kind: number): number[] {
    return KIND_TO_TYPES[kind] || []
}

export const USE_TYPE_LABELS: Record<number, string> = {
    0: "Mặc định",
    1: "Hỗ trợ",
    2: "Kỹ năng",
    3: "Hồi phục",
    4: "Nguyên liệu",
}

export const BIND_TYPE_LABELS: Record<number, string> = {
    0: "Tự do",
    1: "Khóa khi nhặt",
    2: "Khóa khi trang bị",
}

export const KIND_LABELS: Record<number, string> = {
    1: "Vũ khí",
    2: "Trợ thủ",
    3: "Trang bị",
    4: "Trang sức",
    5: "Vật phẩm",
    6: "Nguyên liệu",
    7: "Pet",
    8: "Thần khí",
    9: "Trang bị pet",
    10: "Phi hành",
    11: "Thời trang",
    12: "Dụng cụ",
    13: "Cánh",
    14: "Lông Vũ",
}

export const PROP_TYPE_OPTIONS: LabelOption[] = [
    { value: 1, label: "Max HP" },
    { value: 2, label: "Max MP" },
    { value: 3, label: "Energy" },
    { value: 4, label: "Phys ATK" },
    { value: 5, label: "Magic ATK" },
    { value: 6, label: "Phys DEF" },
    { value: 7, label: "Magic DEF" },
    { value: 8, label: "Accuracy" },
    { value: 9, label: "Evasion" },
    { value: 10, label: "Counter" },
    { value: 11, label: "Speed" },
    { value: 12, label: "Combo" },
    { value: 13, label: "Critical" },
    { value: 14, label: "Armor Pen" },
    { value: 20, label: "STR" },
    { value: 21, label: "AGI" },
    { value: 22, label: "INT" },
    { value: 23, label: "STA" },
    { value: 24, label: "Max HP (%)" },
    { value: 25, label: "Max MP (%)" },
    { value: 26, label: "Revival Rate" },
    { value: 27, label: "Crit Resist" },
    { value: 28, label: "Debuff Resist" },
    { value: 29, label: "Pen Resist" },
]

export const ACTIVE_PROP_OPTIONS: LabelOption[] = [
    { value: 1, label: "Phys ATK" },
    { value: 2, label: "Magic ATK" },
    { value: 3, label: "Critical" },
    { value: 4, label: "Armor Pen" },
    { value: 5, label: "Phys DMG Reduction" },
    { value: 6, label: "Magic DMG Reduction" },
    { value: 7, label: "DMG Reduction" },
    { value: 8, label: "HP Boost" },
]

export const ELEMENT_OPTIONS: LabelOption[] = [
    { value: 0, label: "None" },
    { value: 1, label: "Light" },
    { value: 2, label: "Dark" },
    { value: 3, label: "Wind" },
    { value: 4, label: "Earth" },
    { value: 5, label: "Water" },
    { value: 6, label: "Fire" },
]

export const QILING_PROP_OPTIONS: LabelOption[] = [
    { value: 1, label: "Max HP" },
    { value: 2, label: "Max MP" },
    { value: 4, label: "Phys ATK" },
    { value: 5, label: "Magic ATK" },
    { value: 6, label: "Phys DEF" },
    { value: 7, label: "Magic DEF" },
    { value: 8, label: "Accuracy" },
    { value: 9, label: "Evasion" },
    { value: 10, label: "Counter" },
    { value: 11, label: "Speed" },
    { value: 12, label: "Combo" },
    { value: 13, label: "Critical" },
    { value: 14, label: "Armor Pen" },
    { value: 31, label: "Crit Resist" },
    { value: 32, label: "Debuff Accuracy" },
    { value: 34, label: "Immunity" },
    { value: 58, label: "Debuff Resist" },
    { value: 59, label: "Final Phys DMG Red" },
    { value: 60, label: "Final Magic DMG Red" },
    { value: 61, label: "Pen Resist" },
    { value: 62, label: "Final Phys DMG Boost" },
    { value: 63, label: "Final Magic DMG Boost" },
    { value: 71, label: "Crit Rate" },
    { value: 72, label: "Crit Break" },
]

export const PRE_NAME_TYPE_OPTIONS: LabelOption[] = [
    { value: 0, label: "None" },
    { value: 1, label: "Normal" },
    { value: 2, label: "Enhanced" },
    { value: 3, label: "Exquisite" },
    { value: 4, label: "Perfect" },
    { value: 5, label: "Excellent" },
]

const QILING_PROP_SUFFIX: Record<number, 1 | 2 | 3> = {
    1: 1,
    2: 1,
    4: 1,
    5: 1,
    6: 1,
    7: 1,
    8: 2,
    9: 2,
    10: 2,
    11: 1,
    13: 2,
    14: 2,
    31: 2,
    32: 2,
    34: 2,
    58: 2,
    59: 3,
    60: 3,
    61: 2,
    62: 3,
    63: 3,
    71: 2,
    72: 2,
}

const QILING_QUALITY_STEPS = [
    { minRatio: 1, label: "Orange", color: "#FA5B05" },
    { minRatio: 0.41, label: "Purple", color: "#FF33FF" },
    { minRatio: 0.24, label: "Blue", color: "#0066FF" },
    { minRatio: 0.11, label: "Green", color: "#00FF00" },
    { minRatio: 0, label: "White", color: "#FFFFFF" },
] as const

export const PROP_SLOT_LABELS: Record<EditablePropSlot, string> = {
    main1: "Main line 1",
    main2: "Main line 2",
    prop1: "Sub line 1",
    prop2: "Sub line 2",
    active: "Soul",
}

export function parseCSVIntegers(raw: string): number[] {
    const tokens = String(raw || "")
        .split(/[,\n;]+/g)
        .map(value => value.trim())
        .filter(Boolean)

    const out: number[] = []
    for (const token of tokens) {
        const parsed = Number.parseInt(token, 10)
        if (!Number.isFinite(parsed) || parsed <= 0) {
            throw new Error(`Invalid positive integer value: ${token}`)
        }
        out.push(parsed)
    }
    return out
}

function buildPropLine(
    slot: EditablePropSlot,
    type = 0,
    value = 0
): EditablePropLine {
    return {
        slot,
        label: PROP_SLOT_LABELS[slot],
        type: String(type),
        value: String(value),
    }
}

export function getItemTypeLabel(itemType: number): string {
    return ITEM_TYPE_LABELS[itemType] || `Type ${itemType}`
}

export function getUseTypeLabel(useType: number): string {
    return USE_TYPE_LABELS[useType] || `Use ${useType}`
}

export function getBindTypeLabel(bindType: number): string {
    return BIND_TYPE_LABELS[bindType] || `Bind ${bindType}`
}

export function getTradableLabel(tradable: number): string {
    return tradable > 0 ? "Được giao dịch" : "Không giao dịch"
}

export function getKindLabel(kind: number): string {
    return KIND_LABELS[kind] || ITEM_KIND_LABELS[kind] || `Kind ${kind}`
}

export function getTemplateTypeLabel(templateType: number): string {
    return ITEM_TYPE_LABELS[templateType] || `Type ${templateType}`
}

export function getTemplateTableLabel(
    tableID: number,
    tableName: string
): string {
    if (tableID === 19 || tableName === "equipt_template") {
        return "Equipt"
    }
    if (tableID === 29 || tableName === "item_template") {
        return "Item"
    }
    return tableName || `Table ${tableID}`
}

export function getPropTypeLabel(propType: number): string {
    return (
        PROP_TYPE_OPTIONS.find(option => option.value === propType)?.label ||
        `Attribute #${propType}`
    )
}

export function getActivePropLabel(propType: number): string {
    return (
        ACTIVE_PROP_OPTIONS.find(option => option.value === propType)?.label ||
        `Soul #${propType}`
    )
}

export function getElementLabel(element: number): string {
    return (
        ELEMENT_OPTIONS.find(option => option.value === element)?.label ||
        `Element ${element}`
    )
}

export function getQilingPropLabel(propType: number): string {
    return (
        QILING_PROP_OPTIONS.find(option => option.value === propType)?.label ||
        `Qiling #${propType}`
    )
}

export function getPreNameTypeLabel(preNameType: number): string {
    return (
        PRE_NAME_TYPE_OPTIONS.find(option => option.value === preNameType)
            ?.label || `Prefix ${preNameType}`
    )
}

export function getPropOptionsForSlot(slot: EditablePropSlot): LabelOption[] {
    if (slot === "active") {
        return ACTIVE_PROP_OPTIONS
    }
    return PROP_TYPE_OPTIONS
}

export function buildDefaultQilingLines(): QilingDraftLine[] {
    return [0, 1, 2].map(slot => ({
        slot: slot as 0 | 1 | 2,
        type: "0",
        value: "0",
        max: "0",
    }))
}

export function buildDefaultPetStoneSlots(): boolean[] {
    return Array.from({ length: 6 }, () => false)
}

function parseDecimalInput(raw: string): number {
    const value = String(raw || "").trim()
    if (!value) {
        return 0
    }

    const parsed = Number.parseFloat(value)
    if (!Number.isFinite(parsed) || parsed < 0) {
        return 0
    }

    return parsed
}

function formatLooseNumber(value: number): string {
    if (!Number.isFinite(value)) {
        return "0"
    }

    if (Number.isInteger(value)) {
        return String(value)
    }

    return String(Number(value.toFixed(6)))
}

export function serializeSublimationFlag(input: {
    sublimeId: string
    sublimeElement: string
    sublimeAdd: string
}): string {
    const sublimeId = parseNonNegativeInteger(input.sublimeId, 0)
    const sublimeElement = parseNonNegativeInteger(input.sublimeElement, 0)
    const sublimeAdd = parseDecimalInput(input.sublimeAdd)

    if (sublimeId <= 0 && sublimeElement <= 0 && sublimeAdd <= 0) {
        return ""
    }

    return `{sublimeElement:${sublimeElement},sublimeAdd:${formatLooseNumber(sublimeAdd)},sublimeId:${sublimeId}}`
}

export function serializeQilingFlag(lines: QilingDraftLine[]): string {
    const entries: string[] = []

    for (let index = 0; index < lines.length; index += 1) {
        const line = lines[index]
        const type = parseNonNegativeInteger(line.type, 0)
        const value = parseDecimalInput(line.value)
        const max = parseDecimalInput(line.max)

        if (type <= 0 || max <= 0) {
            continue
        }

        entries.push(
            `${index}:{t:${type},v:${formatLooseNumber(value)},max:${formatLooseNumber(max)}}`
        )
    }

    return entries.length > 0 ? `{${entries.join(",")}}` : ""
}

export function serializePetStoneFlag(
    petStoneSlots: boolean[],
    petStoneSkillId: string
): string {
    const skillId = parseNonNegativeInteger(petStoneSkillId, 0)
    const normalizedSlots = Array.from({ length: 6 }, (_, index) =>
        Boolean(petStoneSlots[index])
    )

    if (skillId > 0) {
        normalizedSlots[0] = true
    }

    const entries: string[] = []
    for (let index = 0; index < normalizedSlots.length; index += 1) {
        if (!normalizedSlots[index]) {
            continue
        }

        const slot = index + 1
        if (slot === 1 && skillId > 0) {
            entries.push(`${slot}:[1,1,${skillId}]`)
            continue
        }

        entries.push(`${slot}:[1]`)
    }

    return entries.length > 0 ? `{${entries.join(",")}}` : ""
}

export function formatQilingValue(propType: number, rawValue: number): string {
    const suffix = QILING_PROP_SUFFIX[propType]

    if (suffix === 1) {
        return String(Math.ceil(rawValue))
    }

    if (suffix === 2) {
        return Number(rawValue).toFixed(3)
    }

    if (suffix === 3) {
        return `${Number(rawValue * 100).toFixed(3)}%`
    }

    return String(Math.ceil(rawValue))
}

export function getQilingTierMeta(
    value: number,
    max: number
): { label: string; color: string } {
    if (!Number.isFinite(value) || !Number.isFinite(max) || max <= 0) {
        return {
            label: "White",
            color: "#FFFFFF",
        }
    }

    const ratio = value / max
    const tier =
        QILING_QUALITY_STEPS.find(step => ratio >= step.minRatio) ||
        QILING_QUALITY_STEPS[QILING_QUALITY_STEPS.length - 1]

    return {
        label: tier.label,
        color: tier.color,
    }
}

export function isMagicWeaponPosition(position: number): boolean {
    return position >= 15 && position <= 20
}

export function getGemOptionLabel(gem: GemOption): string {
    return `${gem.name} (#${gem.itemId}) | Lv ${gem.gemLevel} | ${getPropTypeLabel(gem.statType)} +${gem.value}`
}

export function getQualityLabel(value: number): string {
    return QUALITY_LABELS[value] || `+${value}`
}

function normalizeQualityOptions(values: number[]): number[] {
    const set = new Set<number>()
    for (const value of values) {
        if (Number.isFinite(value) && value >= 0) {
            set.add(Math.trunc(value))
        }
    }

    return Array.from(set).sort((left, right) => left - right)
}

export function getItemQualityOptions(item: ItemBrowserRow | null): number[] {
    if (!item || item.itemType !== 1) {
        return [0]
    }

    const values =
        item.meta.randomQuality.length > 0
            ? item.meta.randomQuality
            : DEFAULT_QUALITY_OPTIONS
    return normalizeQualityOptions(values)
}

export function getDefaultQualityValue(item: ItemBrowserRow | null): string {
    const qualityOptions = getItemQualityOptions(item)
    if (qualityOptions.includes(0)) {
        return "0"
    }
    return String(qualityOptions[0] ?? 0)
}

export function buildDefaultPropLines(
    item: ItemBrowserRow | null
): EditablePropLine[] {
    const stats = item?.meta.stats || []

    return [
        buildPropLine("main1", stats[0]?.type || 0, stats[0]?.value || 0),
        buildPropLine("main2", stats[1]?.type || 0, stats[1]?.value || 0),
        buildPropLine("prop1", stats[2]?.type || 0, stats[2]?.value || 0),
        buildPropLine("prop2", stats[3]?.type || 0, stats[3]?.value || 0),
        buildPropLine("active", stats[4]?.type || 0, stats[4]?.value || 0),
    ]
}

export function parseNonNegativeInteger(raw: string, fallback = 0): number {
    const parsed = Number.parseInt(String(raw || "").trim(), 10)
    if (!Number.isFinite(parsed) || parsed < 0) {
        return fallback
    }
    return parsed
}

export function buildDefaultGemSlots(
    item: ItemBrowserRow | null,
    holeCount?: number
): string[] {
    const resolvedHoleCount = holeCount ?? item?.meta.socketCount ?? 0
    const socketCount = Math.max(0, Math.min(10, resolvedHoleCount))
    return Array.from({ length: socketCount }, () => "")
}

export function resizeGemSlots(current: string[], holeCount: number): string[] {
    const safeHoleCount = Math.max(0, Math.min(10, holeCount))
    return Array.from(
        { length: safeHoleCount },
        (_, index) => current[index] || ""
    )
}

export function isEquipmentItem(item: ItemBrowserRow | null): boolean {
    return item?.templateTableId === 19
}
