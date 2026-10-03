"use client"

import { useEffect, useMemo, useState } from "react"
import { useQuery } from "@tanstack/react-query"
import { Package, Search } from "lucide-react"

import { Button } from "@/components/ui/button"
import {
    Dialog,
    DialogContent,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Switch } from "@/components/ui/switch"
import { Badge } from "@/components/ui/badge"
import { cn } from "@/lib/utils"
import { useDebounce } from "@/hooks/use-common"
import { itemService, type ItemBrowserRow } from "@/services/item.service"
import { playerService } from "@/services/player.service"

type AddItemDialogProps = {
    open: boolean
    playerId: number
    onOpenChange: (open: boolean) => void
    onSuccess: () => void
}

export function AddItemDialog({
    open,
    playerId,
    onOpenChange,
    onSuccess,
}: AddItemDialogProps) {
    const [search, setSearch] = useState("")
    const debouncedSearch = useDebounce(search, 350)
    const [selected, setSelected] = useState<ItemBrowserRow | null>(null)
    const [count, setCount] = useState("1")
    const [binded, setBinded] = useState(false)
    const [colorOverride, setColorOverride] = useState("")
    const [preNameType, setPreNameType] = useState("")
    const [sending, setSending] = useState(false)
    const [status, setStatus] = useState<string>("")

    useEffect(() => {
        if (!open) {
            setSearch("")
            setSelected(null)
            setCount("1")
            setBinded(false)
            setColorOverride("")
            setPreNameType("")
            setStatus("")
        }
    }, [open])

    const { data, isLoading } = useQuery({
        queryKey: ["items-search-picker", debouncedSearch],
        queryFn: () =>
            itemService.search({
                search: debouncedSearch || undefined,
                pageSize: 24,
                page: 1,
                sortBy: "name",
                sortDir: "asc",
            }),
        enabled: open,
        staleTime: 10_000,
    })

    const items = useMemo<ItemBrowserRow[]>(() => data?.items ?? [], [data])

    const handleSubmit = async () => {
        if (!selected) {
            setStatus("Pick an item first")
            return
        }
        const n = Number(count)
        if (!Number.isFinite(n) || n <= 0) {
            setStatus("Count must be > 0")
            return
        }
        if (n > selected.maxStack * 30) {
            setStatus(
                `Too many — max ${selected.maxStack * 30} across 30 slots`
            )
            return
        }

        const asInt = (v: string) => {
            if (v === "") return undefined
            const parsed = Number(v)
            return Number.isFinite(parsed) ? Math.trunc(parsed) : undefined
        }

        setSending(true)
        setStatus("Sending...")
        try {
            const res = await playerService.sendItem({
                playerId,
                itemId: selected.itemId,
                templateTableId: selected.templateTableId,
                count: Math.trunc(n),
                createdBy: "admin-dashboard",
                options: {
                    binded,
                    color: asInt(colorOverride),
                    preNameType: asInt(preNameType),
                },
            })
            if (!res.ok) {
                setStatus(res.statusMessage || "Failed to send item")
                return
            }
            setStatus(res.statusMessage || "Item added")
            onSuccess()
            setTimeout(() => onOpenChange(false), 700)
        } catch (err) {
            setStatus(
                `Error: ${err instanceof Error ? err.message : String(err)}`
            )
        } finally {
            setSending(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="max-w-2xl">
                <DialogHeader>
                    <DialogTitle className="flex items-center gap-2">
                        <Package className="h-5 w-5" /> Add Item
                    </DialogTitle>
                </DialogHeader>

                <div className="space-y-3">
                    <div className="relative">
                        <Search className="pointer-events-none absolute left-2 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                        <Input
                            className="pl-8"
                            placeholder="Search by name or ID..."
                            value={search}
                            onChange={e => setSearch(e.target.value)}
                            autoFocus
                        />
                    </div>

                    <div className="h-64 overflow-y-auto rounded-md border border-border/60 bg-muted/20 p-2">
                        {isLoading ? (
                            <p className="py-6 text-center text-sm text-muted-foreground">
                                Searching…
                            </p>
                        ) : items.length === 0 ? (
                            <p className="py-6 text-center text-sm text-muted-foreground">
                                No results.
                            </p>
                        ) : (
                            <ul className="grid grid-cols-1 gap-1">
                                {items.map(item => {
                                    const isSelected =
                                        selected?.itemId === item.itemId &&
                                        selected.templateTableId ===
                                            item.templateTableId
                                    return (
                                        <li
                                            key={`${item.templateTableId}-${item.itemId}`}
                                        >
                                            <button
                                                type="button"
                                                onClick={() =>
                                                    setSelected(item)
                                                }
                                                className={cn(
                                                    "flex w-full items-center gap-2 rounded-md border border-transparent px-2 py-1.5 text-left transition hover:bg-muted/60",
                                                    isSelected &&
                                                        "border-primary bg-primary/10"
                                                )}
                                            >
                                                {item.iconDataUrl ? (
                                                    // eslint-disable-next-line @next/next/no-img-element
                                                    <img
                                                        src={item.iconDataUrl}
                                                        alt=""
                                                        className="h-8 w-8 rounded object-contain"
                                                    />
                                                ) : (
                                                    <div className="flex h-8 w-8 items-center justify-center rounded bg-slate-800 text-[10px] font-mono text-slate-300">
                                                        #{item.itemId}
                                                    </div>
                                                )}
                                                <div className="min-w-0 flex-1">
                                                    <p className="truncate text-sm font-medium">
                                                        {item.name ||
                                                            `#${item.itemId}`}
                                                    </p>
                                                    <p className="truncate text-[10px] text-muted-foreground">
                                                        #{item.itemId} · tbl{" "}
                                                        {item.templateTableId} ·
                                                        stack {item.maxStack}
                                                        {item.requiredLevel >
                                                            0 &&
                                                            ` · lv ${item.requiredLevel}`}
                                                    </p>
                                                </div>
                                                <Badge
                                                    variant="secondary"
                                                    className="text-[10px]"
                                                >
                                                    {item.templateTableId === 19
                                                        ? "Equip"
                                                        : "Item"}
                                                </Badge>
                                            </button>
                                        </li>
                                    )
                                })}
                            </ul>
                        )}
                    </div>

                    {selected && (
                        <div className="rounded-md border border-border/60 bg-muted/10 p-3 text-sm">
                            <p className="font-medium">{selected.name}</p>
                            <p className="text-xs text-muted-foreground">
                                Max stack: {selected.maxStack} ·{" "}
                                {selected.templateTableId === 19
                                    ? "Equipment"
                                    : "Item"}{" "}
                                · Template #{selected.itemId}
                            </p>
                        </div>
                    )}

                    <div className="grid grid-cols-2 gap-3">
                        <div className="space-y-1">
                            <Label className="text-xs">Count</Label>
                            <Input
                                type="number"
                                min={1}
                                max={
                                    selected?.maxStack
                                        ? selected.maxStack * 30
                                        : 9999
                                }
                                value={count}
                                onChange={e => setCount(e.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">
                                Color Code (optional)
                            </Label>
                            <Input
                                type="number"
                                min={0}
                                max={5}
                                placeholder="template default"
                                value={colorOverride}
                                onChange={e => setColorOverride(e.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">
                                PreName Type (0-5)
                            </Label>
                            <Input
                                type="number"
                                min={0}
                                max={5}
                                placeholder="template default"
                                value={preNameType}
                                onChange={e => setPreNameType(e.target.value)}
                            />
                        </div>
                        <div className="flex items-end justify-between rounded-md border border-border/40 px-3 py-2">
                            <Label className="text-xs">Bound</Label>
                            <Switch
                                checked={binded}
                                onCheckedChange={setBinded}
                            />
                        </div>
                    </div>

                    {status && <p className="text-xs text-primary">{status}</p>}
                </div>

                <DialogFooter>
                    <Button
                        variant="outline"
                        size="sm"
                        onClick={() => onOpenChange(false)}
                        disabled={sending}
                    >
                        Cancel
                    </Button>
                    <Button
                        size="sm"
                        onClick={() => void handleSubmit()}
                        disabled={sending || !selected}
                    >
                        {sending ? "Sending…" : "Add to Bag"}
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}
