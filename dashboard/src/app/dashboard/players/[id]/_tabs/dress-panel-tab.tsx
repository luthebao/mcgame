"use client"

import { useCallback, useMemo, useState } from "react"
import { useQuery } from "@tanstack/react-query"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { usePlayerAction } from "@/hooks/use-player-detail"
import {
    dressPanelService,
    type DressPanelBookOption,
    type DressPanelRecipeOption,
} from "@/services/dress-panel.service"

import {
    CounterEditorSection,
    type CounterEditorOption,
    CounterOverviewSection,
    type CounterEntryDraft,
} from "./dress-panel-map-sections"

type DressPanelTabProps = {
    char: Record<string, unknown>
    playerId: number
}

type CounterMap = Record<string, number>

function currentNumber(value: unknown) {
    const num = Number(value)
    return Number.isFinite(num) ? num : 0
}

function sortCounterMap(value: CounterMap): CounterMap {
    return Object.fromEntries(
        Object.entries(value).sort(
            ([left], [right]) => Number(left) - Number(right)
        )
    ) as CounterMap
}

function normalizeCounterMap(value: unknown): CounterMap {
    if (!value || typeof value !== "object" || Array.isArray(value)) {
        return {}
    }

    const out: CounterMap = {}
    for (const [key, raw] of Object.entries(value as Record<string, unknown>)) {
        if (!/^\d+$/.test(key)) continue
        const parsed = Number(raw)
        if (!Number.isFinite(parsed) || parsed <= 0) continue
        out[key] = Math.trunc(parsed)
    }

    return sortCounterMap(out)
}

function mapToDraftEntries(value: CounterMap): CounterEntryDraft[] {
    return Object.entries(sortCounterMap(value)).map(([id, count]) => ({
        id,
        value: String(count),
    }))
}

function mapsEqual(left: CounterMap, right: CounterMap): boolean {
    const leftEntries = Object.entries(sortCounterMap(left))
    const rightEntries = Object.entries(sortCounterMap(right))

    if (leftEntries.length !== rightEntries.length) {
        return false
    }

    return leftEntries.every(([key, value], index) => {
        const [otherKey, otherValue] = rightEntries[index]
        return key === otherKey && value === otherValue
    })
}

function normalizeDraftEntries(
    name: string,
    entries: CounterEntryDraft[]
): { map?: CounterMap; error?: string } {
    const out: CounterMap = {}

    for (const [index, entry] of entries.entries()) {
        const rawID = entry.id.trim()
        const rawValue = entry.value.trim()

        if (!rawID && !rawValue) {
            continue
        }
        if (!rawID) {
            return { error: `${name} row ${index + 1} is missing an ID` }
        }
        if (!/^\d+$/.test(rawID)) {
            return { error: `${name} row ${index + 1} must use a numeric ID` }
        }
        if (!rawValue) {
            return { error: `${name} row ${index + 1} is missing a value` }
        }

        const parsedValue = Number(rawValue)
        if (!Number.isFinite(parsedValue) || parsedValue < 0) {
            return {
                error: `${name} row ${index + 1} must use a value greater than or equal to 0`,
            }
        }

        const id = String(Math.trunc(Number(rawID)))
        if (Object.prototype.hasOwnProperty.call(out, id)) {
            return { error: `${name} row ${index + 1} duplicates ID ${id}` }
        }

        const nextValue = Math.trunc(parsedValue)
        if (nextValue > 0) {
            out[id] = nextValue
        }
    }

    return { map: sortCounterMap(out) }
}

function formatBookState(value: number): string {
    switch (value) {
        case 1:
            return "1 · Activated"
        case 2:
            return "2 · Claimed"
        default:
            return String(value)
    }
}

function formatBookPrimary(
    id: string,
    lookup: Map<string, DressPanelBookOption>
): string {
    const option = lookup.get(id)
    return option ? `${option.name} (#${id})` : `Dress #${id}`
}

function formatBookSecondary(
    id: string,
    lookup: Map<string, DressPanelBookOption>
): string {
    const option = lookup.get(id)
    if (!option) {
        return "Name lookup unavailable"
    }

    const parts = [`${option.type === 2 ? "Flyer" : "Dress"}`]
    if (option.itemName) {
        parts.push(`item: ${option.itemName}`)
    } else if (option.itemId > 0) {
        parts.push(`item #${option.itemId}`)
    }
    if (option.recipeName) {
        parts.push(`recipe: ${option.recipeName}`)
    } else if (option.recipeId > 0) {
        parts.push(`recipe #${option.recipeId}`)
    }
    return parts.join(" · ")
}

