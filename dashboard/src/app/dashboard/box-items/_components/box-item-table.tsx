"use client"

import Image from "next/image"

import { Badge } from "@/components/ui/badge"
import { Card, CardContent } from "@/components/ui/card"
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
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import { getKindLabel, getUseTypeLabel } from "@/app/dashboard/items/_lib/shared"
import type {
    BoxItemRow,
    BoxItemSearchResult,
} from "@/services/box-item.service"

type BoxItemTableProps = {
    result: BoxItemSearchResult | null
    loading: boolean
    rowStart: number
    rowEnd: number
    currentPage: number
    totalPages: number
    onRowClick: (item: BoxItemRow) => void
    onPageChange: (page: number) => void
}

function buildPageNumbers(
    current: number,
    total: number
): (number | "ellipsis")[] {
    if (total <= 7) {
        return Array.from({ length: total }, (_, i) => i + 1)
    }

    const pages: (number | "ellipsis")[] = [1]

    if (current > 3) pages.push("ellipsis")

    const rangeStart = Math.max(2, current - 1)
    const rangeEnd = Math.min(total - 1, current + 1)
    for (let i = rangeStart; i <= rangeEnd; i++) {
        pages.push(i)
    }

    if (current < total - 2) pages.push("ellipsis")

    pages.push(total)
    return pages
}

export function BoxItemTable({
    result,
    loading,
    rowStart,
    rowEnd,
    currentPage,
    totalPages,
    onRowClick,
    onPageChange,
}: BoxItemTableProps) {
    return (
        <Card className="flex min-h-0 flex-1 flex-col">
            <CardContent className="flex min-h-0 flex-1 flex-col pt-4">
                <div className="flex min-h-0 flex-1 overflow-auto rounded-md border">
                    <Table>
                        <TableHeader className="sticky top-0 z-10 bg-background">
                            <TableRow>
                                <TableHead className="w-[70px]">ID</TableHead>
                                <TableHead className="w-[80px]">Icon</TableHead>
                                <TableHead>Tên vật phẩm</TableHead>
                                <TableHead className="w-[170px]">
                                    Use type
                                </TableHead>
                                <TableHead className="w-[100px]">
                                    Template
                                </TableHead>
                                <TableHead className="w-[80px]">Kind</TableHead>
                                <TableHead className="w-[80px]">
                                    Level
                                </TableHead>
                                <TableHead className="w-[80px]">
                                    Stack
                                </TableHead>
                            </TableRow>
                        </TableHeader>

                        <TableBody>
                            {!result || result.items.length === 0 ? (
                                <TableRow>
                                    <TableCell
                                        className="text-center text-muted-foreground"
                                        colSpan={8}
                                    >
                                        Không tìm thấy vật phẩm hộp nào.
                                    </TableCell>
                                </TableRow>
                            ) : (
                                result.items.map(item => (
                                    <TableRow
                                        key={`${item.itemType}:${item.itemId}`}
                                        className="cursor-pointer hover:bg-muted/50"
                                        onClick={() => onRowClick(item)}
                                    >
                                        <TableCell className="font-mono text-xs">
                                            {item.itemId}
                                        </TableCell>

                                        <TableCell>
                                            {item.iconDataUrl ? (
                                                <Image
                                                    className="h-10 w-10 rounded object-cover"
                                                    src={item.iconDataUrl}
                                                    alt={`icon-${item.iconId}`}
                                                    width={40}
                                                    height={40}
                                                    unoptimized
                                                />
                                            ) : (
                                                <span className="text-xs text-muted-foreground">
                                                    -
                                                </span>
                                            )}
                                        </TableCell>

                                        <TableCell>
                                            <Tooltip>
                                                <TooltipTrigger asChild>
                                                    <div className="max-w-[280px] truncate font-medium">
                                                        {item.name}
                                                    </div>
                                                </TooltipTrigger>
                                                <TooltipContent>
                                                    {item.name}
                                                </TooltipContent>
                                            </Tooltip>
                                            <Tooltip>
                                                <TooltipTrigger asChild>
                                                    <div className="max-w-[320px] truncate text-xs text-muted-foreground">
                                                        {item.description ||
                                                            "-"}
                                                    </div>
                                                </TooltipTrigger>
                                                <TooltipContent className="max-w-md whitespace-pre-wrap">
                                                    {item.description || "-"}
                                                </TooltipContent>
                                            </Tooltip>
                                        </TableCell>

                                        <TableCell className="text-xs">
                                            <div className="flex flex-col gap-1">
                                                <Badge
                                                    variant="secondary"
                                                    className="w-fit"
                                                >
                                                    {getUseTypeLabel(
                                                        item.useType
                                                    )}
                                                </Badge>
                                                <span className="font-mono text-muted-foreground">
                                                    Use {item.useType}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell className="font-mono text-xs">
                                            Type {item.templateType}
                                        </TableCell>
                                        <TableCell className="text-xs">
                                            {getKindLabel(item.kind)}
                                        </TableCell>
                                        <TableCell className="font-mono text-xs">
                                            {item.requiredLevel}
                                        </TableCell>
                                        <TableCell className="font-mono text-xs">
                                            {item.maxStack}
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </div>

                <div className="mt-4 flex items-center justify-between">
                    <p className="text-sm text-muted-foreground">
                        Hiển thị {rowStart} - {rowEnd} / {result?.total || 0}{" "}
                        vật phẩm có thể sử dụng
                    </p>

                    {totalPages > 1 && (
                        <Pagination>
                            <PaginationContent>
                                <PaginationItem>
                                    <PaginationPrevious
                                        onClick={() =>
                                            onPageChange(
                                                Math.max(currentPage - 1, 1)
                                            )
                                        }
                                        aria-disabled={
                                            loading || currentPage <= 1
                                        }
                                        className={
                                            loading || currentPage <= 1
                                                ? "pointer-events-none opacity-50"
                                                : ""
                                        }
                                    />
                                </PaginationItem>

                                {buildPageNumbers(currentPage, totalPages).map(
                                    (page, idx) =>
                                        page === "ellipsis" ? (
                                            <PaginationItem
                                                key={`ellipsis-${idx}`}
                                            >
                                                <PaginationEllipsis />
                                            </PaginationItem>
                                        ) : (
                                            <PaginationItem key={page}>
                                                <PaginationLink
                                                    isActive={
                                                        page === currentPage
                                                    }
                                                    onClick={() =>
                                                        onPageChange(page)
                                                    }
                                                    disabled={loading}
                                                >
                                                    {page}
                                                </PaginationLink>
                                            </PaginationItem>
                                        )
                                )}

                                <PaginationItem>
                                    <PaginationNext
                                        onClick={() =>
                                            onPageChange(
                                                Math.min(
                                                    currentPage + 1,
                                                    totalPages
                                                )
                                            )
                                        }
                                        aria-disabled={
                                            loading || currentPage >= totalPages
                                        }
                                        className={
                                            loading || currentPage >= totalPages
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
    )
}
