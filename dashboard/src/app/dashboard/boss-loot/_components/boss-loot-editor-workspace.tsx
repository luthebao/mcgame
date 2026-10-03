"use client"

import {
    useCallback,
    useEffect,
    useMemo,
    useRef,
    useState,
} from "react"
import Image from "next/image"
import Link from "next/link"
import { ArrowLeft, ChevronLeft, RefreshCcw, Save, Search, Plus } from "lucide-react"
import { toast } from "sonner"

import { Badge } from "@/components/ui/badge"
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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import { Textarea } from "@/components/ui/textarea"
import {
    BOX_ITEM_CURRENCY_OPTIONS,
    BOX_ITEM_GAME_CURRENCY_OPTIONS,
} from "@/lib/box-item-awards"
import { getErrorMessage } from "@/services/api"
import {
    bossLootService,
    type BossLootDetailResult,
    type BossLootDropInput,
    type BossLootDropRow,
    type BossLootItemOption,
} from "@/services/boss-loot.service"

import {
    BOSS_LOOT_BASIC_CURRENCY_OPTIONS,
    BOSS_LOOT_RATE_MAX,
    BOSS_LOOT_REWARD_TYPES,
} from "../_lib/shared"

type DraftRow = BossLootDropInput & {
    _key: string
    id?: number
    itemName: string
    iconDataUrl: string
}

let keyCounter = 0
function nextKey(): string {
    keyCounter += 1
    return `draft-${keyCounter}`
}

const CURRENCY_REWARD_TYPES = new Set([30, 31, 35])

function isCurrencyReward(t: number) {
    return CURRENCY_REWARD_TYPES.has(t)
}

function basicCurrencyLabel(awardId: number) {
    const match = BOSS_LOOT_BASIC_CURRENCY_OPTIONS.find(o => o.value === awardId)
    return match ? match.label : `Basic ${awardId}`
}

function gameCurrencyLabel(awardId: number) {
    const match = BOX_ITEM_GAME_CURRENCY_OPTIONS.find(
        o => Number(o.value) === awardId
    )
    return match ? match.label : `Game currency ${awardId}`
}

function awardDisplayName(row: { rewardType: number; awardId: number; itemName?: string }) {
    if (row.rewardType === 30) return basicCurrencyLabel(row.awardId)
    if (row.rewardType === 31) return "Kinh nghiệm"
    if (row.rewardType === 35) return gameCurrencyLabel(row.awardId)
    return row.itemName || `Item ${row.awardId}`
}

function rowToDraft(row: BossLootDropRow): DraftRow {
    return {
        _key: row.id > 0 ? `db-${row.id}` : nextKey(),
        id: row.id,
        rewardType: row.rewardType,
        awardId: row.awardId,
        itemName: row.itemName,
        iconDataUrl: row.iconDataUrl,
        rate: row.rate,
        quality: row.quality,
        qtyMin: row.qtyMin,
        qtyMax: row.qtyMax,
        bound: row.bound,
        qid: row.qid,
        tierFilter: row.tierFilter,
        sourceFilter: row.sourceFilter,
        notes: row.notes,
    }
}

function draftFromItemOption(option: BossLootItemOption, rewardType: number): DraftRow {
    return {
        _key: nextKey(),
        rewardType,
        awardId: option.itemId,
        itemName: option.name,
        iconDataUrl: option.iconDataUrl,
        rate: 1000,
        quality: 0,
        qtyMin: 1,
        qtyMax: 1,
        bound: false,
        qid: 0,
        tierFilter: null,
        sourceFilter: null,
        notes: null,
    }
}

function draftFromCurrency(rewardType: number, awardId: number): DraftRow {
    return {
        _key: nextKey(),
        rewardType,
        awardId,
        itemName: "",
        iconDataUrl: "",
        rate: 1000,
        quality: 0,
        qtyMin: 1,
        qtyMax: 1,
        bound: false,
        qid: 0,
        tierFilter: null,
        sourceFilter: null,
        notes: null,
    }
}