function formatRecipePrimary(
    id: string,
    lookup: Map<string, DressPanelRecipeOption>
): string {
    const option = lookup.get(id)
    return option ? `${option.name} (#${id})` : `Recipe #${id}`
}

function formatRecipeSecondary(
    id: string,
    lookup: Map<string, DressPanelRecipeOption>
): string {
    const option = lookup.get(id)
    if (!option) {
        return "Name lookup unavailable"
    }

    const parts = [option.type === 2 ? "Chip" : "Recipe"]
    if (option.productName) {
        parts.push(`makes: ${option.productName}`)
    } else if (option.product > 0) {
        parts.push(`makes recipe #${option.product}`)
    }
    return parts.join(" · ")
}

function formatBookOptionLabel(option: DressPanelBookOption): string {
    const parts = [`#${option.id} - ${option.name}`]
    if (option.itemName) {
        parts.push(`item: ${option.itemName}`)
    } else if (option.itemId > 0) {
        parts.push(`item #${option.itemId}`)
    }
    if (option.recipeName) {
        parts.push(`recipe: ${option.recipeName}`)
    } else if (option.recipeId > 0) {
        parts.push(`recipe #${option.recipeId}`)
    }
    return parts.join(" · ")
}

function formatRecipeOptionLabel(option: DressPanelRecipeOption): string {
    const parts = [
        `#${option.id} - ${option.name}`,
        option.type === 2 ? "chip" : "recipe",
    ]
    if (option.productName) {
        parts.push(`makes: ${option.productName}`)
    } else if (option.product > 0) {
        parts.push(`makes #${option.product}`)
    }
    return parts.join(" · ")
}

function FieldCard({ label, value }: { label: string; value: unknown }) {
    return (
        <div className="space-y-1 rounded-lg border border-border/60 bg-muted/20 p-3">
            <p className="text-xs uppercase tracking-wide text-muted-foreground">
                {label}
            </p>
            <p className="font-medium">
                {value === null || value === undefined || value === ""
                    ? "-"
                    : String(value)}
            </p>
        </div>
    )
}

