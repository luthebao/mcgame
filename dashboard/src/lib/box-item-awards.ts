export type BoxItemAwardType = 12 | 19 | 29 | 30 | 31 | 32 | 33 | 34 | 35

export type BoxItemAwardPayload = Record<string, unknown>

export const BOX_ITEM_AWARD_GUARANTEED_KEY = "guaranteed"

export const BOX_ITEM_AWARD_TYPE_OPTIONS = [
    { value: "29", label: "Vật phẩm" },
    { value: "19", label: "Trang bị" },
    { value: "12", label: "Pet" },
    { value: "30", label: "Bạc / vàng / danh vọng" },
    { value: "35", label: "Điểm / tiền tệ game" },
    { value: "31", label: "Kinh nghiệm" },
    { value: "32", label: "Buff" },
    { value: "33", label: "Danh hiệu" },
    { value: "34", label: "Kỹ năng" },
] as const

export const BOX_ITEM_CURRENCY_OPTIONS = [
    { value: "0", label: "Bạc" },
    { value: "1", label: "Vàng" },
    { value: "2", label: "Danh vọng" },
] as const

export const BOX_ITEM_GAME_CURRENCY_OPTIONS = [
    { value: "1", label: "Điểm đấu trường (btPnt)" },
    { value: "2", label: "Huy chương Cẩu (dogM)" },
    { value: "3", label: "Huy chương Achilles (cbM)" },
    { value: "7", label: "Huy chương Liên Minh (act)" },
    { value: "10", label: "Điểm Năm Mới (yuandan)" },
    { value: "11", label: "Điểm Tết (lyP14)" },
    { value: "12", label: "Điểm Valentine (vtP14)" },
    { value: "13", label: "Điểm Lồng Đèn (ltP14)" },
    { value: "14", label: "Điểm Lao Động (lbP14)" },
    { value: "15", label: "Điểm Câu Cá (fishPnt)" },
    { value: "16", label: "Điểm Thất Tịch (xP23)" },
    { value: "17", label: "Điểm Mùa Hè (smP14)" },
    { value: "18", label: "Điểm Sinh Nhật (thBirthPnt5)" },
    { value: "19", label: "Điểm đấu trường thú (paPnt)" },
    { value: "20", label: "Cống hiến bang hội (guildContrib)" },
    { value: "21", label: "Cống hiến quyên góp (donateContrib)" },
    { value: "22", label: "Điểm Giáng Sinh (christmas)" },
    { value: "25", label: "Điểm Quốc Khánh (nationalDayPnt)" },
    { value: "26", label: "Mảnh thú cưỡi (petChip)" },
    { value: "29", label: "Điểm World Cup (wcPnt18)" },
    { value: "30", label: "Vàng World Cup (wcPnt18gold)" },
    { value: "31", label: "Điểm Olympic (a5Pnt)" },
    { value: "49", label: "Điểm Chu Niên (anni2017)" },
    { value: "58", label: "Điểm Độc Thân (d11Pnt2020)" },
    { value: "60", label: "Điểm ShowTime (explorerPnt)" },
    { value: "61", label: "Vàng Shop (shishangdian)" },
    { value: "62", label: "Điểm Tiêu Hao Chu Niên (st2312Pnt)" },
    { value: "64", label: "MC Beans (mcbeans)" },
    { value: "65", label: "Điểm HĐ đấu trường thú (petPK_202504)" },
    { value: "69", label: "Điểm ShowTime 2 (txkc2508p)" },
    { value: "73", label: "Bụi Ma Thuật (magiccystalrec)" },
    { value: "74", label: "Pha Lê Vĩnh Hằng (magiccystalpre)" },
    { value: "75", label: "Pha Lê Cực Hạn (magiccystallimit)" },
    { value: "200", label: "Vệ Sĩ Pet Ra (petguardout)" },
    { value: "201", label: "Vệ Sĩ Pet Vào (petguardin)" },
    { value: "213", label: "Kết Tinh Trí Thạch (wisdonCrystal)" },
    { value: "214", label: "Điểm Dũng Khí (couragePoint)" },
    { value: "215", label: "Kết Tinh Thần Bí (mysteryCrystal)" },
    { value: "216", label: "Bí Ngân (decoSilver)" },
    { value: "217", label: "Exp Phù Văn (runeExp)" },
    { value: "218", label: "Ma Lực Chi Tinh (rebatepoint)" },
    { value: "219", label: "Điểm Anh Hùng (heroScore2507)" },
    { value: "220", label: "Nguyên Tố Cao Năng (yijieElement)" },
    { value: "221", label: "Kẹo Giáng Sinh (xmCandy24)" },
    { value: "222", label: "Điểm Thưởng Sự Kiện (xcds2403p)" },
    { value: "223", label: "Đổi Điểm Thưởng (exPoint)" },
    { value: "224", label: "Điểm (point)" },
    { value: "225", label: "Huy Chương Dũng Sĩ (threePvpPnt)" },
    { value: "226", label: "Chân Hồn Thạch (realSoulStone)" },
    { value: "227", label: "Kết Tinh Thần Dụ (realSoulCrystal)" },
    { value: "228", label: "Lộ Thu Thập (realSoulWater)" },
    { value: "229", label: "Dũng Khí Thạch (warSprite)" },
    { value: "230", label: "Ý Chí Thạch (battleSprite)" },
    { value: "231", label: "Ma Năng (monsterHeart)" },
    { value: "232", label: "Tâm Tinh Thạch (mhjingshi)" },
    { value: "233", label: "Hắc Diệu Thạch (heiyaoshiPoint)" },
    { value: "234", label: "Tinh Hoa Hắc Diệu Thạch (heiyaoshiPoint2)" },
    { value: "235", label: "Tụ Linh Thạch (energyStone)" },
    { value: "236", label: "Năng Lượng Tự Nhiên (npPnt)" },
    { value: "237", label: "Nguyên Tố (elementPnt)" },
    { value: "238", label: "Điểm PVE Pet (pvePoint)" },
    { value: "239", label: "Điểm Ấn Thạch (stoneSealPoint)" },
    { value: "240", label: "Điểm Tinh Cung (starPnt)" },
] as const

