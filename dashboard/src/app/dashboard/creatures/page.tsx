"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Search, RefreshCcw, ChevronLeft, ChevronRight } from "lucide-react"

import {
    creatureService,
    type CreatureImageFilter,
    type CreatureSearchResult,
} from "@/services/creature.service"
import { getErrorMessage } from "@/services/api"

type CreatureQueryState = {
    search: string
    imageFilter: CreatureImageFilter
    page: number
    pageSize: number
}

const DEFAULT_CREATURE_QUERY: CreatureQueryState = {
    search: "",
    imageFilter: "all",
    page: 1,
    pageSize: 60,
}

const PAGE_SIZE_OPTIONS = [30, 60, 100, 200]
const CROPPED_IMAGE_CACHE = new Map<string, string>()

function CreaturePreviewImage({ src, alt }: { src: string; alt: string }) {
    const [displaySrc, setDisplaySrc] = useState(src)

    useEffect(() => {
        let disposed = false
        if (!src) {
            setDisplaySrc("")
            return () => {
                disposed = true
            }
        }

        const cached = CROPPED_IMAGE_CACHE.get(src)
        if (cached) {
            setDisplaySrc(cached)
            return () => {
                disposed = true
            }
        }

        setDisplaySrc(src)

        const image = new window.Image()
        image.decoding = "async"
        image.onload = () => {
            try {
                const width = image.naturalWidth || image.width
                const height = image.naturalHeight || image.height
                if (width <= 0 || height <= 0) {
                    CROPPED_IMAGE_CACHE.set(src, src)
                    if (!disposed) setDisplaySrc(src)
                    return
                }

                const canvas = document.createElement("canvas")
                canvas.width = width
                canvas.height = height

                const ctx = canvas.getContext("2d", {
                    willReadFrequently: true,
                })
                if (!ctx) {
                    CROPPED_IMAGE_CACHE.set(src, src)
                    if (!disposed) setDisplaySrc(src)
                    return
                }

                ctx.drawImage(image, 0, 0)
                const { data } = ctx.getImageData(0, 0, width, height)

                let minX = width
                let minY = height
                let maxX = -1
                let maxY = -1

                for (let y = 0; y < height; y += 1) {
                    for (let x = 0; x < width; x += 1) {
                        const alpha = data[(y * width + x) * 4 + 3]
                        if (alpha > 10) {
                            if (x < minX) minX = x
                            if (y < minY) minY = y
                            if (x > maxX) maxX = x
                            if (y > maxY) maxY = y
                        }
                    }
                }

                if (maxX < 0 || maxY < 0) {
                    CROPPED_IMAGE_CACHE.set(src, src)
                    if (!disposed) setDisplaySrc(src)
                    return
                }

                const pad = Math.max(
                    2,
                    Math.floor(Math.min(width, height) * 0.02)
                )
                minX = Math.max(0, minX - pad)
                minY = Math.max(0, minY - pad)
                maxX = Math.min(width - 1, maxX + pad)
                maxY = Math.min(height - 1, maxY + pad)

                const cropWidth = maxX - minX + 1
                const cropHeight = maxY - minY + 1

                const cropCanvas = document.createElement("canvas")
                cropCanvas.width = cropWidth
                cropCanvas.height = cropHeight
                const cropCtx = cropCanvas.getContext("2d")
                if (!cropCtx) {
                    CROPPED_IMAGE_CACHE.set(src, src)
                    if (!disposed) setDisplaySrc(src)
                    return
                }

                cropCtx.drawImage(
                    canvas,
                    minX,
                    minY,
                    cropWidth,
                    cropHeight,
                    0,
                    0,
                    cropWidth,
                    cropHeight
                )
                const croppedSrc = cropCanvas.toDataURL("image/png")

                CROPPED_IMAGE_CACHE.set(src, croppedSrc)
                if (!disposed) setDisplaySrc(croppedSrc)
            } catch {
                CROPPED_IMAGE_CACHE.set(src, src)
                if (!disposed) setDisplaySrc(src)
            }
        }

        image.onerror = () => {
            CROPPED_IMAGE_CACHE.set(src, src)
            if (!disposed) setDisplaySrc(src)
        }

        image.src = src

        return () => {
            disposed = true
        }
    }, [src])

    // eslint-disable-next-line @next/next/no-img-element
    return (
        <img
            src={displaySrc}
            alt={alt}
            className="h-[120px] w-[120px] rounded-md bg-background object-contain transition-transform duration-300 group-hover:scale-110"
            loading="lazy"
        />
    )
}

