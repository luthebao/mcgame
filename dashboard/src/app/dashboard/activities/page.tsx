"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { RefreshCcw, Save } from "lucide-react"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { Textarea } from "@/components/ui/textarea"
import { getErrorMessage } from "@/services/api"
import { type ActivityRow, activityService } from "@/services/activity.service"

type ActivityDrafts = Record<number, ActivityRow>
type ActivityDraftPatch = Partial<ActivityRow>

const activityTypeOptions = [
    {
        value: 0,
        label: "0 - Hiển thị cơ bản: flag khác 0 thì hiện",
    },
    {
        value: 2,
        label: "2 - Giới hạn level: flag là level tối thiểu",
    },
    {
        value: 3,
        label: "3 - Trạng thái activity: flag 0/1/2 đổi trạng thái",
    },
    {
        value: 4,
        label: "4 - EXP chuyển sinh: hiện khi expRe > 0",
    },
]

const activityTypeGuide = [
    {
        type: "0",
        behavior: "Hiển thị cơ bản",
        flag: "flag khác 0 thì hiện icon, flag = 0 thì ẩn.",
    },
    {
        type: "2",
        behavior: "Giới hạn level nhân vật",
        flag: "flag là level tối thiểu; hiện khi player.level >= flag.",
    },
    {
        type: "3",
        behavior: "Cập nhật trạng thái icon",
        flag: "0 = ẩn/xóa, 1 = hiện nhãn trạng thái 1, 2 = hiện nhãn trạng thái 2.",
    },
    {
        type: "4",
        behavior: "Giới hạn theo EXP chuyển sinh",
        flag: "Không dùng flag; hiện khi player.expRe (RebirthExp) > 0.",
    },
]

function nullableText(value: string | null): string {
    return value ?? ""
}