const BOX_ITEM_AWARD_QUALITY_COLOR_LABELS = [
    "Trắng",
    "Xanh lá",
    "Xanh dương",
    "Tím",
    "Cam",
] as const

const BOX_ITEM_AWARD_PRE_NAME_TYPE_LABELS = [
    "None",
    "Bình Thường",
    "Cường Hóa",
    "Tinh Xảo",
    "Hoàn Mỹ",
    "Trác Việt",
] as const

export function normalizeBoxItemAwardType(
    value: unknown,
    fallback: BoxItemAwardType = 29
): BoxItemAwardType {
    const numeric =
        typeof value === "number"
            ? Math.trunc(value)
            : Number.parseInt(String(value ?? ""), 10)
    switch (numeric) {
        case 12:
        case 19:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
            return numeric
        default:
            return fallback
    }
}

export function normalizeBoxItemAwardPayload(
    value: unknown
): BoxItemAwardPayload {
    if (!value || Array.isArray(value) || typeof value !== "object") {
        return {}
    }

    return Object.fromEntries(
        Object.entries(value as Record<string, unknown>).filter(
            ([key]) => key.trim().length > 0
        )
    )
}

export function boxItemAwardTypeName(type: number): string {
    switch (normalizeBoxItemAwardType(type)) {
        case 12:
            return "Pet"
        case 19:
            return "Trang bị"
        case 30:
            return "Bạc / vàng / danh vọng"
        case 31:
            return "Kinh nghiệm"
        case 32:
            return "Buff"
        case 33:
            return "Danh hiệu"
        case 34:
            return "Kỹ năng"
        case 35:
            return "Điểm game"
        default:
            return "Vật phẩm"
    }
}

export function boxItemAwardUsesLookup(type: number): boolean {
    const normalized = normalizeBoxItemAwardType(type)
    return (
        normalized === 12 ||
        normalized === 19 ||
        normalized === 29 ||
        normalized === 32 ||
        normalized === 33 ||
        normalized === 34
    )
}

export function boxItemAwardUsesCurrencyOptions(type: number): boolean {
    return normalizeBoxItemAwardType(type) === 30
}

export function boxItemAwardUsesGameCurrencyOptions(type: number): boolean {
    return normalizeBoxItemAwardType(type) === 35
}

export function boxItemAwardIsExperience(type: number): boolean {
    return normalizeBoxItemAwardType(type) === 31
}

export function boxItemAwardUsesFixedCount(type: number): boolean {
    const normalized = normalizeBoxItemAwardType(type)
    return normalized === 33 || normalized === 34
}

