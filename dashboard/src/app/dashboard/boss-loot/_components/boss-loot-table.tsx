"use client"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"

import type { BossLootListResult, BossLootRow } from "@/services/boss-loot.service"

type Props = {
    result: BossLootListResult | null
    loading: boolean
    rowStart: number
    rowEnd: number
    currentPage: number
    totalPages: number
    onRowClick: (row: BossLootRow) => void
    onPageChange: (page: number) => void
}

function kindBadgeClass(kind: string) {
    switch (kind) {
        case "daily_only":
            return "bg-amber-500/15 text-amber-700"
        case "flying":
            return "bg-sky-500/15 text-sky-700"
        case "ground":
            return "bg-emerald-500/15 text-emerald-700"
        default:
            return "bg-muted text-muted-foreground"
    }
}

function tierBadgeClass(tier: string) {
    switch (tier) {
        case "mythic":
            return "bg-purple-500/15 text-purple-700"
        case "special":
            return "bg-rose-500/15 text-rose-700"
        case "normal":
            return "bg-slate-500/15 text-slate-700"
        default:
            return "bg-muted text-muted-foreground"
    }
}

export function BossLootTable({
    result,
    loading,
    rowStart,
    rowEnd,
    currentPage,
    totalPages,
    onRowClick,
    onPageChange,
}: Props) {
    const rows = result?.rows || []

    return (
        <div className="flex min-h-0 flex-1 flex-col overflow-hidden rounded-lg border bg-card">
            <div className="grid grid-cols-[90px_1fr_120px_110px_90px_120px_90px] gap-3 border-b px-4 py-2 text-xs font-semibold uppercase text-muted-foreground">
                <span>NID</span>
                <span>Tên</span>
                <span>Loại</span>
                <span>Tier</span>
                <span>Cấp độ</span>
                <span>Map / Daily</span>
                <span>Drops</span>
            </div>
            <div className="flex-1 overflow-auto">
                {loading && rows.length === 0 ? (
                    <div className="p-6 text-center text-sm text-muted-foreground">
                        Đang tải...
                    </div>
                ) : rows.length === 0 ? (
                    <div className="p-6 text-center text-sm text-muted-foreground">
                        Không có dữ liệu.
                    </div>
                ) : (
                    rows.map(row => (
                        <button
                            key={row.nid}
                            type="button"
                            onClick={() => onRowClick(row)}
                            className="grid w-full grid-cols-[90px_1fr_120px_110px_90px_120px_90px] gap-3 border-b px-4 py-2 text-left text-sm hover:bg-accent"
                        >
                            <span className="font-mono">{row.nid}</span>
                            <span>{row.name}</span>
                            <span>
                                <Badge className={kindBadgeClass(row.kind)}>
                                    {row.kind}
                                </Badge>
                            </span>
                            <span>
                                <Badge className={tierBadgeClass(row.tier)}>
                                    {row.tier}
                                </Badge>
                            </span>
                            <span>{row.level || "-"}</span>
                            <span className="text-xs text-muted-foreground">
                                map {row.mapId}
                                {row.dailyBossId !== null
                                    ? ` · daily ${row.dailyBossId}`
                                    : ""}
                            </span>
                            <span>{row.dropCount}</span>
                        </button>
                    ))
                )}
            </div>
            <div className="flex items-center justify-between border-t px-4 py-2 text-xs text-muted-foreground">
                <span>
                    {result && result.total > 0
                        ? `${rowStart}–${rowEnd} / ${result.total}`
                        : "0 / 0"}
                </span>
                <div className="flex items-center gap-2">
                    <Button
                        type="button"
                        variant="outline"
                        size="sm"
                        onClick={() => onPageChange(Math.max(1, currentPage - 1))}
                        disabled={loading || currentPage <= 1}
                    >
                        Trước
                    </Button>
                    <span>
                        Trang {currentPage} / {Math.max(totalPages, 1)}
                    </span>
                    <Button
                        type="button"
                        variant="outline"
                        size="sm"
                        onClick={() =>
                            onPageChange(Math.min(totalPages || 1, currentPage + 1))
                        }
                        disabled={loading || currentPage >= totalPages}
                    >
                        Sau
                    </Button>
                </div>
            </div>
        </div>
    )
}
