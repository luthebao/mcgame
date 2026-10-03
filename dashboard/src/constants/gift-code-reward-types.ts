export const NUMERIC_GIFT_CODE_REWARD_OPTIONS = [
    {
        value: "exp",
        label: "EXP",
        amountLabel: "EXP Amount",
        description: "Add character experience.",
    },
    {
        value: "gold",
        label: "Gold",
        amountLabel: "Gold Amount",
        description: "Add gold.",
    },
    {
        value: "gold_bind",
        label: "Bound Gold",
        amountLabel: "Bound Gold Amount",
        description: "Add bound gold.",
    },
    {
        value: "silver",
        label: "Silver",
        amountLabel: "Silver Amount",
        description: "Add silver.",
    },
    {
        value: "silver_bind",
        label: "Bank Notes",
        amountLabel: "Bank Notes Amount",
        description: "Add bank notes.",
    },
    {
        value: "reputation",
        label: "Reputation",
        amountLabel: "Reputation Amount",
        description: "Add reputation.",
    },
    {
        value: "honor",
        label: "Honor",
        amountLabel: "Honor Amount",
        description: "Add honor.",
    },
    {
        value: "vigor",
        label: "Vitality",
        amountLabel: "Vitality Amount",
        description: "Add vitality.",
    },
    {
        value: "banggong",
        label: "Guild Points",
        amountLabel: "Guild Points Amount",
        description: "Add guild points.",
    },
    {
        value: "arena_point",
        label: "Arena Points",
        amountLabel: "Arena Points Amount",
        description: "Add arena points.",
    },
    {
        value: "pet_arena_point",
        label: "Pet Arena Points",
        amountLabel: "Pet Arena Points Amount",
        description: "Add pet arena points.",
    },
    {
        value: "pet_arena_act_point",
        label: "Pet Arena Activity Points",
        amountLabel: "Activity Points Amount",
        description: "Add pet arena activity points.",
    },
    {
        value: "pet_chip",
        label: "Pet Chip",
        amountLabel: "Pet Chip Amount",
        description: "Add pet chip.",
    },
    {
        value: "shop_gold",
        label: "Shop Gold",
        amountLabel: "Shop Gold Amount",
        description: "Add shop gold.",
    },
    {
        value: "mc_beans",
        label: "MC Beans",
        amountLabel: "MC Beans Amount",
        description: "Add MC Beans.",
    },
    {
        value: "new_year_point",
        label: "New Year Points",
        amountLabel: "New Year Points Amount",
        description: "Add New Year event points.",
    },
    {
        value: "luna_point",
        label: "Lunar New Year Points",
        amountLabel: "Lunar New Year Points Amount",
        description: "Add Lunar New Year event points.",
    },
    {
        value: "valentine_point",
        label: "Valentine Points",
        amountLabel: "Valentine Points Amount",
        description: "Add Valentine event points.",
    },
    {
        value: "lantern_point",
        label: "Lantern Festival Points",
        amountLabel: "Lantern Festival Points Amount",
        description: "Add Lantern Festival event points.",
    },
    {
        value: "labor_point",
        label: "Labor Day Points",
        amountLabel: "Labor Day Points Amount",
        description: "Add Labor Day event points.",
    },
    {
        value: "fishing_point",
        label: "Fishing Points",
        amountLabel: "Fishing Points Amount",
        description: "Add fishing event points.",
    },
    {
        value: "qixi_point",
        label: "Qixi Festival Points",
        amountLabel: "Qixi Festival Points Amount",
        description: "Add Qixi Festival event points.",
    },
    {
        value: "summer_point",
        label: "Summer Points",
        amountLabel: "Summer Points Amount",
        description: "Add summer event points.",
    },
    {
        value: "annual_third",
        label: "Anniversary Points",
        amountLabel: "Anniversary Points Amount",
        description: "Add anniversary points.",
    },
    {
        value: "xmas_point",
        label: "Christmas Points",
        amountLabel: "Christmas Points Amount",
        description: "Add Christmas event points.",
    },
    {
        value: "national_day_point",
        label: "National Day Points",
        amountLabel: "National Day Points Amount",
        description: "Add National Day event points.",
    },
    {
        value: "world_cup_point",
        label: "World Cup Points",
        amountLabel: "World Cup Points Amount",
        description: "Add World Cup event points.",
    },
    {
        value: "gold_world_cup",
        label: "Gold World Cup",
        amountLabel: "Gold World Cup Amount",
        description: "Add Gold World Cup.",
    },
    {
        value: "summer_game_point",
        label: "Summer Game Points",
        amountLabel: "Summer Game Points Amount",
        description: "Add Summer Game points.",
    },
    {
        value: "anniversary_point",
        label: "Anniversary Points",
        amountLabel: "Anniversary Points Amount",
        description: "Add anniversary points.",
    },
    {
        value: "double11_point",
        label: "Double 11 Points",
        amountLabel: "Double 11 Points Amount",
        description: "Add Double 11 points.",
    },
    {
        value: "show_time_point",
        label: "ShowTime Points",
        amountLabel: "ShowTime Points Amount",
        description: "Add ShowTime points.",
    },
    {
        value: "anni_consume_point",
        label: "Anniversary Consume Points",
        amountLabel: "Consume Points Amount",
        description: "Add anniversary consume points.",
    },
    {
        value: "show_time2_point",
        label: "ShowTime 2 Points",
        amountLabel: "ShowTime 2 Points Amount",
        description: "Add ShowTime 2 points.",
    },
] as const

export const SPECIAL_GIFT_CODE_REWARD_OPTIONS = [
    {
        value: "item",
        label: "Item",
        amountLabel: "Quantity",
        description: "Grant item to inventory.",
    },
] as const

export const GIFT_CODE_REWARD_OPTIONS = [
    ...NUMERIC_GIFT_CODE_REWARD_OPTIONS,
    ...SPECIAL_GIFT_CODE_REWARD_OPTIONS,
] as const

export type NumericGiftCodeRewardType =
    (typeof NUMERIC_GIFT_CODE_REWARD_OPTIONS)[number]["value"]
export type SpecialGiftCodeRewardType =
    (typeof SPECIAL_GIFT_CODE_REWARD_OPTIONS)[number]["value"]
export type GiftCodeRewardType =
    | NumericGiftCodeRewardType
    | SpecialGiftCodeRewardType

const numericRewardTypeSet = new Set<string>(
    NUMERIC_GIFT_CODE_REWARD_OPTIONS.map(option => option.value)
)
const rewardOptionMap = new Map<
    string,
    (typeof GIFT_CODE_REWARD_OPTIONS)[number]
>(GIFT_CODE_REWARD_OPTIONS.map(option => [option.value, option]))

export function isNumericGiftCodeRewardType(
    type: string
): type is NumericGiftCodeRewardType {
    return numericRewardTypeSet.has(type)
}

export function getGiftCodeRewardOption(type: string) {
    return rewardOptionMap.get(type)
}
