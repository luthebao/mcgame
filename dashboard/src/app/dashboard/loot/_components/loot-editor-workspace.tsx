"use client"

import {
    useCallback,
    useEffect,
    useMemo,
    useRef,
    useState,
    type DragEvent,
} from "react"
import Image from "next/image"
import Link from "next/link"
import {
    ArrowLeft,
    ChevronLeft,
    ChevronRight,
    RefreshCcw,
    Save,
    Search,
} from "lucide-react"
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
import { cn } from "@/lib/utils"
import {
    BOX_ITEM_CURRENCY_OPTIONS,
    BOX_ITEM_GAME_CURRENCY_OPTIONS,
} from "@/lib/box-item-awards"
import { getErrorMessage } from "@/services/api"
import {
    lootService,
    type LootDetailResult,
    type LootDropInput,
    type LootDropRow,
    type LootItemOption,
} from "@/services/loot.service"

import { LOOT_RATE_MAX } from "../_lib/shared"

const CURRENCY_REWARD_TYPES = new Set([30, 31, 35])
const LOOT_REWARD_TYPE_OPTIONS = [
    { value: 29, label: "Vật phẩm thường" },
    { value: 19, label: "Trang bị" },
    { value: 508, label: "Vật phẩm nhiệm vụ (508)" },
    { value: 509, label: "Vật phẩm nhiệm vụ (509)" },
    { value: 550, label: "Pet item bag (550)" },
    { value: 30, label: "Tiền tệ cơ bản (money/gold/honor)" },
    { value: 31, label: "Kinh nghiệm" },
    { value: 35, label: "Tiền tệ wallet (warSprite, heiyaoshiPoint, …)" },
]

function isCurrencyType(t: number) {
    return CURRENCY_REWARD_TYPES.has(t)
}

function basicCurrencyLabel(awardId: number) {
    const match = BOX_ITEM_CURRENCY_OPTIONS.find(o => Number(o.value) === awardId)
    return match ? match.label : `Basic ${awardId}`
}

function gameCurrencyLabel(awardId: number) {
    const match = BOX_ITEM_GAME_CURRENCY_OPTIONS.find(
        o => Number(o.value) === awardId
    )
    return match ? match.label : `Game currency ${awardId}`
}

