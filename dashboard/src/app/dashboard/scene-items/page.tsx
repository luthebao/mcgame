"use client"

import { useCallback, useEffect, useRef, useState } from "react"
import { RefreshCcw } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import {
    Pagination,
    PaginationContent,
    PaginationEllipsis,
    PaginationItem,
    PaginationLink,
    PaginationNext,
    PaginationPrevious,
} from "@/components/ui/pagination"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { getErrorMessage } from "@/services/api"
import {
    type SceneItemRow,
    type SceneItemSearchResult,
    sceneItemService,
} from "@/services/scene-item.service"

import { EditPositionDialog } from "./_components/edit-position-dialog"

const PAGE_SIZE_OPTIONS = [20, 30, 50, 100]

function buildPageNumbers(
    current: number,
    total: number
): (number | "ellipsis")[] {
    if (total <= 7) return Array.from({ length: total }, (_, i) => i + 1)
    const pages: (number | "ellipsis")[] = [1]
    if (current > 3) pages.push("ellipsis")
    for (
        let i = Math.max(2, current - 1);
        i <= Math.min(total - 1, current + 1);
        i++
    )
        pages.push(i)
    if (current < total - 2) pages.push("ellipsis")
    pages.push(total)
    return pages
}

export default function SceneItemsPage() {
    const [result, setResult] = useState<SceneItemSearchResult | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [searchDraft, setSearchDraft] = useState("")
    const [mapFilter, setMapFilter] = useState("")
    const [tidFilter, setTidFilter] = useState("38")
    const [page, setPage] = useState(1)
    const [pageSize, setPageSize] = useState(30)
    const [selectedItem, setSelectedItem] = useState<SceneItemRow | null>(null)

    const requestRef = useRef(0)
    const searchRef = useRef("")
    const mapRef = useRef("")
    const tidRef = useRef("38")

    const fetchData = useCallback(
        async (opts: {
            search: string
            mapId: string
            tid: string
            page: number
            pageSize: number
        }) => {
            const requestID = ++requestRef.current
            setLoading(true)
            try {
                const params: Record<string, string | number> = {
                    page: opts.page,
                    pageSize: opts.pageSize,
                }
                if (opts.search) params.search = opts.search
                const mapId = Number(opts.mapId)
                if (mapId > 0) params.mapId = mapId
                const tid = Number(opts.tid)
                if (tid > 0) params.tid = tid

                const res = await sceneItemService.search(params as any)
                if (requestID !== requestRef.current) return
                setResult(res)
                setError("")
            } catch (err) {
                if (requestID !== requestRef.current) return
                setError(getErrorMessage(err))
                setResult(null)
            } finally {
                if (requestID === requestRef.current) setLoading(false)
            }
        },
        []
    )

    const doSearch = useCallback(() => {
        const s = searchDraft.trim()
        const m = mapFilter.trim()
        const t = tidFilter.trim()
        searchRef.current = s
        mapRef.current = m
        tidRef.current = t
        setPage(1)
        void fetchData({ search: s, mapId: m, tid: t, page: 1, pageSize })
    }, [searchDraft, mapFilter, tidFilter, pageSize, fetchData])

    const changePage = useCallback(
        (p: number) => {
            setPage(p)
            void fetchData({
                search: searchRef.current,
                mapId: mapRef.current,
                tid: tidRef.current,
                page: p,
                pageSize,
            })
        },
        [pageSize, fetchData]
    )

    const changePageSize = useCallback(
        (size: number) => {
            setPageSize(size)
            setPage(1)
            void fetchData({
                search: searchRef.current,
                mapId: mapRef.current,
                tid: tidRef.current,
                page: 1,
                pageSize: size,
            })
        },
        [fetchData]
    )

    const refresh = useCallback(() => {
        void fetchData({
            search: searchRef.current,
            mapId: mapRef.current,
            tid: tidRef.current,
            page,
            pageSize,
        })
    }, [page, pageSize, fetchData])

    useEffect(() => {
        void fetchData({
            search: "",
            mapId: "",
            tid: "38",
            page: 1,
            pageSize: 30,
        })
    }, [fetchData])

    useEffect(() => {
        const timer = window.setTimeout(() => doSearch(), 400)
        return () => window.clearTimeout(timer)
    }, [searchDraft, mapFilter, tidFilter, doSearch])

    const totalPages = result?.totalPages || 0
    const currentPage = result?.page || 1
    const total = result?.total || 0
    const rowStart = total > 0 ? (currentPage - 1) * pageSize + 1 : 0
    const rowEnd = total > 0 ? Math.min(currentPage * pageSize, total) : 0

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">
                        Quản lý Scene Items
                    </h2>
                    <p className="text-sm text-muted-foreground">
                        Cập nhật vị trí các vật phẩm cảnh (cổng, NPC, vật tương
                        tác) trên bản đồ.
                    </p>
                </div>
                <Button type="button" onClick={refresh} disabled={loading}>
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Tải lại
                </Button>
            </div>

            {error ? <p className="text-sm text-destructive">{error}</p> : null}

            <Card className="flex min-h-0 flex-1 flex-col">
                <CardContent className="flex min-h-0 flex-1 flex-col pt-4">
                    <div className="flex min-h-0 flex-1 overflow-auto rounded-md border">
                        <Table>
                            <TableHeader className="sticky top-0 z-10 bg-background">
                                <TableRow>
                                    <TableHead className="w-[70px]">
                                        ID
                                    </TableHead>
                                    <TableHead className="w-[180px]">
                                        Phù từ
                                    </TableHead>
                                    <TableHead>Phù tới</TableHead>
                                    <TableHead className="w-[80px]">
                                        Template
                                    </TableHead>
                                    <TableHead className="w-[80px]">
                                        Pos X
                                    </TableHead>
                                    <TableHead className="w-[80px]">
                                        Pos Y
                                    </TableHead>
                                    <TableHead className="w-[80px]">
                                        Dir
                                    </TableHead>
                                </TableRow>
                                <TableRow className="bg-muted/30">
                                    <TableHead className="py-1">
                                        <Input
                                            placeholder="ID"
                                            value={searchDraft}
                                            onChange={e =>
                                                setSearchDraft(e.target.value)
                                            }
                                            className="h-7 text-xs"
                                        />
                                    </TableHead>
                                    <TableHead className="py-1">
                                        <Input
                                            placeholder="Map ID"
                                            value={mapFilter}
                                            onChange={e =>
                                                setMapFilter(e.target.value)
                                            }
                                            className="h-7 text-xs"
                                            type="number"
                                        />
                                    </TableHead>
                                    <TableHead className="py-1" />
                                    <TableHead className="py-1">
                                        <Select
                                            value={tidFilter}
                                            onValueChange={setTidFilter}
                                        >
                                            <SelectTrigger className="h-7 text-xs">
                                                <SelectValue placeholder="TID" />
                                            </SelectTrigger>
                                            <SelectContent>
                                                <SelectItem value="0">
                                                    Tất cả
                                                </SelectItem>
                                                <SelectItem value="38">
                                                    38 - Cổng truyền
                                                </SelectItem>
                                                <SelectItem value="98">
                                                    98 - Quan tài
                                                </SelectItem>
                                                <SelectItem value="99">
                                                    99 - Cổng vào
                                                </SelectItem>
                                                <SelectItem value="100">
                                                    100 - Cổng ra
                                                </SelectItem>
                                                <SelectItem value="101">
                                                    101 - Hốc cây
                                                </SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </TableHead>
                                    <TableHead className="py-1" />
                                    <TableHead className="py-1" />
                                    <TableHead className="py-1">
                                        <Select
                                            value={String(pageSize)}
                                            onValueChange={v =>
                                                changePageSize(Number(v))
                                            }
                                        >
                                            <SelectTrigger className="h-7 text-xs">
                                                <SelectValue />
                                            </SelectTrigger>
                                            <SelectContent>
                                                {PAGE_SIZE_OPTIONS.map(size => (
                                                    <SelectItem
                                                        key={size}
                                                        value={String(size)}
                                                    >
                                                        {size}
                                                    </SelectItem>
                                                ))}
                                            </SelectContent>
                                        </Select>
                                    </TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {!result || result.items.length === 0 ? (
                                    <TableRow>
                                        <TableCell
                                            colSpan={7}
                                            className="text-center text-muted-foreground py-8"
                                        >
                                            {loading
                                                ? "Đang tải..."
                                                : "Không tìm thấy scene item nào."}
                                        </TableCell>
                                    </TableRow>
                                ) : (
                                    result.items.map(item => (
                                        <TableRow
                                            key={item.id}
                                            className="cursor-pointer hover:bg-muted/50"
                                            onClick={() =>
                                                setSelectedItem(item)
                                            }
                                        >
                                            <TableCell className="font-mono text-xs">
                                                {item.id}
                                            </TableCell>
                                            <TableCell className="font-medium space-x-1">
                                                {item.mapName ? (
                                                    <span>{item.mapName}</span>
                                                ) : null}
                                                <span className="font-mono text-xs">
                                                    ({item.mapId})
                                                </span>
                                            </TableCell>
                                            <TableCell className="font-medium">
                                                {item.name}
                                            </TableCell>
                                            <TableCell className="font-mono text-xs">
                                                {item.tid}
                                            </TableCell>
                                            <TableCell className="font-mono text-xs">
                                                {item.posX}
                                            </TableCell>
                                            <TableCell className="font-mono text-xs">
                                                {item.posY}
                                            </TableCell>
                                            <TableCell className="font-mono text-xs">
                                                {item.posDir}
                                            </TableCell>
                                        </TableRow>
                                    ))
                                )}
                            </TableBody>
                        </Table>
                    </div>

                    <div className="mt-4 flex items-center justify-between">
                        <p className="text-sm text-muted-foreground">
                            Hiển thị {rowStart} - {rowEnd} / {total} scene items
                        </p>

                        {totalPages > 1 && (
                            <Pagination>
                                <PaginationContent>
                                    <PaginationItem>
                                        <PaginationPrevious
                                            onClick={() =>
                                                changePage(
                                                    Math.max(currentPage - 1, 1)
                                                )
                                            }
                                            className={
                                                loading || currentPage <= 1
                                                    ? "pointer-events-none opacity-50"
                                                    : ""
                                            }
                                        />
                                    </PaginationItem>
                                    {buildPageNumbers(
                                        currentPage,
                                        totalPages
                                    ).map((p, idx) =>
                                        p === "ellipsis" ? (
                                            <PaginationItem key={`e-${idx}`}>
                                                <PaginationEllipsis />
                                            </PaginationItem>
                                        ) : (
                                            <PaginationItem key={p}>
                                                <PaginationLink
                                                    isActive={p === currentPage}
                                                    onClick={() =>
                                                        changePage(p)
                                                    }
                                                    disabled={loading}
                                                >
                                                    {p}
                                                </PaginationLink>
                                            </PaginationItem>
                                        )
                                    )}
                                    <PaginationItem>
                                        <PaginationNext
                                            onClick={() =>
                                                changePage(
                                                    Math.min(
                                                        currentPage + 1,
                                                        totalPages
                                                    )
                                                )
                                            }
                                            className={
                                                loading ||
                                                currentPage >= totalPages
                                                    ? "pointer-events-none opacity-50"
                                                    : ""
                                            }
                                        />
                                    </PaginationItem>
                                </PaginationContent>
                            </Pagination>
                        )}
                    </div>
                </CardContent>
            </Card>

            <EditPositionDialog
                item={selectedItem}
                open={!!selectedItem}
                onOpenChange={open => {
                    if (!open) setSelectedItem(null)
                }}
                onSaved={refresh}
            />
        </section>
    )
}
