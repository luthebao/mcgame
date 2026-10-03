"use client"

import { startTransition, useState } from "react"
import { Bell, Search, User } from "lucide-react"
import { usePathname, useRouter } from "next/navigation"

import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Input } from "@/components/ui/input"
import { ThemeToggle } from "@/components/theme-toggle"
import { createClient } from "@/lib/supabase/client"
import { APP_ROUTES } from "@/lib/routes"

const PAGE_HEADER_META: Record<string, { title: string; description: string }> =
    {
        "/dashboard": {
            title: "Dashboard",
            description: "Overview of your game server statistics",
        },
        "/dashboard/players": {
            title: "Player Management",
            description: "Search and view detailed player information",
        },
        "/dashboard/items": {
            title: "Item Management",
            description: "Browse all in-game items",
        },
        "/dashboard/box-items": {
            title: "Box Item Management",
            description:
                "Browse usable items and open each item's reward configuration workspace",
        },
        "/dashboard/economy": {
            title: "Economy Management",
            description:
                "Monitor transactions, manage shops, and review economy alerts",
        },
        "/dashboard/events": {
            title: "Event Management",
            description: "Configure and manage in-game events",
        },
        "/dashboard/gift-codes": {
            title: "Gift Code Management",
            description: "Create and manage gift codes",
        },
        "/dashboard/server": {
            title: "Server Management",
            description: "Monitor and manage game server status",
        },
        "/dashboard/actions": {
            title: "GM Actions",
            description: "Perform player management actions",
        },
        "/dashboard/map-viewer": {
            title: "Map Tile Viewer",
            description:
                "View and inspect game map tiles with coordinate information",
        },
    }

function resolvePageMeta(pathname: string) {
    if (pathname.startsWith("/dashboard/box-items/")) {
        return {
            title: "Box Item Rewards",
            description:
                "Manage the reward list for the selected usable item with inline editing",
        }
    }
    if (pathname === "/dashboard/boss-loot") {
        return {
            title: "Boss Loot",
            description:
                "Configure schedule + daily boss loot — items, wallet currencies, and experience",
        }
    }
    if (pathname.startsWith("/dashboard/boss-loot/")) {
        return {
            title: "Boss Loot Editor",
            description:
                "Tune drop rates, qty range, tier/source filters, and reward types for this boss",
        }
    }

    return (
        PAGE_HEADER_META[pathname] ?? {
            title: "Admin Dashboard",
            description: "Game system administration and operations",
        }
    )
}

type HeaderProps = {
    adminUser: string
}

export function Header({ adminUser }: HeaderProps) {
    const pathname = usePathname()
    const router = useRouter()
    const [isLoggingOut, setIsLoggingOut] = useState(false)
    const pageMeta = resolvePageMeta(pathname)

    async function handleLogout() {
        setIsLoggingOut(true)

        try {
            const supabase = createClient()
            await supabase.auth.signOut()
        } finally {
            startTransition(() => {
                router.replace(APP_ROUTES.login)
                router.refresh()
            })
            setIsLoggingOut(false)
        }
    }

    return (
        <header className="sticky top-0 z-10 border-b bg-background px-6 py-3">
            <div className="flex items-center gap-4">
                <div className="flex min-w-0 flex-1 items-center gap-4">
                    <div className="min-w-0 flex-1">
                        <h1 className="truncate text-lg font-semibold leading-6">
                            {pageMeta.title}
                        </h1>
                        <p className="truncate text-sm text-muted-foreground">
                            {pageMeta.description}
                        </p>
                    </div>

                    <div className="relative hidden w-full max-w-md lg:block">
                        <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                        <Input
                            type="search"
                            placeholder="Search players, items, transactions..."
                            className="pl-10"
                        />
                    </div>
                </div>

                <div className="flex shrink-0 items-center gap-4">
                    <ThemeToggle />

                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <Button
                                variant="ghost"
                                size="icon"
                                className="relative"
                            >
                                <Bell className="h-5 w-5" />
                                <Badge className="absolute -right-1 -top-1 flex h-5 w-5 items-center justify-center rounded-full p-0 text-xs">
                                    3
                                </Badge>
                            </Button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent align="end" className="w-80">
                            <DropdownMenuLabel>Notifications</DropdownMenuLabel>
                            <DropdownMenuSeparator />
                            <div className="max-h-96 overflow-y-auto">
                                <DropdownMenuItem className="flex flex-col items-start gap-1">
                                    <div className="flex items-center gap-2">
                                        <Badge variant="warning">Warning</Badge>
                                        <span className="text-xs text-muted-foreground">
                                            2 min ago
                                        </span>
                                    </div>
                                    <p className="text-sm">
                                        Suspicious transaction detected from
                                        player xXGamerXx
                                    </p>
                                </DropdownMenuItem>
                                <DropdownMenuItem className="flex flex-col items-start gap-1">
                                    <div className="flex items-center gap-2">
                                        <Badge variant="success">Success</Badge>
                                        <span className="text-xs text-muted-foreground">
                                            15 min ago
                                        </span>
                                    </div>
                                    <p className="text-sm">
                                        Server maintenance completed
                                        successfully
                                    </p>
                                </DropdownMenuItem>
                                <DropdownMenuItem className="flex flex-col items-start gap-1">
                                    <div className="flex items-center gap-2">
                                        <Badge variant="destructive">
                                            Alert
                                        </Badge>
                                        <span className="text-xs text-muted-foreground">
                                            1 hour ago
                                        </span>
                                    </div>
                                    <p className="text-sm">
                                        Server 2 CPU usage above 90%
                                    </p>
                                </DropdownMenuItem>
                            </div>
                        </DropdownMenuContent>
                    </DropdownMenu>

                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <Button
                                variant="ghost"
                                className="relative h-9 w-9 rounded-full"
                            >
                                <Avatar className="h-9 w-9">
                                    <AvatarImage
                                        src="/avatar.png"
                                        alt={adminUser}
                                    />
                                    <AvatarFallback>
                                        <User className="h-5 w-5" />
                                    </AvatarFallback>
                                </Avatar>
                            </Button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent align="end" className="w-56">
                            <DropdownMenuLabel>My Account</DropdownMenuLabel>
                            <DropdownMenuSeparator />
                            <DropdownMenuItem disabled>
                                <User className="mr-2 h-4 w-4" />
                                <span>{adminUser}</span>
                            </DropdownMenuItem>
                            <DropdownMenuItem disabled>
                                <Bell className="mr-2 h-4 w-4" />
                                <span>Admin Session Active</span>
                            </DropdownMenuItem>
                            <DropdownMenuSeparator />
                            <DropdownMenuItem
                                disabled={isLoggingOut}
                                onClick={() => void handleLogout()}
                            >
                                <span>
                                    {isLoggingOut
                                        ? "Logging out..."
                                        : "Log out"}
                                </span>
                            </DropdownMenuItem>
                        </DropdownMenuContent>
                    </DropdownMenu>
                </div>
            </div>
        </header>
    )
}
