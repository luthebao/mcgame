"use client"

import { useMemo, useState } from "react"
import { useQueryClient } from "@tanstack/react-query"
import { Plus, Trash2, X } from "lucide-react"
import { toast } from "sonner"

import { AddItemDialog } from "../_components/add-item-dialog"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import {
    Dialog,
    DialogContent,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import {
    Tooltip,
    TooltipContent,
    TooltipProvider,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import { Switch } from "@/components/ui/switch"
import { Badge } from "@/components/ui/badge"
import { cn } from "@/lib/utils"
import { usePlayerAction } from "@/hooks/use-player-detail"
import { usePlayerInventory } from "@/hooks/use-player-inventory"
import {
    COLOR_PREFIX,
    EQUIP_SLOT_LABELS,
    SLOTS_PER_BAG_PAGE,
    SLOT_TYPE_BAG,
    SLOT_TYPE_EQUIPPED,
    SLOT_TYPE_PETITEMBAG,
    SLOT_TYPE_QUESTBAG,
    type InventoryItem,
} from "@/types/player-management"
import { getItemTypeLabel, getKindLabel } from "@/app/dashboard/items/_lib/shared"

type ItemsTabProps = {
    playerId: number
}

type BagPage = {
    key: string
    label: string
    slotType: number
    pageIndex: number
    slotCount: number
}

function buildPages(bagSlots: number): BagPage[] {
    const totalPages = Math.max(1, Math.ceil(bagSlots / SLOTS_PER_BAG_PAGE))
    const pages: BagPage[] = []
    for (let i = 0; i < totalPages; i++) {
        pages.push({
            key: `bag-${i}`,
            label: String(i + 1),
            slotType: SLOT_TYPE_BAG,
            pageIndex: i,
            slotCount: SLOTS_PER_BAG_PAGE,
        })
    }
    pages.push({
        key: "quest",
        label: "N.vụ",
        slotType: SLOT_TYPE_QUESTBAG,
        pageIndex: 0,
        slotCount: 30,
    })
    pages.push({
        key: "pet",
        label: "Pet",
        slotType: SLOT_TYPE_PETITEMBAG,
        pageIndex: 0,
        slotCount: 30,
    })
    return pages
}

function colorBorder(colorCode: number) {
    const c = COLOR_PREFIX[colorCode] ?? COLOR_PREFIX[0]
    return c.hex
}

function qualityPrefix(item: InventoryItem): string {
    if (item.preNameType <= 0) return ""
    return COLOR_PREFIX[item.preNameType]?.prefix ?? ""
}

function formatPropValue(v: unknown): string {
    if (v === null || v === undefined) return ""
    if (
        typeof v === "string" ||
        typeof v === "number" ||
        typeof v === "boolean"
    )
        return String(v)
    try {
        const json = JSON.stringify(v)
        return json.length > 40 ? `${json.slice(0, 40)}…` : json
    } catch {
        return String(v)
    }
}

function displayName(item: InventoryItem) {
    const base = item.templateName || `#${item.templateId}`
    const prefix = qualityPrefix(item)
    if (item.itemType === 2 && prefix) return `${prefix} ${base}`
    return base
}

function ItemIcon({ item }: { item: InventoryItem }) {
    const [failed, setFailed] = useState(false)
    const hasIcon = item.iconCode > 0 && !failed
    if (hasIcon) {
        return (
            // eslint-disable-next-line @next/next/no-img-element
            <img
                src={`/api/icons/${item.iconCode}`}
                alt={item.templateName || String(item.templateId)}
                className="h-full w-full object-contain"
                loading="lazy"
                draggable={false}
                onError={() => setFailed(true)}
            />
        )
    }
    return (
        <div className="flex h-full w-full items-center justify-center text-[10px] font-mono text-slate-400">
            #{item.templateId}
        </div>
    )
}

function ItemSlot({
    item,
    onClick,
    onAdd,
}: {
    item: InventoryItem | undefined
    onClick?: () => void
    onAdd?: () => void
}) {
    if (!item) {
        if (onAdd) {
            return (
                <button
                    type="button"
                    onClick={onAdd}
                    className="group flex aspect-square items-center justify-center rounded-md border border-dashed border-border/50 bg-muted/10 text-muted-foreground/60 transition hover:border-primary/60 hover:bg-primary/10 hover:text-primary"
                    aria-label="Add item to this slot"
                >
                    <Plus className="h-4 w-4 opacity-0 transition group-hover:opacity-100" />
                </button>
            )
        }
        return (
            <div className="aspect-square rounded-md border border-border/40 bg-muted/20" />
        )
    }

    const border = colorBorder(item.colorCode)
    const name = displayName(item)
    const button = (
        <button
            type="button"
            onClick={onClick}
            className={cn(
                "group relative aspect-square rounded-md border-2 bg-gradient-to-br from-slate-800 to-slate-900 p-0.5 text-left transition hover:brightness-125"
            )}
            style={{
                borderColor: border,
                boxShadow:
                    item.colorCode > 0
                        ? `0 0 0 1px ${border}33, inset 0 0 8px ${border}22`
                        : undefined,
            }}
        >
            <div className="flex h-full w-full items-center justify-center overflow-hidden rounded bg-slate-950/60">
                <ItemIcon item={item} />
            </div>
            {item.stackCount > 1 && (
                <span className="absolute bottom-0 right-0 rounded-tl bg-black/70 px-1 text-[10px] font-bold text-white">
                    {item.stackCount}
                </span>
            )}
            {item.enchantLevel > 0 && (
                <span className="absolute top-0 left-0 rounded-br bg-amber-500/80 px-1 text-[10px] font-bold text-black">
                    +{item.enchantLevel}
                </span>
            )}
            {item.isBound && (
                <span className="absolute top-0 right-0 rounded-bl bg-red-500/90 px-1 text-[10px] font-bold text-white">
                    B
                </span>
            )}
        </button>
    )

    return (
        <TooltipProvider delayDuration={150}>
            <Tooltip>
                <TooltipTrigger asChild>{button}</TooltipTrigger>
                <TooltipContent side="top" className="max-w-sm space-y-1">
                    <p className="flex items-center gap-2 font-semibold">
                        <span
                            aria-hidden
                            className="inline-block h-2.5 w-2.5 shrink-0 rounded-full border border-border/60"
                            style={{ backgroundColor: border }}
                        />
                        <span>{name}</span>
                    </p>
                    <p className="text-xs text-muted-foreground">
                        ID #{item.id} · tpl {item.templateId} · sid {item.sid}
                    </p>
                    <div className="grid grid-cols-2 gap-x-3 text-xs">
                        <span>Stack: {item.stackCount}</span>
                        <span>Color: {item.colorCode}</span>
                        {item.enchantLevel > 0 && (
                            <span>Enchant: +{item.enchantLevel}</span>
                        )}
                        {item.starLevel > 0 && (
                            <span>Star: {item.starLevel}</span>
                        )}
                        {item.durability != null && (
                            <span>
                                Dura: {item.durability}/
                                {item.maxDurability ?? "?"}
                            </span>
                        )}
                        <span>Bound: {item.isBound ? "Yes" : "No"}</span>
                    </div>
                    {item.properties &&
                        Object.keys(item.properties).length > 0 && (
                            <div className="mt-1 border-t border-border/40 pt-1">
                                <p className="text-[10px] font-medium text-muted-foreground">
                                    Properties
                                </p>
                                <div className="grid max-h-40 grid-cols-2 gap-x-3 overflow-y-auto text-[10px]">
                                    {Object.entries(item.properties)
                                        .filter(
                                            ([, v]) =>
                                                v !== null &&
                                                v !== "" &&
                                                v !== 0 &&
                                                v !== "0"
                                        )
                                        .sort(([a], [b]) => a.localeCompare(b))
                                        .map(([k, v]) => (
                                            <span
                                                key={k}
                                                className="truncate"
                                                title={`${k}: ${String(v)}`}
                                            >
                                                <span className="text-muted-foreground">
                                                    {k}:
                                                </span>{" "}
                                                {formatPropValue(v)}
                                            </span>
                                        ))}
                                </div>
                            </div>
                        )}
                </TooltipContent>
            </Tooltip>
        </TooltipProvider>
    )
}

const EQUIP_LAYOUT_LEFT = [0, 3, 1, 4, 5, 10] // Mũ, Áo, Đai, Quần, Trang sức 1, Trang sức 2
const EQUIP_LAYOUT_RIGHT = [7, 9, 8, 11, 12, 6] // Dây chuyền, Hộ vai, Nhẫn, Giày, Găng thu thập, Trợ thủ
const EQUIP_LAYOUT_BOTTOM = [2, 20, 13, 21] // Vũ khí, Thời trang, Phi hành, Cánh
const EQUIP_LAYOUT_SOUL = [14, 15, 16, 17, 18, 19] // Thần khí chính + phụ 1..5

function SlotRow({
    side,
    index,
    equipped,
    onPick,
}: {
    side: "left" | "right"
    index: number
    equipped: Map<number, InventoryItem>
    onPick: (item: InventoryItem) => void
}) {
    const label =
        EQUIP_SLOT_LABELS.find(s => s.index === index)?.label ?? `#${index}`
    const it = equipped.get(index)
    const slot = (
        <div className="h-12 w-12 shrink-0">
            <ItemSlot
                item={it}
                onClick={() => {
                    if (it) onPick(it)
                }}
            />
        </div>
    )
    const name = (
        <span className="w-20 shrink-0 text-xs text-muted-foreground">
            {label}
        </span>
    )
    return (
        <div
            className={cn(
                "flex items-center gap-2",
                side === "right" && "justify-end"
            )}
        >
            {side === "left" ? (
                <>
                    {name}
                    {slot}
                </>
            ) : (
                <>
                    {slot}
                    {name}
                </>
            )}
        </div>
    )
}

function EquipmentPanel({
    items,
    onPick,
}: {
    items: InventoryItem[]
    onPick: (item: InventoryItem) => void
}) {
    const equipped = useMemo(() => {
        const map = new Map<number, InventoryItem>()
        for (const it of items) {
            if (it.slotType === SLOT_TYPE_EQUIPPED) {
                map.set(it.slotIndex, it)
            }
        }
        return map
    }, [items])

    return (
        <Card>
            <CardHeader className="pb-3">
                <CardTitle className="text-base">
                    Equipment (Trang bị)
                </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="grid grid-cols-[1fr_auto_1fr] gap-3">
                    <div className="space-y-2">
                        {EQUIP_LAYOUT_LEFT.map(i => (
                            <SlotRow
                                key={i}
                                side="left"
                                index={i}
                                equipped={equipped}
                                onPick={onPick}
                            />
                        ))}
                    </div>
                    <div className="flex items-center justify-center text-xs text-muted-foreground">
                        <div className="flex h-full w-28 items-center justify-center rounded-md border border-dashed border-border/40 bg-muted/10">
                            Nhân vật
                        </div>
                    </div>
                    <div className="space-y-2">
                        {EQUIP_LAYOUT_RIGHT.map(i => (
                            <SlotRow
                                key={i}
                                side="right"
                                index={i}
                                equipped={equipped}
                                onPick={onPick}
                            />
                        ))}
                    </div>
                </div>

                <div className="space-y-2">
                    <p className="text-xs font-medium text-muted-foreground">
                        Vũ khí / Thời trang / Cánh
                    </p>
                    <div className="flex flex-wrap items-center gap-3">
                        {EQUIP_LAYOUT_BOTTOM.map(i => {
                            const it = equipped.get(i)
                            const label =
                                EQUIP_SLOT_LABELS.find(s => s.index === i)
                                    ?.label ?? `#${i}`
                            return (
                                <div
                                    key={i}
                                    className="flex items-center gap-2"
                                >
                                    <div className="h-12 w-12 shrink-0">
                                        <ItemSlot
                                            item={it}
                                            onClick={() => {
                                                if (it) onPick(it)
                                            }}
                                        />
                                    </div>
                                    <span className="text-xs text-muted-foreground">
                                        {label}
                                    </span>
                                </div>
                            )
                        })}
                    </div>
                </div>

                <div className="space-y-2">
                    <p className="text-xs font-medium text-muted-foreground">
                        Hồn Khí
                    </p>
                    <div className="grid grid-cols-6 gap-2">
                        {EQUIP_LAYOUT_SOUL.map(i => {
                            const it = equipped.get(i)
                            return (
                                <div key={i} className="space-y-1">
                                    <div className="aspect-square w-full">
                                        <ItemSlot
                                            item={it}
                                            onClick={() => {
                                                if (it) onPick(it)
                                            }}
                                        />
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}

function BagGrid({
    page,
    items,
    onPick,
    onAddAt,
}: {
    page: BagPage
    items: InventoryItem[]
    onPick: (item: InventoryItem) => void
    onAddAt: (slotType: number, slotIndex: number) => void
}) {
    const offset = page.pageIndex * SLOTS_PER_BAG_PAGE
    const bySlot = useMemo(() => {
        const map = new Map<number, InventoryItem>()
        for (const it of items) {
            if (it.slotType !== page.slotType) continue
            map.set(it.slotIndex, it)
        }
        return map
    }, [items, page.slotType])

    return (
        <div className="grid grid-cols-6 gap-2 rounded-md bg-slate-900/40 p-2">
            {Array.from({ length: page.slotCount }).map((_, i) => {
                const idx = offset + i
                const it = bySlot.get(idx)
                return (
                    <ItemSlot
                        key={idx}
                        item={it}
                        onClick={() => {
                            if (it) onPick(it)
                        }}
                        onAdd={
                            it ? undefined : () => onAddAt(page.slotType, idx)
                        }
                    />
                )
            })}
        </div>
    )
}

function ItemEditDialog({
    playerId,
    item,
    onClose,
    onChange,
}: {
    playerId: number
    item: InventoryItem | null
    onClose: () => void
    onChange: () => void
}) {
    const action = usePlayerAction(playerId)
    const [stackCount, setStackCount] = useState("")
    const [colorCode, setColorCode] = useState("")
    const [preNameType, setPreNameType] = useState("")
    const [enchantLevel, setEnchantLevel] = useState("")
    const [starLevel, setStarLevel] = useState("")
    const [durability, setDurability] = useState("")
    const [maxDurability, setMaxDurability] = useState("")
    const [isBound, setIsBound] = useState<boolean | undefined>(undefined)
    const [propertiesJson, setPropertiesJson] = useState("")
    const [replaceProperties, setReplaceProperties] = useState(false)
    const [propertiesError, setPropertiesError] = useState("")

    if (!item) return null

    const reset = () => {
        setStackCount("")
        setColorCode("")
        setPreNameType("")
        setEnchantLevel("")
        setStarLevel("")
        setDurability("")
        setMaxDurability("")
        setIsBound(undefined)
        setPropertiesJson("")
        setReplaceProperties(false)
        setPropertiesError("")
    }

    const handleUpdate = () => {
        const payload: Record<string, unknown> = { instanceId: item.id }
        const asInt = (v: string) => {
            if (v === "") return undefined
            const n = Number(v)
            return Number.isFinite(n) ? Math.trunc(n) : undefined
        }
        const sc = asInt(stackCount)
        if (sc !== undefined) payload.stackCount = sc
        const cc = asInt(colorCode)
        if (cc !== undefined) payload.colorCode = cc
        const pnt = asInt(preNameType)
        if (pnt !== undefined) payload.preNameType = pnt
        const en = asInt(enchantLevel)
        if (en !== undefined) payload.enchantLevel = en
        const st = asInt(starLevel)
        if (st !== undefined) payload.starLevel = st
        const du = asInt(durability)
        if (du !== undefined) payload.durability = du
        const md = asInt(maxDurability)
        if (md !== undefined) payload.maxDurability = md
        if (isBound !== undefined) payload.isBound = isBound

        if (propertiesJson.trim() !== "") {
            try {
                const parsed = JSON.parse(propertiesJson)
                if (
                    typeof parsed !== "object" ||
                    parsed === null ||
                    Array.isArray(parsed)
                ) {
                    setPropertiesError("Properties must be a JSON object")
                    return
                }
                payload.properties = parsed
                payload.replaceProperties = replaceProperties
                setPropertiesError("")
            } catch (err) {
                setPropertiesError(
                    `Invalid JSON: ${err instanceof Error ? err.message : String(err)}`
                )
                return
            }
        }

        if (Object.keys(payload).length <= 1) {
            toast.error("No changes to apply")
            return
        }

        action.mutate(
            { action: "update_item", payload },
            {
                onSuccess: () => {
                    onChange()
                    reset()
                    onClose()
                },
            }
        )
    }

    const handleDelete = () => {
        if (!confirm(`Delete item #${item.id} (${displayName(item)})?`)) return
        action.mutate(
            { action: "remove_item", payload: { instanceId: item.id } },
            {
                onSuccess: () => {
                    onChange()
                    reset()
                    onClose()
                },
            }
        )
    }

    return (
        <Dialog
            open={!!item}
            onOpenChange={open => {
                if (!open) {
                    reset()
                    onClose()
                }
            }}
        >
            <DialogContent className="max-w-lg">
                <DialogHeader>
                    <DialogTitle className="flex items-center gap-2">
                        <span
                            aria-hidden
                            className="inline-block h-3 w-3 shrink-0 rounded-full border border-border/60"
                            style={{
                                backgroundColor:
                                    COLOR_PREFIX[item.colorCode]?.hex,
                            }}
                        />
                        <span>{displayName(item)}</span>
                        <Badge variant="secondary">ID #{item.id}</Badge>
                    </DialogTitle>
                </DialogHeader>

                <div className="grid grid-cols-2 gap-3 text-xs">
                    <div>
                        <span className="text-muted-foreground">Template:</span>{" "}
                        {item.templateId}
                    </div>
                    <div>
                        <span className="text-muted-foreground">Type:</span>{" "}
                        {item.itemType} ({getItemTypeLabel(item.itemType)})
                    </div>
                    <div>
                        <span className="text-muted-foreground">Slot:</span>{" "}
                        {item.slotType}/{item.slotIndex} (sid {item.sid})
                    </div>
                    <div>
                        <span className="text-muted-foreground">Color:</span>{" "}
                        {item.colorCode}
                    </div>
                    <div>
                        <span className="text-muted-foreground">PreName:</span>{" "}
                        {item.preNameType}
                        {item.preNameType > 0 &&
                            ` (${COLOR_PREFIX[item.preNameType]?.prefix ?? ""})`}
                    </div>
                    <div>
                        <span className="text-muted-foreground">Stack:</span>{" "}
                        {item.stackCount}
                    </div>
                    <div>
                        <span className="text-muted-foreground">Bound:</span>{" "}
                        {item.isBound ? "Yes" : "No"}
                    </div>
                    {item.durability != null && (
                        <div className="col-span-2">
                            <span className="text-muted-foreground">
                                Durability:
                            </span>{" "}
                            {item.durability}/{item.maxDurability ?? "?"}
                        </div>
                    )}
                </div>

                <div className="grid grid-cols-2 gap-3 pt-2">
                    <div className="space-y-1">
                        <Label className="text-xs">Stack Count</Label>
                        <Input
                            type="number"
                            placeholder={String(item.stackCount)}
                            value={stackCount}
                            onChange={e => setStackCount(e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Color Code (0-5)</Label>
                        <Input
                            type="number"
                            placeholder={String(item.colorCode)}
                            value={colorCode}
                            onChange={e => setColorCode(e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">PreName Type (0-5)</Label>
                        <Input
                            type="number"
                            placeholder={String(item.preNameType)}
                            value={preNameType}
                            onChange={e => setPreNameType(e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Enchant Level</Label>
                        <Input
                            type="number"
                            placeholder={String(item.enchantLevel)}
                            value={enchantLevel}
                            onChange={e => setEnchantLevel(e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Star Level</Label>
                        <Input
                            type="number"
                            placeholder={String(item.starLevel)}
                            value={starLevel}
                            onChange={e => setStarLevel(e.target.value)}
                        />
                    </div>
                    {item.durability != null && (
                        <>
                            <div className="space-y-1">
                                <Label className="text-xs">Durability</Label>
                                <Input
                                    type="number"
                                    placeholder={String(item.durability)}
                                    value={durability}
                                    onChange={e =>
                                        setDurability(e.target.value)
                                    }
                                />
                            </div>
                            <div className="space-y-1">
                                <Label className="text-xs">
                                    Max Durability
                                </Label>
                                <Input
                                    type="number"
                                    placeholder={String(
                                        item.maxDurability ?? ""
                                    )}
                                    value={maxDurability}
                                    onChange={e =>
                                        setMaxDurability(e.target.value)
                                    }
                                />
                            </div>
                        </>
                    )}
                    <div className="col-span-2 flex items-center justify-between rounded-md border border-border/40 px-3 py-2">
                        <Label className="text-xs">Bound</Label>
                        <Switch
                            checked={isBound ?? item.isBound}
                            onCheckedChange={v => setIsBound(v)}
                        />
                    </div>
                </div>

                <div className="space-y-1 rounded-md border border-border/40 p-2">
                    <div className="flex items-center justify-between">
                        <Label className="text-xs">Properties (JSON)</Label>
                        <div className="flex items-center gap-2 text-[11px]">
                            <Button
                                type="button"
                                variant="ghost"
                                size="sm"
                                className="h-6 px-2 text-[10px]"
                                onClick={() => {
                                    setPropertiesJson(
                                        JSON.stringify(
                                            item.properties ?? {},
                                            null,
                                            2
                                        )
                                    )
                                    setPropertiesError("")
                                }}
                            >
                                Load current
                            </Button>
                            <Button
                                type="button"
                                variant="ghost"
                                size="sm"
                                className="h-6 px-2 text-[10px]"
                                onClick={() => {
                                    setPropertiesJson("")
                                    setPropertiesError("")
                                }}
                            >
                                Clear
                            </Button>
                            <label className="flex items-center gap-1">
                                <Switch
                                    checked={replaceProperties}
                                    onCheckedChange={setReplaceProperties}
                                />
                                <span>Replace</span>
                            </label>
                        </div>
                    </div>
                    <Textarea
                        rows={6}
                        placeholder='{"preNameType": 5, "flag": "..."}'
                        value={propertiesJson}
                        onChange={e => {
                            setPropertiesJson(e.target.value)
                            setPropertiesError("")
                        }}
                        className="font-mono text-xs"
                    />
                    <p className="text-[10px] text-muted-foreground">
                        {replaceProperties
                            ? "Replace will overwrite the entire properties map."
                            : "Merge patches keys into existing properties. Use null to delete a key."}
                    </p>
                    {propertiesError && (
                        <p className="text-[10px] text-destructive">
                            {propertiesError}
                        </p>
                    )}
                </div>

                <DialogFooter className="gap-2 sm:justify-between">
                    <Button
                        variant="destructive"
                        size="sm"
                        onClick={handleDelete}
                        disabled={action.isPending}
                    >
                        <Trash2 className="mr-1 h-4 w-4" /> Delete
                    </Button>
                    <div className="flex gap-2">
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => {
                                reset()
                                onClose()
                            }}
                        >
                            <X className="mr-1 h-4 w-4" /> Cancel
                        </Button>
                        <Button
                            size="sm"
                            onClick={handleUpdate}
                            disabled={action.isPending}
                        >
                            Apply
                        </Button>
                    </div>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}

export function ItemsTab({ playerId }: ItemsTabProps) {
    const { data, isLoading, error, refetch } = usePlayerInventory(playerId)
    const queryClient = useQueryClient()
    const [activePage, setActivePage] = useState<string>("bag-0")
    const [selected, setSelected] = useState<InventoryItem | null>(null)

    const pages = useMemo(
        () => buildPages(data?.bagSlots ?? 210),
        [data?.bagSlots]
    )
    const activeBag = pages.find(p => p.key === activePage) ?? pages[0]
    const [addOpen, setAddOpen] = useState(false)

    const handleChange = () => {
        void refetch()
        void queryClient.invalidateQueries({
            queryKey: ["player-detail", String(playerId)],
        })
    }

    if (isLoading) {
        return (
            <div className="py-12 text-center text-muted-foreground">
                Loading inventory...
            </div>
        )
    }
    if (error) {
        return (
            <div className="py-12 text-center text-destructive">
                {error.message}
            </div>
        )
    }
    if (!data) return null

    return (
        <div className="space-y-4">
            <div className="grid gap-4 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.2fr)]">
                <EquipmentPanel items={data.items} onPick={setSelected} />

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between pb-3">
                        <CardTitle className="text-base">Túi đồ</CardTitle>
                        <div className="flex items-center gap-2">
                            <Badge variant="secondary" className="font-mono">
                                {
                                    data.items.filter(
                                        i =>
                                            i.slotType === activeBag.slotType &&
                                            Math.floor(
                                                i.slotIndex / SLOTS_PER_BAG_PAGE
                                            ) === activeBag.pageIndex
                                    ).length
                                }
                                /{activeBag.slotCount}
                            </Badge>
                            <Button
                                size="sm"
                                className="h-7 gap-1 px-2"
                                onClick={() => setAddOpen(true)}
                            >
                                <Plus className="h-3.5 w-3.5" /> Add Item
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <div className="flex flex-wrap gap-1">
                            {pages.map(p => (
                                <Button
                                    key={p.key}
                                    size="sm"
                                    variant={
                                        activePage === p.key
                                            ? "default"
                                            : "outline"
                                    }
                                    className="h-8 min-w-10 px-2 text-xs"
                                    onClick={() => setActivePage(p.key)}
                                >
                                    {p.label}
                                </Button>
                            ))}
                        </div>
                        <BagGrid
                            page={activeBag}
                            items={data.items}
                            onPick={setSelected}
                            onAddAt={() => setAddOpen(true)}
                        />
                        <p className="text-xs text-muted-foreground">
                            Hover an item for details. Click an item to edit or
                            delete. Click an empty slot to add. Color indicates
                            quality tier.
                        </p>
                    </CardContent>
                </Card>
            </div>

            <ItemEditDialog
                playerId={playerId}
                item={selected}
                onClose={() => setSelected(null)}
                onChange={handleChange}
            />

            <AddItemDialog
                open={addOpen}
                playerId={playerId}
                onOpenChange={setAddOpen}
                onSuccess={handleChange}
            />
        </div>
    )
}
