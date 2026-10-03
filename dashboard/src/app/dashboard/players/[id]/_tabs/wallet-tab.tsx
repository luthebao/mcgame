"use client"

import { Pencil } from "lucide-react"
import { useMemo, useState } from "react"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { usePlayerAction } from "@/hooks/use-player-detail"
import { cn } from "@/lib/utils"
import {
    CURRENCY_GROUPS,
    CURRENCY_OPTIONS,
    type CurrencyGroup,
    type CurrencyOption,
} from "@/types/player-management"

type CurrencyMode = "add" | "set"

type CurrencyApply = (params: {
    option: CurrencyOption
    mode: CurrencyMode
    amount: number
}) => Promise<unknown>

function formatAmount(raw: unknown): string {
    if (raw === null || raw === undefined) return "-"
    const num = typeof raw === "number" ? raw : Number(raw)
    if (!Number.isFinite(num)) return String(raw)
    return num.toLocaleString()
}

function CurrencyTile({
    option,
    rawValue,
    onApply,
    isPending,
}: {
    option: CurrencyOption
    rawValue: unknown
    onApply: CurrencyApply
    isPending: boolean
}) {
    const [open, setOpen] = useState(false)
    const [mode, setMode] = useState<CurrencyMode>("add")
    const [amount, setAmount] = useState("")

    const editable = option.editable !== false

    const reset = () => {
        setMode("add")
        setAmount("")
    }

    const handleOpenChange = (next: boolean) => {
        setOpen(next)
        if (!next) reset()
    }

    const handleApply = async () => {
        const parsed = Number(amount)
        if (!Number.isFinite(parsed)) {
            toast.error("Enter a valid number")
            return
        }
        try {
            await onApply({ option, mode, amount: parsed })
            setOpen(false)
            setAmount("")
        } catch {
            // error feedback handled by usePlayerAction
        }
    }

    const display = formatAmount(rawValue)
    const tile = (
        <div
            className={cn(
                "group relative space-y-1 rounded-lg border border-border/60 bg-muted/20 p-3 transition",
                editable
                    ? "cursor-pointer hover:border-primary/40 hover:bg-muted/40"
                    : "cursor-not-allowed opacity-70",
            )}
            title={option.description ?? option.label}
        >
            <div className="flex items-center justify-between gap-2">
                <p className="text-xs uppercase tracking-wide text-muted-foreground">
                    {option.label}
                </p>
                {editable && (
                    <Pencil className="h-3 w-3 text-muted-foreground opacity-0 transition group-hover:opacity-100" />
                )}
            </div>
            <p className="font-medium">{display}</p>
            <p className="text-[10px] text-muted-foreground/70">{option.key}</p>
        </div>
    )

    if (!editable) return tile

    return (
        <Popover open={open} onOpenChange={handleOpenChange}>
            <PopoverTrigger asChild>{tile}</PopoverTrigger>
            <PopoverContent
                align="start"
                className="w-72 space-y-3"
                onCloseAutoFocus={e => e.preventDefault()}
            >
                <div>
                    <p className="text-sm font-medium">{option.label}</p>
                    {option.description && (
                        <p className="text-xs text-muted-foreground">
                            {option.description}
                        </p>
                    )}
                    <p className="text-xs text-muted-foreground">
                        Current: {display}
                    </p>
                </div>
                <div className="flex items-center gap-2">
                    <div className="space-y-1">
                        <Label className="text-[10px]">Mode</Label>
                        <Select
                            value={mode}
                            onValueChange={v => setMode(v as CurrencyMode)}
                        >
                            <SelectTrigger className="h-8 w-24">
                                <SelectValue />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="add">Add</SelectItem>
                                <SelectItem value="set">Set</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                    <div className="flex-1 space-y-1">
                        <Label className="text-[10px]">Amount</Label>
                        <Input
                            autoFocus
                            type="number"
                            value={amount}
                            onChange={e => setAmount(e.target.value)}
                            onKeyDown={e => {
                                if (e.key === "Enter") {
                                    e.preventDefault()
                                    void handleApply()
                                }
                            }}
                        />
                    </div>
                </div>
                <div className="flex justify-end gap-2">
                    <Button
                        size="sm"
                        variant="ghost"
                        onClick={() => setOpen(false)}
                    >
                        Cancel
                    </Button>
                    <Button
                        size="sm"
                        onClick={() => void handleApply()}
                        disabled={!amount || isPending}
                    >
                        Apply
                    </Button>
                </div>
            </PopoverContent>
        </Popover>
    )
}

const GROUPED_CURRENCIES: Array<{ group: CurrencyGroup; items: CurrencyOption[] }> =
    CURRENCY_GROUPS.map(group => ({
        group,
        items: CURRENCY_OPTIONS.filter(c => c.group === group),
    })).filter(g => g.items.length > 0)

export function WalletTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    const action = usePlayerAction(playerId)

    const onApply: CurrencyApply = useMemo(
        () =>
            ({ option, mode, amount }) =>
                action.mutateAsync({
                    action: "set_currency",
                    payload: { currency: option.key, amount, mode },
                }),
        [action.mutateAsync],
    )

    return (
        <div className="space-y-6">
            {GROUPED_CURRENCIES.map(({ group, items }) => (
                <Card key={group}>
                    <CardHeader className="pb-3">
                        <CardTitle className="text-base">{group}</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="grid gap-3 md:grid-cols-3 lg:grid-cols-4">
                            {items.map(option => (
                                <CurrencyTile
                                    key={option.key}
                                    option={option}
                                    rawValue={char[option.dtoKey]}
                                    onApply={onApply}
                                    isPending={action.isPending}
                                />
                            ))}
                        </div>
                    </CardContent>
                </Card>
            ))}
        </div>
    )
}
