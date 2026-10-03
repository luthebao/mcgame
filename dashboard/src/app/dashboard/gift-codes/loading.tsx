"use client"

import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"
import { GiftCodeRowSkeleton, StatsCardSkeleton } from "@/components/skeleton"

export default function GiftCodesLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="flex items-center justify-between">
                <div>
                    <div className="h-8 w-[250px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
                </div>
                <div className="h-10 w-[160px] bg-muted animate-pulse rounded" />
            </div>

            {/* Stats */}
            <div className="grid gap-4 md:grid-cols-4">
                <StatsCardSkeleton />
                <StatsCardSkeleton />
                <StatsCardSkeleton />
                <StatsCardSkeleton />
            </div>

            {/* Gift Codes List */}
            <Card>
                <CardHeader>
                    <div className="h-6 w-[180px] bg-muted animate-pulse rounded" />
                </CardHeader>
                <CardContent>
                    <div className="border-b">
                        <div className="flex gap-2 p-4">
                            <Skeleton className="h-4 w-[80px]" />
                            <Skeleton className="h-4 w-[100px]" />
                            <Skeleton className="h-4 w-[80px]" />
                            <Skeleton className="h-4 w-[80px]" />
                            <Skeleton className="h-4 w-[100px]" />
                            <Skeleton className="h-4 w-[80px]" />
                            <Skeleton className="h-4 w-[60px]" />
                        </div>
                    </div>
                    <div>
                        <GiftCodeRowSkeleton />
                        <GiftCodeRowSkeleton />
                        <GiftCodeRowSkeleton />
                        <GiftCodeRowSkeleton />
                        <GiftCodeRowSkeleton />
                    </div>
                </CardContent>
            </Card>
        </div>
    )
}
