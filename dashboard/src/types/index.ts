import { z } from "zod"

// Player Schemas
export const PlayerSchema = z.object({
    id: z.string(),
    username: z.string(),
    email: z.string().email(),
    level: z.number(),
    class: z.string(),
    guild: z.string().nullable(),
    online: z.boolean(),
    lastLogin: z.string(),
    createdAt: z.string(),
    currency: z.object({
        gold: z.number(),
        gems: z.number(),
        coins: z.number(),
    }),
    inventory: z.array(
        z.object({
            id: z.string(),
            itemId: z.string(),
            name: z.string(),
            quantity: z.number(),
            rarity: z.string(),
        })
    ),
    loginHistory: z.array(
        z.object({
            ip: z.string(),
            time: z.string(),
            location: z.string(),
        })
    ),
})

export type Player = z.infer<typeof PlayerSchema>

export const AdminPlayerListItemSchema = z.object({
    id: z.number(),
    playerUid: z.number(),
    playerName: z.string(),
    accountName: z.string(),
    serverId: z.number(),
    serverKey: z.string(),
    level: z.number(),
    sex: z.number(),
    mapId: z.number(),
    instanceId: z.number(),
    position: z.object({
        x: z.number(),
        y: z.number(),
    }),
    online: z.boolean(),
    createdAt: z.string(),
    updatedAt: z.string(),
    lastMoveAt: z.string().nullable(),
    lastLoginAt: z.string().nullable(),
    lastSeenAt: z.string(),
})

export type AdminPlayerListItem = z.infer<typeof AdminPlayerListItemSchema>

export const AdminPlayerListResponseSchema = z.object({
    items: z.array(AdminPlayerListItemSchema),
    total: z.number(),
    limit: z.number(),
    onlineCount: z.number(),
    refreshedAt: z.string(),
})

export type AdminPlayerListResponse = z.infer<
    typeof AdminPlayerListResponseSchema
>

// Server Schemas
export const ServerSchema = z.object({
    id: z.string(),
    name: z.string(),
    status: z.enum(["online", "offline", "maintenance"]),
    players: z.number(),
    maxPlayers: z.number(),
    uptime: z.string(),
    cpu: z.number(),
    memory: z.number(),
    lastRestart: z.string(),
})

export type Server = z.infer<typeof ServerSchema>

// Event Schemas
export const EventSchema = z.object({
    id: z.string(),
    name: z.string(),
    description: z.string(),
    type: z.enum(["exp_boost", "drop_rate", "special", "holiday"]),
    active: z.boolean(),
    startTime: z.string(),
    endTime: z.string(),
    schedule: z.array(
        z.object({
            dayOfWeek: z.number(),
            startHour: z.number(),
            endHour: z.number(),
            expMultiplier: z.number().optional(),
            dropMultiplier: z.number().optional(),
        })
    ),
})

export type GameEvent = z.infer<typeof EventSchema>

// Transaction Schemas
export const TransactionSchema = z.object({
    id: z.string(),
    playerId: z.string(),
    playerName: z.string(),
    type: z.enum(["purchase", "trade", "gift", "reward", "penalty"]),
    amount: z.number(),
    currency: z.enum(["gold", "gems", "coins"]),
    timestamp: z.string(),
    description: z.string(),
    suspicious: z.boolean(),
})

export type Transaction = z.infer<typeof TransactionSchema>

export const ShopItemSchema = z.object({
    id: z.string(),
    name: z.string(),
    type: z.string(),
    price: z.number(),
    currency: z.enum(["gold", "gems", "coins"]),
    stock: z.number(),
    category: z.string(),
})

export type ShopItem = z.infer<typeof ShopItemSchema>

export const EconomyAlertSchema = z.object({
    id: z.string(),
    type: z.enum(["critical", "warning", "info"]),
    message: z.string(),
    time: z.string(),
})

export type EconomyAlert = z.infer<typeof EconomyAlertSchema>

// Gift Code Schemas
export const GiftCodeSchema = z.object({
    code: z.string().min(4).max(20),
    reward: z.object({
        gold: z.number().optional(),
        gems: z.number().optional(),
        coins: z.number().optional(),
        items: z
            .array(
                z.object({
                    itemId: z.string(),
                    quantity: z.number(),
                })
            )
            .optional(),
    }),
    maxUses: z.number(),
    usedCount: z.number(),
    expiresAt: z.string().nullable(),
    active: z.boolean(),
    createdAt: z.string(),
})

export type GiftCode = z.infer<typeof GiftCodeSchema>

// Item Schemas
export const ItemSchema = z.object({
    id: z.string(),
    iconId: z.string(),
    name: z.string(),
    type: z.enum([
        "weapon",
        "armor",
        "accessory",
        "consumable",
        "material",
        "quest",
    ]),
    level: z.number(),
    price: z.number(),
    stackSize: z.number(),
    dungeon: z.string().nullable(),
    rarity: z.enum([
        "common",
        "uncommon",
        "rare",
        "epic",
        "legendary",
        "mythic",
    ]),
    description: z.string().optional(),
    stats: z.record(z.number()).optional(),
})

export type Item = z.infer<typeof ItemSchema>

// GM Action Schemas
export const GMActionSchema = z.object({
    type: z.enum(["ban", "unban", "mute", "kick", "compensate"]),
    targetPlayerId: z.string(),
    reason: z.string(),
    duration: z.number().optional(), // in minutes
    compensation: z
        .object({
            currency: z.enum(["gold", "gems", "coins"]).optional(),
            amount: z.number().optional(),
            items: z
                .array(
                    z.object({
                        itemId: z.string(),
                        quantity: z.number(),
                    })
                )
                .optional(),
        })
        .optional(),
})

export type GMAction = z.infer<typeof GMActionSchema>

export const RecentGMActionSchema = z.object({
    id: z.string(),
    type: z.enum(["ban", "unban", "mute", "kick", "compensate"]),
    target: z.string(),
    reason: z.string(),
    time: z.string(),
    admin: z.string(),
})

export type RecentGMAction = z.infer<typeof RecentGMActionSchema>

export const ActionHistorySchema = z.object({
    id: z.string(),
    type: z.enum(["ban", "unban", "mute", "kick", "compensate"]),
    target: z.string(),
    reason: z.string(),
    duration: z.string(),
    time: z.string(),
    admin: z.string(),
    status: z.enum(["active", "expired", "completed"]),
})

export type ActionHistory = z.infer<typeof ActionHistorySchema>

// Dashboard Stats
export const DashboardStatsSchema = z.object({
    onlinePlayers: z.number(),
    totalPlayers: z.number(),
    todayRegistrations: z.number(),
    todayRevenue: z.number(),
    serverStatus: z.enum(["online", "offline", "maintenance"]),
    activeEvents: z.number(),
    pendingReports: z.number(),
})

export type DashboardStats = z.infer<typeof DashboardStatsSchema>