export function DressPanelTab({ char, playerId }: DressPanelTabProps) {
    const action = usePlayerAction(playerId)
    const [bagCrystal, setBagCrystal] = useState("")
    const [bagJewel, setBagJewel] = useState("")
    const [extract, setExtract] = useState("")
    const [score, setScore] = useState("")
    const [fakeDressId, setFakeDressId] = useState("")
    const [fakeFlyDressId, setFakeFlyDressId] = useState("")

    const currentBookMap = useMemo(
        () => normalizeCounterMap(char.dressBook),
        [char.dressBook]
    )
    const currentRecipeMap = useMemo(
        () => normalizeCounterMap(char.dressRecipe),
        [char.dressRecipe]
    )

    const [bookEntries, setBookEntries] = useState<CounterEntryDraft[]>(() =>
        mapToDraftEntries(currentBookMap)
    )
    const [recipeEntries, setRecipeEntries] = useState<CounterEntryDraft[]>(
        () => mapToDraftEntries(currentRecipeMap)
    )

    const { data: catalogData, error: catalogError } = useQuery({
        queryKey: ["dress-panel-catalog"],
        queryFn: () => dressPanelService.getCatalog(),
        staleTime: 5 * 60_000,
    })

    const bookOptions = useMemo(
        () => catalogData?.bookOptions ?? [],
        [catalogData]
    )
    const recipeOptions = useMemo(
        () => catalogData?.recipeOptions ?? [],
        [catalogData]
    )

    const bookLookup = useMemo(
        () => new Map(bookOptions.map(option => [String(option.id), option])),
        [bookOptions]
    )
    const recipeLookup = useMemo(
        () => new Map(recipeOptions.map(option => [String(option.id), option])),
        [recipeOptions]
    )
    const bookSelectOptions = useMemo<CounterEditorOption[]>(
        () =>
            bookOptions.map(option => ({
                id: String(option.id),
                label: formatBookOptionLabel(option),
            })),
        [bookOptions]
    )
    const recipeSelectOptions = useMemo<CounterEditorOption[]>(
        () =>
            recipeOptions.map(option => ({
                id: String(option.id),
                label: formatRecipeOptionLabel(option),
            })),
        [recipeOptions]
    )

    const currentBookEntries = useMemo(
        () => Object.entries(currentBookMap),
        [currentBookMap]
    )
    const currentRecipeEntries = useMemo(
        () => Object.entries(currentRecipeMap),
        [currentRecipeMap]
    )

    const resetEditors = useCallback(() => {
        setBagCrystal("")
        setBagJewel("")
        setExtract("")
        setScore("")
        setFakeDressId("")
        setFakeFlyDressId("")
        setBookEntries(mapToDraftEntries(currentBookMap))
        setRecipeEntries(mapToDraftEntries(currentRecipeMap))
    }, [currentBookMap, currentRecipeMap])

    const updateBookEntry = useCallback(
        (index: number, patch: Partial<CounterEntryDraft>) => {
            setBookEntries(current =>
                current.map((entry, entryIndex) =>
                    entryIndex === index ? { ...entry, ...patch } : entry
                )
            )
        },
        []
    )

    const updateRecipeEntry = useCallback(
        (index: number, patch: Partial<CounterEntryDraft>) => {
            setRecipeEntries(current =>
                current.map((entry, entryIndex) =>
                    entryIndex === index ? { ...entry, ...patch } : entry
                )
            )
        },
        []
    )

    const removeBookEntry = useCallback((index: number) => {
        setBookEntries(current =>
            current.filter((_, entryIndex) => entryIndex !== index)
        )
    }, [])

    const removeRecipeEntry = useCallback((index: number) => {
        setRecipeEntries(current =>
            current.filter((_, entryIndex) => entryIndex !== index)
        )
    }, [])

    const addBookEntry = useCallback(() => {
        setBookEntries(current => [...current, { id: "", value: "" }])
    }, [])

    const addRecipeEntry = useCallback(() => {
        setRecipeEntries(current => [...current, { id: "", value: "" }])
    }, [])

    const resolveBookPrimary = useCallback(
        (id: string) => formatBookPrimary(id, bookLookup),
        [bookLookup]
    )
    const resolveBookSecondary = useCallback(
        (id: string) => formatBookSecondary(id, bookLookup),
        [bookLookup]
    )
    const resolveRecipePrimary = useCallback(
        (id: string) => formatRecipePrimary(id, recipeLookup),
        [recipeLookup]
    )
    const resolveRecipeSecondary = useCallback(
        (id: string) => formatRecipeSecondary(id, recipeLookup),
        [recipeLookup]
    )

    const handleApply = () => {
        const payload: Record<string, unknown> = {}
        const numericFields: Array<[string, string]> = [
            ["bagCrystal", bagCrystal],
            ["bagJewel", bagJewel],
            ["extract", extract],
            ["score", score],
            ["fakeDressId", fakeDressId],
            ["fakeFlyDressId", fakeFlyDressId],
        ]

        for (const [key, raw] of numericFields) {
            if (raw === "") continue
            const value = Number(raw)
            if (!Number.isFinite(value)) {
                toast.error(`Invalid value for ${key}`)
                return
            }
            payload[key] = Math.trunc(value)
        }

        const normalizedBook = normalizeDraftEntries("Book", bookEntries)
        if (normalizedBook.error) {
            toast.error(normalizedBook.error)
            return
        }

        const normalizedRecipe = normalizeDraftEntries("Recipe", recipeEntries)
        if (normalizedRecipe.error) {
            toast.error(normalizedRecipe.error)
            return
        }

        if (!mapsEqual(normalizedBook.map || {}, currentBookMap)) {
            payload.book = normalizedBook.map || {}
        }

        if (!mapsEqual(normalizedRecipe.map || {}, currentRecipeMap)) {
            payload.recipe = normalizedRecipe.map || {}
        }

        if (Object.keys(payload).length === 0) {
            toast.error("No dress panel changes to apply")
            return
        }

        action.mutate(
            { action: "set_dress_panel", payload },
            {
                onSuccess: response => {
                    const responseData =
                        response.data && typeof response.data === "object"
                            ? (response.data as Record<string, unknown>)
                            : {}

                    setBagCrystal("")
                    setBagJewel("")
                    setExtract("")
                    setScore("")
                    setFakeDressId("")
                    setFakeFlyDressId("")
                    setBookEntries(
                        mapToDraftEntries(
                            normalizeCounterMap(responseData.dressBook)
                        )
                    )
                    setRecipeEntries(
                        mapToDraftEntries(
                            normalizeCounterMap(responseData.dressRecipe)
                        )
                    )
                },
            }
        )
    }

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">
                        Current Dress Panel Data
                    </CardTitle>
                    <CardDescription>
                        These values back the client DRESS_PANEL state and
                        activeDress material checks.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-6">
                        <FieldCard
                            label="Crystal"
                            value={currentNumber(char.dressBagCrystal)}
                        />
                        <FieldCard
                            label="Jewel"
                            value={currentNumber(char.dressBagJewel)}
                        />
                        <FieldCard
                            label="Extract"
                            value={currentNumber(char.dressExtract)}
                        />
                        <FieldCard
                            label="Score"
                            value={currentNumber(char.dressScore)}
                        />
                        <FieldCard
                            label="Fake Dress ID"
                            value={currentNumber(char.dressFakeDressId)}
                        />
                        <FieldCard
                            label="Fake Flyer ID"
                            value={currentNumber(char.dressFakeFlyDressId)}
                        />
                    </div>
                    <div className="grid gap-4 lg:grid-cols-2">
                        <CounterOverviewSection
                            title="Current Book Entries"
                            description="Book states use the saved dress/flyer ID as the key. Value 1 means activated, value 2 means claimed."
                            entries={currentBookEntries}
                            formatPrimary={resolveBookPrimary}
                            formatSecondary={resolveBookSecondary}
                            formatValue={formatBookState}
                            emptyLabel="No dress or flyer entries saved."
                        />
                        <CounterOverviewSection
                            title="Current Recipe Entries"
                            description="Recipe rows store owned recipe or chip quantities keyed by recipe ID."
                            entries={currentRecipeEntries}
                            formatPrimary={resolveRecipePrimary}
                            formatSecondary={resolveRecipeSecondary}
                            formatValue={value => `${value} owned`}
                            emptyLabel="No recipe or chip counts saved."
                        />
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">
                        Set Dress Panel Data
                    </CardTitle>
                    <CardDescription>
                        Leave a numeric field empty to keep it unchanged. Book
                        and Recipe rows edit the saved key/value entries
                        directly.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-6">
                        <div className="space-y-1">
                            <Label className="text-xs">Crystal</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressBagCrystal)
                                )}
                                value={bagCrystal}
                                onChange={event =>
                                    setBagCrystal(event.target.value)
                                }
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Jewel</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressBagJewel)
                                )}
                                value={bagJewel}
                                onChange={event =>
                                    setBagJewel(event.target.value)
                                }
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Extract</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressExtract)
                                )}
                                value={extract}
                                onChange={event =>
                                    setExtract(event.target.value)
                                }
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Score</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressScore)
                                )}
                                value={score}
                                onChange={event => setScore(event.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Fake Dress ID</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressFakeDressId)
                                )}
                                value={fakeDressId}
                                onChange={event =>
                                    setFakeDressId(event.target.value)
                                }
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Fake Flyer ID</Label>
                            <Input
                                type="number"
                                placeholder={String(
                                    currentNumber(char.dressFakeFlyDressId)
                                )}
                                value={fakeFlyDressId}
                                onChange={event =>
                                    setFakeFlyDressId(event.target.value)
                                }
                            />
                        </div>
                    </div>
                    <div className="grid gap-4 lg:grid-cols-2">
                        <CounterEditorSection
                            title="Book Entries"
                            description="Choose the dress or flyer by name, then set the saved book state."
                            emptyLabel="No draft book rows. Add one when you want to change book data."
                            valueLabel="State"
                            valueHint="Use 1 for activated and 2 for claimed."
                            selectPlaceholder="Select dress or flyer"
                            entries={bookEntries}
                            options={bookSelectOptions}
                            formatSecondary={resolveBookSecondary}
                            onAdd={addBookEntry}
                            onChange={updateBookEntry}
                            onRemove={removeBookEntry}
                            fallbackInputLabel="Dress ID"
                        />
                        <CounterEditorSection
                            title="Recipe Entries"
                            description="Choose the recipe or chip by name, then set how many the player owns."
                            emptyLabel="No draft recipe rows. Add one when you want to change recipe data."
                            valueLabel="Count"
                            valueHint="Use the owned quantity for that recipe or chip."
                            selectPlaceholder="Select recipe or chip"
                            entries={recipeEntries}
                            options={recipeSelectOptions}
                            formatSecondary={resolveRecipeSecondary}
                            onAdd={addRecipeEntry}
                            onChange={updateRecipeEntry}
                            onRemove={removeRecipeEntry}
                            fallbackInputLabel="Recipe ID"
                        />
                    </div>
                    {catalogError ? (
                        <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                            Name lookup is unavailable right now, so the editor
                            falls back to numeric IDs.{" "}
                            {catalogError instanceof Error
                                ? catalogError.message
                                : ""}
                        </p>
                    ) : null}
                    <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                        Updating crystal and jewel here changes the persisted
                        `dressInfo.bag` values that `activeDress` consumes.
                        Online players receive the exact `onUpdateDressInto`
                        callback so DRESS_PANEL refreshes immediately.
                    </p>
                    <div className="flex flex-wrap gap-2">
                        <Button
                            size="sm"
                            onClick={handleApply}
                            disabled={action.isPending}
                        >
                            Apply Dress Panel Changes
                        </Button>
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={resetEditors}
                            disabled={action.isPending}
                        >
                            Reset Editor
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    )
}
