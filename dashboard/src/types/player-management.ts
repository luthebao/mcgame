export type PlayerActionRequest = {
    action: string
    targetId: number
    payload?: Record<string, unknown>
}

export type PlayerActionResponse = {
    ok: boolean
    action: string
    targetId: number
    deliveryMode?: string
    statusMessage?: string
    data?: unknown
}

export type PlayerDetailData = {
    character: Record<string, unknown>
    online: boolean
    session?: {
        mapId: number
        channelId: number
        positionX: number
        positionY: number
        connectedAt?: string
    }
}

export const CURRENCY_GROUPS = [
    "Primary",
    "Battle",
    "Event",
    "Guild",
    "Special",
    "Magic Crystal",
    "NPC Shop",
    "Train Soul",
    "Decoration",
    "Cross-Realm",
    "Daily / Misc",
    "Progression",
    "Pet Real Soul (PRS)",
    "War Sprite",
    "Monster Heart",
    "Hắc Diệu Thạch",
    "Pet Stone",
    "Magic Array / Stars",
    "Pet Talent",
    "Stone Seal",
] as const

export type CurrencyGroup = (typeof CURRENCY_GROUPS)[number]

export type CurrencyOption = {
    key: string
    label: string
    group: CurrencyGroup
    dtoKey: string
    editable?: boolean
    description?: string
}

