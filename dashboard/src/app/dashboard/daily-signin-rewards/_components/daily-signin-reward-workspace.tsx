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
import { ChevronRight, RefreshCcw, Save, Search, Trash2 } from "lucide-react"
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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { cn } from "@/lib/utils"
import { getErrorMessage } from "@/services/api"
import {
    ITEM_KIND_LABELS,
    ITEM_TYPE_LABELS,
    KIND_TO_TYPES,
} from "@/app/dashboard/items/_lib/shared"
import {
    dailySigninRewardService,
    type DailySigninItemOption,
    type DailySigninRewardInput,
    type DailySigninRewardRow,
} from "@/services/daily-signin-reward.service"

type IncBucket = 1 | 2 | 4

type Draft = {
    key: string
    rewardId: number
    inc: IncBucket
    itemId: number
    itemName: string
    iconDataUrl: string
    quantity: number
    weight: number
    note: string
}

const KIND_OPTIONS = Object.entries(ITEM_KIND_LABELS)
    .map(([key, label]) => ({ value: Number(key), label }))
    .sort((a, b) => a.value - b.value)

function getTypeOptionsForKind(
    kind: string
): Array<{ value: number; label: string }> {
    if (kind === "all") {
        return Object.entries(ITEM_TYPE_LABELS)
            .map(([key, label]) => ({ value: Number(key), label }))
            .sort((a, b) => a.value - b.value)
    }
    const ids = KIND_TO_TYPES[Number(kind)] || []
    return ids
        .map(id => ({
            value: id,
            label: ITEM_TYPE_LABELS[id] || `Loại ${id}`,
        }))
        .sort((a, b) => a.value - b.value)
}

const INC_BUCKETS: ReadonlyArray<{
    inc: IncBucket
    title: string
    description: string
    weighted: boolean
}> = [
    {
        inc: 1,
        title: "Phần thưởng ngày (inc=1)",
        description:
            "Mỗi ngày ký tên trao 1 vật phẩm cố định. Trọng số không áp dụng — server lấy mục đầu tiên.",
        weighted: false,
    },
    {
        inc: 2,
        title: "Bonus ngày may mắn (inc=2)",
        description:
            "Khi đủ chuỗi, server roll trọng số ngẫu nhiên từ pool này (ngày may mắn).",
        weighted: true,
    },
    {
        inc: 4,
        title: "Bonus bạo kích (inc=4)",
        description:
            "Khi roll bạo kích, server cộng thêm 1 vật phẩm từ pool này theo trọng số.",
        weighted: true,
    },
]

let keyCounter = 0
function nextKey() {
    keyCounter += 1
    return `draft-${keyCounter}`
}

function rowToDraft(row: DailySigninRewardRow): Draft {
    const inc = (row.inc === 1 || row.inc === 2 || row.inc === 4
        ? row.inc
        : 1) as IncBucket
    return {
        key: row.rewardId > 0 ? `db-${row.rewardId}` : nextKey(),
        rewardId: row.rewardId,
        inc,
        itemId: row.itemId,
        itemName: row.itemName,
        iconDataUrl: "",
        quantity: row.quantity,
        weight: row.weight,
        note: row.note ?? "",
    }
}

function isValidDraft(draft: Draft): boolean {
    return draft.itemId > 0 && draft.quantity >= 1
}