function parseNumber(value: string, fallback: number): number {
    const parsed = Number.parseInt(value, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

function sortActivities(a: ActivityRow, b: ActivityRow): number {
    return a.sort_type - b.sort_type || a.id - b.id
}

function createActivityDrafts(rows: ActivityRow[]): ActivityDrafts {
    return Object.fromEntries(rows.map(activity => [activity.id, activity]))
}

function matchesActivitySearch(activity: ActivityRow, needle: string): boolean {
    if (!needle) return true

    return [
        activity.id,
        activity.name,
        activity.type,
        activity.flag,
        activity.note,
    ]
        .filter(value => value !== null && value !== undefined)
        .some(value => String(value).toLowerCase().includes(needle))
}

function isChanged(
    original: ActivityRow | undefined,
    draft: ActivityRow
): boolean {
    if (!original) return false
    return JSON.stringify(original) !== JSON.stringify(draft)
}

export default function ActivitiesPage() {
    const [activities, setActivities] = useState<ActivityRow[]>([])
    const [drafts, setDrafts] = useState<ActivityDrafts>({})
    const [loading, setLoading] = useState(false)
    const [savingId, setSavingId] = useState<number | null>(null)
    const [error, setError] = useState("")
    const [search, setSearch] = useState("")

    const requestRef = useRef(0)

    const loadActivities = useCallback(async () => {
        const requestID = ++requestRef.current
        setLoading(true)
        setError("")
        try {
            const rows = await activityService.list()
            if (requestID !== requestRef.current) return
            setActivities(rows)
            setDrafts(createActivityDrafts(rows))
        } catch (err) {
            if (requestID !== requestRef.current) return
            setError(getErrorMessage(err))
        } finally {
            if (requestID === requestRef.current) setLoading(false)
        }
    }, [])

    useEffect(() => {
        void loadActivities()
    }, [loadActivities])

    const originalsById = useMemo(
        () => new Map(activities.map(activity => [activity.id, activity])),
        [activities]
    )

    const filteredDrafts = useMemo(() => {
        const needle = search.trim().toLowerCase()
        return Object.values(drafts)
            .filter(activity => matchesActivitySearch(activity, needle))
            .sort(sortActivities)
    }, [drafts, search])

    const changedCount = useMemo(
        () =>
            Object.values(drafts).filter(draft =>
                isChanged(originalsById.get(draft.id), draft)
            ).length,
        [drafts, originalsById]
    )

    const updateDraft = useCallback(
        (id: number, updater: (current: ActivityRow) => ActivityRow) => {
            setDrafts(current => {
                const draft = current[id]
                if (!draft) return current
                return { ...current, [id]: updater(draft) }
            })
        },
        []
    )

    const patchDraft = useCallback(
        (id: number, patch: ActivityDraftPatch) => {
            updateDraft(id, current => ({ ...current, ...patch }))
        },
        [updateDraft]
    )

    const saveActivity = useCallback(async (activity: ActivityRow) => {
        setSavingId(activity.id)
        setError("")
        try {
            const updated = await activityService.update(activity.id, {
                name: activity.name,
                enable: activity.enable,
                type: activity.type,
                flag: activity.flag,
                note: activity.note,
            })
            setActivities(current =>
                current
                    .map(row => (row.id === updated.id ? updated : row))
                    .sort(sortActivities)
            )
            setDrafts(current => ({ ...current, [updated.id]: updated }))
        } catch (err) {
            setError(getErrorMessage(err))
        } finally {
            setSavingId(null)
        }
    }, [])

    const controlsDisabled = savingId !== null || loading

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[700px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">
                        Quản lý Activity Bar
                    </h2>
                    <p className="text-sm text-muted-foreground">
                        Chỉnh sửa cấu hình data.data_tbl_activity cho danh sách
                        startedActList của Flash client.
                    </p>
                </div>
                <div className="flex flex-wrap items-center gap-2">
                    <Badge variant={changedCount > 0 ? "warning" : "secondary"}>
                        {changedCount} thay đổi chưa lưu
                    </Badge>
                    <Button
                        type="button"
                        onClick={() => void loadActivities()}
                        disabled={loading || savingId !== null}
                    >
                        <RefreshCcw className="mr-2 h-4 w-4" />
                        Tải lại
                    </Button>
                </div>
            </div>

            <Card>
                <CardContent className="grid gap-3 pt-4 md:grid-cols-[minmax(0,1fr)_auto] md:items-center">
                    <Input
                        value={search}
                        onChange={event => setSearch(event.target.value)}
                        placeholder="Tìm theo id, name, type, flag, note..."
                    />
                    <p className="text-sm text-muted-foreground">
                        {filteredDrafts.length}/{activities.length} activity
                    </p>
                    <p className="text-sm text-muted-foreground md:col-span-2">
                        enable tắt/mở activity ở phía server. type mô tả cách
                        Flash client hiểu flag cho activity đó khi render icon.
                    </p>
                </CardContent>
            </Card>

            <Card>
                <CardContent className="grid gap-3 pt-4">
                    <div>
                        <h3 className="font-semibold">
                            Hướng dẫn type và flag
                        </h3>
                        <p className="text-sm text-muted-foreground">
                            Các giá trị này đi vào startedActList. Flash client
                            chỉ có logic rõ ràng cho type 0, 2, 3 và 4.
                        </p>
                    </div>
                    <div className="grid gap-2 md:grid-cols-2 xl:grid-cols-3">
                        {activityTypeGuide.map(item => (
                            <div
                                key={item.type}
                                className="rounded-md border p-3 text-sm"
                            >
                                <p className="font-medium">
                                    Type {item.type}: {item.behavior}
                                </p>
                                <p className="mt-1 text-muted-foreground">
                                    {item.flag}
                                </p>
                            </div>
                        ))}
                    </div>
                </CardContent>
            </Card>

            {error ? <p className="text-sm text-destructive">{error}</p> : null}

            <Card className="min-h-0 flex-1">
                <CardContent className="flex h-full min-h-0 flex-col p-0">
                    <div className="min-h-0 flex-1 overflow-auto">
                        <Table>
                            <TableHeader className="sticky top-0 z-10 bg-background">
                                <TableRow>
                                    <TableHead className="w-[64px]">
                                        ID
                                    </TableHead>
                                    <TableHead className="min-w-[220px]">
                                        Name
                                    </TableHead>
                                    <TableHead className="w-[84px]">
                                        Enable
                                    </TableHead>
                                    <TableHead className="min-w-[360px]">
                                        Type
                                    </TableHead>
                                    <TableHead className="w-[90px]">
                                        Flag
                                    </TableHead>
                                    <TableHead className="min-w-[220px]">
                                        Note
                                    </TableHead>
                                    <TableHead className="w-[110px]" />
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {filteredDrafts.map(activity => {
                                    const changed = isChanged(
                                        originalsById.get(activity.id),
                                        activity
                                    )
                                    return (
                                        <TableRow key={activity.id}>
                                            <TableCell className="font-mono text-xs">
                                                {activity.id}
                                            </TableCell>
                                            <TableCell>
                                                <Input
                                                    value={nullableText(
                                                        activity.name
                                                    )}
                                                    disabled={controlsDisabled}
                                                    className="h-8"
                                                    onChange={event =>
                                                        patchDraft(
                                                            activity.id,
                                                            {
                                                                name:
                                                                    event.target
                                                                        .value ||
                                                                    null,
                                                            }
                                                        )
                                                    }
                                                />
                                            </TableCell>
                                            <TableCell>
                                                <Switch
                                                    checked={activity.enable}
                                                    disabled={controlsDisabled}
                                                    onCheckedChange={checked =>
                                                        patchDraft(
                                                            activity.id,
                                                            {
                                                                enable: checked,
                                                            }
                                                        )
                                                    }
                                                />
                                            </TableCell>
                                            <TableCell>
                                                <Select
                                                    value={String(
                                                        activity.type
                                                    )}
                                                    disabled={controlsDisabled}
                                                    onValueChange={value =>
                                                        patchDraft(
                                                            activity.id,
                                                            {
                                                                type: Number(
                                                                    value
                                                                ),
                                                            }
                                                        )
                                                    }
                                                >
                                                    <SelectTrigger className="h-8">
                                                        <SelectValue placeholder="Choose activity type" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        {activityTypeOptions.map(
                                                            option => (
                                                                <SelectItem
                                                                    key={
                                                                        option.value
                                                                    }
                                                                    value={String(
                                                                        option.value
                                                                    )}
                                                                >
                                                                    {
                                                                        option.label
                                                                    }
                                                                </SelectItem>
                                                            )
                                                        )}
                                                    </SelectContent>
                                                </Select>
                                            </TableCell>
                                            <TableCell>
                                                <Input
                                                    type="number"
                                                    value={activity.flag}
                                                    disabled={controlsDisabled}
                                                    className="h-8"
                                                    onChange={event =>
                                                        updateDraft(
                                                            activity.id,
                                                            current => ({
                                                                ...current,
                                                                flag: parseNumber(
                                                                    event.target
                                                                        .value,
                                                                    current.flag
                                                                ),
                                                            })
                                                        )
                                                    }
                                                />
                                            </TableCell>
                                            <TableCell>
                                                <Textarea
                                                    value={nullableText(
                                                        activity.note
                                                    )}
                                                    disabled={controlsDisabled}
                                                    className="min-h-8"
                                                    onChange={event =>
                                                        patchDraft(
                                                            activity.id,
                                                            {
                                                                note:
                                                                    event.target
                                                                        .value ||
                                                                    null,
                                                            }
                                                        )
                                                    }
                                                />
                                            </TableCell>
                                            <TableCell>
                                                <Button
                                                    type="button"
                                                    size="sm"
                                                    disabled={
                                                        !changed ||
                                                        controlsDisabled
                                                    }
                                                    onClick={() =>
                                                        void saveActivity(
                                                            activity
                                                        )
                                                    }
                                                >
                                                    <Save className="mr-2 h-4 w-4" />
                                                    Lưu
                                                </Button>
                                            </TableCell>
                                        </TableRow>
                                    )
                                })}
                            </TableBody>
                        </Table>
                    </div>
                </CardContent>
            </Card>
        </section>
    )
}
