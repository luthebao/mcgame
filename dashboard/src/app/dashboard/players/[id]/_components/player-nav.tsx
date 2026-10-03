"use client"

import { TabsList, TabsTrigger } from "@/components/ui/tabs"
import { cn } from "@/lib/utils"
import {
    PLAYER_NAV_CATEGORIES,
    PLAYER_NAV_ITEMS,
    type PlayerNavItem,
} from "../_lib/nav"

const TRIGGER_CLASS = cn(
    "justify-start gap-2 rounded-md border-l-2 border-transparent px-3 py-2 text-sm font-medium text-muted-foreground",
    "data-[state=active]:border-primary data-[state=active]:bg-primary/10 data-[state=active]:text-primary data-[state=active]:shadow-none",
    "hover:bg-accent hover:text-accent-foreground"
)

function NavTrigger({ item }: { item: PlayerNavItem }) {
    const Icon = item.icon
    return (
        <TabsTrigger value={item.value} className={cn(TRIGGER_CLASS, "w-full")}>
            <Icon className="h-4 w-4 shrink-0" />
            {item.label}
        </TabsTrigger>
    )
}

export function PlayerNav() {
    return (
        <TabsList
            className={cn(
                "h-auto flex-col items-stretch justify-start gap-1 rounded-none bg-transparent p-0 text-muted-foreground",
                "lg:sticky lg:top-44"
            )}
        >
            {PLAYER_NAV_CATEGORIES.map(category => {
                const items = PLAYER_NAV_ITEMS.filter(
                    item => item.category === category
                )
                if (items.length === 0) return null
                return (
                    <div key={category} className="space-y-1">
                        <p className="px-3 pb-0.5 pt-3 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground/70">
                            {category}
                        </p>
                        {items.map(item => (
                            <NavTrigger key={item.value} item={item} />
                        ))}
                    </div>
                )
            })}
        </TabsList>
    )
}

export function PlayerNavStrip() {
    return (
        <TabsList
            className={cn(
                "h-auto w-full justify-start gap-1 overflow-x-auto rounded-lg bg-muted/50 p-1",
                "[scrollbar-width:none] [&::-webkit-scrollbar]:hidden"
            )}
        >
            {PLAYER_NAV_ITEMS.map(item => {
                const Icon = item.icon
                return (
                    <TabsTrigger
                        key={item.value}
                        value={item.value}
                        className={cn(
                            "shrink-0 gap-2 whitespace-nowrap rounded-md px-3 py-1.5",
                            "data-[state=active]:bg-primary/10 data-[state=active]:text-primary"
                        )}
                    >
                        <Icon className="h-4 w-4 shrink-0" />
                        {item.label}
                    </TabsTrigger>
                )
            })}
        </TabsList>
    )
}
