/**
 * Economy constants
 */

export const TRANSACTION_TYPES = {
    purchase: { label: "Purchase", color: "bg-blue-500" },
    trade: { label: "Trade", color: "bg-purple-500" },
    gift: { label: "Gift", color: "bg-green-500" },
    sell: { label: "Sell", color: "bg-yellow-500" },
    compensate: { label: "Compensation", color: "bg-pink-500" },
}

export const ALERT_TYPES = {
    critical: { label: "Critical", color: "text-red-500", bg: "bg-red-500/10" },
    warning: {
        label: "Warning",
        color: "text-yellow-500",
        bg: "bg-yellow-500/10",
    },
    info: { label: "Info", color: "text-blue-500", bg: "bg-blue-500/10" },
}

export const CURRENCY_TYPES = {
    gold: { label: "Gold", color: "bg-yellow-500", icon: "coins" },
    gems: { label: "Gems", color: "bg-purple-500", icon: "gem" },
    coins: { label: "Coins", color: "bg-blue-500", icon: "coins" },
}
