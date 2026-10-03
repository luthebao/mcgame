"use client"

import { useDeferredValue, useState } from "react"
import { useRouter } from "next/navigation"
import { Eye, RefreshCw, Search, Settings } from "lucide-react"

import { usePlayers, type PlayerListItem } from "@/hooks/use-players"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"

const defaultPlayerLimit = 500

function formatDateTime(value: string | null): string {
    if (!value) return "-"
    const parsed = new Date(value)
    if (Number.isNaN(parsed.valueOf())) return value
    return new Intl.DateTimeFormat("en-US", {
        dateStyle: "short",
        timeStyle: "medium",
    }).format(parsed)
}

function formatSexLabel(sex: number): string {
    return sex === 1 ? "Female" : "Male"
}

function getPlayerInitials(player: PlayerListItem): string {
    const trimmedName = player.playerName.trim()
    if (!trimmedName) return String(player.id)
    return trimmedName.slice(0, 1).toUpperCase()
}

function DetailField(props: { label: string; value: string }) {
    return (
        <div className="space-y-1 rounded-lg border border-border/60 bg-muted/20 p-3">
            <p className="text-xs uppercase tracking-wide text-muted-foreground">
                {props.label}
            </p>
            <p className="font-medium">{props.value}</p>
        </div>
    )
}