type DraftRow = LootDropInput & {
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

function rowsFromServer(rows: LootDropRow[]): DraftRow[] {
    return rows.map(r => ({
        _key: r.id > 0 ? `db-${r.id}` : nextKey(),
        id: r.id,
        itemId: r.itemId,
        itemName: r.itemName,
        iconDataUrl: r.iconDataUrl,
        rate: r.rate,
        quality: r.quality,
        bind: r.bind,
        qid: r.qid,
        type: r.type,
        qtyMin: r.qtyMin || 1,
        qtyMax: r.qtyMax || Math.max(r.qtyMin || 1, 1),
    }))
}

function draftFromOption(option: LootItemOption, type: number): DraftRow {
    return {
        _key: nextKey(),
        itemId: option.itemId,
        itemName: option.name,
        iconDataUrl: option.iconDataUrl,
        rate: 1000,
        quality: 0,
        bind: 0,
        qid: 0,
        type,
        qtyMin: 1,
        qtyMax: 1,
    }
}

function draftFromCurrency(type: number, awardId: number): DraftRow {
    return {
        _key: nextKey(),
        itemId: awardId,
        itemName: "",
        iconDataUrl: "",
        rate: 1000,
        quality: 0,
        bind: 0,
        qid: 0,
        type,
        qtyMin: 1,
        qtyMax: 1,
    }
}

function awardDisplayName(row: DraftRow) {
    if (row.type === 30) return basicCurrencyLabel(row.itemId)
    if (row.type === 31) return "Kinh nghiệm"
    if (row.type === 35) return gameCurrencyLabel(row.itemId)
    return row.itemName || `Item ${row.itemId}`
}

export function LootEditorWorkspace({ cid }: { cid: number }) {
    const [detail, setDetail] = useState<LootDetailResult | null>(null)
    const [rows, setRows] = useState<DraftRow[]>([])
    const [loading, setLoading] = useState(true)
    const [saving, setSaving] = useState(false)
    const [error, setError] = useState("")
    const [search, setSearch] = useState("")
    const [options, setOptions] = useState<LootItemOption[]>([])
    const [optionsLoading, setOptionsLoading] = useState(false)
    const [dropActive, setDropActive] = useState(false)
    const [addType, setAddType] = useState<number>(29)

    const searchReqRef = useRef(0)
    const dragOptionRef = useRef<LootItemOption | null>(null)

    const load = useCallback(async () => {
        setLoading(true)
        setError("")
        try {
            const res = await lootService.detail(cid)
            setDetail(res)
            setRows(rowsFromServer(res.drops))
        } catch (err) {
            setError(getErrorMessage(err))
            setDetail(null)
            setRows([])
        } finally {
            setLoading(false)
        }
    }, [cid])

    useEffect(() => {
        void load()
    }, [load])

    useEffect(() => {
        if (isCurrencyType(addType)) {
            setOptions([])
            setOptionsLoading(false)
            return
        }
        const reqId = ++searchReqRef.current
        const timer = window.setTimeout(async () => {
            setOptionsLoading(true)
            try {
                const res = await lootService.itemOptions(search.trim())
                if (reqId === searchReqRef.current) setOptions(res.items)
            } catch {
                if (reqId === searchReqRef.current) setOptions([])
            } finally {
                if (reqId === searchReqRef.current) setOptionsLoading(false)
            }
        }, 250)
        return () => window.clearTimeout(timer)
    }, [search, addType])

    const addOption = useCallback(
        (option: LootItemOption) => {
            setRows(prev => [...prev, draftFromOption(option, addType)])
        },
        [addType]
    )

    const addCurrency = useCallback(
        (awardId: number) => {
            setRows(prev => [...prev, draftFromCurrency(addType, awardId)])
        },
        [addType]
    )

    const addExperience = useCallback(() => {
        setRows(prev => [...prev, draftFromCurrency(31, 0)])
    }, [])

    const updateRow = useCallback(
        (key: string, patch: Partial<DraftRow>) => {
            setRows(prev =>
                prev.map(r => (r._key === key ? { ...r, ...patch } : r))
            )
        },
        []
    )

    const removeRow = useCallback((key: string) => {
        setRows(prev => prev.filter(r => r._key !== key))
    }, [])

    const totalRate = useMemo(
        () =>
            rows.reduce((s, r) => s + (Number.isFinite(r.rate) ? r.rate : 0), 0),
        [rows]
    )

    const ratePct = totalRate > 0 ? (totalRate / LOOT_RATE_MAX) * 100 : 0

    const save = useCallback(async () => {
        setSaving(true)
        try {
            const payload: LootDropInput[] = rows.map(r => ({
                itemId: r.itemId,
                rate: r.rate,
                quality: r.quality,
                bind: r.bind,
                qid: r.qid,
                type: r.type,
                qtyMin: r.qtyMin,
                qtyMax: Math.max(r.qtyMax, r.qtyMin),
            }))
            const res = await lootService.save(cid, payload)
            if (!res.ok) {
                toast.error(res.message || "Lưu thất bại")
                return
            }
            toast.success(`Đã lưu ${res.inserted} dòng`)
            await load()
        } catch (err) {
            toast.error(getErrorMessage(err))
        } finally {
            setSaving(false)
        }
    }, [cid, rows, load])

    const handleDragStart = useCallback((option: LootItemOption) => {
        return (event: DragEvent<HTMLDivElement>) => {
            dragOptionRef.current = option
            event.dataTransfer.effectAllowed = "copy"
            event.dataTransfer.setData("text/plain", String(option.itemId))
        }
    }, [])

    const handleDragEnd = useCallback(() => {
        dragOptionRef.current = null
        setDropActive(false)
    }, [])

    const handleDrop = useCallback(
        (event: DragEvent<HTMLDivElement>) => {
            event.preventDefault()
            const option = dragOptionRef.current
            dragOptionRef.current = null
            setDropActive(false)
            if (!option) return
            addOption(option)
        },
        [addOption]
    )

    if (loading) {
        return (
            <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4">
                <Button asChild variant="outline" size="sm" className="w-fit">
                    <Link href="/dashboard/loot">
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
                    <Link href="/dashboard/loot">
                        <ArrowLeft className="mr-2 h-4 w-4" />
                        Quay lại danh sách
                    </Link>
                </Button>
                <Card className="flex flex-1 items-center justify-center">
                    <CardContent className="pt-6 text-center">
                        <p className="font-medium">Không mở được cấu hình rớt.</p>
                        <p className="mt-1 text-sm text-destructive">
                            {error || `Không tìm thấy quái #${cid}.`}
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
                        <Link href="/dashboard/loot">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Quay lại danh sách
                        </Link>
                    </Button>

                    <div className="space-y-2">
                        <h2 className="text-xl font-semibold">
                            {detail.name}{" "}
                            <span className="text-muted-foreground">
                                #{detail.cid}
                            </span>
                        </h2>
                        <p className="text-sm text-muted-foreground">
                            Kéo vật phẩm từ card bên trái sang card bên phải hoặc
                            bấm mũi tên để thêm và gỡ khỏi bảng rơi.
                        </p>
                        <div className="flex flex-wrap items-center gap-2">
                            <Badge variant="outline" className="font-mono">
                                {rows.length} dòng
                            </Badge>
                            <Badge
                                variant={
                                    totalRate > LOOT_RATE_MAX
                                        ? "destructive"
                                        : "secondary"
                                }
                                className="font-mono"
                            >
                                Tỉ lệ {totalRate}/{LOOT_RATE_MAX}
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
                    <Button
                        type="button"
                        onClick={() => void save()}
                        disabled={saving}
                    >
                        <Save className="mr-2 h-4 w-4" />
                        {saving ? "Đang lưu..." : "Lưu thay đổi"}
                    </Button>
                </div>
            </div>

            <div className="grid min-h-0 flex-1 gap-4 xl:grid-cols-[minmax(0,0.95fr)_minmax(0,1.05fr)]">
                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">
                            Tất cả vật phẩm
                        </CardTitle>
                        <CardDescription>
                            Tìm theo ID hoặc tên rồi kéo sang phải, hoặc bấm nút
                            mũi tên.
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="flex min-h-0 flex-1 flex-col gap-4">
                        <div className="grid gap-3 md:grid-cols-[240px_minmax(0,1fr)]">
                            <Select
                                value={String(addType)}
                                onValueChange={v => setAddType(Number(v))}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Loại phần thưởng" />
                                </SelectTrigger>
                                <SelectContent>
                                    {LOOT_REWARD_TYPE_OPTIONS.map(opt => (
                                        <SelectItem key={opt.value} value={String(opt.value)}>
                                            {opt.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>

                            {!isCurrencyType(addType) ? (
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
                            ) : addType === 35 ? (
                                <div className="relative">
                                    <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                    <Input
                                        type="text"
                                        value={search}
                                        onChange={e => setSearch(e.target.value)}
                                        placeholder="Tìm theo tên tiền tệ..."
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
                                        <ChevronRight className="h-4 w-4" />
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
                                            EXP cộng vào nhân vật khi roll trúng
                                        </div>
                                    </div>
                                    <ChevronRight className="h-4 w-4" />
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
                                        <ChevronRight className="h-4 w-4" />
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
                                    <div
                                        key={`${opt.itemId}-${opt.templateType}`}
                                        draggable
                                        onDragStart={handleDragStart(opt)}
                                        onDragEnd={handleDragEnd}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 transition-colors hover:bg-accent/50"
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
                                            <div className="truncate font-medium">
                                                {opt.name}
                                            </div>
                                            <div className="truncate text-xs text-muted-foreground">
                                                #{opt.itemId} · type{" "}
                                                {opt.templateType}
                                            </div>
                                        </div>

                                        <Button
                                            type="button"
                                            variant="outline"
                                            size="icon"
                                            onClick={() => addOption(opt)}
                                            aria-label={`Thêm ${opt.name}`}
                                        >
                                            <ChevronRight className="h-4 w-4" />
                                        </Button>
                                    </div>
                                ))
                            )}
                        </div>
                    </CardContent>
                </Card>

                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">Bảng rơi</CardTitle>
                        <CardDescription>
                            {rows.length > 0
                                ? `${rows.length} dòng đang gắn với quái #${detail.cid}`
                                : "Kéo thả hoặc thêm từ card bên trái để bắt đầu cấu hình bảng rơi."}
                        </CardDescription>
                    </CardHeader>

                    <CardContent className="flex min-h-0 flex-1 flex-col">
                        <div
                            onDragOver={e => {
                                e.preventDefault()
                                setDropActive(true)
                            }}
                            onDragLeave={() => setDropActive(false)}
                            onDrop={handleDrop}
                            className={cn(
                                "flex min-h-0 flex-1 flex-col gap-3 overflow-auto rounded-lg border border-dashed p-3 transition-colors",
                                dropActive && "border-primary bg-primary/5"
                            )}
                        >
                            {rows.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center text-center text-sm text-muted-foreground">
                                    Chưa có vật phẩm nào. Hãy thêm bằng nút mũi
                                    tên hoặc kéo thả từ danh sách bên trái.
                                </div>
                            ) : (
                                rows.map(r => (
                                    <div
                                        key={r._key}
                                        className="rounded-lg border bg-background p-4"
                                    >
                                        <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                                            <div className="flex min-w-0 items-start gap-3">
                                                {r.iconDataUrl && !isCurrencyType(r.type) ? (
                                                    <Image
                                                        className="h-12 w-12 rounded-md border object-cover"
                                                        src={r.iconDataUrl}
                                                        alt={r.itemName}
                                                        width={48}
                                                        height={48}
                                                        unoptimized
                                                    />
                                                ) : (
                                                    <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                        {r.type === 31
                                                            ? "EXP"
                                                            : r.type === 30
                                                              ? "$"
                                                              : r.type === 35
                                                                ? "¤"
                                                                : "No icon"}
                                                    </div>
                                                )}

                                                <div className="min-w-0">
                                                    <div className="truncate font-medium">
                                                        {awardDisplayName(r)}
                                                    </div>
                                                    <div className="mt-1 flex flex-wrap gap-2 text-xs text-muted-foreground">
                                                        <Badge variant="secondary">
                                                            type {r.type}
                                                        </Badge>
                                                        <Badge
                                                            variant="outline"
                                                            className="font-mono"
                                                        >
                                                            {r.type === 31
                                                                ? "EXP"
                                                                : `id ${r.itemId}`}
                                                        </Badge>
                                                        {r.id && r.id > 0 ? (
                                                            <Badge
                                                                variant="outline"
                                                                className="font-mono"
                                                            >
                                                                Drop #{r.id}
                                                            </Badge>
                                                        ) : (
                                                            <Badge variant="outline">
                                                                Mới thêm
                                                            </Badge>
                                                        )}
                                                    </div>
                                                </div>
                                            </div>

                                            <Button
                                                type="button"
                                                variant="outline"
                                                size="icon"
                                                onClick={() => removeRow(r._key)}
                                                disabled={saving}
                                                aria-label={`Gỡ ${r.itemName}`}
                                            >
                                                <ChevronLeft className="h-4 w-4" />
                                            </Button>
                                        </div>

                                        <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                                            <div className="space-y-1">
                                                <p className="text-xs font-medium text-muted-foreground">
                                                    Rate (/{LOOT_RATE_MAX})
                                                </p>
                                                <Input
                                                    type="number"
                                                    min={0}
                                                    max={LOOT_RATE_MAX}
                                                    value={r.rate}
                                                    onChange={e =>
                                                        updateRow(r._key, {
                                                            rate: Math.max(
                                                                0,
                                                                Math.min(
                                                                    LOOT_RATE_MAX,
                                                                    Number(
                                                                        e.target
                                                                            .value
                                                                    ) || 0
                                                                )
                                                            ),
                                                        })
                                                    }
                                                />
                                                {totalRate > 0 ? (
                                                    <p className="text-[11px] text-muted-foreground">
                                                        ~
                                                        {(
                                                            (r.rate /
                                                                LOOT_RATE_MAX) *
                                                            100
                                                        ).toFixed(2)}
                                                        % xác suất rơi
                                                    </p>
                                                ) : null}
                                            </div>

                                            <div className="space-y-1">
                                                <p className="text-xs font-medium text-muted-foreground">
                                                    Qty min
                                                </p>
                                                <Input
                                                    type="number"
                                                    min={1}
                                                    value={r.qtyMin}
                                                    onChange={e => {
                                                        const v = Math.max(
                                                            1,
                                                            Number(e.target.value) || 1
                                                        )
                                                        updateRow(r._key, {
                                                            qtyMin: v,
                                                            qtyMax: Math.max(v, r.qtyMax),
                                                        })
                                                    }}
                                                />
                                            </div>

                                            <div className="space-y-1">
                                                <p className="text-xs font-medium text-muted-foreground">
                                                    Qty max
                                                </p>
                                                <Input
                                                    type="number"
                                                    min={r.qtyMin}
                                                    value={r.qtyMax}
                                                    onChange={e =>
                                                        updateRow(r._key, {
                                                            qtyMax: Math.max(
                                                                r.qtyMin,
                                                                Number(
                                                                    e.target.value
                                                                ) || r.qtyMin
                                                            ),
                                                        })
                                                    }
                                                />
                                            </div>

                                            {!isCurrencyType(r.type) ? (
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Chất lượng
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        max={25}
                                                        value={r.quality}
                                                        onChange={e =>
                                                            updateRow(r._key, {
                                                                quality: Math.max(
                                                                    0,
                                                                    Math.min(
                                                                        25,
                                                                        Number(
                                                                            e.target
                                                                                .value
                                                                        ) || 0
                                                                    )
                                                                ),
                                                            })
                                                        }
                                                    />
                                                </div>
                                            ) : (
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Quest gate (qid)
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={-1}
                                                        value={r.qid}
                                                        onChange={e =>
                                                            updateRow(r._key, {
                                                                qid:
                                                                    Number(
                                                                        e.target.value
                                                                    ) || 0,
                                                            })
                                                        }
                                                    />
                                                </div>
                                            )}
                                        </div>

                                        {!isCurrencyType(r.type) ? (
                                            <div className="mt-3 grid gap-3 md:grid-cols-2">
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Quest gate (qid)
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={-1}
                                                        value={r.qid}
                                                        onChange={e =>
                                                            updateRow(r._key, {
                                                                qid:
                                                                    Number(
                                                                        e.target.value
                                                                    ) || 0,
                                                            })
                                                        }
                                                    />
                                                </div>
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Loại (type)
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        value={r.type}
                                                        onChange={e =>
                                                            updateRow(r._key, {
                                                                type: Math.max(
                                                                    0,
                                                                    Number(
                                                                        e.target.value
                                                                    ) || 0
                                                                ),
                                                            })
                                                        }
                                                    />
                                                </div>
                                            </div>
                                        ) : null}

                                        <div className="mt-3 flex items-center gap-2">
                                            <Switch
                                                id={`bind-${r._key}`}
                                                checked={r.bind === 1}
                                                onCheckedChange={checked =>
                                                    updateRow(r._key, {
                                                        bind: checked ? 1 : 0,
                                                    })
                                                }
                                                disabled={r.type === 31}
                                            />
                                            <Label
                                                htmlFor={`bind-${r._key}`}
                                                className="cursor-pointer text-xs"
                                            >
                                                {r.type === 30
                                                    ? "Khóa (chuyển sang moneyBind / goldBind)"
                                                    : r.type === 35
                                                      ? "Khóa (không áp dụng cho game currency)"
                                                      : "Khóa vật phẩm khi rơi (bind)"}
                                            </Label>
                                        </div>
                                    </div>
                                ))
                            )}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </section>
    )
}