export const CURRENCY_OPTIONS: CurrencyOption[] = [
    { key: "money", label: "Bạc (Money)", group: "Primary", dtoKey: "money" },
    { key: "moneyBind", label: "Bạc khóa (Bind Money)", group: "Primary", dtoKey: "moneyBind" },
    { key: "gold", label: "Vàng (Gold)", group: "Primary", dtoKey: "gold" },
    { key: "goldBind", label: "Vàng khóa (Bind Gold)", group: "Primary", dtoKey: "goldBind" },
    { key: "honor", label: "Danh vọng (Honor)", group: "Primary", dtoKey: "honor" },

    { key: "btPnt", label: "Điểm Đấu Trường", group: "Battle", dtoKey: "arenaPoints" },
    { key: "dogM", label: "Huy Chương Cẩu", group: "Battle", dtoKey: "dogMedal" },
    { key: "cbM", label: "Huy Chương Achilles", group: "Battle", dtoKey: "achillesMedal" },
    { key: "act", label: "Huy Chương Liên Minh", group: "Battle", dtoKey: "groupPvpMedal" },
    { key: "paPnt", label: "Điểm Đấu Trường Pet", group: "Battle", dtoKey: "petArenaPoint" },
    { key: "petPK_202504", label: "Điểm HĐ Đấu Trường Pet", group: "Battle", dtoKey: "petArenaActPoint" },

    { key: "yuandan", label: "Điểm Năm Mới", group: "Event", dtoKey: "newYearPoint", description: "Server may suffix the year (yuandan24) — all map to this key" },
    { key: "lyP14", label: "Điểm Tết", group: "Event", dtoKey: "lunaPoint", description: "Also matches lyP_* family" },
    { key: "vtP14", label: "Điểm Valentine", group: "Event", dtoKey: "valentinePoint", description: "Also matches vtP_* family" },
    { key: "ltP14", label: "Điểm Lồng Đèn", group: "Event", dtoKey: "lanternPoint", description: "Also matches ltP_* family" },
    { key: "lbP14", label: "Điểm Lao Động", group: "Event", dtoKey: "laborPoint", description: "Also matches lbP_* family" },
    { key: "fishPnt", label: "Điểm Câu Cá", group: "Event", dtoKey: "fishingPoint" },
    { key: "xP23", label: "Điểm Thất Tịch", group: "Event", dtoKey: "qixiPoint" },
    { key: "smP14", label: "Điểm Mùa Hè", group: "Event", dtoKey: "summerPoint", description: "Also matches smP_* family" },
    { key: "thBirthPnt5", label: "Điểm Sinh Nhật", group: "Event", dtoKey: "annualThird" },
    { key: "christmas", label: "Điểm Giáng Sinh", group: "Event", dtoKey: "xmasPoint", description: "christmas* year-suffixed variants all map here" },
    { key: "nationalDayPnt", label: "Điểm Quốc Khánh", group: "Event", dtoKey: "nationalDayPoint" },
    { key: "wcPnt18", label: "Điểm World Cup", group: "Event", dtoKey: "worldCupPoint" },
    { key: "wcPnt18gold", label: "Vàng World Cup", group: "Event", dtoKey: "goldWorldCup" },
    { key: "a5Pnt", label: "Điểm Olympic", group: "Event", dtoKey: "summerGamePoint" },
    { key: "anni2017", label: "Điểm Chu Niên", group: "Event", dtoKey: "anniversaryPoint", description: "Despite the year suffix this is the permanent anniversary register" },
    { key: "d11Pnt2020", label: "Điểm Độc Thân", group: "Event", dtoKey: "double11Point" },
    { key: "explorerPnt", label: "Điểm ShowTime", group: "Event", dtoKey: "showTimePoint" },
    { key: "st2312Pnt", label: "Điểm Tiêu Hao Chu Niên", group: "Event", dtoKey: "anniConsumePoint" },
    { key: "txkc2508p", label: "Điểm ShowTime 2", group: "Event", dtoKey: "showTime2Point" },

    { key: "guildContrib", label: "Cống Hiến Bang Hội", group: "Guild", dtoKey: "guildContrib" },
    { key: "donateContrib", label: "Cống Hiến Quyên Góp", group: "Guild", dtoKey: "donateContrib" },

    { key: "petChip", label: "Mảnh Thú Cưỡi", group: "Special", dtoKey: "petChip" },
    { key: "petguardout", label: "Vệ Sĩ Pet (Ra)", group: "Special", dtoKey: "petguardout" },
    { key: "petguardin", label: "Vệ Sĩ Pet (Vào)", group: "Special", dtoKey: "petguardin" },
    { key: "shishangdian", label: "Vàng Shop", group: "Special", dtoKey: "shishangdian", description: "Mirrors Character.ShopGold" },
    { key: "mcbeans", label: "MC Beans", group: "Special", dtoKey: "mcbeans" },

    { key: "magiccystalrec", label: "Bụi Ma Thuật", group: "Magic Crystal", dtoKey: "magiccystalrec" },
    { key: "magiccystalpre", label: "Pha Lê Vĩnh Hằng", group: "Magic Crystal", dtoKey: "magiccystalpre" },
    { key: "magiccystallimit", label: "Pha Lê Cực Hạn", group: "Magic Crystal", dtoKey: "magiccystallimit" },

    { key: "wisdonCrystal", label: "Kết Tinh Trí Thạch", group: "NPC Shop", dtoKey: "wisdonCrystal", description: "Client typo 'wisdon' — moneyType is mirrored exactly" },
    { key: "couragePoint", label: "Điểm Dũng Khí", group: "NPC Shop", dtoKey: "couragePoint" },
    { key: "heroScore2507", label: "Điểm Anh Hùng", group: "NPC Shop", dtoKey: "heroScore2507" },
    { key: "xmCandy24", label: "Kẹo Giáng Sinh", group: "NPC Shop", dtoKey: "xmCandy24" },
    { key: "xcds2403p", label: "Điểm Thưởng Sự Kiện", group: "NPC Shop", dtoKey: "xcds2403p" },

    { key: "mysteryCrystal", label: "Kết Tinh Thần Bí", group: "Train Soul", dtoKey: "mysteryCrystal" },

    { key: "decoSilver", label: "Bí Ngân", group: "Decoration", dtoKey: "decoSilver" },
    { key: "runeExp", label: "Exp Phù Văn", group: "Decoration", dtoKey: "runeExp" },

    { key: "yijieElement", label: "Nguyên Tố Cao Năng", group: "Cross-Realm", dtoKey: "yijieElement" },

    { key: "rebatepoint", label: "Ma Lực Chi Tinh", group: "Daily / Misc", dtoKey: "rebatepoint" },
    { key: "exPoint", label: "Đổi Điểm Thưởng", group: "Daily / Misc", dtoKey: "exPoint" },
    { key: "point", label: "Điểm", group: "Daily / Misc", dtoKey: "point" },
    { key: "threePvpPnt", label: "Huy Chương Dũng Sĩ", group: "Daily / Misc", dtoKey: "threePvpPnt" },

    { key: "soulPnt", label: "Pha Lê (Soul Points)", group: "Progression", dtoKey: "soulPnt", description: "Persisted via Character.SoulPoints — also editable from the Progression tab" },
    { key: "movePnt", label: "Điểm Hành Động", group: "Progression", dtoKey: "movePnt", editable: false, description: "Daily-reset semantics owned by the Magic Estate subsystem — edit via the Magic Estate panel" },

    { key: "realSoulStone", label: "Chân Hồn Thạch", group: "Pet Real Soul (PRS)", dtoKey: "realSoulStone" },
    { key: "realSoulCrystal", label: "Kết Tinh Thần Dụ", group: "Pet Real Soul (PRS)", dtoKey: "realSoulCrystal" },
    { key: "realSoulWater", label: "Lộ Thu Thập", group: "Pet Real Soul (PRS)", dtoKey: "realSoulWater" },

    { key: "warSprite", label: "Dũng Khí Thạch", group: "War Sprite", dtoKey: "warSprite", description: "Distinct from the warSprite stat-feature JSONB (template maps)" },
    { key: "battleSprite", label: "Ý Chí Thạch", group: "War Sprite", dtoKey: "battleSprite" },

    { key: "monsterHeart", label: "Ma Năng", group: "Monster Heart", dtoKey: "monsterHeart", description: "Distinct from the monsterHeart stat-feature JSONB" },
    { key: "mhjingshi", label: "Tâm Tinh Thạch", group: "Monster Heart", dtoKey: "mhjingshi" },

    { key: "heiyaoshiPoint", label: "Hắc Diệu Thạch", group: "Hắc Diệu Thạch", dtoKey: "heiyaoshiPoint", description: "Distinct from the heiyaoshi stat-feature JSONB" },
    { key: "heiyaoshiPoint2", label: "Tinh Hoa Hắc Diệu Thạch", group: "Hắc Diệu Thạch", dtoKey: "heiyaoshiPoint2" },

    { key: "energyStone", label: "Tụ Linh Thạch", group: "Pet Stone", dtoKey: "energyStone", description: "Character-scoped despite the panel name" },

    { key: "npPnt", label: "Năng Lượng Tự Nhiên", group: "Magic Array / Stars", dtoKey: "npPnt" },
    { key: "elementPnt", label: "Nguyên Tố", group: "Magic Array / Stars", dtoKey: "elementPnt" },
    { key: "starPnt", label: "Điểm Tinh Cung (Star Points)", group: "Magic Array / Stars", dtoKey: "starPnt" },

    { key: "pvePoint", label: "Điểm PVE Pet", group: "Pet Talent", dtoKey: "pvePoint" },

    { key: "stoneSealPoint", label: "Điểm Ấn Thạch", group: "Stone Seal", dtoKey: "stoneSealPoint" },
]

