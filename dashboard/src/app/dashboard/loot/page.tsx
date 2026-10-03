"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { useRouter } from "next/navigation"
import { RefreshCcw } from "lucide-react"

import { Button } from "@/components/ui/button"
import { getErrorMessage } from "@/services/api"
import { lootService, type LootListResult } from "@/services/loot.service"

import { LootFilters } from "./_components/loot-filters"
import { LootTable } from "./_components/loot-table"
import {
    DEFAULT_LOOT_QUERY,
    type LootQueryState,
    type LootRole,
} from "./_lib/shared"

export default function LootPage() {
    const router = useRouter()
    const [query, setQuery] = useState<LootQueryState>(() => ({ ...DEFAULT_LOOT_QUERY }))
    const [result, setResult] = useState<LootListResult | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [searchDraft, setSearchDraft] = useState("")

    const queryRef = useRef<LootQueryState>({ ...DEFAULT_LOOT_QUERY })
    const requestRef = useRef(0)

    const commitQuery = useCallback((next: LootQueryState) => {
        queryRef.current = next
        setQuery(next)
    }, [])

    const runSearch = useCallback(async (q: LootQueryState, resetPage = false) => {
        let current = q
        if (resetPage && q.page !== 1) {
            current = { ...q, page: 1 }
            commitQuery(current)
        }
        const reqId = ++requestRef.current
        setLoading(true)
        try {
            const res = await lootService.list({
                search: current.search,
                role: current.role,
                mapId: current.mapId,
                minLevel: current.minLevel,
                maxLevel: current.maxLevel,
                sortBy: current.sortBy,
                sortDir: current.sortDir,
                page: current.page,
                pageSize: current.pageSize,
            })
            if (reqId !== requestRef.current) return
            setResult(res)
            setError(res.lastError || "")
        } catch (err) {
            if (reqId !== requestRef.current) return
            setError(getErrorMessage(err))
            setResult(null)
        } finally {
            if (reqId === requestRef.current) setLoading(false)
        }
    }, [commitQuery])

    const updateQuery = useCallback((updates: Partial<LootQueryState>, resetPage = true) => {
        const current = queryRef.current
        const next: LootQueryState = {
            ...current,
            ...updates,
            page: resetPage ? 1 : (updates.page || current.page),
        }
        commitQuery(next)
        void runSearch(next)
    }, [commitQuery, runSearch])

    const clearFilters = useCallback(() => {
        const next = { ...DEFAULT_LOOT_QUERY, pageSize: queryRef.current.pageSize }
        commitQuery(next)
        setSearchDraft("")
        void runSearch(next)
    }, [commitQuery, runSearch])

    useEffect(() => {
        const timer = window.setTimeout(() => {
            const trimmed = searchDraft.trim()
            if (trimmed !== queryRef.current.search) updateQuery({ search: trimmed })
        }, 400)
        return () => window.clearTimeout(timer)
    }, [searchDraft, updateQuery])

    useEffect(() => {
        void runSearch(queryRef.current, true)
    }, [runSearch])

    const totalPages = Math.max(result?.totalPages || 1, 1)
    const currentPage = result?.totalPages === 0 ? 1 : (result?.page || 1)
    const rowStart = result && result.total > 0 ? (currentPage - 1) * query.pageSize + 1 : 0
    const rowEnd = result ? Math.min(currentPage * query.pageSize, result.total) : 0

    const summaryText = useMemo(() => {
        if (!result) return loading ? "Đang tải dữ liệu..." : "Không có dữ liệu."
        return `${result.total} quái có cấu hình rơi | Trang ${result.page}/${Math.max(result.totalPages, 1)}`
    }, [result, loading])

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">Quản lý rớt vật phẩm</h2>
                    <p className="text-sm text-muted-foreground">
                        Cấu hình bảng rơi sau khi kết thúc trận đấu cho từng loại quái.
                    </p>
                </div>
                <Button type="button" onClick={() => void runSearch(queryRef.current)} disabled={loading}>
                    <RefreshCcw className="mr-2 h-4 w-4" /> Tải lại
                </Button>
            </div>

            <LootFilters
                query={query}
                searchDraft={searchDraft}
                summaryText={summaryText}
                error={error}
                loading={loading}
                onSearchDraftChange={setSearchDraft}
                onRoleChange={(role: LootRole) => updateQuery({ role })}
                onMinLevelChange={v => updateQuery({ minLevel: v })}
                onMaxLevelChange={v => updateQuery({ maxLevel: v })}
                onClearFilters={clearFilters}
            />

            <LootTable
                result={result}
                loading={loading}
                rowStart={rowStart}
                rowEnd={rowEnd}
                currentPage={currentPage}
                totalPages={totalPages}
                onRowClick={row => router.push(`/dashboard/loot/${row.cid}`)}
                onPageChange={page => updateQuery({ page }, false)}
            />
        </section>
    )
}
