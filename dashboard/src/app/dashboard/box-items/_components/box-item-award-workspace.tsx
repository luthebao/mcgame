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

import { getUseTypeLabel } from "@/app/dashboard/items/_lib/shared"
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
import { Label } from "@/components/ui/label"
import { Switch } from "@/components/ui/switch"
import { Textarea } from "@/components/ui/textarea"
import { cn } from "@/lib/utils"
import {
    BOX_ITEM_AWARD_GUARANTEED_KEY,
    BOX_ITEM_AWARD_TYPE_OPTIONS,
    BOX_ITEM_CURRENCY_OPTIONS,
    BOX_ITEM_GAME_CURRENCY_OPTIONS,
    boxItemAwardFallbackName,
    boxItemAwardIsExperience,
    boxItemAwardPreNameTypeLabel,
    boxItemAwardQualityLabel,
    boxItemAwardSupportsPreNameType,
    boxItemAwardSupportsQuality,
    boxItemAwardTypeName,
    boxItemAwardUsesCurrencyOptions,
    boxItemAwardUsesFixedCount,
    boxItemAwardUsesGameCurrencyOptions,
    boxItemAwardUsesLookup,
    normalizeBoxItemAwardPayload,
    normalizeBoxItemAwardPreNameType,
    normalizeBoxItemAwardQuality,
    normalizeBoxItemAwardType,
} from "@/lib/box-item-awards"
import { getErrorMessage } from "@/services/api"
import {
    boxItemService,
    type BoxItemRow,
    type ItemAwardInput,
    type ItemAwardOption,
    type ItemAwardRow,
} from "@/services/box-item.service"

type DraftAward = Omit<ItemAwardInput, "payload"> & {
    _key: string
    awardName: string
    typeName: string
    iconId?: number
    iconDataUrl?: string
    payloadText: string
    guaranteed: boolean
}

type AvailableAward = {
    key: string
    awardId: number
    type: number
    name: string
    subtitle: string
    iconId: number
    iconDataUrl: string
    count: number
    rate: number
    quality: number
    preNameType: number
    payloadText: string
}

type BoxItemAwardWorkspaceProps = {
    itemId: number
}

let keyCounter = 0

function nextKey() {
    keyCounter += 1
    return `draft-${keyCounter}`
}

function countLabel(type: number) {
    switch (type) {
        case 12:
            return "Số pet"
        case 30:
            return "Số tiền"
        case 35:
            return "Số điểm"
        case 31:
            return "EXP"
        case 32:
            return "Thời gian (s)"
        default:
            return "Số lượng"
    }
}

function availableAwardFromOption(
    type: number,
    item: ItemAwardOption
): AvailableAward {
    return {
        key: `${type}:${item.id}`,
        awardId: item.id,
        type,
        name: item.name,
        subtitle: item.subtitle,
        iconId: item.iconId,
        iconDataUrl: item.iconDataUrl,
        count: 1,
        rate: 100,
        quality: 0,
        preNameType: 0,
        payloadText: "",
    }
}

function createStaticAvailableAwards(
    type: number,
    search: string
): AvailableAward[] {
    const normalizedSearch = search.trim().toLowerCase()

    if (boxItemAwardUsesCurrencyOptions(type)) {
        return BOX_ITEM_CURRENCY_OPTIONS.map(option => ({
            key: `${type}:${option.value}`,
            awardId: Number(option.value),
            type,
            name: option.label,
            subtitle: `Thêm phần thưởng ${option.label.toLowerCase()}`,
            iconId: 0,
            iconDataUrl: "",
            count: 1,
            rate: 100,
            quality: 0,
            preNameType: 0,
            payloadText: "",
        })).filter(
            item =>
                !normalizedSearch ||
                item.name.toLowerCase().includes(normalizedSearch)
        )
    }

    if (boxItemAwardUsesGameCurrencyOptions(type)) {
        return BOX_ITEM_GAME_CURRENCY_OPTIONS.map(option => ({
            key: `${type}:${option.value}`,
            awardId: Number(option.value),
            type,
            name: option.label,
            subtitle: `Thêm phần thưởng ${option.label.toLowerCase()}`,
            iconId: 0,
            iconDataUrl: "",
            count: 1,
            rate: 100,
            quality: 0,
            preNameType: 0,
            payloadText: "",
        })).filter(
            item =>
                !normalizedSearch ||
                item.name.toLowerCase().includes(normalizedSearch)
        )
    }

    if (boxItemAwardIsExperience(type)) {
        const items = [
            {
                key: `${type}:0`,
                awardId: 0,
                type,
                name: "Kinh nghiệm",
                subtitle: "Thêm phần thưởng kinh nghiệm",
                iconId: 0,
                iconDataUrl: "",
                count: 1,
                rate: 100,
                quality: 0,
                preNameType: 0,
                payloadText: "",
            },
        ]

        return items.filter(
            item =>
                !normalizedSearch ||
                item.name.toLowerCase().includes(normalizedSearch)
        )
    }

    return []
}

