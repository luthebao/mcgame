"use client"

import { useState } from "react"
import { toast as sonnerToast } from "sonner"
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from "@/components/ui/alert-dialog"
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
    DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Progress } from "@/components/ui/progress"
import { Switch } from "@/components/ui/switch"
import { Textarea } from "@/components/ui/textarea"
import { Clock, Cpu, HardDrive, Megaphone, RefreshCw } from "lucide-react"

import { RESOURCE_THRESHOLDS, SERVER_STATUS_CONFIG } from "@/constants/server"
import { useServerActions } from "@/hooks/use-actions"
import { getErrorMessage } from "@/services/api"
import { adminNoticeService } from "@/services/admin-notice.service"
import type { Server } from "@/types"

const adminBroadcastMessageMaxLength = 1024
const defaultAdminSenderColor = "#3399FF"
const defaultAdminMessageColor = "#FFFFFF"

export default function ServerPage() {
    const [servers, setServers] = useState<Server[]>([])
    const [broadcastMessage, setBroadcastMessage] = useState("")
    const [broadcastError, setBroadcastError] = useState<string | null>(null)
    const [isBroadcastDialogOpen, setIsBroadcastDialogOpen] = useState(false)
    const [isBroadcasting, setIsBroadcasting] = useState(false)
    const [broadcastSenderColor, setBroadcastSenderColor] = useState(
        defaultAdminSenderColor
    )
    const [broadcastMessageColor, setBroadcastMessageColor] = useState(
        defaultAdminMessageColor
    )

    const { restartServer, toggleMaintenance } = useServerActions()

    const remainingBroadcastChars =
        adminBroadcastMessageMaxLength - broadcastMessage.length
    const previewMessage =
        broadcastMessage.trim() ||
        "Notification content will be displayed here."

    const getStatusColor = (status: keyof typeof SERVER_STATUS_CONFIG) =>
        SERVER_STATUS_CONFIG[status].color
    const getStatusIcon = (status: keyof typeof SERVER_STATUS_CONFIG) => {
        const Icon = SERVER_STATUS_CONFIG[status].icon
        return <Icon className="h-4 w-4" />
    }

    const resetBroadcastColors = () => {
        setBroadcastSenderColor(defaultAdminSenderColor)
        setBroadcastMessageColor(defaultAdminMessageColor)
    }

    const handleRestart = (serverId: string) => {
        const server = servers.find(entry => entry.id === serverId)
        if (!server) {
            return
        }

        restartServer(server.name)
        setServers(current =>
            current.map(entry =>
                entry.id === serverId
                    ? { ...entry, status: "maintenance" as const, players: 0 }
                    : entry
            )
        )

        setTimeout(() => {
            setServers(current =>
                current.map(entry =>
                    entry.id === serverId
                        ? {
                              ...entry,
                              status: "online" as const,
                              players: Math.floor(Math.random() * 3000),
                          }
                        : entry
                )
            )
        }, 5000)
    }

    const handleToggleMaintenance = (serverId: string) => {
        setServers(current =>
            current.map(entry => {
                if (entry.id !== serverId) {
                    return entry
                }

                const isMaintenance = entry.status === "maintenance"
                const nextStatus = isMaintenance ? "online" : "maintenance"
                toggleMaintenance(entry.name, !isMaintenance)
                return {
                    ...entry,
                    status: nextStatus as "online" | "maintenance" | "offline",
                    players: isMaintenance
                        ? Math.floor(Math.random() * 3000)
                        : 0,
                }
            })
        )
    }

    const handleBroadcast = async () => {
        const message = broadcastMessage.trim()
        if (!message) {
            setBroadcastError("Notification content cannot be empty.")
            return
        }

        setIsBroadcasting(true)
        setBroadcastError(null)

        try {
            await adminNoticeService.broadcast({
                message,
                senderColor: broadcastSenderColor,
                messageColor: broadcastMessageColor,
            })
            sonnerToast.success("Server-wide notification sent", {
                description: message,
            })
            setBroadcastMessage("")
            setIsBroadcastDialogOpen(false)
        } catch (error) {
            const message = getErrorMessage(error)
            setBroadcastError(message)
            sonnerToast.error("Failed to send notification", {
                description: message,
            })
        } finally {
            setIsBroadcasting(false)
        }
    }

    const isResourceHigh = (value: number) => value >= RESOURCE_THRESHOLDS.HIGH

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-end">
                <Dialog
                    open={isBroadcastDialogOpen}
                    onOpenChange={open => {
                        setIsBroadcastDialogOpen(open)
                        if (!open) {
                            setBroadcastError(null)
                        }
                    }}
                >
                    <DialogTrigger asChild>
                        <Button variant="outline">
                            <Megaphone className="mr-2 h-4 w-4" />
                            Server-wide broadcast
                        </Button>
                    </DialogTrigger>
                    <DialogContent>
                        <DialogHeader>
                            <DialogTitle>
                                Send server-wide broadcast
                            </DialogTitle>
                            <DialogDescription>
                                This message will be sent via admin chat
                                endpoint to all online players.
                            </DialogDescription>
                        </DialogHeader>

                        <div className="space-y-4 py-4">
                            <div className="space-y-2">
                                <Label htmlFor="admin-broadcast-message">
                                    Notification content
                                </Label>
                                <Textarea
                                    id="admin-broadcast-message"
                                    placeholder="Enter notification content..."
                                    value={broadcastMessage}
                                    onChange={event => {
                                        setBroadcastMessage(event.target.value)
                                        if (broadcastError) {
                                            setBroadcastError(null)
                                        }
                                    }}
                                    className="min-h-[120px]"
                                    maxLength={adminBroadcastMessageMaxLength}
                                />
                                <div className="flex items-center justify-between text-xs text-muted-foreground">
                                    <span>
                                        Server will fanout as admin world chat.
                                    </span>
                                    <span>
                                        {remainingBroadcastChars} characters
                                        remaining
                                    </span>
                                </div>
                            </div>

                            <div className="grid gap-4 sm:grid-cols-2">
                                <div className="space-y-2">
                                    <Label htmlFor="admin-sender-color">
                                        [Admin] text color
                                    </Label>
                                    <div className="flex items-center gap-3">
                                        <Input
                                            id="admin-sender-color"
                                            type="color"
                                            value={broadcastSenderColor}
                                            onChange={event =>
                                                setBroadcastSenderColor(
                                                    event.target.value.toUpperCase()
                                                )
                                            }
                                            className="h-11 w-16 cursor-pointer p-1"
                                        />
                                        <div className="rounded-md border bg-muted/40 px-3 py-2 font-mono text-sm">
                                            {broadcastSenderColor}
                                        </div>
                                    </div>
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="admin-message-color">
                                        Message text color
                                    </Label>
                                    <div className="flex items-center gap-3">
                                        <Input
                                            id="admin-message-color"
                                            type="color"
                                            value={broadcastMessageColor}
                                            onChange={event =>
                                                setBroadcastMessageColor(
                                                    event.target.value.toUpperCase()
                                                )
                                            }
                                            className="h-11 w-16 cursor-pointer p-1"
                                        />
                                        <div className="rounded-md border bg-muted/40 px-3 py-2 font-mono text-sm">
                                            {broadcastMessageColor}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="rounded-lg border bg-muted/40 px-4 py-3">
                                <div className="flex items-center justify-between gap-3">
                                    <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
                                        Preview
                                    </p>
                                    <Button
                                        type="button"
                                        variant="ghost"
                                        className="h-8 px-2 text-xs"
                                        onClick={resetBroadcastColors}
                                    >
                                        Use default colors
                                    </Button>
                                </div>
                                <p className="mt-3 break-words text-sm leading-6">
                                    <span
                                        className="font-semibold underline"
                                        style={{ color: broadcastSenderColor }}
                                    >
                                        [Admin]
                                    </span>{" "}
                                    <span
                                        style={{ color: broadcastMessageColor }}
                                    >
                                        {previewMessage}
                                    </span>
                                </p>
                            </div>

                            {broadcastError ? (
                                <div className="rounded-lg border border-destructive/30 bg-destructive/10 px-3 py-2 text-sm text-destructive">
                                    {broadcastError}
                                </div>
                            ) : null}
                        </div>

                        <div className="flex justify-end">
                            <Button
                                onClick={() => void handleBroadcast()}
                                disabled={
                                    isBroadcasting || !broadcastMessage.trim()
                                }
                            >
                                {isBroadcasting
                                    ? "Sending..."
                                    : "Send notification"}
                            </Button>
                        </div>
                    </DialogContent>
                </Dialog>
            </div>

            {servers.length === 0 ? (
                <Card>
                    <CardContent className="py-8">
                        <p className="text-sm text-muted-foreground text-center">
                            No servers configured.
                        </p>
                    </CardContent>
                </Card>
            ) : (
                <div className="grid gap-6 md:grid-cols-2">
                    {servers.map(server => (
                        <Card key={server.id}>
                            <CardHeader>
                                <div className="flex items-start justify-between">
                                    <div>
                                        <CardTitle className="text-lg">
                                            {server.name}
                                        </CardTitle>
                                        <CardDescription>
                                            ID: {server.id}
                                        </CardDescription>
                                    </div>
                                    <Badge
                                        variant={getStatusColor(server.status)}
                                        className="capitalize"
                                    >
                                        <span className="flex items-center gap-1">
                                            {getStatusIcon(server.status)}
                                            {server.status}
                                        </span>
                                    </Badge>
                                </div>
                            </CardHeader>
                            <CardContent className="space-y-6">
                                <div>
                                    <div className="mb-2 flex items-center justify-between">
                                        <span className="text-sm text-muted-foreground">
                                            Players
                                        </span>
                                        <span className="text-sm font-medium">
                                            {server.players} /{" "}
                                            {server.maxPlayers}
                                        </span>
                                    </div>
                                    <Progress
                                        value={
                                            (server.players /
                                                server.maxPlayers) *
                                            100
                                        }
                                    />
                                </div>

                                <div>
                                    <div className="mb-2 flex items-center justify-between">
                                        <span className="flex items-center gap-1 text-sm text-muted-foreground">
                                            <Cpu className="h-3 w-3" />
                                            CPU Usage
                                        </span>
                                        <span className="text-sm font-medium">
                                            {server.cpu}%
                                        </span>
                                    </div>
                                    <Progress
                                        value={server.cpu}
                                        className={
                                            isResourceHigh(server.cpu)
                                                ? "bg-red-500"
                                                : ""
                                        }
                                    />
                                </div>

                                <div>
                                    <div className="mb-2 flex items-center justify-between">
                                        <span className="flex items-center gap-1 text-sm text-muted-foreground">
                                            <HardDrive className="h-3 w-3" />
                                            Memory Usage
                                        </span>
                                        <span className="text-sm font-medium">
                                            {server.memory}%
                                        </span>
                                    </div>
                                    <Progress
                                        value={server.memory}
                                        className={
                                            isResourceHigh(server.memory)
                                                ? "bg-red-500"
                                                : ""
                                        }
                                    />
                                </div>

                                <div className="grid grid-cols-2 gap-4 border-t pt-4">
                                    <div>
                                        <p className="flex items-center gap-1 text-xs text-muted-foreground">
                                            <Clock className="h-3 w-3" />
                                            Uptime
                                        </p>
                                        <p className="text-sm font-medium">
                                            {server.uptime}
                                        </p>
                                    </div>
                                    <div>
                                        <p className="text-xs text-muted-foreground">
                                            Last Restart
                                        </p>
                                        <p className="text-sm font-medium">
                                            {server.lastRestart}
                                        </p>
                                    </div>
                                </div>

                                <div className="flex flex-col gap-2 border-t pt-4">
                                    <div className="flex items-center justify-between">
                                        <span className="text-sm">
                                            Maintenance Mode
                                        </span>
                                        <Switch
                                            checked={
                                                server.status === "maintenance"
                                            }
                                            onCheckedChange={() =>
                                                handleToggleMaintenance(
                                                    server.id
                                                )
                                            }
                                            disabled={
                                                server.status === "offline"
                                            }
                                        />
                                    </div>

                                    <AlertDialog>
                                        <AlertDialogTrigger asChild>
                                            <Button
                                                variant="outline"
                                                className="w-full"
                                                disabled={
                                                    server.status === "offline"
                                                }
                                            >
                                                <RefreshCw className="mr-2 h-4 w-4" />
                                                Restart Server
                                            </Button>
                                        </AlertDialogTrigger>
                                        <AlertDialogContent>
                                            <AlertDialogHeader>
                                                <AlertDialogTitle>
                                                    Confirm server restart?
                                                </AlertDialogTitle>
                                                <AlertDialogDescription>
                                                    This action will disconnect
                                                    all players from{" "}
                                                    {server.name}. The server
                                                    will take approximately 2-5
                                                    minutes to restart.
                                                </AlertDialogDescription>
                                            </AlertDialogHeader>
                                            <AlertDialogFooter>
                                                <AlertDialogCancel>
                                                    Cancel
                                                </AlertDialogCancel>
                                                <AlertDialogAction
                                                    onClick={() =>
                                                        handleRestart(server.id)
                                                    }
                                                >
                                                    Confirm restart
                                                </AlertDialogAction>
                                            </AlertDialogFooter>
                                        </AlertDialogContent>
                                    </AlertDialog>
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            )}
        </div>
    )
}
