"use client"

import { useState } from "react"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
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
import { Shield, Ban, Unlock, VolumeX, UserX, Gift, Search } from "lucide-react"

// Constants
import {
    ACTION_TYPES,
    ACTION_STATUS,
    BAN_DURATIONS,
    COMPENSATION_TYPES,
} from "@/constants/actions"

// Types
import type { ActionHistory, RecentGMAction } from "@/types"

// Icons map
const ACTION_ICONS: Record<
    string,
    React.ComponentType<{ className?: string }>
> = {
    ban: Ban,
    unban: Unlock,
    mute: VolumeX,
    kick: UserX,
}

// Hooks
import { usePlayerActions } from "@/hooks/use-actions"

export default function ActionsPage() {
    const [searchPlayer, setSearchPlayer] = useState("")
    const [selectedAction, setSelectedAction] = useState("")
    const [reason, setReason] = useState("")
    const [duration, setDuration] = useState("60")
    const [compensationType, setCompensationType] = useState("currency")

    // Actions
    const { banPlayer, unbanPlayer, mutePlayer, kickPlayer, compensatePlayer } =
        usePlayerActions()

    const recentActions: RecentGMAction[] = []
    const actionHistory: ActionHistory[] = []

    const handleAction = (actionType: string) => {
        const durationText =
            duration === "-1" ? "Permanent" : `${duration} minutes`

        switch (actionType) {
            case "ban":
                banPlayer(searchPlayer, reason)
                break
            case "unban":
                unbanPlayer(searchPlayer)
                break
            case "mute":
                mutePlayer(searchPlayer, parseInt(duration))
                break
            case "kick":
                kickPlayer(searchPlayer)
                break
        }

        setSearchPlayer("")
        setReason("")
        setSelectedAction("")
    }

    const getActionConfig = (type: string) =>
        ACTION_TYPES[type as keyof typeof ACTION_TYPES]
    const getStatusConfig = (status: string) =>
        ACTION_STATUS[status as keyof typeof ACTION_STATUS]

    return (
        <div className="space-y-6">
            <Tabs defaultValue="actions" className="space-y-4">
                <TabsList>
                    <TabsTrigger value="actions">Execute action</TabsTrigger>
                    <TabsTrigger value="compensate">Compensate</TabsTrigger>
                    <TabsTrigger value="history">Action history</TabsTrigger>
                </TabsList>

                <TabsContent value="actions" className="space-y-4">
                    <Card>
                        <CardHeader>
                            <CardTitle>Select action</CardTitle>
                            <CardDescription>
                                Choose the GM action to perform
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-6">
                            {/* Player Search */}
                            <div>
                                <Label>Search player</Label>
                                <div className="flex gap-2 mt-2">
                                    <div className="relative flex-1">
                                        <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                        <Input
                                            placeholder="Enter player name or ID..."
                                            value={searchPlayer}
                                            onChange={e =>
                                                setSearchPlayer(e.target.value)
                                            }
                                            className="pl-10"
                                        />
                                    </div>
                                    <Button variant="outline">Search</Button>
                                </div>
                            </div>

                            {/* Action Type Selection */}
                            <div>
                                <Label>Action type</Label>
                                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-2">
                                    {Object.entries(ACTION_TYPES).map(
                                        ([id, config]) => {
                                            const Icon =
                                                ACTION_ICONS[id] || Shield
                                            return (
                                                <Card
                                                    key={id}
                                                    className={`cursor-pointer transition-all ${
                                                        selectedAction === id
                                                            ? "ring-2 ring-primary bg-primary/5"
                                                            : "hover:bg-accent"
                                                    }`}
                                                    onClick={() =>
                                                        setSelectedAction(id)
                                                    }
                                                >
                                                    <CardContent className="p-4">
                                                        <div className="flex flex-col items-center text-center gap-2">
                                                            <div
                                                                className={`p-2 rounded-full ${
                                                                    config.color ===
                                                                    "destructive"
                                                                        ? "bg-red-500/20 text-red-500"
                                                                        : config.color ===
                                                                            "secondary"
                                                                          ? "bg-gray-500/20 text-gray-500"
                                                                          : config.color ===
                                                                              "warning"
                                                                            ? "bg-yellow-500/20 text-yellow-500"
                                                                            : "bg-primary/20 text-primary"
                                                                }`}
                                                            >
                                                                <Icon className="h-5 w-5" />
                                                            </div>
                                                            <div>
                                                                <p className="font-medium text-sm">
                                                                    {
                                                                        config.label
                                                                    }
                                                                </p>
                                                                <p className="text-xs text-muted-foreground">
                                                                    {
                                                                        config.description
                                                                    }
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </CardContent>
                                                </Card>
                                            )
                                        }
                                    )}
                                </div>
                            </div>

                            {/* Action Details */}
                            {selectedAction && (
                                <Card className="border-primary/50">
                                    <CardHeader>
                                        <CardTitle className="text-lg">
                                            Action details
                                        </CardTitle>
                                    </CardHeader>
                                    <CardContent className="space-y-4">
                                        <div>
                                            <Label>Reason</Label>
                                            <Textarea
                                                placeholder="Enter reason for this action..."
                                                value={reason}
                                                onChange={e =>
                                                    setReason(e.target.value)
                                                }
                                                className="min-h-[80px]"
                                            />
                                        </div>

                                        {(selectedAction === "ban" ||
                                            selectedAction === "mute") && (
                                            <div>
                                                <Label>
                                                    Duration (minutes)
                                                </Label>
                                                <Select
                                                    value={duration}
                                                    onValueChange={setDuration}
                                                >
                                                    <SelectTrigger>
                                                        <SelectValue />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        {BAN_DURATIONS.map(
                                                            dur => (
                                                                <SelectItem
                                                                    key={
                                                                        dur.value
                                                                    }
                                                                    value={
                                                                        dur.value
                                                                    }
                                                                >
                                                                    {dur.label}
                                                                </SelectItem>
                                                            )
                                                        )}
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                        )}

                                        <div className="flex gap-2 pt-4">
                                            <Button
                                                variant="outline"
                                                className="flex-1"
                                                onClick={() => {
                                                    setSelectedAction("")
                                                    setReason("")
                                                }}
                                            >
                                                Cancel
                                            </Button>
                                            <AlertDialog>
                                                <AlertDialogTrigger asChild>
                                                    <Button
                                                        variant={
                                                            selectedAction ===
                                                            "ban"
                                                                ? "destructive"
                                                                : "default"
                                                        }
                                                        className="flex-1"
                                                        disabled={
                                                            !searchPlayer ||
                                                            !reason
                                                        }
                                                    >
                                                        Confirm
                                                    </Button>
                                                </AlertDialogTrigger>
                                                <AlertDialogContent>
                                                    <AlertDialogHeader>
                                                        <AlertDialogTitle>
                                                            Confirm action?
                                                        </AlertDialogTitle>
                                                        <AlertDialogDescription>
                                                            You are performing{" "}
                                                            <strong>
                                                                {
                                                                    getActionConfig(
                                                                        selectedAction
                                                                    )?.label
                                                                }
                                                            </strong>{" "}
                                                            on player{" "}
                                                            <strong>
                                                                {searchPlayer}
                                                            </strong>
                                                            .
                                                            <br />
                                                            <br />
                                                            Reason: {reason}
                                                            {(selectedAction ===
                                                                "ban" ||
                                                                selectedAction ===
                                                                    "mute") && (
                                                                <>
                                                                    <br />
                                                                    Duration:{" "}
                                                                    {duration ===
                                                                    "-1"
                                                                        ? "Permanent"
                                                                        : `${duration} minutes`}
                                                                </>
                                                            )}
                                                            <br />
                                                            <br />
                                                            This action will be
                                                            recorded in the
                                                            history.
                                                        </AlertDialogDescription>
                                                    </AlertDialogHeader>
                                                    <AlertDialogFooter>
                                                        <AlertDialogCancel>
                                                            Cancel
                                                        </AlertDialogCancel>
                                                        <AlertDialogAction
                                                            onClick={() =>
                                                                handleAction(
                                                                    selectedAction
                                                                )
                                                            }
                                                        >
                                                            Confirm action
                                                        </AlertDialogAction>
                                                    </AlertDialogFooter>
                                                </AlertDialogContent>
                                            </AlertDialog>
                                        </div>
                                    </CardContent>
                                </Card>
                            )}
                        </CardContent>
                    </Card>

                    {/* Recent Actions */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Recent actions</CardTitle>
                        </CardHeader>
                        <CardContent>
                            {recentActions.length === 0 ? (
                                <p className="text-sm text-muted-foreground">
                                    No recent actions.
                                </p>
                            ) : (
                                <div className="space-y-3">
                                    {recentActions.map(action => {
                                        const config = getActionConfig(
                                            action.type
                                        )
                                        const Icon =
                                            ACTION_ICONS[action.type] || Shield
                                        return (
                                            <div
                                                key={action.id}
                                                className="flex items-center gap-3 p-3 bg-muted/50 rounded-lg"
                                            >
                                                <Icon className="h-5 w-5 text-muted-foreground" />
                                                <div className="flex-1">
                                                    <p className="text-sm">
                                                        <span className="font-medium">
                                                            {action.admin}
                                                        </span>{" "}
                                                        performed{" "}
                                                        <span className="font-medium">
                                                            {config?.label}
                                                        </span>{" "}
                                                        on{" "}
                                                        <span className="font-medium">
                                                            {action.target}
                                                        </span>
                                                    </p>
                                                    <p className="text-xs text-muted-foreground">
                                                        {action.reason}
                                                    </p>
                                                </div>
                                                <span className="text-xs text-muted-foreground">
                                                    {action.time}
                                                </span>
                                            </div>
                                        )
                                    })}
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>

                <TabsContent value="compensate" className="space-y-4">
                    <Card>
                        <CardHeader>
                            <CardTitle>Compensate player</CardTitle>
                            <CardDescription>
                                Send compensation items or currency to players
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div>
                                <Label>
                                    Recipient player (leave empty for all)
                                </Label>
                                <Input placeholder="Enter player name or ID..." />
                            </div>

                            <div>
                                <Label>Compensation type</Label>
                                <Select
                                    value={compensationType}
                                    onValueChange={setCompensationType}
                                >
                                    <SelectTrigger>
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {Object.entries(COMPENSATION_TYPES).map(
                                            ([key, config]) => (
                                                <SelectItem
                                                    key={key}
                                                    value={key}
                                                >
                                                    {config.label}
                                                </SelectItem>
                                            )
                                        )}
                                    </SelectContent>
                                </Select>
                            </div>

                            {compensationType === "currency" ||
                            compensationType === "both" ? (
                                <div className="grid grid-cols-3 gap-4">
                                    <div>
                                        <Label>Gold</Label>
                                        <Input type="number" placeholder="0" />
                                    </div>
                                    <div>
                                        <Label>Gems</Label>
                                        <Input type="number" placeholder="0" />
                                    </div>
                                    <div>
                                        <Label>Coins</Label>
                                        <Input type="number" placeholder="0" />
                                    </div>
                                </div>
                            ) : null}

                            {compensationType === "item" ||
                            compensationType === "both" ? (
                                <div>
                                    <Label>Item IDs (comma separated)</Label>
                                    <Input placeholder="item001, item002, item003" />
                                    <p className="text-xs text-muted-foreground mt-1">
                                        Example: potion_hp, sword_epic
                                    </p>
                                </div>
                            ) : null}

                            <div>
                                <Label>Quantity per item</Label>
                                <Input
                                    type="number"
                                    placeholder="1"
                                    defaultValue="1"
                                />
                            </div>

                            <div>
                                <Label>Compensation reason</Label>
                                <Textarea
                                    placeholder="Enter reason..."
                                    className="min-h-[80px]"
                                />
                            </div>

                            <AlertDialog>
                                <AlertDialogTrigger asChild>
                                    <Button className="w-full">
                                        <Gift className="h-4 w-4 mr-2" />
                                        Send compensation
                                    </Button>
                                </AlertDialogTrigger>
                                <AlertDialogContent>
                                    <AlertDialogHeader>
                                        <AlertDialogTitle>
                                            Confirm send compensation?
                                        </AlertDialogTitle>
                                        <AlertDialogDescription>
                                            Please review the information
                                            carefully before sending. This
                                            action cannot be undone.
                                        </AlertDialogDescription>
                                    </AlertDialogHeader>
                                    <AlertDialogFooter>
                                        <AlertDialogCancel>
                                            Cancel
                                        </AlertDialogCancel>
                                        <AlertDialogAction>
                                            Confirm send
                                        </AlertDialogAction>
                                    </AlertDialogFooter>
                                </AlertDialogContent>
                            </AlertDialog>
                        </CardContent>
                    </Card>
                </TabsContent>

                <TabsContent value="history" className="space-y-4">
                    <Card>
                        <CardHeader>
                            <CardTitle>GM action history</CardTitle>
                            <CardDescription>
                                All actions that have been performed
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            {actionHistory.length === 0 ? (
                                <p className="text-sm text-muted-foreground">
                                    No action history.
                                </p>
                            ) : (
                                <div className="space-y-3">
                                    {actionHistory.map(action => {
                                        const Icon =
                                            ACTION_ICONS[action.type] || Shield
                                        const statusConfig = getStatusConfig(
                                            action.status
                                        )
                                        return (
                                            <div
                                                key={action.id}
                                                className="flex items-center gap-3 p-4 border rounded-lg"
                                            >
                                                <div
                                                    className={`p-2 rounded-full ${
                                                        action.type === "ban"
                                                            ? "bg-red-500/20 text-red-500"
                                                            : action.type ===
                                                                "mute"
                                                              ? "bg-gray-500/20 text-gray-500"
                                                              : action.type ===
                                                                  "unban"
                                                                ? "bg-green-500/20 text-green-500"
                                                                : "bg-blue-500/20 text-blue-500"
                                                    }`}
                                                >
                                                    <Icon className="h-4 w-4" />
                                                </div>
                                                <div className="flex-1">
                                                    <div className="flex items-center gap-2">
                                                        <span className="font-medium">
                                                            {action.admin}
                                                        </span>
                                                        <span className="text-sm text-muted-foreground">
                                                            did
                                                        </span>
                                                        <span className="font-medium capitalize">
                                                            {action.type}
                                                        </span>
                                                        <span className="font-medium">
                                                            {action.target}
                                                        </span>
                                                        <Badge
                                                            variant={
                                                                statusConfig.variant
                                                            }
                                                        >
                                                            {statusConfig.label}
                                                        </Badge>
                                                    </div>
                                                    <p className="text-sm text-muted-foreground">
                                                        {action.reason}
                                                    </p>
                                                </div>
                                                <div className="text-right text-sm">
                                                    <p>{action.duration}</p>
                                                    <p className="text-muted-foreground">
                                                        {action.time}
                                                    </p>
                                                </div>
                                            </div>
                                        )
                                    })}
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>
            </Tabs>
        </div>
    )
}
