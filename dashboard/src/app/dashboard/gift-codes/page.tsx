"use client"

import { useCallback, useEffect, useMemo, useState } from "react"
import {
    Calendar,
    Copy,
    Gift,
    Pencil,
    Plus,
    RefreshCcw,
    Ticket,
    Trash2,
    Users,
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
import { DatePicker } from "@/components/ui/date-picker"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { Switch } from "@/components/ui/switch"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Textarea } from "@/components/ui/textarea"
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import {
    GiftCodeCampaignCreatePayload,
    GiftCodeCodeView,
    GiftCodeCampaignView,
    giftCodeService,
} from "@/services/gift-code.service"
import { GiftCodeRewardBuilder } from "./_components/gift-code-reward-builder"
import {
    type GiftCodeFormState,
    type GiftCodeRewardDraft,
    type GiftCodeRewardType,
    buildRewardInputFromDraft,
    createDefaultGiftCodeForm,
    createRewardDraft,
    mapCampaignToForm,
    parseCodesInput,
    parseInteger,
    summarizeRewardDraft,
} from "./_lib/rewards"

const giftCodeAlphabet = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"

function createRandomBytes(length: number): Uint8Array {
    const bytes = new Uint8Array(length)
    if (
        typeof globalThis.crypto !== "undefined" &&
        typeof globalThis.crypto.getRandomValues === "function"
    ) {
        globalThis.crypto.getRandomValues(bytes)
        return bytes
    }

    for (let index = 0; index < length; index += 1) {
        bytes[index] = Math.floor(Math.random() * 256)
    }
    return bytes
}

function generateLocalGiftCode(prefix: string, randomLength: number): string {
    const safeLength = randomLength > 0 ? randomLength : 8
    const bytes = createRandomBytes(safeLength)
    let code = prefix
    for (const value of bytes) {
        code += giftCodeAlphabet[value % giftCodeAlphabet.length]
    }
    return code
}

function toRFC3339FromDate(date: Date | undefined, endOfDay: boolean): string {
    if (!date) return ""
    const converted = new Date(date)
    if (Number.isNaN(converted.getTime())) return ""

    if (endOfDay) {
        converted.setHours(23, 59, 59, 999)
    } else {
        converted.setHours(0, 0, 0, 0)
    }
    return converted.toISOString()
}

function formatDate(value: string): string {
    if (!value) return "-"
    const parsed = new Date(value)
    if (Number.isNaN(parsed.getTime())) return value
    return parsed.toLocaleString("vi-VN")
}

function isCampaignActive(
    campaign: GiftCodeCampaignView,
    nowTs: number
): boolean {
    if (campaign.status !== 1) return false

    const startTs = campaign.startsAt
        ? new Date(campaign.startsAt).getTime()
        : Number.NEGATIVE_INFINITY
    const endTs = campaign.endsAt
        ? new Date(campaign.endsAt).getTime()
        : Number.POSITIVE_INFINITY
    const timeWindowActive = nowTs >= startTs && nowTs <= endTs
    const usageActive =
        campaign.maxTotalUses <= 0 ||
        campaign.redeemedCount < campaign.maxTotalUses

    return timeWindowActive && usageActive
}

function isCampaignExpiredOrExhausted(
    campaign: GiftCodeCampaignView,
    nowTs: number
): boolean {
    const endedByTime = campaign.endsAt
        ? new Date(campaign.endsAt).getTime() < nowTs
        : false
    const endedByUsage =
        campaign.maxTotalUses > 0 &&
        campaign.redeemedCount >= campaign.maxTotalUses
    return endedByTime || endedByUsage
}

function isCampaignEndedOrExhausted(
    campaign: GiftCodeCampaignView,
    nowTs: number
): boolean {
    if (campaign.status !== 1) return true
    return isCampaignExpiredOrExhausted(campaign, nowTs)
}

function isGiftCodeRedeemed(code: GiftCodeCodeView): boolean {
    return code.redeemedCount > 0 || Boolean(code.lastRedeemedAt)
}

function getGiftCodeUsageBadge(code: GiftCodeCodeView): {
    label: string
    variant: "outline" | "secondary" | "warning" | "destructive"
} {
    if (code.status !== 1) {
        return { label: "Tắt", variant: "secondary" }
    }

    if (!isGiftCodeRedeemed(code)) {
        return { label: "Chưa dùng", variant: "outline" }
    }

    if (code.maxUses > 0 && code.redeemedCount >= code.maxUses) {
        return { label: "Hết lượt", variant: "destructive" }
    }

    return { label: "Đã dùng", variant: "warning" }
}

async function copyTextToClipboard(value: string): Promise<void> {
    if (typeof navigator !== "undefined" && navigator.clipboard?.writeText) {
        await navigator.clipboard.writeText(value)
        return
    }

    throw new Error("Clipboard API không khả dụng")
}

function getRewardValidationMessage(
    reward: GiftCodeRewardDraft
): string | null {
    if (reward.type === "item") {
        if (parseInteger(reward.itemId, 0) <= 0)
            return "Item reward cần Item ID hợp lệ."
        if (parseInteger(reward.count, 0) <= 0)
            return "Item reward cần số lượng > 0."
        return null
    }

    if (parseInteger(reward.amount, 0) <= 0) {
        return `Reward ${reward.type} cần giá trị > 0.`
    }

    return null
}

