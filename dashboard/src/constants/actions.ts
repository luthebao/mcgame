/**
 * GM Actions constants
 */

export const ACTION_TYPES = {
    ban: {
        label: "Ban Account",
        color: "destructive",
        description: "Permanent or temporary",
    },
    unban: {
        label: "Unban",
        color: "default",
        description: "Remove account ban",
    },
    mute: {
        label: "Mute Chat",
        color: "secondary",
        description: "Disable chat",
    },
    kick: {
        label: "Kick",
        color: "outline",
        description: "Force logout from game",
    },
    compensate: {
        label: "Compensate",
        color: "warning",
        description: "Send rewards or currency as compensation",
    },
} as const

export const ACTION_STATUS = {
    active: { label: "Active", variant: "destructive" },
    expired: { label: "Expired", variant: "secondary" },
    completed: { label: "Completed", variant: "success" },
} as const

export const BAN_DURATIONS = [
    { value: "30", label: "30 minutes" },
    { value: "60", label: "1 hour" },
    { value: "240", label: "4 hours" },
    { value: "1440", label: "1 day" },
    { value: "10080", label: "7 days" },
    { value: "43200", label: "30 days" },
    { value: "-1", label: "Permanent" },
]

export const COMPENSATION_TYPES = {
    currency: { label: "Currency", description: "Gold, Gems, Coins" },
    item: { label: "Item", description: "Specific items" },
    both: { label: "Both", description: "Currency and Items" },
}
