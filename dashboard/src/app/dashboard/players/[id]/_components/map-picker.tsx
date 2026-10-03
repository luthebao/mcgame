"use client"

import { useMemo, useState } from "react"
import { Check, ChevronsUpDown, Search } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import { cn } from "@/lib/utils"
import { useMapList, type MapEntry } from "@/hooks/use-maps"

const MAX_VISIBLE = 100

type MapPickerProps = {
    value: number
    onChange: (mapId: number) => void
    className?: string
    disabled?: boolean
    placeholder?: string
}

export function MapPicker({
    value,
    onChange,
    className,
    disabled,
    placeholder = "Select map...",
}: MapPickerProps) {
    const { data: maps, isLoading, error } = useMapList()
    const [open, setOpen] = useState(false)
    const [query, setQuery] = useState("")

    const selected: MapEntry | undefined = useMemo(() => {
        if (!maps) return undefined
        return maps.find(m => m.id === value)
    }, [maps, value])

    const filtered = useMemo(() => {
        if (!maps) return [] as MapEntry[]
        const q = query.trim().toLowerCase()
        if (!q) return maps.slice(0, MAX_VISIBLE)
        const matched: MapEntry[] = []
        for (const m of maps) {
            if (
                String(m.id).startsWith(q) ||
                m.name.toLowerCase().includes(q)
            ) {
                matched.push(m)
                if (matched.length >= MAX_VISIBLE) break
            }
        }
        return matched
    }, [maps, query])

    const triggerLabel = selected
        ? `${selected.id} — ${selected.name || "(unnamed)"}`
        : value > 0
          ? `Map #${value}`
          : placeholder

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    type="button"
                    variant="outline"
                    role="combobox"
                    aria-expanded={open}
                    disabled={disabled}
                    className={cn(
                        "w-[280px] justify-between font-normal",
                        className
                    )}
                >
                    <span className="truncate text-left">{triggerLabel}</span>
                    <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
                </Button>
            </PopoverTrigger>
            <PopoverContent className="w-[320px] p-0" align="start">
                <div className="flex items-center gap-2 border-b px-3 py-2">
                    <Search className="h-4 w-4 opacity-50" />
                    <Input
                        autoFocus
                        value={query}
                        onChange={e => setQuery(e.target.value)}
                        placeholder="Search by id or name..."
                        className="h-8 border-0 p-0 shadow-none focus-visible:ring-0"
                    />
                </div>
                <div className="max-h-72 overflow-y-auto py-1">
                    {isLoading ? (
                        <p className="px-3 py-4 text-center text-sm text-muted-foreground">
                            Loading maps...
                        </p>
                    ) : error ? (
                        <p className="px-3 py-4 text-center text-sm text-destructive">
                            Failed to load maps
                        </p>
                    ) : filtered.length === 0 ? (
                        <p className="px-3 py-4 text-center text-sm text-muted-foreground">
                            No maps match
                        </p>
                    ) : (
                        filtered.map(m => (
                            <button
                                type="button"
                                key={m.id}
                                onClick={() => {
                                    onChange(m.id)
                                    setOpen(false)
                                    setQuery("")
                                }}
                                className={cn(
                                    "flex w-full items-center gap-2 px-3 py-1.5 text-left text-sm hover:bg-accent",
                                    m.id === value && "bg-accent/60"
                                )}
                            >
                                <Check
                                    className={cn(
                                        "h-4 w-4",
                                        m.id === value
                                            ? "opacity-100"
                                            : "opacity-0"
                                    )}
                                />
                                <span className="font-mono text-xs text-muted-foreground w-14 shrink-0">
                                    {m.id}
                                </span>
                                <span className="flex-1 truncate">
                                    {m.name || "(unnamed)"}
                                </span>
                            </button>
                        ))
                    )}
                    {maps && maps.length > filtered.length && !query && (
                        <p className="px-3 py-2 text-xs text-muted-foreground">
                            Showing {filtered.length} of {maps.length} — type to
                            filter
                        </p>
                    )}
                </div>
            </PopoverContent>
        </Popover>
    )
}