export function DailySigninRewardWorkspace() {
    const [drafts, setDrafts] = useState<Draft[]>([])
    const [loading, setLoading] = useState(true)
    const [saving, setSaving] = useState(false)
    const [iconCache, setIconCache] = useState<Record<number, string>>({})

    const [search, setSearch] = useState("")
    const [kindFilter, setKindFilter] = useState<string>("all")
    const [typeFilter, setTypeFilter] = useState<string>("all")
    const [searchResults, setSearchResults] = useState<DailySigninItemOption[]>(
        []
    )
    const [searching, setSearching] = useState(false)
    const [dropTargetInc, setDropTargetInc] = useState<IncBucket | null>(null)

    const typeOptions = useMemo(
        () => getTypeOptionsForKind(kindFilter),
        [kindFilter]
    )

    const dragItemRef = useRef<DailySigninItemOption | null>(null)
    const searchRequestRef = useRef(0)
    const originalsRef = useRef<DailySigninRewardRow[]>([])

    const loadRewards = useCallback(async () => {
        setLoading(true)
        try {
            const rows = await dailySigninRewardService.list()
            originalsRef.current = rows
            setDrafts(rows.map(rowToDraft))
        } catch (error) {
            toast.error(getErrorMessage(error))
            originalsRef.current = []
            setDrafts([])
        } finally {
            setLoading(false)
        }
    }, [])

    useEffect(() => {
        void loadRewards()
    }, [loadRewards])

    useEffect(() => {
        const requestId = ++searchRequestRef.current
        const timer = window.setTimeout(async () => {
            setSearching(true)
            try {
                const items = await dailySigninRewardService.searchItems({
                    search,
                    kind: kindFilter === "all" ? null : Number(kindFilter),
                    templateType:
                        typeFilter === "all" ? null : Number(typeFilter),
                    limit: 30,
                })
                if (requestId !== searchRequestRef.current) return
                setSearchResults(items)
                if (items.length > 0) {
                    setIconCache(prev => {
                        const next = { ...prev }
                        for (const item of items) {
                            if (item.iconDataUrl)
                                next[item.itemId] = item.iconDataUrl
                        }
                        return next
                    })
                }
            } catch (error) {
                if (requestId !== searchRequestRef.current) return
                setSearchResults([])
                toast.error(getErrorMessage(error))
            } finally {
                if (requestId === searchRequestRef.current) setSearching(false)
            }
        }, 250)

        return () => window.clearTimeout(timer)
    }, [search, kindFilter, typeFilter])

    const draftsByInc = useMemo(() => {
        const map = new Map<IncBucket, Draft[]>([
            [1, []],
            [2, []],
            [4, []],
        ])
        for (const draft of drafts) {
            const list = map.get(draft.inc)
            if (list) list.push(draft)
        }
        return map
    }, [drafts])

    const totalWeightByInc = useMemo(() => {
        const map = new Map<IncBucket, number>()
        for (const bucket of INC_BUCKETS) {
            if (!bucket.weighted) continue
            const list = draftsByInc.get(bucket.inc) || []
            map.set(
                bucket.inc,
                list.reduce((sum, d) => sum + Math.max(0, d.weight), 0)
            )
        }
        return map
    }, [draftsByInc])

    const changedCount = useMemo(() => {
        const originals = originalsRef.current
        if (originals.length !== drafts.length) {
            return drafts.length + originals.length
        }
        const original = JSON.stringify(
            [...originals]
                .map(r => ({
                    rewardId: r.rewardId,
                    inc: r.inc,
                    itemId: r.itemId,
                    quantity: r.quantity,
                    weight: r.weight,
                    note: r.note ?? "",
                }))
                .sort((a, b) => a.rewardId - b.rewardId)
        )
        const current = JSON.stringify(
            [...drafts]
                .map(d => ({
                    rewardId: d.rewardId,
                    inc: d.inc,
                    itemId: d.itemId,
                    quantity: d.quantity,
                    weight: d.weight,
                    note: d.note,
                }))
                .sort((a, b) => a.rewardId - b.rewardId)
        )
        return original === current ? 0 : 1
    }, [drafts])

    const addDraft = useCallback(
        (item: DailySigninItemOption, inc: IncBucket) => {
            if (item.iconDataUrl) {
                setIconCache(prev => ({
                    ...prev,
                    [item.itemId]: item.iconDataUrl,
                }))
            }
            setDrafts(prev => [
                ...prev,
                {
                    key: nextKey(),
                    rewardId: 0,
                    inc,
                    itemId: item.itemId,
                    itemName: item.name,
                    iconDataUrl: item.iconDataUrl,
                    quantity: 1,
                    weight: 1,
                    note: "",
                },
            ])
        },
        []
    )

    const updateDraft = useCallback(
        (key: string, patch: Partial<Draft>) => {
            setDrafts(prev =>
                prev.map(draft =>
                    draft.key === key ? { ...draft, ...patch } : draft
                )
            )
        },
        []
    )

    const removeDraft = useCallback((key: string) => {
        setDrafts(prev => prev.filter(draft => draft.key !== key))
    }, [])

    const handleDragStart = useCallback(
        (item: DailySigninItemOption) =>
            (event: DragEvent<HTMLDivElement>) => {
                dragItemRef.current = item
                event.dataTransfer.effectAllowed = "copy"
                event.dataTransfer.setData("text/plain", String(item.itemId))
            },
        []
    )

    const handleDragEnd = useCallback(() => {
        dragItemRef.current = null
        setDropTargetInc(null)
    }, [])

    const handleDrop = useCallback(
        (inc: IncBucket) => (event: DragEvent<HTMLDivElement>) => {
            event.preventDefault()
            const item = dragItemRef.current
            dragItemRef.current = null
            setDropTargetInc(null)
            if (!item) return
            addDraft(item, inc)
        },
        [addDraft]
    )

    const handleSave = useCallback(async () => {
        const valid = drafts.filter(isValidDraft)
        if (valid.length === 0) {
            toast.error("Cần ít nhất 1 phần thưởng hợp lệ trước khi lưu.")
            return
        }

        const payload: DailySigninRewardInput[] = valid.map(draft => ({
            reward_id: draft.rewardId > 0 ? draft.rewardId : undefined,
            inc: draft.inc,
            item_id: draft.itemId,
            quantity: Math.max(1, draft.quantity),
            weight: Math.max(0, draft.weight),
            note: draft.note.trim() ? draft.note.trim() : null,
        }))

        setSaving(true)
        try {
            const saved = await dailySigninRewardService.save(payload)
            originalsRef.current = saved
            setDrafts(saved.map(rowToDraft))
            toast.success(`Đã lưu ${saved.length} phần thưởng.`)
        } catch (error) {
            toast.error(getErrorMessage(error))
        } finally {
            setSaving(false)
        }
    }, [drafts])

    const resolveIcon = useCallback(
        (itemId: number, fallback?: string) =>
            iconCache[itemId] || fallback || "",
        [iconCache]
    )

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[700px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">
                        Phần thưởng Báo Danh
                    </h2>
                    <p className="text-sm text-muted-foreground">
                        Cấu hình data.daily_signin_rewards: kéo vật phẩm từ
                        card bên trái thả vào nhóm tương ứng bên phải, chỉnh số
                        lượng / trọng số rồi bấm Lưu.
                    </p>
                </div>

                <div className="flex flex-wrap items-center gap-2">
                    <Badge variant={changedCount > 0 ? "warning" : "secondary"}>
                        {changedCount > 0
                            ? "Có thay đổi chưa lưu"
                            : "Đã đồng bộ"}
                    </Badge>
                    <Button
                        type="button"
                        variant="outline"
                        onClick={() => void loadRewards()}
                        disabled={loading || saving}
                    >
                        <RefreshCcw className="mr-2 h-4 w-4" />
                        Tải lại
                    </Button>
                    <Button
                        type="button"
                        onClick={() => void handleSave()}
                        disabled={loading || saving || changedCount === 0}
                    >
                        <Save className="mr-2 h-4 w-4" />
                        {saving ? "Đang lưu..." : "Lưu thay đổi"}
                    </Button>
                </div>
            </div>

            <div className="grid min-h-0 flex-1 gap-4 xl:grid-cols-[minmax(0,0.85fr)_minmax(0,1.15fr)]">
                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">
                            Vật phẩm có thể thêm
                        </CardTitle>
                        <CardDescription>
                            Tìm theo tên hoặc ID, kéo thả sang một trong 3 nhóm
                            inc bên phải hoặc bấm mũi tên để thêm vào nhóm Phần
                            thưởng ngày (inc=1).
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="flex min-h-0 flex-1 flex-col gap-4">
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                            <Input
                                value={search}
                                onChange={event => setSearch(event.target.value)}
                                placeholder="Tìm vật phẩm theo tên hoặc ID..."
                                className="pl-10"
                            />
                        </div>

                        <div className="grid gap-2 sm:grid-cols-2">
                            <Select
                                value={kindFilter}
                                onValueChange={value => {
                                    setKindFilter(value)
                                    setTypeFilter("all")
                                }}
                                disabled={searching}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Tất cả Kind" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">
                                        Tất cả Kind
                                    </SelectItem>
                                    {KIND_OPTIONS.map(option => (
                                        <SelectItem
                                            key={option.value}
                                            value={String(option.value)}
                                        >
                                            {option.value} - {option.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>

                            <Select
                                value={typeFilter}
                                onValueChange={setTypeFilter}
                                disabled={searching}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Tất cả Type" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">
                                        Tất cả Type
                                    </SelectItem>
                                    {typeOptions.map(option => (
                                        <SelectItem
                                            key={option.value}
                                            value={String(option.value)}
                                        >
                                            {option.value} - {option.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="flex min-h-0 flex-1 flex-col gap-2 overflow-auto pr-1">
                            {searching ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Đang tải vật phẩm...
                                </div>
                            ) : searchResults.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Không có vật phẩm phù hợp.
                                </div>
                            ) : (
                                searchResults.map(item => (
                                    <div
                                        key={`${item.itemId}-${item.templateTableId}`}
                                        draggable
                                        onDragStart={handleDragStart(item)}
                                        onDragEnd={handleDragEnd}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 transition-colors hover:bg-accent/50"
                                    >
                                        {item.iconDataUrl ? (
                                            <Image
                                                className="h-12 w-12 rounded-md border object-cover"
                                                src={item.iconDataUrl}
                                                alt={item.name}
                                                width={48}
                                                height={48}
                                                unoptimized
                                            />
                                        ) : (
                                            <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                #{item.itemId}
                                            </div>
                                        )}

                                        <div className="min-w-0 flex-1">
                                            <div className="truncate font-medium">
                                                {item.name}
                                            </div>
                                            <div className="truncate text-xs text-muted-foreground">
                                                {item.subtitle}
                                            </div>
                                        </div>

                                        <Button
                                            type="button"
                                            variant="outline"
                                            size="icon"
                                            onClick={() => addDraft(item, 1)}
                                            aria-label={`Thêm ${item.name} vào nhóm phần thưởng ngày`}
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
                        <CardTitle className="text-lg">
                            Cấu hình phần thưởng theo nhóm
                        </CardTitle>
                        <CardDescription>
                            Mỗi nhóm là một bucket inc khác nhau. Kéo vật phẩm
                            từ card bên trái thả vào vùng tương ứng để thêm vào
                            nhóm.
                        </CardDescription>
                    </CardHeader>

                    <CardContent className="flex min-h-0 flex-1 flex-col gap-4 overflow-auto">
                        {INC_BUCKETS.map(bucket => {
                            const list = draftsByInc.get(bucket.inc) || []
                            const totalWeight =
                                totalWeightByInc.get(bucket.inc) || 0
                            const isDropping = dropTargetInc === bucket.inc

                            return (
                                <div
                                    key={bucket.inc}
                                    className="space-y-2"
                                    onDragOver={event => {
                                        event.preventDefault()
                                        setDropTargetInc(bucket.inc)
                                    }}
                                    onDragLeave={() => {
                                        if (dropTargetInc === bucket.inc)
                                            setDropTargetInc(null)
                                    }}
                                    onDrop={handleDrop(bucket.inc)}
                                >
                                    <div className="flex flex-wrap items-baseline gap-2">
                                        <h3 className="font-semibold">
                                            {bucket.title}
                                        </h3>
                                        <Badge variant="outline">
                                            {list.length} mục
                                        </Badge>
                                        {bucket.weighted ? (
                                            <Badge variant="secondary">
                                                Tổng trọng số: {totalWeight}
                                            </Badge>
                                        ) : null}
                                    </div>
                                    <p className="text-xs text-muted-foreground">
                                        {bucket.description}
                                    </p>

                                    <div
                                        className={cn(
                                            "flex flex-col gap-2 rounded-lg border border-dashed p-3 transition-colors",
                                            isDropping &&
                                                "border-primary bg-primary/5",
                                            list.length === 0 &&
                                                "min-h-[80px] items-center justify-center text-sm text-muted-foreground"
                                        )}
                                    >
                                        {list.length === 0 ? (
                                            <span>
                                                Kéo thả vật phẩm vào đây để thêm
                                                vào nhóm này.
                                            </span>
                                        ) : (
                                            list.map(draft => {
                                                const iconUrl = resolveIcon(
                                                    draft.itemId,
                                                    draft.iconDataUrl
                                                )
                                                const ratePercent =
                                                    bucket.weighted &&
                                                    totalWeight > 0
                                                        ? Math.round(
                                                              (draft.weight /
                                                                  totalWeight) *
                                                                  100
                                                          )
                                                        : null
                                                return (
                                                    <div
                                                        key={draft.key}
                                                        className="rounded-lg border bg-background p-3"
                                                    >
                                                        <div className="flex items-start gap-3">
                                                            {iconUrl ? (
                                                                <Image
                                                                    className="h-10 w-10 rounded-md border object-cover"
                                                                    src={iconUrl}
                                                                    alt={
                                                                        draft.itemName
                                                                    }
                                                                    width={40}
                                                                    height={40}
                                                                    unoptimized
                                                                />
                                                            ) : (
                                                                <div className="flex h-10 w-10 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                                    #{draft.itemId}
                                                                </div>
                                                            )}

                                                            <div className="min-w-0 flex-1">
                                                                <div className="flex flex-wrap items-baseline gap-2">
                                                                    <span className="truncate font-medium">
                                                                        {
                                                                            draft.itemName
                                                                        }
                                                                    </span>
                                                                    <Badge
                                                                        variant="outline"
                                                                        className="font-mono text-xs"
                                                                    >
                                                                        ID{" "}
                                                                        {
                                                                            draft.itemId
                                                                        }
                                                                    </Badge>
                                                                    {draft.rewardId >
                                                                    0 ? (
                                                                        <Badge
                                                                            variant="outline"
                                                                            className="font-mono text-xs"
                                                                        >
                                                                            #
                                                                            {
                                                                                draft.rewardId
                                                                            }
                                                                        </Badge>
                                                                    ) : (
                                                                        <Badge variant="outline">
                                                                            Mới
                                                                        </Badge>
                                                                    )}
                                                                </div>
                                                            </div>

                                                            <Button
                                                                type="button"
                                                                variant="outline"
                                                                size="icon"
                                                                onClick={() =>
                                                                    removeDraft(
                                                                        draft.key
                                                                    )
                                                                }
                                                                disabled={saving}
                                                                aria-label={`Xóa ${draft.itemName}`}
                                                            >
                                                                <Trash2 className="h-4 w-4" />
                                                            </Button>
                                                        </div>

                                                        <div className="mt-3 grid gap-3 md:grid-cols-3">
                                                            <div className="space-y-1">
                                                                <p className="text-xs font-medium text-muted-foreground">
                                                                    Số lượng
                                                                </p>
                                                                <Input
                                                                    type="number"
                                                                    min={1}
                                                                    value={
                                                                        draft.quantity
                                                                    }
                                                                    onChange={event =>
                                                                        updateDraft(
                                                                            draft.key,
                                                                            {
                                                                                quantity:
                                                                                    Math.max(
                                                                                        1,
                                                                                        Number(
                                                                                            event
                                                                                                .target
                                                                                                .value
                                                                                        ) ||
                                                                                            1
                                                                                    ),
                                                                            }
                                                                        )
                                                                    }
                                                                />
                                                            </div>

                                                            <div className="space-y-1">
                                                                <p className="text-xs font-medium text-muted-foreground">
                                                                    Trọng số
                                                                </p>
                                                                <Input
                                                                    type="number"
                                                                    min={0}
                                                                    value={
                                                                        draft.weight
                                                                    }
                                                                    disabled={
                                                                        !bucket.weighted
                                                                    }
                                                                    onChange={event =>
                                                                        updateDraft(
                                                                            draft.key,
                                                                            {
                                                                                weight: Math.max(
                                                                                    0,
                                                                                    Number(
                                                                                        event
                                                                                            .target
                                                                                            .value
                                                                                    ) ||
                                                                                        0
                                                                                ),
                                                                            }
                                                                        )
                                                                    }
                                                                />
                                                                {ratePercent !==
                                                                null ? (
                                                                    <p className="text-[11px] text-muted-foreground">
                                                                        ~
                                                                        {
                                                                            ratePercent
                                                                        }
                                                                        % xác
                                                                        suất
                                                                    </p>
                                                                ) : !bucket.weighted ? (
                                                                    <p className="text-[11px] text-muted-foreground">
                                                                        Không
                                                                        áp dụng
                                                                    </p>
                                                                ) : null}
                                                            </div>

                                                            <div className="space-y-1">
                                                                <p className="text-xs font-medium text-muted-foreground">
                                                                    Ghi chú
                                                                </p>
                                                                <Textarea
                                                                    rows={1}
                                                                    value={
                                                                        draft.note
                                                                    }
                                                                    onChange={event =>
                                                                        updateDraft(
                                                                            draft.key,
                                                                            {
                                                                                note: event
                                                                                    .target
                                                                                    .value,
                                                                            }
                                                                        )
                                                                    }
                                                                    placeholder="Tuỳ chọn"
                                                                    className="text-xs"
                                                                />
                                                            </div>
                                                        </div>
                                                    </div>
                                                )
                                            })
                                        )}
                                    </div>
                                </div>
                            )
                        })}
                    </CardContent>
                </Card>
            </div>
        </section>
    )
}
