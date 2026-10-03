"use client"

import { Search } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import type { BoxItemSortDir } from "@/services/box-item.service"

import { BOX_ITEM_TYPE_OPTIONS } from "@/lib/box-items"

import { PAGE_SIZE_OPTIONS, type BoxItemQueryState } from "../_lib/shared"

type BoxItemFiltersProps = {
    query: BoxItemQueryState
    loading: boolean
    searchDraft: string
    summaryText: string
    error: string
    onSearchDraftChange: (value: string) => void
    onTemplateTypeChange: (value: number | null) => void
    onSortDirChange: (value: BoxItemSortDir) => void
    onPageSizeChange: (value: number) => void
    onClearFilters: () => void
}

export function BoxItemFilters({
    query,
    loading,
    searchDraft,
    summaryText,
    error,
    onSearchDraftChange,
    onTemplateTypeChange,
    onSortDirChange,
    onPageSizeChange,
    onClearFilters,
}: BoxItemFiltersProps) {
    return (
        <Card>
            <CardHeader>
                <CardTitle>Bộ lọc</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-[minmax(0,1fr)_260px_220px]">
                    <div>
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                            <Input
                                type="text"
                                placeholder="Tên, item ID..."
                                autoComplete="off"
                                value={searchDraft}
                                onChange={event =>
                                    onSearchDraftChange(event.target.value)
                                }
                                className="pl-10"
                            />
                        </div>
                    </div>

                    <Select
                        value={
                            query.templateType === null
                                ? "all"
                                : String(query.templateType)
                        }
                        onValueChange={value =>
                            onTemplateTypeChange(
                                value === "all" ? null : Number(value)
                            )
                        }
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Type" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Tất cả Type</SelectItem>
                            {BOX_ITEM_TYPE_OPTIONS.map(option => (
                                <SelectItem
                                    key={option.value}
                                    value={String(option.value)}
                                >
                                    {option.label}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>

                    <Select
                        value={query.sortDir}
                        onValueChange={onSortDirChange}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Thứ tự" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="asc">Tăng dần</SelectItem>
                            <SelectItem value="desc">Giảm dần</SelectItem>
                        </SelectContent>
                    </Select>
                </div>

                <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                    <div className="flex flex-col text-sm">
                        <span className={loading ? "opacity-70" : ""}>
                            {summaryText}
                        </span>
                        {error ? (
                            <span className="text-destructive">{error}</span>
                        ) : null}
                    </div>

                    <div className="flex items-center gap-2">
                        <Select
                            value={String(query.pageSize)}
                            onValueChange={value =>
                                onPageSizeChange(Number(value))
                            }
                            disabled={loading}
                        >
                            <SelectTrigger className="w-28">
                                <SelectValue placeholder="Số dòng" />
                            </SelectTrigger>
                            <SelectContent>
                                {PAGE_SIZE_OPTIONS.map(size => (
                                    <SelectItem key={size} value={String(size)}>
                                        {size}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>

                        <Button
                            type="button"
                            variant="outline"
                            onClick={onClearFilters}
                            disabled={loading}
                        >
                            Xóa bộ lọc
                        </Button>
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}