export type PlayerActionType =
    | "kick"
    | "transport"
    | "set_currency"
    | "set_attributes"
    | "advance_progression"
    | "set_progression"
    | "set_combat_stats"
    | "set_resources"
    | "set_dress_panel"
    | "set_life_skills"
    | "set_gm_level"
    | "remove_item"
    | "update_item"
    | "get_inventory"
    | "get_pets"
    | "update_pet"
    | "delete_pet"
    | "player_detail"
    | "get_feature_states"
    | "set_feature_state"
    | "get_relationships"
    | "set_relationship"
    | "delete_relationship"

export type Relationship = {
    id: number
    otherId: number
    otherName: string
    type: number
    groupId: number
    nickname: string
    intimacy: number
    createdAt: string
}

export const RELATIONSHIP_TYPES: { value: number; label: string }[] = [
    { value: 0, label: "Bạn bè (Friend)" },
    { value: 1, label: "Danh sách đen (Black)" },
    { value: 2, label: "Kẻ thù (Enemy)" },
    { value: 3, label: "Phu thê (Couple)" },
    { value: 4, label: "Sư đồ (Tutor)" },
    { value: 5, label: "Kết nghĩa (Brother)" },
]

export type FeatureState = {
    featureKey: string
    state: Record<string, unknown>
}

export type FeatureScalarField = {
    path: string
    label: string
    min?: number
    max?: number
}

export type FeatureSystem = {
    featureKey: string
    label: string
    scalarFields?: FeatureScalarField[]
}

export const FEATURE_SYSTEMS: FeatureSystem[] = [
    {
        featureKey: "monster_heart",
        label: "Ma Năng (Monster Heart)",
    },
    {
        featureKey: "rune",
        label: "Phù Văn (Rune)",
        scalarFields: [{ path: "upLvlHole", label: "Up Level Hole" }],
    },
    {
        featureKey: "rune_chip",
        label: "Mảnh Phù Văn (Rune Chip)",
    },
    {
        featureKey: "magic_array",
        label: "Trận Pháp (Magic Array)",
        scalarFields: [
            { path: "pickCount", label: "Pick Count", min: 0, max: 12 },
            { path: "refreshCount", label: "Refresh Count", min: 0, max: 10 },
            { path: "buyPickCount", label: "Buy Pick Count", min: 0 },
        ],
    },
    {
        featureKey: "mystery_treasure",
        label: "Bí Bảo (Mystery Treasure)",
        scalarFields: [
            { path: "skiLvl", label: "Skill Level", min: 0 },
            { path: "skiPt", label: "Skill Point", min: 0 },
        ],
    },
    {
        featureKey: "deco_hole",
        label: "Lỗ Trang Trí (Deco Hole)",
    },
    {
        featureKey: "explorer_medal",
        label: "Huy Chương Thám Hiểm (Explorer Medal)",
        scalarFields: [
            { path: "level", label: "Level", min: 0, max: 100 },
            { path: "score", label: "Score", min: 0 },
        ],
    },
    {
        featureKey: "pet_pve",
        label: "Pet PVE",
        scalarFields: [
            { path: "ppvefloor", label: "PVE Floor", min: 0, max: 150 },
            { path: "freeTime", label: "Free Time", min: 0, max: 3 },
        ],
    },
]