function rowToDraft(row: ItemAwardRow): DraftAward {
    const payload = normalizeBoxItemAwardPayload(row.payload)
    const isGuaranteed = !!payload[BOX_ITEM_AWARD_GUARANTEED_KEY]
    const displayPayload = { ...payload }
    delete displayPayload[BOX_ITEM_AWARD_GUARANTEED_KEY]
    return {
        _key: row.id > 0 ? `db-${row.id}` : nextKey(),
        id: row.id,
        awardId: row.awardId,
        awardName:
            row.awardName || boxItemAwardFallbackName(row.type, row.awardId),
        type: row.type,
        typeName: row.typeName || boxItemAwardTypeName(row.type),
        count: row.count,
        rate: row.rate,
        quality: row.quality,
        preNameType: row.preNameType,
        guaranteed: isGuaranteed,
        payloadText:
            Object.keys(displayPayload).length > 0
                ? JSON.stringify(displayPayload, null, 2)
                : "",
    }
}

async function hydrateDraftIcon(row: ItemAwardRow) {
    const draft = rowToDraft(row)
    if (!boxItemAwardUsesLookup(row.type) || row.awardId <= 0) {
        return draft
    }

    try {
        const matches = await boxItemService.searchAwardOptions(
            row.type,
            String(row.awardId),
            1
        )
        const match = matches.find(item => item.id === row.awardId)
        if (!match) return draft

        return {
            ...draft,
            awardName: match.name,
            iconId: match.iconId,
            iconDataUrl: match.iconDataUrl,
        }
    } catch {
        return draft
    }
}

function draftFromAvailable(item: AvailableAward): DraftAward {
    return {
        _key: nextKey(),
        awardId: item.awardId,
        awardName: item.name,
        type: item.type,
        typeName: boxItemAwardTypeName(item.type),
        count: item.count,
        rate: item.rate,
        quality: item.quality,
        preNameType: item.preNameType,
        iconId: item.iconId,
        iconDataUrl: item.iconDataUrl,
        guaranteed: false,
        payloadText: item.payloadText,
    }
}

function isValidAward(draft: DraftAward) {
    if (boxItemAwardIsExperience(draft.type)) return true
    if (boxItemAwardUsesCurrencyOptions(draft.type))
        return draft.awardId >= 0 && draft.awardId <= 2
    return draft.awardId > 0
}

