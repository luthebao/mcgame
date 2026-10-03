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

import {
    ITEM_KIND_LABELS,
    ITEM_TYPE_LABELS,
    KIND_TO_TYPES,
    PAGE_SIZE_OPTIONS,
    type ItemQueryState,
} from "../_lib/shared"

type KindEntry = { value: number; label: string }
const KIND_OPTIONS: KindEntry[] = Object.entries(ITEM_KIND_LABELS)
    .map(([key, label]) => ({ value: Number(key), label }))
    .sort((a, b) => a.value - b.value)

function getTypeOptionsForKind(kind: string): { value: number; label: string }[] {
    if (kind === "all") {
        return Object.entries(ITEM_TYPE_LABELS)
            .map(([key, label]) => ({ value: Number(key), label }))
            .sort((a, b) => a.value - b.value)
    }

    const kindNum = Number(kind)
    const typeIds = KIND_TO_TYPES[kindNum] || []
    return typeIds
        .map(id => ({ value: id, label: ITEM_TYPE_LABELS[id] || `Loại ${id}` }))
        .sort((a, b) => a.value - b.value)
}

type ItemBrowserFiltersProps = {
    query: ItemQueryState
    loading: boolean
    searchDraft: string
    itemSummaryText: string
    itemMetaText: string
    error: string
    onSearchDraftChange: (value: string) => void
    onKindChange: (value: string) => void
    onTemplateTypeChange: (value: string) => void
    onSortByChange: (value: ItemQueryState["sortBy"]) => void
    onSortDirChange: (value: ItemQueryState["sortDir"]) => void
    onPageSizeChange: (value: number) => void
    onClearFilters: () => void
}

export function ItemBrowserFilters({
    query,
    loading,
    searchDraft,
    itemSummaryText,
    itemMetaText,
    error,
    onSearchDraftChange,
    onKindChange,
    onTemplateTypeChange,
    onSortByChange,
    onSortDirChange,
    onPageSizeChange,
    onClearFilters,
}: ItemBrowserFiltersProps) {
    const typeOptions = getTypeOptionsForKind(query.kind)

    return (
        <Card>
            <CardHeader>
                <CardTitle>Bộ lọc</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-6">
                    <div className="xl:col-span-2">
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
                        value={query.kind}
                        onValueChange={value => {
                            onKindChange(value)
                            if (value !== query.kind) {
                                onTemplateTypeChange("all")
                            }
                        }}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Loại trang bị" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Tất cả Kind</SelectItem>
                            {KIND_OPTIONS.map(option => (
                                <SelectItem
                                    key={option.value}
                                    value={String(option.value)}
                                >
                                    {option.value} - {option.label}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>

                    <Select
                        value={query.templateType}
                        onValueChange={onTemplateTypeChange}
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Loại chi tiết" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Tất cả Type</SelectItem>
                            {typeOptions.map(option => (
                                <SelectItem
                                    key={option.value}
                                    value={String(option.value)}
                                >
                                    {option.value} - {option.label}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>

                    <Select
                        value={query.sortBy}
                        onValueChange={value =>
                            onSortByChange(value as ItemQueryState["sortBy"])
                        }
                        disabled={loading}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Sắp xếp" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="item_id">Item ID</SelectItem>
                            <SelectItem value="name">Tên</SelectItem>
                            <SelectItem value="kind">Kind</SelectItem>
                            <SelectItem value="template_type">Type</SelectItem>
                            <SelectItem value="required_level">
                                Yêu cầu cấp
                            </SelectItem>
                            <SelectItem value="max_stack">Stack tối đa</SelectItem>
                            <SelectItem value="template_level">
                                Cấp vật phẩm
                            </SelectItem>
                        </SelectContent>
                    </Select>

                    <Select
                        value={query.sortDir}
                        onValueChange={value =>
                            onSortDirChange(value as ItemQueryState["sortDir"])
                        }
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
                            {itemSummaryText}
                        </span>
                        <span className="text-muted-foreground">
                            {itemMetaText}
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
                            <SelectTrigger className="w-[110px]">
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
