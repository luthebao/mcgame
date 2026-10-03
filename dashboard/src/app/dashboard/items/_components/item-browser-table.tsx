"use client"

import Image from "next/image"
import { ChevronLeft, ChevronRight } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
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
import type { ItemBrowserRow, ItemSearchResult } from "@/services/item.service"

import {
    getBindTypeLabel,
    getItemTypeLabel,
    getKindLabel,
    getTemplateTableLabel,
    getTradableLabel,
    getUseTypeLabel,
} from "../_lib/shared"

type ItemBrowserTableProps = {
    result: ItemSearchResult | null
    loading: boolean
    rowStart: number
    rowEnd: number
    itemCurrentPage: number
    itemTotalPages: number
    onRowClick: (item: ItemBrowserRow) => void
    onPreviousPage: () => void
    onNextPage: () => void
}

export function ItemBrowserTable({
    result,
    loading,
    rowStart,
    rowEnd,
    itemCurrentPage,
    itemTotalPages,
    onRowClick,
    onPreviousPage,
    onNextPage,
}: ItemBrowserTableProps) {
    return (
        <Card className="flex min-h-0 flex-1 flex-col">
            <CardContent className="flex min-h-0 flex-1 flex-col pt-4">
                <div className="flex min-h-0 flex-1 overflow-auto rounded-md border">
                    <Table>
                        <TableHeader className="sticky top-0 z-10 bg-background">
                            <TableRow>
                                <TableHead>ID</TableHead>
                                <TableHead>Icon</TableHead>
                                <TableHead>Tên</TableHead>
                                <TableHead>Bảng</TableHead>
                                <TableHead>Kind</TableHead>
                                <TableHead>Type</TableHead>
                                <TableHead>Cách dùng</TableHead>
                                <TableHead>Cấp</TableHead>
                                <TableHead>Stack</TableHead>
                                <TableHead>Khóa</TableHead>
                            </TableRow>
                        </TableHeader>

                        <TableBody>
                            {!result || result.items.length === 0 ? (
                                <TableRow>
                                    <TableCell
                                        className="text-center text-muted-foreground"
                                        colSpan={10}
                                    >
                                        Không tìm thấy vật phẩm nào.
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
                                            <div className="flex min-w-[76px] flex-col gap-1">
                                                {item.iconDataUrl ? (
                                                    <Image
                                                        className="h-10 w-10 rounded object-cover"
                                                        src={item.iconDataUrl}
                                                        alt={`icon-${item.iconId}`}
                                                        width={40}
                                                        height={40}
                                                        unoptimized
                                                    />
                                                ) : item.hasIconId ? (
                                                    <span className="text-xs text-muted-foreground">
                                                        Thiếu file
                                                    </span>
                                                ) : (
                                                    <span className="text-xs text-muted-foreground">
                                                        Không có
                                                    </span>
                                                )}
                                                <span className="font-mono text-[11px] text-muted-foreground">
                                                    {item.hasIconId
                                                        ? `#${item.iconId}`
                                                        : "-"}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell>
                                            <Tooltip>
                                                <TooltipTrigger asChild>
                                                    <div className="max-w-[220px] truncate font-medium">
                                                        {item.name}
                                                    </div>
                                                </TooltipTrigger>
                                                <TooltipContent>
                                                    {item.name}
                                                </TooltipContent>
                                            </Tooltip>
                                            <Tooltip>
                                                <TooltipTrigger asChild>
                                                    <div className="max-w-[240px] truncate text-xs text-muted-foreground">
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
                                            <div className="flex flex-col">
                                                <span className="font-medium">
                                                    {getTemplateTableLabel(
                                                        item.templateTableId,
                                                        item.templateTableName
                                                    )}
                                                </span>
                                                <span className="font-mono text-muted-foreground">
                                                    TBL {item.templateTableId}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell className="text-xs">
                                            <div className="flex flex-col">
                                                <span className="font-medium">
                                                    {getKindLabel(item.kind)}
                                                </span>
                                                <span className="font-mono text-muted-foreground">
                                                    Kind {item.kind}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell className="text-xs">
                                            <div className="flex flex-col">
                                                <span className="font-mono">
                                                    {getItemTypeLabel(item.itemType)}
                                                </span>
                                                <span className="font-mono text-muted-foreground">
                                                    Type {item.templateType}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell className="text-xs">
                                            <div className="flex flex-col">
                                                <span>
                                                    {getUseTypeLabel(
                                                        item.useType
                                                    )}
                                                </span>
                                                <span className="text-muted-foreground">
                                                    Cấp VP{" "}
                                                    {item.templateLevel || "-"}
                                                </span>
                                            </div>
                                        </TableCell>

                                        <TableCell className="font-mono text-xs">
                                            {item.requiredLevel}
                                        </TableCell>
                                        <TableCell className="font-mono text-xs">
                                            {item.maxStack}
                                        </TableCell>

                                        <TableCell className="text-xs">
                                            <div className="flex flex-col">
                                                <span>
                                                    {getBindTypeLabel(
                                                        item.bindType
                                                    )}
                                                </span>
                                                <span className="text-muted-foreground">
                                                    {getTradableLabel(
                                                        item.tradable
                                                    )}
                                                </span>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </div>

                <div className="mt-4 flex items-center justify-between">
                    <p className="text-sm text-muted-foreground">
                        Hiển thị {rowStart} - {rowEnd} / {result?.total || 0} vật phẩm
                    </p>

                    <div className="flex items-center gap-2">
                        <Button
                            type="button"
                            variant="outline"
                            size="icon"
                            onClick={onPreviousPage}
                            disabled={loading || itemCurrentPage <= 1}
                        >
                            <ChevronLeft className="h-4 w-4" />
                        </Button>

                        <span className="text-sm text-muted-foreground">
                            Trang {itemCurrentPage}/{itemTotalPages}
                        </span>

                        <Button
                            type="button"
                            variant="outline"
                            size="icon"
                            onClick={onNextPage}
                            disabled={
                                loading || itemCurrentPage >= itemTotalPages
                            }
                        >
                            <ChevronRight className="h-4 w-4" />
                        </Button>
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}
