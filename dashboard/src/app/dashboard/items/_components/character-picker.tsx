"use client"

import { useEffect, useMemo, useRef, useState } from "react"
import { Check, ChevronsUpDown, Search, User } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import { cn } from "@/lib/utils"

type CharacterOption = {
    id: number
    name: string
    level: number
    accountId: string
}

type CharacterPickerProps = {
    value: string
    onChange: (value: string) => void
    disabled?: boolean
}

export function CharacterPicker({
    value,
    onChange,
    disabled,
}: CharacterPickerProps) {
    const [open, setOpen] = useState(false)
    const [search, setSearch] = useState("")
    const [characters, setCharacters] = useState<CharacterOption[]>([])
    const [loading, setLoading] = useState(false)
    const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null)

    const selectedChar = useMemo(
        () => characters.find(c => String(c.id) === value),
        [characters, value]
    )

    useEffect(() => {
        if (!open) return

        if (debounceRef.current) clearTimeout(debounceRef.current)

        debounceRef.current = setTimeout(async () => {
            setLoading(true)
            try {
                const params = new URLSearchParams({ limit: "20" })
                if (search.trim()) params.set("search", search.trim())
                const res = await fetch(`/api/players/characters?${params}`)
                const json = await res.json()
                setCharacters(json.items || [])
            } catch {
                setCharacters([])
            } finally {
                setLoading(false)
            }
        }, 300)

        return () => {
            if (debounceRef.current) clearTimeout(debounceRef.current)
        }
    }, [open, search])

    useEffect(() => {
        if (!open || !value || selectedChar) return

        fetch(`/api/players/characters?id=${encodeURIComponent(value)}`)
            .then(res => res.json())
            .then(json => {
                const items = json.items || []
                if (items.length > 0) {
                    setCharacters(prev => {
                        if (prev.some(c => c.id === items[0].id)) return prev
                        return [items[0], ...prev]
                    })
                }
            })
            .catch(() => {})
    }, [open, value, selectedChar])

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant="outline"
                    role="combobox"
                    aria-expanded={open}
                    className="w-full justify-between font-normal"
                    disabled={disabled}
                >
                    {selectedChar ? (
                        <span className="flex items-center gap-2 truncate">
                            <User className="h-3.5 w-3.5 shrink-0 text-muted-foreground" />
                            <span className="truncate">
                                {selectedChar.name}
                                <span className="ml-1.5 text-muted-foreground">
                                    #{selectedChar.id} Lv.{selectedChar.level}
                                </span>
                            </span>
                        </span>
                    ) : value ? (
                        <span className="text-muted-foreground">
                            Character #{value}
                        </span>
                    ) : (
                        <span className="text-muted-foreground">
                            Select character...
                        </span>
                    )}
                    <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
                </Button>
            </PopoverTrigger>
            <PopoverContent
                className="w-[var(--radix-popover-trigger-width)] p-0"
                align="start"
            >
                <div className="flex items-center border-b px-3">
                    <Search className="mr-2 h-4 w-4 shrink-0 opacity-50" />
                    <Input
                        placeholder="Search by name or ID..."
                        value={search}
                        onChange={e => setSearch(e.target.value)}
                        className="border-0 bg-transparent shadow-none focus-visible:ring-0"
                    />
                </div>
                <div className="max-h-64 overflow-y-auto p-1">
                    {loading ? (
                        <p className="py-6 text-center text-sm text-muted-foreground">
                            Loading...
                        </p>
                    ) : characters.length === 0 ? (
                        <p className="py-6 text-center text-sm text-muted-foreground">
                            No characters found.
                        </p>
                    ) : (
                        characters.map(char => (
                            <button
                                key={char.id}
                                type="button"
                                className={cn(
                                    "flex w-full items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-none hover:bg-accent hover:text-accent-foreground",
                                    String(char.id) === value && "bg-accent"
                                )}
                                onClick={() => {
                                    onChange(String(char.id))
                                    setOpen(false)
                                }}
                            >
                                <Check
                                    className={cn(
                                        "h-4 w-4 shrink-0",
                                        String(char.id) === value
                                            ? "opacity-100"
                                            : "opacity-0"
                                    )}
                                />
                                <span className="truncate font-medium">
                                    {char.name}
                                </span>
                                <span className="ml-auto shrink-0 text-xs text-muted-foreground">
                                    #{char.id} Lv.{char.level}
                                </span>
                            </button>
                        ))
                    )}
                </div>
            </PopoverContent>
        </Popover>
    )
}
