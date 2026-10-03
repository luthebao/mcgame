"use client"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"

import {
    LOOT_ROLE_LABELS,
    type LootRole,
} from "../_lib/shared"
import type { LootListResult, LootRow } from "@/services/loot.service"

type Props = {
    result: LootListResult | null
    loading: boolean
    rowStart: number
    rowEnd: number
    currentPage: number
    totalPages: number
    onRowClick: (row: LootRow) => void
    onPageChange: (page: number) => void
}

function roleBadgeClass(role: string) {
    switch (role) {
        case "map-boss":
            return "bg-red-500/15 text-red-700"
        case "npc":
            return "bg-blue-500/15 text-blue-700"
        case "normal":
            return "bg-green-500/15 text-green-700"
        default:
            return "bg-muted text-muted-foreground"
    }
}

export function LootTable({
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
            <div className="grid grid-cols-[80px_1fr_140px_120px_120px_80px] gap-3 border-b px-4 py-2 text-xs font-semibold uppercase text-muted-foreground">
                <span>CID</span>
                <span>Tên</span>
                <span>Vai trò</span>
                <span>Cấp độ</span>
                <span>Số lượng rơi</span>
                <span>Bản đồ</span>
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
                            key={row.cid}
                            type="button"
                            onClick={() => onRowClick(row)}
                            className="grid w-full grid-cols-[80px_1fr_140px_120px_120px_80px] gap-3 border-b px-4 py-2 text-left text-sm hover:bg-accent"
                        >
                            <span className="font-mono">{row.cid}</span>
                            <span>{row.name}</span>
                            <span>
                                <Badge className={roleBadgeClass(row.role)}>
                                    {LOOT_ROLE_LABELS[row.role as LootRole] ||
                                        row.role}
                                </Badge>
                            </span>
                            <span>{row.level || "-"}</span>
                            <span>{row.dropCount}</span>
                            <span className="text-xs text-muted-foreground">
                                {row.mapIds.slice(0, 3).join(", ")}
                                {row.mapIds.length > 3 ? "…" : ""}
                            </span>
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