export default function CreaturesPage() {
    const [query, setQuery] = useState<CreatureQueryState>(() => ({
        ...DEFAULT_CREATURE_QUERY,
    }))
    const [result, setResult] = useState<CreatureSearchResult | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [searchDraft, setSearchDraft] = useState("")

    const queryRef = useRef<CreatureQueryState>({ ...DEFAULT_CREATURE_QUERY })
    const requestRef = useRef(0)

    const commitQuery = useCallback((nextQuery: CreatureQueryState) => {
        queryRef.current = nextQuery
        setQuery(nextQuery)
    }, [])

    const runSearch = useCallback(
        async (
            queryInput: CreatureQueryState,
            resetPage = false,
            forceRefresh = false
        ) => {
            let currentQuery = queryInput
            if (resetPage && queryInput.page !== 1) {
                currentQuery = { ...queryInput, page: 1 }
                commitQuery(currentQuery)
            }

            const requestID = ++requestRef.current
            setLoading(true)

            try {
                const searchResult = await creatureService.search({
                    search: currentQuery.search,
                    imageFilter: currentQuery.imageFilter,
                    page: currentQuery.page,
                    pageSize: currentQuery.pageSize,
                    refresh: forceRefresh ? 1 : undefined,
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
        (updates: Partial<CreatureQueryState>, resetPage = true) => {
            const current = queryRef.current
            const nextQuery: CreatureQueryState = {
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
            ...DEFAULT_CREATURE_QUERY,
            pageSize: queryRef.current.pageSize,
        }
        commitQuery(nextQuery)
        void runSearch(nextQuery)
    }, [commitQuery, runSearch])

    const refreshData = useCallback(() => {
        void runSearch(queryRef.current, false, true)
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

    const totalPages = Math.max(result?.totalPages || 1, 1)
    const currentPage = result?.totalPages === 0 ? 1 : result?.page || 1
    const rowStart =
        result && result.total > 0 ? (currentPage - 1) * query.pageSize + 1 : 0
    const rowEnd = result
        ? Math.min(currentPage * query.pageSize, result.total)
        : 0

    const summaryText = useMemo(() => {
        if (!result) {
            return loading
                ? "Loading creature data..."
                : "No creature data available."
        }
        return `Matched ${result.total} creature | Page ${result.page}/${Math.max(
            result.totalPages,
            1
        )} | Loaded ${result.mappingCount} mapping`
    }, [result, loading])

    const metaText = result
        ? `Source: ${result.sourceFile} | Image dir: ${result.imageDirectory} | Files: ${result.imageCount} | Last refresh: ${new Date(
              result.lastRefresh
          ).toLocaleString("vi-VN")}`
        : ""

    return (
        <section className="flex h-[calc(100vh-10rem)] min-h-[640px] flex-col gap-4 overflow-hidden">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h2 className="text-xl font-semibold">Creature Browser</h2>
                    <p className="text-sm text-muted-foreground">
                        Map creature names from monster_appr.json to image
                        assets.
                    </p>
                </div>
                <Button type="button" onClick={refreshData} disabled={loading}>
                    <RefreshCcw className="mr-2 h-4 w-4" />
                    Refresh Data
                </Button>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Filters</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-4 md:grid-cols-4">
                        <div className="md:col-span-2">
                            <div className="relative">
                                <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                <Input
                                    type="text"
                                    placeholder="Creature name or appr id..."
                                    autoComplete="off"
                                    value={searchDraft}
                                    onChange={event =>
                                        setSearchDraft(event.target.value)
                                    }
                                    className="pl-10"
                                />
                            </div>
                        </div>

                        <Select
                            value={query.imageFilter}
                            onValueChange={(value: CreatureImageFilter) =>
                                updateQuery({ imageFilter: value })
                            }
                            disabled={loading}
                        >
                            <SelectTrigger>
                                <SelectValue placeholder="Image" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">All</SelectItem>
                                <SelectItem value="with">
                                    Only with file
                                </SelectItem>
                                <SelectItem value="without">
                                    Only missing file
                                </SelectItem>
                            </SelectContent>
                        </Select>

                        <Select
                            value={String(query.pageSize)}
                            onValueChange={value =>
                                updateQuery({ pageSize: Number(value) })
                            }
                            disabled={loading}
                        >
                            <SelectTrigger>
                                <SelectValue placeholder="Page Size" />
                            </SelectTrigger>
                            <SelectContent>
                                {PAGE_SIZE_OPTIONS.map(size => (
                                    <SelectItem key={size} value={String(size)}>
                                        {size}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>

                    <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                        <div className="flex flex-col text-sm">
                            <span className={loading ? "opacity-70" : ""}>
                                {summaryText}
                            </span>
                            <span className="text-muted-foreground">
                                {metaText}
                            </span>
                            {error ? (
                                <span className="text-destructive">
                                    {error}
                                </span>
                            ) : null}
                        </div>

                        <Button
                            type="button"
                            variant="outline"
                            onClick={clearFilters}
                            disabled={loading}
                        >
                            Clear
                        </Button>
                    </div>
                </CardContent>
            </Card>

            <Card className="flex min-h-0 flex-1 flex-col">
                <CardContent className="flex min-h-0 flex-1 flex-col pt-4">
                    <div className="grid min-h-0 flex-1 gap-3 overflow-auto rounded-md p-4 [grid-template-columns:repeat(auto-fill,minmax(180px,1fr))]">
                        {!result || result.items.length === 0 ? (
                            <div className="col-span-full rounded-md border border-dashed p-6 text-center text-sm text-muted-foreground">
                                No matching creature found.
                            </div>
                        ) : (
                            result.items.map(item => (
                                <Card
                                    key={`${item.apprId}-${item.name}`}
                                    className="group min-h-[196px] border-0 shadow-none transition-all duration-200 hover:-translate-y-1 hover:shadow-lg hover:shadow-primary/10"
                                >
                                    <CardContent className="flex h-full w-full flex-col items-center justify-start gap-2 p-3 text-center">
                                        {item.imageDataUrl ? (
                                            <div className="flex h-[116px] w-full items-center justify-center">
                                                <CreaturePreviewImage
                                                    src={item.imageDataUrl}
                                                    alt={`creature-${item.apprId}`}
                                                />
                                            </div>
                                        ) : (
                                            <div className="flex h-[96px] w-[96px] items-center justify-center rounded-md border border-dashed bg-muted/20 text-xs text-muted-foreground transition-colors duration-200 group-hover:bg-muted/30">
                                                No image
                                            </div>
                                        )}

                                        <div className="w-full space-y-0.5 pt-1">
                                            <p className="line-clamp-2 text-sm font-semibold leading-tight text-foreground transition-colors duration-200 group-hover:text-primary">
                                                {item.name}
                                            </p>
                                            <p className="font-mono text-xs text-muted-foreground">
                                                ID: {item.apprId}
                                            </p>
                                        </div>
                                    </CardContent>
                                </Card>
                            ))
                        )}
                    </div>

                    <div className="mt-4 flex items-center justify-between">
                        <p className="text-sm text-muted-foreground">
                            Showing {rowStart} - {rowEnd} of{" "}
                            {result?.total || 0} creatures
                        </p>

                        <div className="flex items-center gap-2">
                            <Button
                                type="button"
                                variant="outline"
                                size="icon"
                                onClick={() =>
                                    updateQuery(
                                        { page: Math.max(currentPage - 1, 1) },
                                        false
                                    )
                                }
                                disabled={loading || currentPage <= 1}
                            >
                                <ChevronLeft className="h-4 w-4" />
                            </Button>

                            <span className="text-sm text-muted-foreground">
                                Page {currentPage}/{totalPages}
                            </span>

                            <Button
                                type="button"
                                variant="outline"
                                size="icon"
                                onClick={() =>
                                    updateQuery(
                                        {
                                            page: Math.min(
                                                currentPage + 1,
                                                totalPages
                                            ),
                                        },
                                        false
                                    )
                                }
                                disabled={loading || currentPage >= totalPages}
                            >
                                <ChevronRight className="h-4 w-4" />
                            </Button>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </section>
    )
}
