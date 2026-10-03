import {
    Backpack,
    Boxes,
    Coins,
    Leaf,
    PawPrint,
    Package,
    Shield,
    Sparkles,
    Swords,
    Target,
    User,
    UsersRound,
    type LucideIcon,
} from "lucide-react"

type PlayerNavCategory =
    | "Core"
    | "Combat"
    | "Economy"
    | "Inventory"
    | "Customization"
    | "Systems"
    | "Social"

export type PlayerNavItem = {
    value: string
    label: string
    icon: LucideIcon
    category: PlayerNavCategory
}

export const PLAYER_NAV_ITEMS: PlayerNavItem[] = [
    { value: "overview", label: "Overview", icon: User, category: "Core" },
    {
        value: "progression",
        label: "Progression",
        icon: Sparkles,
        category: "Core",
    },
    {
        value: "attributes",
        label: "Attributes",
        icon: Target,
        category: "Core",
    },
    {
        value: "combat",
        label: "Combat Stats",
        icon: Swords,
        category: "Combat",
    },
    { value: "wallet", label: "Wallet", icon: Coins, category: "Economy" },
    {
        value: "resources",
        label: "Resources",
        icon: Backpack,
        category: "Economy",
    },
    {
        value: "items",
        label: "Items",
        icon: Package,
        category: "Inventory",
    },
    {
        value: "pets",
        label: "Pets",
        icon: PawPrint,
        category: "Inventory",
    },
    {
        value: "dress-panel",
        label: "Dress Panel",
        icon: Sparkles,
        category: "Customization",
    },
    {
        value: "life-skills",
        label: "Life Skills",
        icon: Leaf,
        category: "Customization",
    },
    { value: "gm", label: "GM", icon: Shield, category: "Systems" },
    {
        value: "feature-state",
        label: "Game Systems",
        icon: Boxes,
        category: "Systems",
    },
    {
        value: "relationships",
        label: "Quan Hệ (Relationships)",
        icon: UsersRound,
        category: "Social",
    },
]

export const PLAYER_NAV_CATEGORIES: PlayerNavCategory[] = [
    ...new Set(PLAYER_NAV_ITEMS.map(item => item.category)),
]