export function BossLootEditorWorkspace({ nid }: { nid: number }) {
    const [detail, setDetail] = useState<BossLootDetailResult | null>(null)
    const [rows, setRows] = useState<DraftRow[]>([])
    const [loading, setLoading] = useState(true)
    const [saving, setSaving] = useState(false)
    const [error, setError] = useState("")
    const [search, setSearch] = useState("")
    const [options, setOptions] = useState<BossLootItemOption[]>([])
    const [optionsLoading, setOptionsLoading] = useState(false)
    const [addType, setAddType] = useState<number>(29)

    const searchReqRef = useRef(0)

    const load = useCallback(async () => {
        setLoading(true)
        setError("")
        try {
            const res = await bossLootService.detail(nid)
            setDetail(res)
            setRows(res.drops.map(rowToDraft))
        } catch (err) {
            setError(getErrorMessage(err))
            setDetail(null)
            setRows([])
        } finally {
            setLoading(false)
        }
    }, [nid])

    useEffect(() => {
        void load()
    }, [load])

    useEffect(() => {
        if (isCurrencyReward(addType)) {
            setOptions([])
            setOptionsLoading(false)
            return
        }
        const reqId = ++searchReqRef.current
        const timer = window.setTimeout(async () => {
            setOptionsLoading(true)
            try {
                const res = await bossLootService.itemOptions(search.trim())
                if (reqId === searchReqRef.current) setOptions(res.items)
            } catch {
                if (reqId === searchReqRef.current) setOptions([])
            } finally {
                if (reqId === searchReqRef.current) setOptionsLoading(false)
            }
        }, 250)
        return () => window.clearTimeout(timer)
    }, [search, addType])

    const addItem = useCallback((option: BossLootItemOption) => {
        setRows(prev => [...prev, draftFromItemOption(option, addType)])
    }, [addType])

    const addCurrency = useCallback((awardId: number) => {
        setRows(prev => [...prev, draftFromCurrency(addType, awardId)])
    }, [addType])

    const addExperience = useCallback(() => {
        setRows(prev => [...prev, draftFromCurrency(31, 0)])
    }, [])

    const updateRow = useCallback((key: string, patch: Partial<DraftRow>) => {
        setRows(prev => prev.map(r => (r._key === key ? { ...r, ...patch } : r)))
    }, [])

    const removeRow = useCallback((key: string) => {
        setRows(prev => prev.filter(r => r._key !== key))
    }, [])

    const totalRate = useMemo(
        () => rows.reduce((s, r) => s + (Number.isFinite(r.rate) ? r.rate : 0), 0),
        [rows]
    )
    const ratePct = totalRate > 0 ? (totalRate / BOSS_LOOT_RATE_MAX) * 100 : 0

    const save = useCallback(async () => {
        setSaving(true)
        try {
            const payload: BossLootDropInput[] = rows.map(r => ({
                rewardType: r.rewardType,
                awardId: r.awardId,
                rate: r.rate,
                quality: r.quality,
                qtyMin: r.qtyMin,
                qtyMax: Math.max(r.qtyMax, r.qtyMin),
                bound: r.bound,
                qid: r.qid,
                tierFilter: r.tierFilter,
                sourceFilter: r.sourceFilter,
                notes: r.notes,
            }))
            const res = await bossLootService.save(nid, payload)
            if (!res.ok) {
                toast.error(res.message || "Lưu thất bại")
                return
            }
            toast.success(`Đã lưu ${res.inserted} dòng loot`)
            await load()
        } catch (err) {
            toast.error(getErrorMessage(err))
        } finally {
            setSaving(false)
        }
    }, [nid, rows, load])

    if (loading) {
        return (
            <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4">
                <Button asChild variant="outline" size="sm" className="w-fit">
                    <Link href="/dashboard/boss-loot">
                        <ArrowLeft className="mr-2 h-4 w-4" />
                        Quay lại danh sách
                    </Link>
                </Button>
                <Card className="flex flex-1 items-center justify-center">
                    <CardContent className="pt-6 text-muted-foreground">
                        Đang tải dữ liệu...
                    </CardContent>
                </Card>
            </section>
        )
    }

    if (error || !detail) {
        return (
            <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4">
                <Button asChild variant="outline" size="sm" className="w-fit">
                    <Link href="/dashboard/boss-loot">
                        <ArrowLeft className="mr-2 h-4 w-4" />
                        Quay lại danh sách
                    </Link>
                </Button>
                <Card className="flex flex-1 items-center justify-center">
                    <CardContent className="pt-6 text-center">
                        <p className="font-medium">Không mở được cấu hình loot.</p>
                        <p className="mt-1 text-sm text-destructive">
                            {error || `Không tìm thấy boss NID ${nid}.`}
                        </p>
                    </CardContent>
                </Card>
            </section>
        )
    }

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[700px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                <div className="space-y-3">
                    <Button asChild variant="outline" size="sm">
                        <Link href="/dashboard/boss-loot">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Quay lại danh sách
                        </Link>
                    </Button>
                    <div className="space-y-2">
                        <h2 className="text-xl font-semibold">
                            {detail.name}{" "}
                            <span className="text-muted-foreground">
                                #{detail.nid}
                            </span>
                        </h2>
                        <p className="text-sm text-muted-foreground">
                            {detail.kind} · tier {detail.tier} · map {detail.mapId} · lv {detail.level}
                            {detail.dailyBossId !== null
                                ? ` · daily id ${detail.dailyBossId}`
                                : ""}
                        </p>
                        <div className="flex flex-wrap items-center gap-2">
                            <Badge variant="outline" className="font-mono">
                                {rows.length} dòng
                            </Badge>
                            <Badge
                                variant={
                                    totalRate > BOSS_LOOT_RATE_MAX
                                        ? "destructive"
                                        : "secondary"
                                }
                                className="font-mono"
                            >
                                Tỉ lệ {totalRate}/{BOSS_LOOT_RATE_MAX}
                            </Badge>
                            <Badge variant="outline" className="font-mono">
                                {ratePct.toFixed(2)}% cộng dồn
                            </Badge>
                        </div>
                    </div>
                </div>

                <div className="flex flex-wrap gap-2">
                    <Button
                        type="button"
                        variant="outline"
                        onClick={() => void load()}
                        disabled={loading || saving}
                    >
                        <RefreshCcw className="mr-2 h-4 w-4" />
                        Tải lại
                    </Button>
                    <Button type="button" onClick={() => void save()} disabled={saving}>
                        <Save className="mr-2 h-4 w-4" />
                        {saving ? "Đang lưu..." : "Lưu thay đổi"}
                    </Button>
                </div>
            </div>

            <div className="grid min-h-0 flex-1 gap-4 xl:grid-cols-[minmax(0,0.95fr)_minmax(0,1.05fr)]">
                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">Thêm phần thưởng</CardTitle>
                        <CardDescription>
                            Chọn loại phần thưởng, sau đó tìm hoặc chọn để thêm
                            vào bảng loot bên phải.
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="flex min-h-0 flex-1 flex-col gap-4">
                        <div className="grid gap-3 md:grid-cols-[260px_minmax(0,1fr)]">
                            <Select
                                value={String(addType)}
                                onValueChange={v => setAddType(Number(v))}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Loại phần thưởng" />
                                </SelectTrigger>
                                <SelectContent>
                                    {BOSS_LOOT_REWARD_TYPES.map(opt => (
                                        <SelectItem
                                            key={opt.value}
                                            value={String(opt.value)}
                                        >
                                            {opt.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>

                            {!isCurrencyReward(addType) ? (
                                <div className="relative">
                                    <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                    <Input
                                        type="text"
                                        value={search}
                                        onChange={e => setSearch(e.target.value)}
                                        placeholder="Tìm vật phẩm theo ID hoặc tên..."
                                        className="pl-10"
                                    />
                                </div>
                            ) : null}
                        </div>

                        <div className="flex min-h-0 flex-1 flex-col gap-2 overflow-auto pr-1">
                            {addType === 30 ? (
                                BOX_ITEM_CURRENCY_OPTIONS.map(opt => (
                                    <button
                                        key={opt.value}
                                        type="button"
                                        onClick={() => addCurrency(Number(opt.value))}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 text-left transition-colors hover:bg-accent/50"
                                    >
                                        <div className="flex h-12 w-12 items-center justify-center rounded-md border text-xs font-medium">
                                            #{opt.value}
                                        </div>
                                        <div className="min-w-0 flex-1">
                                            <div className="font-medium">{opt.label}</div>
                                            <div className="text-xs text-muted-foreground">
                                                Bật khóa để rơi {opt.label.toLowerCase()} khóa
                                            </div>
                                        </div>
                                        <Plus className="h-4 w-4" />
                                    </button>
                                ))
                            ) : addType === 31 ? (
                                <button
                                    type="button"
                                    onClick={addExperience}
                                    className="flex items-center gap-3 rounded-lg border bg-background p-3 text-left transition-colors hover:bg-accent/50"
                                >
                                    <div className="flex h-12 w-12 items-center justify-center rounded-md border text-xs font-medium">
                                        EXP
                                    </div>
                                    <div className="min-w-0 flex-1">
                                        <div className="font-medium">Kinh nghiệm</div>
                                        <div className="text-xs text-muted-foreground">
                                            Số EXP nhân vật nhận thêm khi roll trúng
                                        </div>
                                    </div>
                                    <Plus className="h-4 w-4" />
                                </button>
                            ) : addType === 35 ? (
                                BOX_ITEM_GAME_CURRENCY_OPTIONS.filter(opt =>
                                    !search.trim() ||
                                    opt.label.toLowerCase().includes(search.toLowerCase()) ||
                                    String(opt.value).includes(search.trim())
                                ).map(opt => (
                                    <button
                                        key={opt.value}
                                        type="button"
                                        onClick={() => addCurrency(Number(opt.value))}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 text-left transition-colors hover:bg-accent/50"
                                    >
                                        <div className="flex h-12 w-12 items-center justify-center rounded-md border text-xs font-mono">
                                            #{opt.value}
                                        </div>
                                        <div className="min-w-0 flex-1 truncate">
                                            <div className="truncate font-medium">{opt.label}</div>
                                        </div>
                                        <Plus className="h-4 w-4" />
                                    </button>
                                ))
                            ) : optionsLoading ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Đang tải danh sách vật phẩm...
                                </div>
                            ) : options.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Không có vật phẩm phù hợp.
                                </div>
                            ) : (
                                options.map(opt => (
                                    <button
                                        key={`${opt.itemId}-${opt.templateType}`}
                                        type="button"
                                        onClick={() => addItem(opt)}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 text-left transition-colors hover:bg-accent/50"
                                    >
                                        {opt.iconDataUrl ? (
                                            <Image
                                                className="h-12 w-12 rounded-md border object-cover"
                                                src={opt.iconDataUrl}
                                                alt={opt.name}
                                                width={48}
                                                height={48}
                                                unoptimized
                                            />
                                        ) : (
                                            <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                No icon
                                            </div>
                                        )}
                                        <div className="min-w-0 flex-1">
                                            <div className="truncate font-medium">{opt.name}</div>
                                            <div className="truncate text-xs text-muted-foreground">
                                                #{opt.itemId} · type {opt.templateType}
                                            </div>
                                        </div>
                                        <Plus className="h-4 w-4" />
                                    </button>
                                ))
                            )}
                        </div>
                    </CardContent>
                </Card>

                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">Bảng loot</CardTitle>
                        <CardDescription>
                            {rows.length > 0
                                ? `${rows.length} dòng đang gắn với boss #${detail.nid}`
                                : "Chưa có dòng loot nào. Thêm từ card bên trái để bắt đầu."}
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="flex min-h-0 flex-1 flex-col">
                        <div className="flex min-h-0 flex-1 flex-col gap-3 overflow-auto rounded-lg border border-dashed p-3">
                            {rows.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center text-center text-sm text-muted-foreground">
                                    Chưa có vật phẩm / tiền tệ nào. Thêm từ card
                                    bên trái.
                                </div>
                            ) : (
                                rows.map(r => (
                                    <BossLootRowCard
                                        key={r._key}
                                        row={r}
                                        onUpdate={patch => updateRow(r._key, patch)}
                                        onRemove={() => removeRow(r._key)}
                                        disabled={saving}
                                    />
                                ))
                            )}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </section>
    )
}

type RowCardProps = {
    row: DraftRow
    onUpdate: (patch: Partial<DraftRow>) => void
    onRemove: () => void
    disabled: boolean
}

function BossLootRowCard({ row, onUpdate, onRemove, disabled }: RowCardProps) {
    const isCurrency = isCurrencyReward(row.rewardType)
    const isExp = row.rewardType === 31
    const isBasicCurrency = row.rewardType === 30

    return (
        <div className="rounded-lg border bg-background p-4">
            <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                <div className="flex min-w-0 items-start gap-3">
                    {row.iconDataUrl && !isCurrency ? (
                        <Image
                            className="h-12 w-12 rounded-md border object-cover"
                            src={row.iconDataUrl}
                            alt={row.itemName}
                            width={48}
                            height={48}
                            unoptimized
                        />
                    ) : (
                        <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                            {isExp ? "EXP" : isBasicCurrency ? "$" : isCurrency ? "¤" : "?"}
                        </div>
                    )}
                    <div className="min-w-0">
                        <div className="truncate font-medium">
                            {awardDisplayName(row)}
                        </div>
                        <div className="mt-1 flex flex-wrap gap-2 text-xs text-muted-foreground">
                            <Badge variant="secondary">type {row.rewardType}</Badge>
                            <Badge variant="outline" className="font-mono">
                                {isExp ? "EXP" : `id ${row.awardId}`}
                            </Badge>
                            {row.id && row.id > 0 ? (
                                <Badge variant="outline" className="font-mono">
                                    Drop #{row.id}
                                </Badge>
                            ) : (
                                <Badge variant="outline">Mới thêm</Badge>
                            )}
                        </div>
                    </div>
                </div>
                <Button
                    type="button"
                    variant="outline"
                    size="icon"
                    onClick={onRemove}
                    disabled={disabled}
                    aria-label="Gỡ dòng"
                >
                    <ChevronLeft className="h-4 w-4" />
                </Button>
            </div>

            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                <div className="space-y-1">
                    <p className="text-xs font-medium text-muted-foreground">
                        Rate (/{BOSS_LOOT_RATE_MAX})
                    </p>
                    <Input
                        type="number"
                        min={1}
                        max={BOSS_LOOT_RATE_MAX}
                        value={row.rate}
                        onChange={e =>
                            onUpdate({
                                rate: Math.max(1, Math.min(BOSS_LOOT_RATE_MAX, Number(e.target.value) || 1)),
                            })
                        }
                    />
                </div>

                <div className="space-y-1">
                    <p className="text-xs font-medium text-muted-foreground">Số lượng tối thiểu</p>
                    <Input
                        type="number"
                        min={1}
                        value={row.qtyMin}
                        onChange={e => {
                            const v = Math.max(1, Number(e.target.value) || 1)
                            onUpdate({ qtyMin: v, qtyMax: Math.max(v, row.qtyMax) })
                        }}
                    />
                </div>

                <div className="space-y-1">
                    <p className="text-xs font-medium text-muted-foreground">Số lượng tối đa</p>
                    <Input
                        type="number"
                        min={row.qtyMin}
                        value={row.qtyMax}
                        onChange={e =>
                            onUpdate({
                                qtyMax: Math.max(row.qtyMin, Number(e.target.value) || row.qtyMin),
                            })
                        }
                    />
                </div>

                {!isCurrency ? (
                    <div className="space-y-1">
                        <p className="text-xs font-medium text-muted-foreground">Chất lượng</p>
                        <Input
                            type="number"
                            min={0}
                            max={25}
                            value={row.quality}
                            onChange={e =>
                                onUpdate({
                                    quality: Math.max(0, Math.min(25, Number(e.target.value) || 0)),
                                })
                            }
                        />
                    </div>
                ) : (
                    <div className="space-y-1">
                        <p className="text-xs font-medium text-muted-foreground">Quest gate (qid)</p>
                        <Input
                            type="number"
                            min={-1}
                            value={row.qid}
                            onChange={e =>
                                onUpdate({ qid: Number(e.target.value) || 0 })
                            }
                        />
                    </div>
                )}
            </div>

            <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                <div className="space-y-1">
                    <Label className="text-xs">Filter tier</Label>
                    <Select
                        value={row.tierFilter ?? "any"}
                        onValueChange={v =>
                            onUpdate({ tierFilter: v === "any" ? null : v })
                        }
                    >
                        <SelectTrigger>
                            <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="any">Tất cả tier</SelectItem>
                            <SelectItem value="normal">normal</SelectItem>
                            <SelectItem value="mythic">mythic</SelectItem>
                            <SelectItem value="special">special</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
                <div className="space-y-1">
                    <Label className="text-xs">Filter source</Label>
                    <Select
                        value={row.sourceFilter ?? "any"}
                        onValueChange={v =>
                            onUpdate({ sourceFilter: v === "any" ? null : v })
                        }
                    >
                        <SelectTrigger>
                            <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="any">Tất cả</SelectItem>
                            <SelectItem value="schedule">schedule</SelectItem>
                            <SelectItem value="daily">daily</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
                {!isCurrency ? (
                    <div className="space-y-1">
                        <Label className="text-xs">Quest gate (qid)</Label>
                        <Input
                            type="number"
                            min={-1}
                            value={row.qid}
                            onChange={e =>
                                onUpdate({ qid: Number(e.target.value) || 0 })
                            }
                        />
                    </div>
                ) : null}
            </div>

            <div className="mt-3 flex items-center gap-3">
                <Switch
                    id={`bound-${row._key}`}
                    checked={row.bound}
                    onCheckedChange={checked => onUpdate({ bound: checked })}
                    disabled={isExp}
                />
                <Label htmlFor={`bound-${row._key}`} className="cursor-pointer text-xs">
                    {isBasicCurrency
                        ? "Khóa (chuyển sang moneyBind / goldBind)"
                        : isCurrency
                          ? "Khóa (không áp dụng cho game currency)"
                          : "Khóa vật phẩm khi rơi"}
                </Label>
            </div>

            <div className="mt-3 space-y-1">
                <Label className="text-xs">Ghi chú (tùy chọn)</Label>
                <Textarea
                    rows={2}
                    value={row.notes ?? ""}
                    onChange={e =>
                        onUpdate({ notes: e.target.value ? e.target.value : null })
                    }
                    placeholder="Mô tả cho admin – không gửi đến client"
                    className="text-xs"
                />
            </div>
        </div>
    )
}
