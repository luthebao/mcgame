"use client"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"

import {
    LOOT_ROLE_LABELS,
    type LootQueryState,
    type LootRole,
} from "../_lib/shared"

type Props = {
    query: LootQueryState
    searchDraft: string
    summaryText: string
    error: string
    loading: boolean
    onSearchDraftChange: (v: string) => void
    onRoleChange: (v: LootRole) => void
    onMinLevelChange: (v: number | null) => void
    onMaxLevelChange: (v: number | null) => void
    onClearFilters: () => void
}

const ROLE_ORDER: LootRole[] = [
    "all",
    "normal",
    "map-boss",
    "npc",
    "other",
]

export function LootFilters(props: Props) {
    const { query, searchDraft, summaryText, error, loading } = props

    return (
        <div className="space-y-3 rounded-lg border bg-card p-3">
            <div className="flex flex-wrap items-end gap-3">
                <div className="min-w-[240px] flex-1">
                    <Label htmlFor="loot-search" className="text-xs">
                        Tìm theo tên hoặc ID quái
                    </Label>
                    <Input
                        id="loot-search"
                        value={searchDraft}
                        onChange={e => props.onSearchDraftChange(e.target.value)}
                        placeholder="Vd. 2204 hoặc Thất Sắc Kê"
                        disabled={loading}
                    />
                </div>
                <div className="w-44">
                    <Label className="text-xs">Vai trò</Label>
                    <Select
                        value={query.role}
                        onValueChange={v => props.onRoleChange(v as LootRole)}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                            {ROLE_ORDER.map(r => (
                                <SelectItem key={r} value={r}>
                                    {LOOT_ROLE_LABELS[r]}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                </div>
                <div className="w-28">
                    <Label className="text-xs">Lv tối thiểu</Label>
                    <Input
                        type="number"
                        min={1}
                        max={200}
                        value={query.minLevel ?? ""}
                        onChange={e =>
                            props.onMinLevelChange(
                                e.target.value ? Number(e.target.value) : null
                            )
                        }
                        disabled={loading}
                    />
                </div>
                <div className="w-28">
                    <Label className="text-xs">Lv tối đa</Label>
                    <Input
                        type="number"
                        min={1}
                        max={200}
                        value={query.maxLevel ?? ""}
                        onChange={e =>
                            props.onMaxLevelChange(
                                e.target.value ? Number(e.target.value) : null
                            )
                        }
                        disabled={loading}
                    />
                </div>
                <Button
                    type="button"
                    variant="outline"
                    onClick={props.onClearFilters}
                    disabled={loading}
                >
                    Xóa bộ lọc
                </Button>
            </div>
            <div className="flex items-center justify-between text-xs text-muted-foreground">
                <span>{summaryText}</span>
                {error ? <span className="text-destructive">{error}</span> : null}
            </div>
        </div>
    )
}