export default function GiftCodesPage() {
    const [campaigns, setCampaigns] = useState<GiftCodeCampaignView[]>([])
    const [loading, setLoading] = useState(true)
    const [refreshing, setRefreshing] = useState(false)
    const [creating, setCreating] = useState(false)
    const [error, setError] = useState("")
    const [formError, setFormError] = useState("")
    const [form, setForm] = useState<GiftCodeFormState>(() =>
        createDefaultGiftCodeForm()
    )
    const [createDialogOpen, setCreateDialogOpen] = useState(false)
    const [isEditMode, setIsEditMode] = useState(false)
    const [editingCampaignId, setEditingCampaignId] = useState<number | null>(
        null
    )
    const [togglingCampaignId, setTogglingCampaignId] = useState<number | null>(
        null
    )
    const [deletingCampaignId, setDeletingCampaignId] = useState<number | null>(
        null
    )
    const [codesDialogCampaign, setCodesDialogCampaign] =
        useState<GiftCodeCampaignView | null>(null)

    const actionsDisabled = loading || refreshing || creating

    const loadCampaigns = useCallback(async (showToast = false) => {
        setError("")
        setRefreshing(true)
        try {
            const items = await giftCodeService.listCampaigns(50)
            setCampaigns(items)
            if (showToast) {
                toast.success(`Đã tải ${items.length} campaign gift code`)
            }
        } catch (loadError) {
            const message =
                loadError instanceof Error
                    ? loadError.message
                    : "Không tải được danh sách gift code"
            setError(message)
            if (showToast) {
                toast.error(message)
            }
        } finally {
            setRefreshing(false)
            setLoading(false)
        }
    }, [])

    useEffect(() => {
        void loadCampaigns(false)
    }, [loadCampaigns])

    const summaryText = useMemo(() => {
        if (loading) return "Đang tải campaign gift code..."
        if (refreshing) return "Đang làm mới danh sách..."
        return `Đã tải ${campaigns.length} campaign.`
    }, [campaigns.length, loading, refreshing])

    const stats = useMemo(() => {
        const nowTs = Date.now()
        return {
            total: campaigns.length,
            active: campaigns.filter(campaign =>
                isCampaignActive(campaign, nowTs)
            ).length,
            redeemedTotal: campaigns.reduce(
                (sum, campaign) => sum + campaign.redeemedCount,
                0
            ),
            endedOrExhausted: campaigns.filter(campaign =>
                isCampaignEndedOrExhausted(campaign, nowTs)
            ).length,
        }
    }, [campaigns])

    const rewardPreviewJSON = useMemo(() => {
        try {
            return JSON.stringify(
                form.rewards.map(buildRewardInputFromDraft),
                null,
                2
            )
        } catch {
            return "[]"
        }
    }, [form.rewards])

    const totalCodesInForm = useMemo(
        () => parseCodesInput(form.codesText).length,
        [form.codesText]
    )

    const selectedCampaignCodes = useMemo(() => {
        if (!codesDialogCampaign) return []
        const codes = Array.isArray(codesDialogCampaign.codes)
            ? [...codesDialogCampaign.codes]
            : []
        return codes.sort((left, right) => {
            const leftUsed = isGiftCodeRedeemed(left) ? 1 : 0
            const rightUsed = isGiftCodeRedeemed(right) ? 1 : 0
            if (leftUsed !== rightUsed) return rightUsed - leftUsed
            return left.code.localeCompare(right.code)
        })
    }, [codesDialogCampaign])

    const selectedCampaignCodeStats = useMemo(() => {
        if (!codesDialogCampaign) {
            return {
                total: 0,
                redeemed: 0,
                available: 0,
                exhausted: 0,
                disabled: 0,
            }
        }

        return selectedCampaignCodes.reduce(
            (acc, code) => {
                acc.total += 1
                if (code.status !== 1) {
                    acc.disabled += 1
                } else if (
                    code.maxUses > 0 &&
                    code.redeemedCount >= code.maxUses
                ) {
                    acc.exhausted += 1
                } else if (!isGiftCodeRedeemed(code)) {
                    acc.available += 1
                }

                if (isGiftCodeRedeemed(code)) {
                    acc.redeemed += 1
                }
                return acc
            },
            { total: 0, redeemed: 0, available: 0, exhausted: 0, disabled: 0 }
        )
    }, [codesDialogCampaign, selectedCampaignCodes])

    const handleResetForm = useCallback(() => {
        setForm(createDefaultGiftCodeForm())
        setFormError("")
    }, [])

    const handleCopyText = useCallback(
        async (value: string, successLabel: string) => {
            const trimmed = value.trim()
            if (!trimmed) {
                toast.error("Không có dữ liệu để copy.")
                return
            }

            try {
                await copyTextToClipboard(trimmed)
                toast.success(`Đã copy ${successLabel}.`)
            } catch {
                toast.error("Không copy được vào clipboard.")
            }
        },
        []
    )

    const updateFormField = useCallback(
        <K extends keyof GiftCodeFormState>(
            field: K,
            value: GiftCodeFormState[K]
        ) => {
            setForm(prev => ({ ...prev, [field]: value }))
        },
        []
    )

    const addReward = useCallback((type: GiftCodeRewardType) => {
        setForm(prev => ({
            ...prev,
            rewards: [...prev.rewards, createRewardDraft(type)],
        }))
    }, [])

    const updateReward = useCallback(
        (rewardId: string, patch: Partial<GiftCodeRewardDraft>) => {
            setForm(prev => ({
                ...prev,
                rewards: prev.rewards.map(reward =>
                    reward.id === rewardId ? { ...reward, ...patch } : reward
                ),
            }))
        },
        []
    )

    const changeRewardType = useCallback(
        (rewardId: string, type: GiftCodeRewardType) => {
            setForm(prev => ({
                ...prev,
                rewards: prev.rewards.map(reward =>
                    reward.id === rewardId
                        ? { ...createRewardDraft(type), id: reward.id }
                        : reward
                ),
            }))
        },
        []
    )

    const removeReward = useCallback((rewardId: string) => {
        setForm(prev => {
            if (prev.rewards.length <= 1) return prev
            return {
                ...prev,
                rewards: prev.rewards.filter(reward => reward.id !== rewardId),
            }
        })
    }, [])

    const buildPayloadFromForm = (): GiftCodeCampaignCreatePayload | null => {
        setFormError("")
        setError("")

        if (form.rewards.length === 0) {
            setFormError("Bạn cần cấu hình ít nhất một reward.")
            return null
        }

        for (const reward of form.rewards) {
            const validationMessage = getRewardValidationMessage(reward)
            if (validationMessage) {
                setFormError(validationMessage)
                return null
            }
        }

        const generateCount = parseInteger(form.generateCount, 0)
        const explicitCodes = parseCodesInput(form.codesText)
        const payload: GiftCodeCampaignCreatePayload = {
            campaignKey: form.campaignKey.trim(),
            name: form.name.trim(),
            description: form.description.trim(),
            startsAt: toRFC3339FromDate(form.startsAtDate, false),
            endsAt: toRFC3339FromDate(form.endsAtDate, true),
            maxTotalUses: parseInteger(form.maxTotalUses, 0),
            maxUsesPerPlayer: parseInteger(form.maxUsesPerPlayer, 1),
            codeMaxUses: parseInteger(form.codeMaxUses, 1),
            createdBy: form.createdBy.trim() || "admin-dashboard",
            codes: explicitCodes,
            rewards: form.rewards.map(buildRewardInputFromDraft),
        }

        if (generateCount > 0 && explicitCodes.length === 0) {
            payload.generate = {
                prefix: form.generatePrefix.trim(),
                count: generateCount,
                length: parseInteger(form.generateLength, 8),
            }
        }

        return payload
    }

    const handleCreateCampaign = async () => {
        const payload = buildPayloadFromForm()
        if (!payload) return

        setCreating(true)
        try {
            const created = await giftCodeService.createCampaign(payload)
            toast.success(`Tạo campaign thành công: ${created.name}`)
            handleResetForm()
            setCreateDialogOpen(false)
            await loadCampaigns(false)
        } catch (createError) {
            const message =
                createError instanceof Error
                    ? createError.message
                    : "Tạo campaign thất bại"
            setFormError(message)
            toast.error(message)
        } finally {
            setCreating(false)
        }
    }

    const handleUpdateCampaign = async () => {
        if (!editingCampaignId) {
            setFormError("Campaign không hợp lệ để cập nhật.")
            return
        }

        const payload = buildPayloadFromForm()
        if (!payload) return

        setCreating(true)
        try {
            const updated = await giftCodeService.updateCampaign(
                editingCampaignId,
                payload
            )
            setCampaigns(prev =>
                prev.map(item => (item.id === updated.id ? updated : item))
            )
            toast.success(`Đã cập nhật campaign: ${updated.name}`)
            setCreateDialogOpen(false)
            setIsEditMode(false)
            setEditingCampaignId(null)
            handleResetForm()
        } catch (updateError) {
            const message =
                updateError instanceof Error
                    ? updateError.message
                    : "Cập nhật campaign thất bại"
            setFormError(message)
            toast.error(message)
        } finally {
            setCreating(false)
        }
    }

    const handleOpenCreateDialog = () => {
        setIsEditMode(false)
        setEditingCampaignId(null)
        handleResetForm()
        setCreateDialogOpen(true)
    }

    const handleOpenEditDialog = (campaign: GiftCodeCampaignView) => {
        setIsEditMode(true)
        setEditingCampaignId(campaign.id)
        setFormError("")
        setForm(mapCampaignToForm(campaign))
        setCreateDialogOpen(true)
    }

    const handleAutoGenerateCodes = () => {
        setFormError("")

        const count = parseInteger(form.generateCount, 0)
        const randomLength = parseInteger(form.generateLength, 8)
        const prefix = form.generatePrefix.trim().toUpperCase()

        if (count <= 0 || count > 500) {
            setFormError("Số lượng generate phải từ 1 đến 500.")
            return
        }
        if (randomLength < 4 || randomLength > 64) {
            setFormError("Độ dài random phải từ 4 đến 64 ký tự.")
            return
        }
        if (prefix.length + randomLength > 64) {
            setFormError(
                "Tổng độ dài prefix + random phải nhỏ hơn hoặc bằng 64 ký tự."
            )
            return
        }

        const generated = new Set<string>()
        while (generated.size < count) {
            generated.add(generateLocalGiftCode(prefix, randomLength))
        }

        setForm(prev => ({
            ...prev,
            codesText: Array.from(generated).join("\n"),
            generateCount: "",
        }))
        toast.success(`Đã generate ${count} code vào ô danh sách code.`)
    }

    const handleToggleCampaignStatus = async (
        campaign: GiftCodeCampaignView,
        active: boolean
    ) => {
        setError("")
        setTogglingCampaignId(campaign.id)
        try {
            const updated = await giftCodeService.toggleCampaignStatus(
                campaign.id,
                active
            )
            setCampaigns(prev =>
                prev.map(item => (item.id === updated.id ? updated : item))
            )
            toast.success(
                `${updated.name}: ${updated.status === 1 ? "đã bật" : "đã tắt"}`
            )
        } catch (toggleError) {
            const message =
                toggleError instanceof Error
                    ? toggleError.message
                    : "Không cập nhật được trạng thái campaign"
            setError(message)
            toast.error(message)
        } finally {
            setTogglingCampaignId(null)
        }
    }

    const handleDeleteCampaign = async (campaign: GiftCodeCampaignView) => {
        const confirmed = globalThis.confirm(
            `Xóa campaign "${campaign.name}" (${campaign.campaignKey})?`
        )
        if (!confirmed) return

        setError("")
        setDeletingCampaignId(campaign.id)
        try {
            await giftCodeService.deleteCampaign(campaign.id)
            setCampaigns(prev => prev.filter(item => item.id !== campaign.id))
            toast.success(`Đã xóa campaign: ${campaign.name}`)
        } catch (deleteError) {
            const message =
                deleteError instanceof Error
                    ? deleteError.message
                    : "Không xóa được campaign"
            setError(message)
            toast.error(message)
        } finally {
            setDeletingCampaignId(null)
        }
    }

    return (
        <div className="flex flex-col gap-6">
            <div className="flex items-center justify-end gap-2">
                <Button
                    variant="outline"
                    onClick={() => void loadCampaigns(true)}
                    disabled={actionsDisabled}
                >
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Làm mới
                </Button>

                <Dialog
                    open={createDialogOpen}
                    onOpenChange={open => {
                        setCreateDialogOpen(open)
                        if (!open) {
                            setFormError("")
                        }
                    }}
                >
                    <DialogTrigger asChild>
                        <Button
                            disabled={actionsDisabled}
                            onClick={handleOpenCreateDialog}
                        >
                            <Plus className="mr-2 h-4 w-4" />
                            Tạo Gift Code mới
                        </Button>
                    </DialogTrigger>
                    <DialogContent className="grid h-[92vh] max-h-[92vh] max-w-6xl grid-rows-[auto_minmax(0,1fr)_auto] gap-0 overflow-hidden p-0">
                        <DialogHeader className="border-b px-6 py-5">
                            <DialogTitle>
                                {isEditMode
                                    ? "Chỉnh sửa campaign gift code"
                                    : "Tạo campaign gift code"}
                            </DialogTitle>
                            <DialogDescription>
                                Tách rõ phần thông tin campaign, mã code và
                                reward để thao tác nhanh hơn. Bạn không cần nhập
                                JSON thô nữa.
                            </DialogDescription>
                        </DialogHeader>

                        <div className="grid min-h-0 lg:grid-cols-[320px_minmax(0,1fr)]">
                            <aside className="min-h-0 overflow-y-auto border-r bg-muted/20 px-6 py-6">
                                <div className="flex flex-col gap-4">
                                    <Card>
                                        <CardHeader className="pb-3">
                                            <CardTitle className="text-xl">
                                                Tóm tắt
                                            </CardTitle>
                                        </CardHeader>
                                        <CardContent className="flex flex-col gap-4">
                                            <div>
                                                <div className="text-lg font-semibold">
                                                    {form.name.trim() ||
                                                        "Campaign mới"}
                                                </div>
                                                <div className="mt-1 font-mono text-xs text-muted-foreground">
                                                    {form.campaignKey.trim() ||
                                                        "campaign-key sẽ tự sinh nếu để trống"}
                                                </div>
                                            </div>

                                            <div className="flex flex-wrap gap-2">
                                                <Badge variant="outline">
                                                    {form.rewards.length} reward
                                                </Badge>
                                                <Badge variant="outline">
                                                    {totalCodesInForm} code
                                                </Badge>
                                            </div>

                                            <Separator />

                                            <div className="grid gap-3 text-sm">
                                                <div className="flex items-center justify-between gap-3">
                                                    <span className="text-muted-foreground">
                                                        Bắt đầu
                                                    </span>
                                                    <span className="text-right">
                                                        {form.startsAtDate
                                                            ? formatDate(
                                                                  form.startsAtDate.toISOString()
                                                              )
                                                            : "Không giới hạn"}
                                                    </span>
                                                </div>
                                                <div className="flex items-center justify-between gap-3">
                                                    <span className="text-muted-foreground">
                                                        Kết thúc
                                                    </span>
                                                    <span className="text-right">
                                                        {form.endsAtDate
                                                            ? formatDate(
                                                                  form.endsAtDate.toISOString()
                                                              )
                                                            : "Không giới hạn"}
                                                    </span>
                                                </div>
                                                <div className="flex items-center justify-between gap-3">
                                                    <span className="text-muted-foreground">
                                                        Tổng lượt dùng
                                                    </span>
                                                    <span>
                                                        {form.maxTotalUses ||
                                                            "0"}
                                                    </span>
                                                </div>
                                                <div className="flex items-center justify-between gap-3">
                                                    <span className="text-muted-foreground">
                                                        Mỗi người chơi
                                                    </span>
                                                    <span>
                                                        {form.maxUsesPerPlayer ||
                                                            "1"}
                                                    </span>
                                                </div>
                                            </div>
                                        </CardContent>
                                    </Card>

                                    <Card>
                                        <CardHeader className="pb-3">
                                            <CardTitle className="text-lg">
                                                Reward đã cấu hình
                                            </CardTitle>
                                            <CardDescription>
                                                Kiểm tra nhanh trước khi lưu.
                                            </CardDescription>
                                        </CardHeader>
                                        <CardContent className="flex flex-col gap-3">
                                            {form.rewards.map(reward => (
                                                <div
                                                    key={reward.id}
                                                    className="rounded-lg border bg-background px-3 py-2 text-sm"
                                                >
                                                    {summarizeRewardDraft(
                                                        reward
                                                    )}
                                                </div>
                                            ))}
                                        </CardContent>
                                    </Card>
                                </div>
                            </aside>

                            <div className="min-h-0 overflow-y-auto px-6 py-6">
                                <Tabs
                                    defaultValue="info"
                                    className="flex flex-col gap-4"
                                >
                                    <TabsList className="grid w-full grid-cols-3">
                                        <TabsTrigger value="info">
                                            Thông tin campaign
                                        </TabsTrigger>
                                        <TabsTrigger value="codes">
                                            Mã gift code
                                        </TabsTrigger>
                                        <TabsTrigger value="rewards">
                                            Phần thưởng
                                        </TabsTrigger>
                                    </TabsList>

                                    <TabsContent
                                        value="info"
                                        className="mt-0 flex flex-col gap-4"
                                    >
                                        <Card>
                                            <CardHeader>
                                                <CardTitle>
                                                    Thông tin cơ bản
                                                </CardTitle>
                                                <CardDescription>
                                                    Đặt tên, mô tả và khoảng
                                                    thời gian áp dụng.
                                                </CardDescription>
                                            </CardHeader>
                                            <CardContent className="grid gap-4 md:grid-cols-2">
                                                <div className="flex flex-col gap-2">
                                                    <Label>Campaign key</Label>
                                                    <Input
                                                        placeholder="Để trống để tự sinh từ tên campaign"
                                                        value={form.campaignKey}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "campaignKey",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>Tên campaign</Label>
                                                    <Input
                                                        placeholder="Ví dụ: Newbie Pack Tháng 3"
                                                        value={form.name}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "name",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>Created by</Label>
                                                    <Input
                                                        value={form.createdBy}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "createdBy",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>Ngày bắt đầu</Label>
                                                    <DatePicker
                                                        value={
                                                            form.startsAtDate
                                                        }
                                                        onChange={date =>
                                                            updateFormField(
                                                                "startsAtDate",
                                                                date
                                                            )
                                                        }
                                                        placeholder="Chọn ngày bắt đầu"
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>Ngày kết thúc</Label>
                                                    <DatePicker
                                                        value={form.endsAtDate}
                                                        onChange={date =>
                                                            updateFormField(
                                                                "endsAtDate",
                                                                date
                                                            )
                                                        }
                                                        placeholder="Chọn ngày kết thúc"
                                                    />
                                                </div>
                                                <div className="md:col-span-2 flex flex-col gap-2">
                                                    <Label>Mô tả</Label>
                                                    <Textarea
                                                        rows={4}
                                                        placeholder="Ghi chú nhanh cho campaign này"
                                                        value={form.description}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "description",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                            </CardContent>
                                        </Card>

                                        <Card>
                                            <CardHeader>
                                                <CardTitle>
                                                    Giới hạn sử dụng
                                                </CardTitle>
                                                <CardDescription>
                                                    Điều chỉnh tổng lượt dùng và
                                                    số lần mỗi người chơi được
                                                    redeem.
                                                </CardDescription>
                                            </CardHeader>
                                            <CardContent className="grid gap-4 md:grid-cols-3">
                                                <div className="flex flex-col gap-2">
                                                    <Label>
                                                        Tổng lượt dùng
                                                    </Label>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        value={
                                                            form.maxTotalUses
                                                        }
                                                        onChange={event =>
                                                            updateFormField(
                                                                "maxTotalUses",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>
                                                        Mỗi người chơi
                                                    </Label>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        value={
                                                            form.maxUsesPerPlayer
                                                        }
                                                        onChange={event =>
                                                            updateFormField(
                                                                "maxUsesPerPlayer",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                                <div className="flex flex-col gap-2">
                                                    <Label>Mỗi code</Label>
                                                    <Input
                                                        type="number"
                                                        min={0}
                                                        value={form.codeMaxUses}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "codeMaxUses",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                </div>
                                            </CardContent>
                                        </Card>
                                    </TabsContent>

                                    <TabsContent
                                        value="codes"
                                        className="mt-0 flex flex-col gap-4"
                                    >
                                        <Card>
                                            <CardHeader>
                                                <CardTitle>
                                                    Tạo danh sách code
                                                </CardTitle>
                                                <CardDescription>
                                                    Bạn có thể dán code thủ công
                                                    hoặc generate nhanh ngay
                                                    trong dashboard.
                                                </CardDescription>
                                            </CardHeader>
                                            <CardContent className="grid gap-4 lg:grid-cols-[minmax(0,1fr)_360px]">
                                                <div className="flex flex-col gap-2">
                                                    <div className="flex items-center justify-between gap-2">
                                                        <Label>
                                                            Danh sách code
                                                        </Label>
                                                        <Tooltip>
                                                            <TooltipTrigger
                                                                asChild
                                                            >
                                                                <Button
                                                                    type="button"
                                                                    variant="outline"
                                                                    size="icon"
                                                                    className="size-8"
                                                                    onClick={() =>
                                                                        void handleCopyText(
                                                                            form.codesText,
                                                                            "danh sách code"
                                                                        )
                                                                    }
                                                                    disabled={
                                                                        actionsDisabled ||
                                                                        !form.codesText.trim()
                                                                    }
                                                                >
                                                                    <Copy />
                                                                </Button>
                                                            </TooltipTrigger>
                                                            <TooltipContent>
                                                                Copy toàn bộ
                                                                danh sách code
                                                            </TooltipContent>
                                                        </Tooltip>
                                                    </div>
                                                    <Textarea
                                                        rows={14}
                                                        placeholder="Mỗi code một dòng. Để trống nếu bạn muốn generate."
                                                        value={form.codesText}
                                                        onChange={event =>
                                                            updateFormField(
                                                                "codesText",
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled
                                                        }
                                                    />
                                                    <p className="text-xs text-muted-foreground">
                                                        Hiện có{" "}
                                                        {totalCodesInForm} code
                                                        trong ô nhập.
                                                    </p>
                                                </div>

                                                <Card className="border-dashed">
                                                    <CardContent className="flex h-full flex-col gap-4 p-6">
                                                        <div className="flex flex-col gap-2">
                                                            <Label>
                                                                Prefix
                                                            </Label>
                                                            <Input
                                                                placeholder="Ví dụ: S1NEW"
                                                                value={
                                                                    form.generatePrefix
                                                                }
                                                                onChange={event =>
                                                                    updateFormField(
                                                                        "generatePrefix",
                                                                        event
                                                                            .target
                                                                            .value
                                                                    )
                                                                }
                                                                disabled={
                                                                    actionsDisabled
                                                                }
                                                            />
                                                        </div>
                                                        <div className="grid gap-4 md:grid-cols-2">
                                                            <div className="flex flex-col gap-2">
                                                                <Label>
                                                                    Số lượng
                                                                    generate
                                                                </Label>
                                                                <Input
                                                                    type="number"
                                                                    min={1}
                                                                    max={500}
                                                                    value={
                                                                        form.generateCount
                                                                    }
                                                                    onChange={event =>
                                                                        updateFormField(
                                                                            "generateCount",
                                                                            event
                                                                                .target
                                                                                .value
                                                                        )
                                                                    }
                                                                    disabled={
                                                                        actionsDisabled
                                                                    }
                                                                />
                                                            </div>
                                                            <div className="flex flex-col gap-2">
                                                                <Label>
                                                                    Độ dài
                                                                    random
                                                                </Label>
                                                                <Input
                                                                    type="number"
                                                                    min={4}
                                                                    max={64}
                                                                    value={
                                                                        form.generateLength
                                                                    }
                                                                    onChange={event =>
                                                                        updateFormField(
                                                                            "generateLength",
                                                                            event
                                                                                .target
                                                                                .value
                                                                        )
                                                                    }
                                                                    disabled={
                                                                        actionsDisabled
                                                                    }
                                                                />
                                                            </div>
                                                        </div>
                                                        <Button
                                                            type="button"
                                                            variant="outline"
                                                            onClick={
                                                                handleAutoGenerateCodes
                                                            }
                                                            disabled={
                                                                actionsDisabled
                                                            }
                                                        >
                                                            <Ticket className="mr-2 h-4 w-4" />
                                                            Generate vào danh
                                                            sách code
                                                        </Button>
                                                    </CardContent>
                                                </Card>
                                            </CardContent>
                                        </Card>
                                    </TabsContent>

                                    <TabsContent
                                        value="rewards"
                                        className="mt-0 flex flex-col gap-4"
                                    >
                                        <GiftCodeRewardBuilder
                                            rewards={form.rewards}
                                            disabled={actionsDisabled}
                                            onAddReward={addReward}
                                            onRewardChange={updateReward}
                                            onRewardTypeChange={
                                                changeRewardType
                                            }
                                            onRemoveReward={removeReward}
                                        />

                                        <Card>
                                            <CardHeader>
                                                <CardTitle>
                                                    Payload xem trước
                                                </CardTitle>
                                                <CardDescription>
                                                    Giữ lại để bạn kiểm tra
                                                    nhanh dữ liệu sẽ gửi xuống
                                                    API.
                                                </CardDescription>
                                            </CardHeader>
                                            <CardContent>
                                                <Textarea
                                                    rows={10}
                                                    value={rewardPreviewJSON}
                                                    readOnly
                                                    className="font-mono text-xs"
                                                />
                                            </CardContent>
                                        </Card>
                                    </TabsContent>
                                </Tabs>

                                {formError ? (
                                    <div className="mt-4 text-sm text-destructive">
                                        {formError}
                                    </div>
                                ) : null}
                            </div>
                        </div>

                        <div className="flex shrink-0 items-center justify-between border-t bg-background px-6 py-4">
                            <p className="text-sm text-muted-foreground">
                                {isEditMode
                                    ? "Đang ở chế độ chỉnh sửa campaign."
                                    : "Campaign mới sẽ được lưu ngay vào DB giftcode."}
                            </p>
                            <div className="flex items-center gap-2">
                                <Button
                                    variant="outline"
                                    onClick={handleResetForm}
                                    disabled={actionsDisabled}
                                >
                                    Reset form
                                </Button>
                                <Button
                                    onClick={() =>
                                        void (isEditMode
                                            ? handleUpdateCampaign()
                                            : handleCreateCampaign())
                                    }
                                    disabled={actionsDisabled}
                                >
                                    {creating
                                        ? isEditMode
                                            ? "Đang cập nhật..."
                                            : "Đang tạo..."
                                        : isEditMode
                                          ? "Lưu thay đổi"
                                          : "Tạo campaign"}
                                </Button>
                            </div>
                        </div>
                    </DialogContent>
                </Dialog>
            </div>

            <div className="grid gap-4 md:grid-cols-4">
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Tổng campaign
                        </CardTitle>
                        <Gift className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{stats.total}</div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Đang hoạt động
                        </CardTitle>
                        <Gift className="h-4 w-4 text-green-500" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{stats.active}</div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Tổng lượt redeem
                        </CardTitle>
                        <Users className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {stats.redeemedTotal.toLocaleString("vi-VN")}
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Đã hết lượt / hết hạn
                        </CardTitle>
                        <Calendar className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {stats.endedOrExhausted}
                        </div>
                    </CardContent>
                </Card>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Campaigns</CardTitle>
                    <CardDescription>{summaryText}</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    {error ? (
                        <div className="text-sm text-destructive">{error}</div>
                    ) : null}

                    {campaigns.length === 0 ? (
                        <div className="rounded-md border border-dashed p-6 text-center text-sm text-muted-foreground">
                            Chưa có campaign gift code nào.
                        </div>
                    ) : (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Campaign</TableHead>
                                    <TableHead>Trạng thái</TableHead>
                                    <TableHead>Bật / tắt</TableHead>
                                    <TableHead>Lượt dùng</TableHead>
                                    <TableHead>Codes</TableHead>
                                    <TableHead>Rewards</TableHead>
                                    <TableHead>Thời gian</TableHead>
                                    <TableHead>Cập nhật</TableHead>
                                    <TableHead>Thao tác</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {campaigns.map(campaign => {
                                    const nowTs = Date.now()
                                    const active = isCampaignActive(
                                        campaign,
                                        nowTs
                                    )
                                    const endedOrExhausted =
                                        isCampaignExpiredOrExhausted(
                                            campaign,
                                            nowTs
                                        )
                                    const cannotDeleteRedeemed =
                                        campaign.redeemedCount > 0
                                    const statusVariant:
                                        | "success"
                                        | "secondary" = active
                                        ? "success"
                                        : "secondary"
                                    const codes = Array.isArray(campaign.codes)
                                        ? campaign.codes
                                        : []
                                    const rewards = Array.isArray(
                                        campaign.rewards
                                    )
                                        ? campaign.rewards
                                        : []

                                    return (
                                        <TableRow key={campaign.id}>
                                            <TableCell>
                                                <div className="space-y-1">
                                                    <div className="font-medium">
                                                        {campaign.name}
                                                    </div>
                                                    <div className="font-mono text-xs text-muted-foreground">
                                                        {campaign.campaignKey}
                                                    </div>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant={statusVariant}>
                                                    {active
                                                        ? "Hoạt động"
                                                        : "Không hoạt động"}
                                                </Badge>
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex items-center gap-2">
                                                    <Switch
                                                        checked={
                                                            campaign.status ===
                                                            1
                                                        }
                                                        onCheckedChange={checked =>
                                                            void handleToggleCampaignStatus(
                                                                campaign,
                                                                checked
                                                            )
                                                        }
                                                        disabled={
                                                            actionsDisabled ||
                                                            togglingCampaignId !==
                                                                null ||
                                                            deletingCampaignId !==
                                                                null ||
                                                            endedOrExhausted
                                                        }
                                                    />
                                                    <span className="text-xs text-muted-foreground">
                                                        {campaign.status === 1
                                                            ? "ON"
                                                            : "OFF"}
                                                    </span>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                {campaign.redeemedCount.toLocaleString(
                                                    "vi-VN"
                                                )}{" "}
                                                /{" "}
                                                {campaign.maxTotalUses > 0
                                                    ? campaign.maxTotalUses.toLocaleString(
                                                          "vi-VN"
                                                      )
                                                    : "Không giới hạn"}
                                            </TableCell>
                                            <TableCell>
                                                <div className="space-y-1">
                                                    <div>
                                                        {codes.length} code
                                                    </div>
                                                    {codes.length > 0 ? (
                                                        <Button
                                                            type="button"
                                                            variant="link"
                                                            size="sm"
                                                            className="h-auto px-0 text-xs"
                                                            onClick={() =>
                                                                setCodesDialogCampaign(
                                                                    campaign
                                                                )
                                                            }
                                                        >
                                                            Xem danh sách mã
                                                        </Button>
                                                    ) : null}
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <div className="space-y-1">
                                                    <div>
                                                        {rewards.length} reward
                                                    </div>
                                                    <div className="max-w-[220px] truncate text-xs text-muted-foreground">
                                                        {rewards.length > 0
                                                            ? rewards[0]
                                                                  .description
                                                            : "-"}
                                                    </div>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <div className="space-y-1 text-xs">
                                                    <div>
                                                        Bắt đầu:{" "}
                                                        {formatDate(
                                                            campaign.startsAt
                                                        )}
                                                    </div>
                                                    <div>
                                                        Kết thúc:{" "}
                                                        {formatDate(
                                                            campaign.endsAt
                                                        )}
                                                    </div>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                {formatDate(campaign.updatedAt)}
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex items-center gap-2">
                                                    <Button
                                                        type="button"
                                                        variant="outline"
                                                        size="sm"
                                                        disabled={
                                                            actionsDisabled ||
                                                            deletingCampaignId !==
                                                                null
                                                        }
                                                        onClick={() =>
                                                            handleOpenEditDialog(
                                                                campaign
                                                            )
                                                        }
                                                    >
                                                        <Pencil className="mr-2 h-3 w-3" />
                                                        Sửa
                                                    </Button>
                                                    <Button
                                                        type="button"
                                                        variant="destructive"
                                                        size="sm"
                                                        disabled={
                                                            actionsDisabled ||
                                                            deletingCampaignId !==
                                                                null ||
                                                            cannotDeleteRedeemed
                                                        }
                                                        onClick={() =>
                                                            void handleDeleteCampaign(
                                                                campaign
                                                            )
                                                        }
                                                        title={
                                                            cannotDeleteRedeemed
                                                                ? "Campaign đã có người redeem nên không thể xóa"
                                                                : "Xóa campaign"
                                                        }
                                                    >
                                                        <Trash2 className="mr-2 h-3 w-3" />
                                                        {deletingCampaignId ===
                                                        campaign.id
                                                            ? "Đang xóa..."
                                                            : "Xóa"}
                                                    </Button>
                                                </div>
                                            </TableCell>
                                        </TableRow>
                                    )
                                })}
                            </TableBody>
                        </Table>
                    )}
                </CardContent>
            </Card>

            <Dialog
                open={Boolean(codesDialogCampaign)}
                onOpenChange={open =>
                    !open ? setCodesDialogCampaign(null) : undefined
                }
            >
                <DialogContent className="grid h-[85vh] max-h-[85vh] max-w-5xl grid-rows-[auto_minmax(0,1fr)] gap-0 overflow-hidden p-0">
                    <DialogHeader className="border-b px-6 py-5">
                        <DialogTitle>Danh sách mã gift code</DialogTitle>
                        <DialogDescription>
                            {codesDialogCampaign
                                ? `${codesDialogCampaign.name} • ${selectedCampaignCodeStats.redeemed}/${selectedCampaignCodeStats.total} mã đã được sử dụng`
                                : "Kiểm tra trạng thái từng mã trong campaign."}
                        </DialogDescription>
                    </DialogHeader>

                    <div className="grid min-h-0 gap-4 px-6 py-6">
                        <div className="grid gap-3 md:grid-cols-4">
                            <Card>
                                <CardHeader className="pb-2">
                                    <CardTitle className="text-sm">
                                        Tổng mã
                                    </CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-2xl font-semibold">
                                        {selectedCampaignCodeStats.total}
                                    </div>
                                </CardContent>
                            </Card>
                            <Card>
                                <CardHeader className="pb-2">
                                    <CardTitle className="text-sm">
                                        Đã dùng
                                    </CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-2xl font-semibold">
                                        {selectedCampaignCodeStats.redeemed}
                                    </div>
                                </CardContent>
                            </Card>
                            <Card>
                                <CardHeader className="pb-2">
                                    <CardTitle className="text-sm">
                                        Chưa dùng
                                    </CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-2xl font-semibold">
                                        {selectedCampaignCodeStats.available}
                                    </div>
                                </CardContent>
                            </Card>
                            <Card>
                                <CardHeader className="pb-2">
                                    <CardTitle className="text-sm">
                                        Hết lượt / tắt
                                    </CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-2xl font-semibold">
                                        {selectedCampaignCodeStats.exhausted +
                                            selectedCampaignCodeStats.disabled}
                                    </div>
                                </CardContent>
                            </Card>
                        </div>

                        <div className="flex items-center justify-end">
                            <Button
                                type="button"
                                variant="outline"
                                size="sm"
                                onClick={() =>
                                    void handleCopyText(
                                        selectedCampaignCodes
                                            .map(code => code.code)
                                            .join("\n"),
                                        "toàn bộ mã trong campaign"
                                    )
                                }
                                disabled={selectedCampaignCodes.length === 0}
                            >
                                <Copy />
                                Copy tất cả mã
                            </Button>
                        </div>

                        <div className="min-h-0 overflow-y-auto rounded-lg border">
                            <Table>
                                <TableHeader className="sticky top-0 z-10 bg-background">
                                    <TableRow>
                                        <TableHead>Mã</TableHead>
                                        <TableHead>Trạng thái</TableHead>
                                        <TableHead>Lượt dùng</TableHead>
                                        <TableHead>Redeem gần nhất</TableHead>
                                    </TableRow>
                                </TableHeader>
                                <TableBody>
                                    {selectedCampaignCodes.length === 0 ? (
                                        <TableRow>
                                            <TableCell
                                                colSpan={4}
                                                className="py-8 text-center text-sm text-muted-foreground"
                                            >
                                                Campaign này chưa có mã nào.
                                            </TableCell>
                                        </TableRow>
                                    ) : (
                                        selectedCampaignCodes.map(code => {
                                            const usageBadge =
                                                getGiftCodeUsageBadge(code)
                                            return (
                                                <TableRow key={code.id}>
                                                    <TableCell>
                                                        <div className="flex items-center justify-between gap-2">
                                                            <span className="truncate font-mono text-sm">
                                                                {code.code}
                                                            </span>
                                                            <Tooltip>
                                                                <TooltipTrigger
                                                                    asChild
                                                                >
                                                                    <Button
                                                                        type="button"
                                                                        variant="ghost"
                                                                        size="icon"
                                                                        className="size-8 shrink-0"
                                                                        onClick={() =>
                                                                            void handleCopyText(
                                                                                code.code,
                                                                                `mã ${code.code}`
                                                                            )
                                                                        }
                                                                    >
                                                                        <Copy />
                                                                    </Button>
                                                                </TooltipTrigger>
                                                                <TooltipContent>
                                                                    Copy mã này
                                                                </TooltipContent>
                                                            </Tooltip>
                                                        </div>
                                                    </TableCell>
                                                    <TableCell>
                                                        <Badge
                                                            variant={
                                                                usageBadge.variant
                                                            }
                                                        >
                                                            {usageBadge.label}
                                                        </Badge>
                                                    </TableCell>
                                                    <TableCell>
                                                        {code.redeemedCount.toLocaleString(
                                                            "vi-VN"
                                                        )}{" "}
                                                        /{" "}
                                                        {code.maxUses > 0
                                                            ? code.maxUses.toLocaleString(
                                                                  "vi-VN"
                                                              )
                                                            : "Không giới hạn"}
                                                    </TableCell>
                                                    <TableCell>
                                                        {code.lastRedeemedAt
                                                            ? formatDate(
                                                                  code.lastRedeemedAt
                                                              )
                                                            : "-"}
                                                    </TableCell>
                                                </TableRow>
                                            )
                                        })
                                    )}
                                </TableBody>
                            </Table>
                        </div>
                    </div>
                </DialogContent>
            </Dialog>
        </div>
    )
}
