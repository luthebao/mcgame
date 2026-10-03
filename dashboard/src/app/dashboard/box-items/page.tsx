"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { useRouter } from "next/navigation"
import { RefreshCcw } from "lucide-react"

import { Button } from "@/components/ui/button"
import { getErrorMessage } from "@/services/api"
import {
    type BoxItemSearchResult,
    boxItemService,
} from "@/services/box-item.service"

import { BoxItemFilters } from "./_components/box-item-filters"
import { BoxItemTable } from "./_components/box-item-table"
import { DEFAULT_BOX_ITEM_QUERY, type BoxItemQueryState } from "./_lib/shared"

export default function BoxItemsPage() {
    const router = useRouter()
    const [query, setQuery] = useState<BoxItemQueryState>(() => ({
        ...DEFAULT_BOX_ITEM_QUERY,
    }))
    const [result, setResult] = useState<BoxItemSearchResult | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [searchDraft, setSearchDraft] = useState("")

    const queryRef = useRef<BoxItemQueryState>({ ...DEFAULT_BOX_ITEM_QUERY })
    const requestRef = useRef(0)

    const commitQuery = useCallback((nextQuery: BoxItemQueryState) => {
        queryRef.current = nextQuery
        setQuery(nextQuery)
    }, [])

    const runSearch = useCallback(
        async (queryInput: BoxItemQueryState, resetPage = false) => {
            let currentQuery = queryInput
            if (resetPage && queryInput.page !== 1) {
                currentQuery = { ...queryInput, page: 1 }
                commitQuery(currentQuery)
            }

            const requestID = ++requestRef.current
            setLoading(true)

            try {
                const searchResult = await boxItemService.search({
                    search: currentQuery.search,
                    templateType: currentQuery.templateType,
                    sortBy: currentQuery.sortBy,
                    sortDir: currentQuery.sortDir,
                    sourceFilter: currentQuery.sourceFilter,
                    shopId:
                        currentQuery.sourceFilter === "shop"
                            ? currentQuery.shopId
                            : null,
                    page: currentQuery.page,
                    pageSize: currentQuery.pageSize,
                })

                if (requestID !== requestRef.current) return

                setResult(searchResult)
                setError(searchResult.lastError || "")

                if (
                    searchResult.totalPages > 0 &&
                    currentQuery.page > searchResult.totalPages
                ) {
                    const clippedQuery = {
                        ...currentQuery,
                        page: searchResult.totalPages,
                    }
                    commitQuery(clippedQuery)
                }
            } catch (err) {
                if (requestID !== requestRef.current) return
                setError(getErrorMessage(err))
                setResult(null)
            } finally {
                if (requestID === requestRef.current) setLoading(false)
            }
        },
        [commitQuery]
    )

    const updateQuery = useCallback(
        (updates: Partial<BoxItemQueryState>, resetPage = true) => {
            const current = queryRef.current
            const nextQuery: BoxItemQueryState = {
                ...current,
                ...updates,
                page: resetPage ? 1 : updates.page || current.page,
            }
            commitQuery(nextQuery)
            void runSearch(nextQuery)
        },
        [commitQuery, runSearch]
    )

    const commitDraftFilters = useCallback(
        (searchText: string) => {
            const nextSearch = String(searchText || "").trim()
            if (nextSearch === queryRef.current.search) return
            updateQuery({ search: nextSearch })
        },
        [updateQuery]
    )

    const clearFilters = useCallback(() => {
        const nextQuery = {
            ...DEFAULT_BOX_ITEM_QUERY,
            pageSize: queryRef.current.pageSize,
        }
        commitQuery(nextQuery)
        setSearchDraft("")
        void runSearch(nextQuery)
    }, [commitQuery, runSearch])

    const refreshData = useCallback(() => {
        void runSearch(queryRef.current)
    }, [runSearch])

    useEffect(() => {
        const timer = window.setTimeout(() => {
            commitDraftFilters(searchDraft)
        }, 400)
        return () => window.clearTimeout(timer)
    }, [searchDraft, commitDraftFilters])

    useEffect(() => {
        void runSearch(queryRef.current, true)
    }, [runSearch])

    const totalPages = Math.max(result?.totalPages || 1, 1)
    const currentPage = result?.totalPages === 0 ? 1 : result?.page || 1

    const summaryText = useMemo(() => {
        if (!result)
            return loading ? "Đang tải dữ liệu..." : "Không có dữ liệu."
        return `Khớp ${result.total} vật phẩm có thể sử dụng | Trang ${result.page}/${Math.max(result.totalPages, 1)}`
    }, [result, loading])

    const rowStart =
        result && result.total > 0 ? (currentPage - 1) * query.pageSize + 1 : 0
    const rowEnd = result
        ? Math.min(currentPage * query.pageSize, result.total)
        : 0

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">
                        Quản lý vật phẩm hộp
                    </h2>
                    <p className="text-sm text-muted-foreground">
                        Chỉ hiển thị các vật phẩm có thể sử dụng. Chọn một dòng
                        để mở trang quản lý phần thưởng riêng cho vật phẩm đó.
                    </p>
                </div>
                <Button type="button" onClick={refreshData} disabled={loading}>
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Tải lại
                </Button>
            </div>

            <BoxItemFilters
                query={query}
                loading={loading}
                searchDraft={searchDraft}
                summaryText={summaryText}
                error={error}
                onSearchDraftChange={setSearchDraft}
                onTemplateTypeChange={value =>
                    updateQuery({ templateType: value })
                }
                onSortDirChange={value => updateQuery({ sortDir: value })}
                onPageSizeChange={value => updateQuery({ pageSize: value })}
                onClearFilters={clearFilters}
            />

            <BoxItemTable
                result={result}
                loading={loading}
                rowStart={rowStart}
                rowEnd={rowEnd}
                currentPage={currentPage}
                totalPages={totalPages}
                onRowClick={item =>
                    router.push(`/dashboard/box-items/${item.itemId}`)
                }
                onPageChange={page => updateQuery({ page }, false)}
            />
        </section>
    )
}