export function boxItemAwardSupportsQuality(type: number): boolean {
    const normalized = normalizeBoxItemAwardType(type)
    return normalized === 12 || normalized === 19 || normalized === 29
}

export function boxItemAwardSupportsPreNameType(type: number): boolean {
    return normalizeBoxItemAwardType(type) === 19
}

export function boxItemAwardLookupPlaceholder(type: number): string {
    switch (normalizeBoxItemAwardType(type)) {
        case 12:
            return "Chọn pet..."
        case 19:
            return "Chọn trang bị..."
        case 32:
            return "Chọn buff..."
        case 33:
            return "Chọn danh hiệu..."
        case 34:
            return "Chọn kỹ năng..."
        default:
            return "Chọn vật phẩm..."
    }
}

export function boxItemCurrencyName(awardId: number): string {
    switch (awardId) {
        case 0:
            return "Bạc"
        case 1:
            return "Vàng"
        case 2:
            return "Danh vọng"
        default:
            return `Tiền tệ #${awardId}`
    }
}

export function boxItemAwardFallbackName(
    type: number,
    awardId: number
): string {
    switch (normalizeBoxItemAwardType(type)) {
        case 12:
            return awardId > 0 ? `Pet #${awardId}` : "Pet"
        case 19:
            return awardId > 0 ? `Trang bị #${awardId}` : "Trang bị"
        case 30:
            return boxItemCurrencyName(awardId)
        case 31:
            return "Kinh nghiệm"
        case 32:
            return awardId > 0 ? `Buff #${awardId}` : "Buff"
        case 33:
            return awardId > 0 ? `Danh hiệu #${awardId}` : "Danh hiệu"
        case 34:
            return awardId > 0 ? `Kỹ năng #${awardId}` : "Kỹ năng"
        case 35:
            return boxItemGameCurrencyName(awardId)
        default:
            return awardId > 0 ? `Vật phẩm #${awardId}` : "Vật phẩm"
    }
}

export function boxItemAwardAllowsPersistedZeroAwardId(type: number): boolean {
    const normalized = normalizeBoxItemAwardType(type)
    return normalized === 30 || normalized === 31
}

export function boxItemGameCurrencyName(awardId: number): string {
    const match = BOX_ITEM_GAME_CURRENCY_OPTIONS.find(
        option => Number(option.value) === awardId
    )
    if (match) {
        return match.label
    }

    return awardId > 0 ? `Điểm game #${awardId}` : "Điểm game"
}

function normalizeAwardNumber(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

export function normalizeBoxItemAwardQuality(value: unknown): number {
    return Math.min(25, Math.max(0, normalizeAwardNumber(value)))
}

export function normalizeBoxItemAwardPreNameType(value: unknown): number {
    return Math.min(5, Math.max(0, normalizeAwardNumber(value)))
}

function formatPetAwardGrowthLabel(quality: number): string {
    if (quality <= 0) {
        return "Mặc định"
    }

    const growRate = quality / 10
    return Number.isInteger(growRate)
        ? `Tăng trưởng x${growRate}`
        : `Tăng trưởng x${growRate.toFixed(1)}`
}

function resolveBoxItemAwardQualityColorLabel(quality: number): string {
    if (quality <= 0) {
        return BOX_ITEM_AWARD_QUALITY_COLOR_LABELS[0]
    }

    const tierIndex = Math.min(
        BOX_ITEM_AWARD_QUALITY_COLOR_LABELS.length - 1,
        Math.floor((quality - 1) / 5)
    )

    return BOX_ITEM_AWARD_QUALITY_COLOR_LABELS[tierIndex]
}

export function boxItemAwardQualityLabel(
    type: number,
    quality: number
): string {
    const normalizedType = normalizeBoxItemAwardType(type)
    const normalizedQuality = normalizeBoxItemAwardQuality(quality)

    if (normalizedType === 12) {
        return formatPetAwardGrowthLabel(normalizedQuality)
    }

    return resolveBoxItemAwardQualityColorLabel(normalizedQuality)
}

export function boxItemAwardPreNameTypeLabel(preNameType: number): string {
    const normalizedPreNameType = normalizeBoxItemAwardPreNameType(preNameType)
    return (
        BOX_ITEM_AWARD_PRE_NAME_TYPE_LABELS[normalizedPreNameType] ||
        `Prefix ${normalizedPreNameType}`
    )
}
