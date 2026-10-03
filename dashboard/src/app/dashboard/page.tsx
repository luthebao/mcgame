"use client"

import Link from "next/link"
import { useCallback, useEffect, useState } from "react"
import { toast } from "sonner"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Switch } from "@/components/ui/switch"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from "@/components/ui/alert-dialog"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import {
    gatewayConfigService,
    type GatewayLine,
} from "@/services/gateway-config.service"
import { gameConfigService } from "@/services/game-config.service"

const STATUS_COLORS: Record<GatewayLine["status"], "default" | "secondary" | "destructive"> = {
    online: "default",
    maintenance: "secondary",
    offline: "destructive",
}

const MAINTENANCE_KEY = "maintenance_mode"

export default function DashboardPage() {
    const [lines, setLines] = useState<GatewayLine[]>([])
    const [loading, setLoading] = useState(true)
    const [deleteTarget, setDeleteTarget] = useState<GatewayLine | null>(null)
    const [maintenance, setMaintenance] = useState<boolean | null>(null)
    const [pendingMaintenance, setPendingMaintenance] = useState<boolean | null>(null)
    const [maintenanceBusy, setMaintenanceBusy] = useState(false)

    const refresh = useCallback(async () => {
        setLoading(true)
        try {
            const [linesData, serverSettings] = await Promise.all([
                gatewayConfigService.list(),
                gameConfigService.list("server"),
            ])
            setLines(linesData)
            const entry = serverSettings.find(item => item.key === MAINTENANCE_KEY)
            setMaintenance(Boolean(entry?.value))
        } catch (error) {
            toast.error(error instanceof Error ? error.message : "Failed to load dashboard")
        } finally {
            setLoading(false)
        }
    }, [])

    useEffect(() => {
        void refresh()
    }, [refresh])

    async function handleStatusChange(line: GatewayLine, next: GatewayLine["status"]) {
        try {
            const updated = await gatewayConfigService.update(line.id, { status: next })
            setLines(prev => prev.map(l => (l.id === updated.id ? updated : l)))
            toast.success(`Line ${line.id} set to ${next}`)
        } catch (error) {
            toast.error(error instanceof Error ? error.message : "Status update failed")
        }
    }

    async function handleDelete() {
        if (!deleteTarget) return
        try {
            await gatewayConfigService.remove(deleteTarget.id)
            setLines(prev => prev.filter(l => l.id !== deleteTarget.id))
            toast.success(`Line ${deleteTarget.id} deleted`)
        } catch (error) {
            toast.error(error instanceof Error ? error.message : "Delete failed")
        } finally {
            setDeleteTarget(null)
        }
    }

    async function commitMaintenance() {
        if (pendingMaintenance === null) return
        const next = pendingMaintenance
        setMaintenanceBusy(true)
        try {
            const item = await gameConfigService.upsert("server", {
                key: MAINTENANCE_KEY,
                value: next,
            })
            setMaintenance(Boolean(item.value))
            toast.success(
                next
                    ? "Maintenance enabled — all connected players are being kicked"
                    : "Maintenance disabled — logins re-enabled",
            )
        } catch (error) {
            toast.error(error instanceof Error ? error.message : "Failed to update maintenance mode")
        } finally {
            setMaintenanceBusy(false)
            setPendingMaintenance(null)
        }
    }

    return (
        <div className="space-y-6 p-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold">Gateway Lines</h1>
                    <p className="text-sm text-muted-foreground">
                        Live operator config for the line list served via getLineInfo. Changes propagate in &lt;1s.
                        Flipping a line to offline/maintenance kicks all connected players on that line.
                    </p>
                </div>
                <Button asChild>
                    <Link href="/dashboard/lines/new">New Line</Link>
                </Button>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Global maintenance</CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="flex items-center justify-between gap-4">
                        <div className="space-y-1">
                            <p className="text-sm font-medium">
                                Maintenance mode
                                {maintenance === true ? (
                                    <Badge variant="destructive" className="ml-2">enabled</Badge>
                                ) : maintenance === false ? (
                                    <Badge variant="secondary" className="ml-2">disabled</Badge>
                                ) : null}
                            </p>
                            <p className="text-sm text-muted-foreground">
                                When enabled, all logins are blocked and every connected player is kicked.
                            </p>
                        </div>
                        <Switch
                            checked={Boolean(maintenance)}
                            disabled={maintenance === null || maintenanceBusy}
                            onCheckedChange={value => setPendingMaintenance(value)}
                        />
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader>
                    <CardTitle>Configured lines ({lines.length})</CardTitle>
                </CardHeader>
                <CardContent>
                    {loading ? (
                        <p className="text-sm text-muted-foreground">Loading…</p>
                    ) : lines.length === 0 ? (
                        <p className="text-sm text-muted-foreground">
                            No lines yet. Create one to start advertising channels to the Flash client.
                        </p>
                    ) : (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>ID</TableHead>
                                    <TableHead>Name</TableHead>
                                    <TableHead>URL</TableHead>
                                    <TableHead className="text-right">Max</TableHead>
                                    <TableHead>Auction</TableHead>
                                    <TableHead>Guild</TableHead>
                                    <TableHead>Status</TableHead>
                                    <TableHead className="text-right">Actions</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {lines.map(line => (
                                    <TableRow key={line.id}>
                                        <TableCell>{line.id}</TableCell>
                                        <TableCell className="font-medium">{line.name}</TableCell>
                                        <TableCell className="font-mono text-xs">{line.url}</TableCell>
                                        <TableCell className="text-right">{line.max_clients}</TableCell>
                                        <TableCell>
                                            <Badge variant={line.auction ? "default" : "outline"}>
                                                {line.auction ? "yes" : "no"}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant={line.guild ? "default" : "outline"}>
                                                {line.guild ? "yes" : "no"}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            <Select
                                                value={line.status}
                                                onValueChange={value =>
                                                    handleStatusChange(line, value as GatewayLine["status"])
                                                }
                                            >
                                                <SelectTrigger className="w-[140px]">
                                                    <SelectValue>
                                                        <Badge variant={STATUS_COLORS[line.status]}>
                                                            {line.status}
                                                        </Badge>
                                                    </SelectValue>
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="online">online</SelectItem>
                                                    <SelectItem value="maintenance">maintenance</SelectItem>
                                                    <SelectItem value="offline">offline</SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </TableCell>
                                        <TableCell className="text-right space-x-2">
                                            <Button variant="outline" size="sm" asChild>
                                                <Link href={`/dashboard/lines/${line.id}`}>Edit</Link>
                                            </Button>
                                            <Button
                                                variant="destructive"
                                                size="sm"
                                                onClick={() => setDeleteTarget(line)}
                                            >
                                                Delete
                                            </Button>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    )}
                </CardContent>
            </Card>

            <AlertDialog open={deleteTarget !== null} onOpenChange={open => !open && setDeleteTarget(null)}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Delete line {deleteTarget?.id}?</AlertDialogTitle>
                        <AlertDialogDescription>
                            The Flash client will stop advertising this line within ~1 second. Already-connected
                            players are not kicked. This action is irreversible.
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel>Cancel</AlertDialogCancel>
                        <AlertDialogAction onClick={handleDelete}>Delete</AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>

            <AlertDialog
                open={pendingMaintenance !== null}
                onOpenChange={open => !open && !maintenanceBusy && setPendingMaintenance(null)}
            >
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>
                            {pendingMaintenance
                                ? "Enable maintenance mode?"
                                : "Disable maintenance mode?"}
                        </AlertDialogTitle>
                        <AlertDialogDescription>
                            {pendingMaintenance
                                ? "All currently-connected players will be kicked within ~1 second, and new logins will be rejected with a 'server not ready' message until this is turned off."
                                : "Logins will be re-enabled immediately. Connected players (if any) are unaffected."}
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel disabled={maintenanceBusy}>Cancel</AlertDialogCancel>
                        <AlertDialogAction onClick={commitMaintenance} disabled={maintenanceBusy}>
                            {maintenanceBusy ? "Applying…" : "Confirm"}
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </div>
    )
}
