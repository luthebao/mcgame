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
    BOSS_LOOT_KIND_LABELS,
    BOSS_LOOT_TIER_LABELS,
    type BossLootKind,
    type BossLootQueryState,
    type BossLootTier,
} from "../_lib/shared"

type Props = {
    query: BossLootQueryState
    searchDraft: string
    summaryText: string
    error: string
    loading: boolean
    onSearchDraftChange: (v: string) => void
    onKindChange: (v: BossLootKind) => void
    onTierChange: (v: BossLootTier) => void
    onMinLevelChange: (v: number | null) => void
    onMaxLevelChange: (v: number | null) => void
    onClearFilters: () => void
}

const KIND_ORDER: BossLootKind[] = ["all", "ground", "flying", "daily_only"]
const TIER_ORDER: BossLootTier[] = ["all", "normal", "mythic", "special"]

export function BossLootFilters(props: Props) {
    const { query, searchDraft, summaryText, error, loading } = props

    return (
        <div className="space-y-3 rounded-lg border bg-card p-3">
            <div className="flex flex-wrap items-end gap-3">
                <div className="min-w-[240px] flex-1">
                    <Label htmlFor="boss-loot-search" className="text-xs">
                        Tìm theo tên / NID / daily ID
                    </Label>
                    <Input
                        id="boss-loot-search"
                        value={searchDraft}
                        onChange={e => props.onSearchDraftChange(e.target.value)}
                        placeholder="Vd. 706 hoặc 2204 hoặc Thất Sắc Kê"
                        disabled={loading}
                    />
                </div>
                <div className="w-40">
                    <Label className="text-xs">Loại</Label>
                    <Select
                        value={query.kind}
                        onValueChange={v => props.onKindChange(v as BossLootKind)}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                            {KIND_ORDER.map(k => (
                                <SelectItem key={k} value={k}>
                                    {BOSS_LOOT_KIND_LABELS[k]}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                </div>
                <div className="w-40">
                    <Label className="text-xs">Tier</Label>
                    <Select
                        value={query.tier}
                        onValueChange={v => props.onTierChange(v as BossLootTier)}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                            {TIER_ORDER.map(t => (
                                <SelectItem key={t} value={t}>
                                    {BOSS_LOOT_TIER_LABELS[t]}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                </div>
                <div className="w-28">
                    <Label className="text-xs">Lv min</Label>
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
                    <Label className="text-xs">Lv max</Label>
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