export type InventoryItem = {
    id: number
    templateId: number
    templateName: string
    templateTableId: number
    itemType: number
    slotType: number
    slotIndex: number
    sid: number
    stackCount: number
    isBound: boolean
    colorCode: number
    enchantLevel: number
    starLevel: number
    durability?: number | null
    maxDurability?: number | null
    iconCode: number
    resCode: number
    preNameType: number
    properties?: Record<string, unknown>
}

export type InventoryData = {
    bagSlots: number
    bankSlots: number
    tempBagSlots: number
    questBagSlots: number
    petItemBagSlots: number
    petSlots: number
    equipSlots: number
    items: InventoryItem[]
}

export type PetData = {
    id: number
    tid: number
    petName: string
    level: number
    exp: number
    upgradeNum: number
    element: number
    evolutionLv: number
    growRate: number
    currentHp: number
    currentMp: number
    hpMax: number
    mpMax: number
    aptStrength: number
    aptAgility: number
    aptStamina: number
    aptIntelligence: number
    aptEnergy: number
    aptStrengthEx: number
    aptAgilityEx: number
    aptStaminaEx: number
    aptIntelligenceEx: number
    aptEnergyEx: number
    binded?: string | number
    state?: number
    featherLevel?: number
    attack?: number
    defense?: number
    magicAttack?: number
    magicDefense?: number
    speed?: number
    creatureData?: Record<string, unknown>
    [key: string]: unknown
}

export type PetsData = {
    petSlots: number
    pets: PetData[]
}

export const SLOT_TYPE_EQUIPPED = 1
export const SLOT_TYPE_BAG = 0
export const SLOT_TYPE_BANK = 2
export const SLOT_TYPE_TEMPBAG = 3
export const SLOT_TYPE_QUESTBAG = 4
export const SLOT_TYPE_PETITEMBAG = 5
export const SLOT_TYPE_PETEQUIPPED = 6

export const SLOTS_PER_BAG_PAGE = 30

export const COLOR_PREFIX: Record<
    number,
    { prefix: string; hex: string; label: string }
> = {
    0: { prefix: "", hex: "#FFFFFF", label: "Default" },
    1: { prefix: "Bình Thường", hex: "#FFFFFF", label: "White" },
    2: { prefix: "Cường Hóa", hex: "#22C55E", label: "Green" },
    3: { prefix: "Tinh Xảo", hex: "#3B82F6", label: "Blue" },
    4: { prefix: "Hoàn Mỹ", hex: "#D946EF", label: "Purple" },
    5: { prefix: "Trác Việt", hex: "#F59E0B", label: "Orange" },
}

export const EQUIP_SLOT_LABELS: Array<{ index: number; label: string }> = [
    { index: 0, label: "Mũ" },
    { index: 1, label: "Đai" },
    { index: 2, label: "Vũ khí" },
    { index: 3, label: "Áo" },
    { index: 4, label: "Quần" },
    { index: 5, label: "Trang sức 1" },
    { index: 6, label: "Trợ thủ" },
    { index: 7, label: "Dây chuyền" },
    { index: 8, label: "Nhẫn" },
    { index: 9, label: "Hộ vai" },
    { index: 10, label: "Trang sức 2" },
    { index: 11, label: "Giày" },
    { index: 12, label: "Găng thu thập" },
    { index: 13, label: "Phi hành" },
    { index: 14, label: "Thần khí chính" },
    { index: 15, label: "Thần khí phụ 1" },
    { index: 16, label: "Thần khí phụ 2" },
    { index: 17, label: "Thần khí phụ 3" },
    { index: 18, label: "Thần khí phụ 4" },
    { index: 19, label: "Thần khí phụ 5" },
    { index: 20, label: "Thời trang" },
    { index: 21, label: "Cánh" },
]
