"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { RefreshCcw } from "lucide-react"

import { Button } from "@/components/ui/button"
import { getErrorMessage } from "@/services/api"
import {
    type ItemBrowserRow,
    type ItemSearchResult,
    itemService,
} from "@/services/item.service"

import { ItemBrowserFilters } from "./_components/item-browser-filters"
import { ItemBrowserTable } from "./_components/item-browser-table"
import { ItemDetailDialog } from "./_components/item-detail-dialog"
import {
    DEFAULT_ITEMS_QUERY,
    type ItemQueryState,
} from "./_lib/shared"

export default function ItemsPage() {
    const [query, setQuery] = useState<ItemQueryState>(() => ({
        ...DEFAULT_ITEMS_QUERY,
    }))
    const [result, setResult] = useState<ItemSearchResult | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [searchDraft, setSearchDraft] = useState("")
    const [detailItem, setDetailItem] = useState<ItemBrowserRow | null>(null)
    const [detailOpen, setDetailOpen] = useState(false)

    const queryRef = useRef<ItemQueryState>({ ...DEFAULT_ITEMS_QUERY })
    const requestRef = useRef(0)

    const commitQuery = useCallback((nextQuery: ItemQueryState) => {
        queryRef.current = nextQuery
        setQuery(nextQuery)
    }, [])

    const runSearch = useCallback(
        async (queryInput: ItemQueryState, resetPage = false) => {
            let currentQuery = queryInput
            if (resetPage && queryInput.page !== 1) {
                currentQuery = { ...queryInput, page: 1 }
                commitQuery(currentQuery)
            }

            const requestID = ++requestRef.current
            setLoading(true)

            try {
                const searchResult = await itemService.search({
                    search: currentQuery.search,
                    kind: currentQuery.kind,
                    templateType: currentQuery.templateType,
                    sortBy: currentQuery.sortBy,
                    sortDir: currentQuery.sortDir,
                    page: currentQuery.page,
                    pageSize: currentQuery.pageSize,
                })

                if (requestID !== requestRef.current) {
                    return
                }

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
                    await runSearch(clippedQuery)
                }
            } catch (err) {
                if (requestID !== requestRef.current) {
                    return
                }

                setError(getErrorMessage(err))
                setResult(null)
            } finally {
                if (requestID === requestRef.current) {
                    setLoading(false)
                }
            }
        },
        [commitQuery]
    )

    const updateQuery = useCallback(
        (updates: Partial<ItemQueryState>, resetPage = true) => {
            const current = queryRef.current
            const nextQuery: ItemQueryState = {
                ...current,
                ...updates,
                page: resetPage ? 1 : updates.page || current.page,
            }

            commitQuery(nextQuery)
            void runSearch(nextQuery)
        },
        [commitQuery, runSearch]
    )

    const commitSearch = useCallback(
        (text: string) => {
            const nextSearch = String(text || "").trim()
            if (nextSearch === queryRef.current.search) {
                return
            }
            updateQuery({ search: nextSearch })
        },
        [updateQuery]
    )

    const clearFilters = useCallback(() => {
        const nextQuery = {
            ...DEFAULT_ITEMS_QUERY,
            pageSize: queryRef.current.pageSize,
        }
        commitQuery(nextQuery)
        void runSearch(nextQuery)
    }, [commitQuery, runSearch])

    const refreshData = useCallback(() => {
        void runSearch(queryRef.current)
    }, [runSearch])

    useEffect(() => {
        const timer = window.setTimeout(() => {
            commitSearch(searchDraft)
        }, 400)

        return () => {
            window.clearTimeout(timer)
        }
    }, [searchDraft, commitSearch])

    useEffect(() => {
        void runSearch(queryRef.current, true)
    }, [runSearch])

    const itemTotalPages = Math.max(result?.totalPages || 1, 1)
    const itemCurrentPage = result?.totalPages === 0 ? 1 : result?.page || 1

    const itemSummaryText = useMemo(() => {
        if (!result) {
            return loading
                ? "Đang tải dữ liệu vật phẩm..."
                : "Không có dữ liệu vật phẩm."
        }

        return `Tìm thấy ${result.total} vật phẩm | Trang ${result.page}/${Math.max(result.totalPages, 1)} | Đã tải ${result.itemCount} mẫu vật phẩm`
    }, [result, loading])

    const itemMetaText = result
        ? `File icon: ${result.iconCount} | Thư mục icon: ${result.iconDirectory} | Cập nhật lúc: ${new Date(result.lastRefresh).toLocaleString("vi-VN")}`
        : ""

    const rowStart =
        result && result.total > 0
            ? (itemCurrentPage - 1) * query.pageSize + 1
            : 0
    const rowEnd = result
        ? Math.min(itemCurrentPage * query.pageSize, result.total)
        : 0

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">
                        Trình duyệt vật phẩm
                    </h2>
                    <p className="text-sm text-muted-foreground">
                        Tìm mẫu vật phẩm và kiểm tra icon.
                    </p>
                </div>
                <Button type="button" onClick={refreshData} disabled={loading}>
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Tải lại dữ liệu
                </Button>
            </div>

            <ItemBrowserFilters
                query={query}
                loading={loading}
                searchDraft={searchDraft}
                itemSummaryText={itemSummaryText}
                itemMetaText={itemMetaText}
                error={error}
                onSearchDraftChange={setSearchDraft}
                onKindChange={value => updateQuery({ kind: value })}
                onTemplateTypeChange={value => updateQuery({ templateType: value })}
                onSortByChange={value => updateQuery({ sortBy: value })}
                onSortDirChange={value => updateQuery({ sortDir: value })}
                onPageSizeChange={value => updateQuery({ pageSize: value })}
                onClearFilters={clearFilters}
            />

            <ItemDetailDialog
                open={detailOpen}
                onOpenChange={setDetailOpen}
                item={detailItem}
            />

            <ItemBrowserTable
                result={result}
                loading={loading}
                rowStart={rowStart}
                rowEnd={rowEnd}
                itemCurrentPage={itemCurrentPage}
                itemTotalPages={itemTotalPages}
                onRowClick={row => {
                    setDetailItem(row)
                    setDetailOpen(true)
                }}
                onPreviousPage={() =>
                    updateQuery(
                        { page: Math.max(itemCurrentPage - 1, 1) },
                        false
                    )
                }
                onNextPage={() =>
                    updateQuery(
                        { page: Math.min(itemCurrentPage + 1, itemTotalPages) },
                        false
                    )
                }
            />
        </section>
    )
}