export default function PlayersPage() {
    const router = useRouter()
    const [searchTerm, setSearchTerm] = useState("")
    const deferredSearch = useDeferredValue(searchTerm.trim())
    const [selectedPlayer, setSelectedPlayer] = useState<PlayerListItem | null>(
        null
    )

    const { data, isLoading, isFetching, error, refetch } = usePlayers(
        deferredSearch,
        defaultPlayerLimit
    )

    const players = data?.items ?? []
    const totalPlayers = data?.total ?? 0
    const onlinePlayers = data?.onlineCount ?? 0
    const lastRefreshedAt = data?.refreshedAt ?? null

    return (
        <div className="space-y-6">
            <div className="grid gap-4 md:grid-cols-3">
                <Card>
                    <CardHeader className="pb-3">
                        <CardDescription>Online realtime</CardDescription>
                        <CardTitle>{onlinePlayers}</CardTitle>
                    </CardHeader>
                </Card>
                <Card>
                    <CardHeader className="pb-3">
                        <CardDescription>Currently showing</CardDescription>
                        <CardTitle>
                            {players.length} / {totalPlayers}
                        </CardTitle>
                    </CardHeader>
                </Card>
                <Card>
                    <CardHeader className="pb-3">
                        <CardDescription>Last refreshed</CardDescription>
                        <CardTitle className="text-base">
                            {formatDateTime(lastRefreshedAt)}
                        </CardTitle>
                    </CardHeader>
                </Card>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Search players</CardTitle>
                    <CardDescription>
                        Search by player name, account, player ID, or UID. The
                        list auto-refreshes every 5 seconds.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="flex flex-col gap-3 md:flex-row">
                        <div className="relative flex-1">
                            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                            <Input
                                placeholder="Enter name, account, ID, or UID..."
                                value={searchTerm}
                                onChange={event =>
                                    setSearchTerm(event.target.value)
                                }
                                className="pl-10"
                            />
                        </div>
                        <Button
                            variant="outline"
                            onClick={() => void refetch()}
                            disabled={isLoading || isFetching}
                        >
                            <RefreshCw
                                className={`mr-2 h-4 w-4 ${isFetching ? "animate-spin" : ""}`}
                            />
                            Refresh
                        </Button>
                    </div>

                    {totalPlayers > players.length ? (
                        <p className="text-sm text-muted-foreground">
                            Showing up to {players.length} of {totalPlayers}{" "}
                            most recent players. Use search for server-side
                            filtering.
                        </p>
                    ) : null}

                    {error ? (
                        <div className="rounded-lg border border-destructive/40 bg-destructive/10 px-4 py-3 text-sm text-destructive">
                            {error instanceof Error
                                ? error.message
                                : "Failed to load players"}
                        </div>
                    ) : null}
                </CardContent>
            </Card>

            <Card>
                <CardHeader>
                    <CardTitle>Player list</CardTitle>
                    <CardDescription>
                        Online status is fetched from Redis runtime, not the
                        Postgres online column.
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead>ID</TableHead>
                                <TableHead>Player</TableHead>
                                <TableHead>Account</TableHead>
                                <TableHead>Level</TableHead>
                                <TableHead>Server</TableHead>
                                <TableHead>Map</TableHead>
                                <TableHead>Status</TableHead>
                                <TableHead>Last active</TableHead>
                                <TableHead>Actions</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {isLoading ? (
                                <TableRow>
                                    <TableCell
                                        colSpan={9}
                                        className="h-24 text-center text-muted-foreground"
                                    >
                                        Loading player list...
                                    </TableCell>
                                </TableRow>
                            ) : players.length === 0 ? (
                                <TableRow>
                                    <TableCell
                                        colSpan={9}
                                        className="h-24 text-center text-muted-foreground"
                                    >
                                        No players found.
                                    </TableCell>
                                </TableRow>
                            ) : (
                                players.map(player => (
                                    <TableRow key={player.id}>
                                        <TableCell className="font-mono">
                                            {player.id}
                                        </TableCell>
                                        <TableCell>
                                            <div className="flex items-center gap-3">
                                                <Avatar className="h-8 w-8">
                                                    <AvatarFallback>
                                                        {getPlayerInitials(
                                                            player
                                                        )}
                                                    </AvatarFallback>
                                                </Avatar>
                                                <div className="space-y-0.5">
                                                    <p className="font-medium">
                                                        {player.playerName}
                                                    </p>
                                                    <p className="text-xs text-muted-foreground">
                                                        UID {player.playerUid}
                                                    </p>
                                                </div>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            {player.accountName}
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant="secondary">
                                                {player.level}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            {player.serverKey}
                                        </TableCell>
                                        <TableCell>
                                            {player.mapId}
                                            {player.instanceId > 0
                                                ? ` / ${player.instanceId}`
                                                : ""}
                                        </TableCell>
                                        <TableCell>
                                            <Badge
                                                variant={
                                                    player.online
                                                        ? "success"
                                                        : "secondary"
                                                }
                                            >
                                                {player.online
                                                    ? "Online"
                                                    : "Offline"}
                                            </Badge>
                                        </TableCell>
                                        <TableCell className="text-sm">
                                            {formatDateTime(player.lastSeenAt)}
                                        </TableCell>
                                        <TableCell>
                                            <div className="flex items-center gap-1">
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    onClick={() =>
                                                        setSelectedPlayer(
                                                            player
                                                        )
                                                    }
                                                >
                                                    <Eye className="mr-1 h-4 w-4" />
                                                    View
                                                </Button>
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    onClick={() =>
                                                        router.push(
                                                            `/dashboard/players/${player.id}`
                                                        )
                                                    }
                                                >
                                                    <Settings className="mr-1 h-4 w-4" />
                                                    Manage
                                                </Button>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>

            <Dialog
                open={selectedPlayer !== null}
                onOpenChange={open => !open && setSelectedPlayer(null)}
            >
                <DialogContent className="max-w-3xl">
                    <DialogHeader>
                        <DialogTitle>
                            {selectedPlayer?.playerName ?? "Player detail"}
                        </DialogTitle>
                        <DialogDescription>
                            Player ID {selectedPlayer?.id ?? "-"} | UID{" "}
                            {selectedPlayer?.playerUid ?? "-"}
                        </DialogDescription>
                    </DialogHeader>

                    {selectedPlayer ? (
                        <div className="grid gap-4 md:grid-cols-2">
                            <DetailField
                                label="Account"
                                value={selectedPlayer.accountName}
                            />
                            <DetailField
                                label="Server"
                                value={`${selectedPlayer.serverKey} (#${selectedPlayer.serverId})`}
                            />
                            <DetailField
                                label="Level"
                                value={String(selectedPlayer.level)}
                            />
                            <DetailField
                                label="Sex"
                                value={formatSexLabel(selectedPlayer.sex)}
                            />
                            <DetailField
                                label="Map / Instance"
                                value={`${selectedPlayer.mapId} / ${selectedPlayer.instanceId}`}
                            />
                            <DetailField
                                label="Position"
                                value={`${selectedPlayer.position.x}, ${selectedPlayer.position.y}`}
                            />
                            <DetailField
                                label="Online"
                                value={
                                    selectedPlayer.online ? "Online" : "Offline"
                                }
                            />
                            <DetailField
                                label="Last seen"
                                value={formatDateTime(
                                    selectedPlayer.lastSeenAt
                                )}
                            />
                            <DetailField
                                label="Last login"
                                value={formatDateTime(
                                    selectedPlayer.lastLoginAt
                                )}
                            />
                            <DetailField
                                label="Last move"
                                value={formatDateTime(
                                    selectedPlayer.lastMoveAt
                                )}
                            />
                            <DetailField
                                label="Updated at"
                                value={formatDateTime(selectedPlayer.updatedAt)}
                            />
                            <DetailField
                                label="Created at"
                                value={formatDateTime(selectedPlayer.createdAt)}
                            />
                        </div>
                    ) : null}
                </DialogContent>
            </Dialog>
        </div>
    )
}