export function BoxItemAwardWorkspace({ itemId }: BoxItemAwardWorkspaceProps) {
    const [item, setItem] = useState<BoxItemRow | null>(null)
    const [itemLoading, setItemLoading] = useState(true)
    const [itemError, setItemError] = useState("")
    const [drafts, setDrafts] = useState<DraftAward[]>([])
    const [awardsLoading, setAwardsLoading] = useState(false)
    const [saving, setSaving] = useState(false)
    const [availableType, setAvailableType] = useState<string>("29")
    const [availableSearch, setAvailableSearch] = useState("")
    const [availableResults, setAvailableResults] = useState<AvailableAward[]>(
        []
    )
    const [availableLoading, setAvailableLoading] = useState(false)
    const [dropActive, setDropActive] = useState(false)

    const dragItemRef = useRef<AvailableAward | null>(null)
    const availableRequestRef = useRef(0)
    const selectedAvailableType = useMemo(
        () => normalizeBoxItemAwardType(availableType),
        [availableType]
    )

    const loadItem = useCallback(async () => {
        setItemLoading(true)
        setItemError("")

        try {
            const nextItem = await boxItemService.getItem(itemId)
            if (!nextItem) {
                setItem(null)
                setItemError(`Không tìm thấy vật phẩm #${itemId}.`)
                return
            }

            setItem(nextItem)
        } catch (error) {
            setItem(null)
            setItemError(getErrorMessage(error))
        } finally {
            setItemLoading(false)
        }
    }, [itemId])

    const loadAwards = useCallback(async (nextItemId: number) => {
        setAwardsLoading(true)

        try {
            const rows = await boxItemService.getAwards(nextItemId)
            const hydratedDrafts = await Promise.all(
                rows.map(row => hydrateDraftIcon(row))
            )
            setDrafts(hydratedDrafts)
        } catch (error) {
            toast.error(getErrorMessage(error))
            setDrafts([])
        } finally {
            setAwardsLoading(false)
        }
    }, [])

    const refreshAll = useCallback(async () => {
        await loadItem()
        if (itemId > 0) {
            await loadAwards(itemId)
        }
    }, [itemId, loadAwards, loadItem])

    const addAvailableAward = useCallback((availableAward: AvailableAward) => {
        setDrafts(prev => [...prev, draftFromAvailable(availableAward)])
    }, [])

    const updateDraft = useCallback(
        (key: string, field: keyof ItemAwardInput, value: number) => {
            setDrafts(prev =>
                prev.map(draft =>
                    draft._key === key ? { ...draft, [field]: value } : draft
                )
            )
        },
        []
    )

    const updateDraftPayloadText = useCallback(
        (key: string, payloadText: string) => {
            setDrafts(prev =>
                prev.map(draft =>
                    draft._key === key ? { ...draft, payloadText } : draft
                )
            )
        },
        []
    )

    const updateDraftGuaranteed = useCallback(
        (key: string, guaranteed: boolean) => {
            setDrafts(prev =>
                prev.map(draft =>
                    draft._key === key ? { ...draft, guaranteed } : draft
                )
            )
        },
        []
    )

    const poolTotalWeight = useMemo(
        () =>
            drafts
                .filter(d => !d.guaranteed && d.rate > 0)
                .reduce((sum, d) => sum + d.rate, 0),
        [drafts]
    )

    const removeDraft = useCallback(async (draft: DraftAward) => {
        if (draft.id && draft.id > 0) {
            try {
                await boxItemService.deleteAward(draft.id)
            } catch (error) {
                toast.error(getErrorMessage(error))
                return
            }
        }

        setDrafts(prev => prev.filter(item => item._key !== draft._key))
    }, [])

    const handleSave = useCallback(async () => {
        if (!item) return

        const validDrafts = drafts.filter(isValidAward)
        if (validDrafts.length === 0) {
            toast.error("Cần ít nhất 1 phần thưởng hợp lệ.")
            return
        }

        setSaving(true)

        try {
            const payload: ItemAwardInput[] = validDrafts.map(
                ({
                    _key,
                    awardName,
                    typeName,
                    iconId,
                    iconDataUrl,
                    guaranteed,
                    payloadText,
                    ...draft
                }) => {
                    const trimmedPayloadText = payloadText.trim()
                    let normalizedPayload: Record<string, unknown> = {}

                    if (trimmedPayloadText) {
                        let parsed: unknown
                        try {
                            parsed = JSON.parse(trimmedPayloadText)
                        } catch {
                            throw new Error(
                                `Payload JSON không hợp lệ cho ${awardName}.`
                            )
                        }

                        normalizedPayload = normalizeBoxItemAwardPayload(parsed)
                        if (
                            Object.keys(normalizedPayload).length === 0 &&
                            trimmedPayloadText !== "{}"
                        ) {
                            throw new Error(
                                `Payload JSON của ${awardName} phải là object.`
                            )
                        }
                    }

                    if (guaranteed) {
                        normalizedPayload[BOX_ITEM_AWARD_GUARANTEED_KEY] = true
                    } else {
                        delete normalizedPayload[BOX_ITEM_AWARD_GUARANTEED_KEY]
                    }

                    return {
                        ...draft,
                        count: boxItemAwardUsesFixedCount(draft.type)
                            ? 1
                            : draft.count,
                        payload: normalizedPayload,
                    }
                }
            )

            const saved = await boxItemService.saveAwards(item.itemId, payload)
            const hydratedDrafts = await Promise.all(
                saved.map(row => hydrateDraftIcon(row))
            )
            setDrafts(hydratedDrafts)
            toast.success(
                `Đã lưu ${hydratedDrafts.length} phần thưởng cho item #${item.itemId}`
            )
        } catch (error) {
            toast.error(getErrorMessage(error))
        } finally {
            setSaving(false)
        }
    }, [drafts, item])

    const handleDragStart = useCallback((availableAward: AvailableAward) => {
        return (event: DragEvent<HTMLDivElement>) => {
            dragItemRef.current = availableAward
            event.dataTransfer.effectAllowed = "copy"
            event.dataTransfer.setData("text/plain", availableAward.key)
        }
    }, [])

    const handleDragEnd = useCallback(() => {
        dragItemRef.current = null
        setDropActive(false)
    }, [])

    const handleDrop = useCallback(
        (event: DragEvent<HTMLDivElement>) => {
            event.preventDefault()
            const availableAward = dragItemRef.current
            dragItemRef.current = null
            setDropActive(false)
            if (!availableAward) return
            addAvailableAward(availableAward)
        },
        [addAvailableAward]
    )

    useEffect(() => {
        void loadItem()
    }, [loadItem])

    useEffect(() => {
        if (!item) {
            setDrafts([])
            return
        }

        void loadAwards(item.itemId)
    }, [item, loadAwards])

    useEffect(() => {
        const requestId = ++availableRequestRef.current

        if (
            boxItemAwardUsesCurrencyOptions(selectedAvailableType) ||
            boxItemAwardIsExperience(selectedAvailableType)
        ) {
            setAvailableLoading(false)
            setAvailableResults(
                createStaticAvailableAwards(
                    selectedAvailableType,
                    availableSearch
                )
            )
            return
        }

        const timer = window.setTimeout(async () => {
            setAvailableLoading(true)
            try {
                const results = await boxItemService.searchAwardOptions(
                    selectedAvailableType,
                    availableSearch,
                    30
                )
                if (requestId !== availableRequestRef.current) return
                setAvailableResults(
                    results.map(item =>
                        availableAwardFromOption(selectedAvailableType, item)
                    )
                )
            } catch {
                if (requestId !== availableRequestRef.current) return
                setAvailableResults([])
            } finally {
                if (requestId === availableRequestRef.current) {
                    setAvailableLoading(false)
                }
            }
        }, 250)

        return () => window.clearTimeout(timer)
    }, [availableSearch, selectedAvailableType])

    if (itemLoading) {
        return (
            <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4">
                <div className="flex items-center justify-between">
                    <Button asChild variant="outline">
                        <Link href="/dashboard/box-items">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Quay lại danh sách
                        </Link>
                    </Button>
                </div>
                <Card className="flex flex-1 items-center justify-center">
                    <CardContent className="pt-6 text-muted-foreground">
                        Đang tải dữ liệu vật phẩm...
                    </CardContent>
                </Card>
            </section>
        )
    }

    if (!item) {
        return (
            <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4">
                <div className="flex items-center justify-between">
                    <Button asChild variant="outline">
                        <Link href="/dashboard/box-items">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Quay lại danh sách
                        </Link>
                    </Button>
                </div>
                <Card className="flex flex-1 items-center justify-center">
                    <CardContent className="pt-6 text-center">
                        <p className="font-medium">
                            Không thể mở vật phẩm hộp.
                        </p>
                        <p className="mt-1 text-sm text-destructive">
                            {itemError || `Không tìm thấy item #${itemId}.`}
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
                        <Link href="/dashboard/box-items">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Quay lại danh sách
                        </Link>
                    </Button>

                    <div className="flex flex-col gap-3 sm:flex-row sm:items-start">
                        {item.iconDataUrl ? (
                            <Image
                                className="h-16 w-16 rounded-lg border object-cover"
                                src={item.iconDataUrl}
                                alt={item.name}
                                width={64}
                                height={64}
                                unoptimized
                            />
                        ) : (
                            <div className="flex h-16 w-16 items-center justify-center rounded-lg border text-xs text-muted-foreground">
                                No icon
                            </div>
                        )}

                        <div className="space-y-2">
                            <div>
                                <h2 className="text-xl font-semibold">
                                    {item.name}
                                </h2>
                                <p className="text-sm text-muted-foreground">
                                    Kéo phần thưởng từ card bên trái sang card
                                    bên phải hoặc dùng các nút mũi tên để thêm
                                    và gỡ khỏi danh sách.
                                </p>
                            </div>

                            <div className="flex flex-wrap gap-2">
                                <Badge variant="outline" className="font-mono">
                                    #{item.itemId}
                                </Badge>
                                <Badge variant="secondary">
                                    {getUseTypeLabel(item.useType)}
                                </Badge>
                                <Badge variant="outline">
                                    Type {item.templateType}
                                </Badge>
                                <Badge variant="outline">
                                    Stack {item.maxStack}
                                </Badge>
                            </div>

                            {item.description ? (
                                <p className="max-w-3xl text-sm text-muted-foreground">
                                    {item.description}
                                </p>
                            ) : null}
                        </div>
                    </div>
                </div>

                <Button
                    type="button"
                    variant="outline"
                    onClick={() => void refreshAll()}
                    disabled={awardsLoading || saving}
                >
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Tải lại
                </Button>
            </div>

            <div className="grid min-h-0 flex-1 gap-4 xl:grid-cols-[minmax(0,0.95fr)_minmax(0,1.05fr)]">
                <Card className="flex min-h-0 flex-col">
                    <CardHeader>
                        <CardTitle className="text-lg">
                            Tất cả phần thưởng
                        </CardTitle>
                        <CardDescription>
                            Chọn loại phần thưởng, tìm kiếm, rồi bấm mũi tên
                            hoặc kéo thả sang danh sách bên phải.
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="flex min-h-0 flex-1 flex-col gap-4">
                        <div className="grid gap-3 md:grid-cols-[200px_minmax(0,1fr)]">
                            <Select
                                value={availableType}
                                onValueChange={setAvailableType}
                                disabled={availableLoading}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Loại phần thưởng" />
                                </SelectTrigger>
                                <SelectContent>
                                    {BOX_ITEM_AWARD_TYPE_OPTIONS.map(option => (
                                        <SelectItem
                                            key={option.value}
                                            value={option.value}
                                        >
                                            {option.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>

                            <div className="relative">
                                <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                <Input
                                    type="text"
                                    value={availableSearch}
                                    onChange={event =>
                                        setAvailableSearch(event.target.value)
                                    }
                                    placeholder="Tìm theo tên hoặc ID..."
                                    className="pl-10"
                                />
                            </div>
                        </div>

                        <div className="flex min-h-0 flex-1 flex-col gap-2 overflow-auto pr-1">
                            {availableLoading ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Đang tải danh sách phần thưởng...
                                </div>
                            ) : availableResults.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center rounded-lg border border-dashed text-sm text-muted-foreground">
                                    Không có phần thưởng phù hợp.
                                </div>
                            ) : (
                                availableResults.map(availableAward => (
                                    <div
                                        key={availableAward.key}
                                        draggable
                                        onDragStart={handleDragStart(
                                            availableAward
                                        )}
                                        onDragEnd={handleDragEnd}
                                        className="flex items-center gap-3 rounded-lg border bg-background p-3 transition-colors hover:bg-accent/50"
                                    >
                                        {availableAward.iconDataUrl ? (
                                            <Image
                                                className="h-12 w-12 rounded-md border object-cover"
                                                src={availableAward.iconDataUrl}
                                                alt={availableAward.name}
                                                width={48}
                                                height={48}
                                                unoptimized
                                            />
                                        ) : (
                                            <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                {boxItemAwardTypeName(
                                                    availableAward.type
                                                )}
                                            </div>
                                        )}

                                        <div className="min-w-0 flex-1">
                                            <div className="truncate font-medium">
                                                {availableAward.name}
                                            </div>
                                            <div className="truncate text-xs text-muted-foreground">
                                                {availableAward.subtitle}
                                            </div>
                                        </div>

                                        <Button
                                            type="button"
                                            variant="outline"
                                            size="icon"
                                            onClick={() =>
                                                addAvailableAward(
                                                    availableAward
                                                )
                                            }
                                            aria-label={`Thêm ${availableAward.name}`}
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
                    <CardHeader className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                        <div>
                            <CardTitle className="text-lg">
                                Danh sách phần thưởng
                            </CardTitle>
                            <CardDescription>
                                {drafts.length > 0
                                    ? `${drafts.length} phần thưởng đang gắn với item #${item.itemId}`
                                    : "Kéo thả hoặc thêm từ card bên trái để bắt đầu cấu hình phần thưởng."}
                            </CardDescription>
                        </div>

                        <Button
                            type="button"
                            size="sm"
                            onClick={() => void handleSave()}
                            disabled={
                                saving || awardsLoading || drafts.length === 0
                            }
                        >
                            <Save className="mr-2 h-4 w-4" />
                            {saving ? "Đang lưu..." : "Lưu thay đổi"}
                        </Button>
                    </CardHeader>

                    <CardContent className="flex min-h-0 flex-1 flex-col">
                        <div
                            onDragOver={event => {
                                event.preventDefault()
                                setDropActive(true)
                            }}
                            onDragLeave={() => setDropActive(false)}
                            onDrop={handleDrop}
                            className={cn(
                                "flex min-h-0 flex-1 flex-col gap-3 overflow-auto rounded-lg border border-dashed p-3 transition-colors",
                                dropActive && "border-primary bg-primary/5"
                            )}
                        >
                            {awardsLoading ? (
                                <div className="flex flex-1 items-center justify-center text-sm text-muted-foreground">
                                    Đang tải phần thưởng...
                                </div>
                            ) : drafts.length === 0 ? (
                                <div className="flex flex-1 items-center justify-center text-center text-sm text-muted-foreground">
                                    Chưa có phần thưởng nào. Hãy thêm bằng nút
                                    mũi tên hoặc kéo thả từ danh sách bên trái.
                                </div>
                            ) : (
                                drafts.map(draft => (
                                    <div
                                        key={draft._key}
                                        className="rounded-lg border bg-background p-4"
                                    >
                                        <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                                            <div className="flex min-w-0 items-start gap-3">
                                                {draft.iconDataUrl ? (
                                                    <Image
                                                        className="h-12 w-12 rounded-md border object-cover"
                                                        src={draft.iconDataUrl}
                                                        alt={draft.awardName}
                                                        width={48}
                                                        height={48}
                                                        unoptimized
                                                    />
                                                ) : (
                                                    <div className="flex h-12 w-12 items-center justify-center rounded-md border text-[11px] text-muted-foreground">
                                                        {draft.typeName}
                                                    </div>
                                                )}

                                                <div className="min-w-0">
                                                    <div className="truncate font-medium">
                                                        {draft.awardName}
                                                    </div>
                                                    <div className="mt-1 flex flex-wrap gap-2 text-xs text-muted-foreground">
                                                        <Badge variant="secondary">
                                                            {draft.typeName}
                                                        </Badge>
                                                        <Badge
                                                            variant="outline"
                                                            className="font-mono"
                                                        >
                                                            {boxItemAwardIsExperience(
                                                                draft.type
                                                            )
                                                                ? "EXP"
                                                                : `ID ${draft.awardId}`}
                                                        </Badge>
                                                        {draft.id &&
                                                        draft.id > 0 ? (
                                                            <Badge
                                                                variant="outline"
                                                                className="font-mono"
                                                            >
                                                                Award #
                                                                {draft.id}
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
                                                onClick={() =>
                                                    void removeDraft(draft)
                                                }
                                                disabled={saving}
                                                aria-label={`Gỡ ${draft.awardName}`}
                                            >
                                                <ChevronLeft className="h-4 w-4" />
                                            </Button>
                                        </div>

                                        <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                                            <div className="space-y-1">
                                                <p className="text-xs font-medium text-muted-foreground">
                                                    {countLabel(draft.type)}
                                                </p>
                                                <Input
                                                    type="number"
                                                    min={1}
                                                    value={draft.count}
                                                    disabled={boxItemAwardUsesFixedCount(
                                                        draft.type
                                                    )}
                                                    onChange={event =>
                                                        updateDraft(
                                                            draft._key,
                                                            "count",
                                                            Math.max(
                                                                1,
                                                                Number(
                                                                    event.target
                                                                        .value
                                                                ) || 1
                                                            )
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
                                                    value={draft.rate}
                                                    disabled={draft.guaranteed}
                                                    onChange={event =>
                                                        updateDraft(
                                                            draft._key,
                                                            "rate",
                                                            Math.max(
                                                                0,
                                                                Number(
                                                                    event
                                                                        .target
                                                                        .value
                                                                ) || 0
                                                            )
                                                        )
                                                    }
                                                />
                                                {!draft.guaranteed &&
                                                poolTotalWeight > 0 ? (
                                                    <p className="text-[11px] text-muted-foreground">
                                                        ~
                                                        {
                                                            Math.round(
                                                                (draft.rate /
                                                                    poolTotalWeight) *
                                                                    100
                                                            )
                                                        }
                                                        % xác suất chọn
                                                    </p>
                                                ) : null}
                                                <div className="flex items-center gap-2 pt-1">
                                                    <Switch
                                                        id={`guaranteed-${draft._key}`}
                                                        checked={draft.guaranteed}
                                                        onCheckedChange={checked =>
                                                            updateDraftGuaranteed(
                                                                draft._key,
                                                                checked
                                                            )
                                                        }
                                                    />
                                                    <Label
                                                        htmlFor={`guaranteed-${draft._key}`}
                                                        className="cursor-pointer text-xs"
                                                    >
                                                        Phần thưởng cố định
                                                    </Label>
                                                </div>
                                            </div>

                                            {boxItemAwardSupportsQuality(
                                                draft.type
                                            ) ? (
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Chất lượng
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        max={25}
                                                        value={draft.quality}
                                                        onChange={event =>
                                                            updateDraft(
                                                                draft._key,
                                                                "quality",
                                                                normalizeBoxItemAwardQuality(
                                                                    event.target
                                                                        .value
                                                                )
                                                            )
                                                        }
                                                    />
                                                    <p className="text-[11px] text-muted-foreground">
                                                        {boxItemAwardQualityLabel(
                                                            draft.type,
                                                            draft.quality
                                                        )}
                                                    </p>
                                                </div>
                                            ) : null}

                                            {boxItemAwardSupportsPreNameType(
                                                draft.type
                                            ) ? (
                                                <div className="space-y-1">
                                                    <p className="text-xs font-medium text-muted-foreground">
                                                        Tiền tố
                                                    </p>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        max={5}
                                                        value={
                                                            draft.preNameType
                                                        }
                                                        onChange={event =>
                                                            updateDraft(
                                                                draft._key,
                                                                "preNameType",
                                                                normalizeBoxItemAwardPreNameType(
                                                                    event.target
                                                                        .value
                                                                )
                                                            )
                                                        }
                                                    />
                                                    <p className="text-[11px] text-muted-foreground">
                                                        {boxItemAwardPreNameTypeLabel(
                                                            draft.preNameType
                                                        )}
                                                    </p>
                                                </div>
                                            ) : null}
                                        </div>

                                        <div className="mt-3 space-y-1">
                                            <p className="text-xs font-medium text-muted-foreground">
                                                Payload JSON tùy chọn
                                            </p>
                                            <Textarea
                                                rows={3}
                                                value={draft.payloadText}
                                                onChange={event =>
                                                    updateDraftPayloadText(
                                                        draft._key,
                                                        event.target.value
                                                    )
                                                }
                                                placeholder='{"note":"future metadata"}'
                                                className="font-mono text-xs"
                                            />
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
