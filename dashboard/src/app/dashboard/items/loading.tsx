"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"
import { StatsCardSkeleton, ItemCardSkeleton } from "@/components/skeleton"

export default function ItemsLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="flex items-center justify-between">
                <div>
                    <div className="h-8 w-[200px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
                </div>
                <div className="h-10 w-[120px] bg-muted animate-pulse rounded" />
            </div>

            {/* Stats */}
            <div className="grid gap-4 md:grid-cols-6">
                <StatsCardSkeleton icon={false} />
                <StatsCardSkeleton icon={false} />
                <StatsCardSkeleton icon={false} />
                <StatsCardSkeleton icon={false} />
                <StatsCardSkeleton icon={false} />
                <StatsCardSkeleton icon={false} />
            </div>

            {/* Filters */}
            <Card>
                <CardHeader>
                    <div className="flex items-center gap-2">
                        <Skeleton className="h-5 w-5" />
                        <Skeleton className="h-6 w-[180px]" />
                    </div>
                </CardHeader>
                <CardContent>
                    <div className="grid gap-4 md:grid-cols-5">
                        <div className="md:col-span-2">
                            <div className="relative">
                                <div className="absolute left-3 top-1/2 -translate-y-1/2">
                                    <Skeleton className="h-4 w-4" />
                                </div>
                                <Skeleton className="h-10 w-full" />
                            </div>
                        </div>
                        <Skeleton className="h-10 w-full" />
                        <Skeleton className="h-10 w-full" />
                        <Skeleton className="h-10 w-full" />
                    </div>
                    <div className="mt-4 flex items-center justify-between">
                        <Skeleton className="h-4 w-[200px]" />
                        <Skeleton className="h-9 w-[100px]" />
                    </div>
                </CardContent>
            </Card>

            {/* Items Table */}
            <Card>
                <CardHeader>
                    <Skeleton className="h-6 w-[150px] mb-2" />
                    <Skeleton className="h-4 w-[120px]" />
                </CardHeader>
                <CardContent>
                    <div className="rounded-md border">
                        <div className="border-b p-4">
                            <div className="flex gap-2">
                                <Skeleton className="h-4 w-[60px]" />
                                <Skeleton className="h-4 w-[60px]" />
                                <Skeleton className="h-4 w-[60px]" />
                                <Skeleton className="h-4 w-[80px]" />
                                <Skeleton className="h-4 w-[80px]" />
                                <Skeleton className="h-4 w-[60px]" />
                                <Skeleton className="h-4 w-[50px]" />
                                <Skeleton className="h-4 w-[80px]" />
                                <Skeleton className="h-4 w-[60px]" />
                                <Skeleton className="h-4 w-[80px]" />
                            </div>
                        </div>
                        <div className="p-4 space-y-3">
                            <ItemCardSkeleton />
                            <ItemCardSkeleton />
                            <ItemCardSkeleton />
                            <ItemCardSkeleton />
                            <ItemCardSkeleton />
                        </div>
                    </div>

                    {/* Pagination */}
                    <div className="flex items-center justify-between mt-4">
                        <Skeleton className="h-4 w-[250px]" />
                        <div className="flex gap-2">
                            <Skeleton className="h-9 w-9" />
                            <Skeleton className="h-8 w-8" />
                            <Skeleton className="h-8 w-8" />
                            <Skeleton className="h-8 w-8" />
                            <Skeleton className="h-8 w-8" />
                            <Skeleton className="h-9 w-9" />
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    )
}
