export const BOX_ITEM_ALLOWED_KIND = 5

export const BOX_ITEM_TYPE_OPTIONS = [
    { value: 500, label: "500 - Sách cuộn" },
    { value: 501, label: "501 - Thuốc" },
    { value: 502, label: "502 - Thức ăn" },
    { value: 503, label: "503 - Bảo thạch" },
    { value: 504, label: "504 - Thăng tinh thạch" },
    { value: 505, label: "505 - Sách kỹ năng" },
    { value: 506, label: "506 - Yếu quyết" },
    { value: 507, label: "507 - Vật liệu luyện hóa" },
    { value: 508, label: "508 - Vật phẩm nhiệm vụ" },
    { value: 509, label: "509 - Chìa khóa" },
    { value: 510, label: "510 - Thâm Lam Tinh" },
    { value: 511, label: "511 - Thâm Hồng Tinh" },
    { value: 512, label: "512 - Thăng cấp trang bị pet" },
    { value: 513, label: "513 - Sửa trang bị pet" },
    { value: 514, label: "514 - Hoán Thần Thạch" },
    { value: 515, label: "515 - Ngư cụ" },
    { value: 516, label: "516 - Công thức tạo" },
    { value: 517, label: "517 - Túi tiện dụng" },
    { value: 518, label: "518 - Cường Hóa Cánh" },
    { value: 519, label: "519 - MW Prop Reset" },
    { value: 520, label: "520 - Target Item" },
    { value: 521, label: "521 - Bí Kíp Tinh Linh" },
    { value: 522, label: "522 - MW Stage Eight" },
    { value: 523, label: "523 - Thăng Hoa" },
    { value: 524, label: "524 - Phong Ấn" },
    { value: 527, label: "527 - Kỳ Lân Các" },
    { value: 550, label: "550 - Khác" },
    { value: 551, label: "551 - Thêm Sao" },
    { value: 552, label: "552 - Tốc Độ Sao" },
] as const

export const BOX_ITEM_ALLOWED_TYPES = BOX_ITEM_TYPE_OPTIONS.map(
    option => option.value
)

export function normalizeBoxItemTemplateType(
    value: number | null
): number | null {
    if (value === null || !Number.isFinite(value)) {
        return null
    }

    const normalized = Math.trunc(value)
    return BOX_ITEM_ALLOWED_TYPES.some(
        allowedType => allowedType === normalized
    )
        ? normalized
        : null
}
