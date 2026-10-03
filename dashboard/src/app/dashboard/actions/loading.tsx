"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export function ActionCardSkeleton() {
    return (
        <div className="flex flex-col items-center p-4 space-y-2 rounded-lg border bg-muted/20">
            <Skeleton className="h-10 w-10 rounded-full" />
            <Skeleton className="h-4 w-[120px]" />
            <Skeleton className="h-3 w-[150px]" />
        </div>
    )
}

export function ActionHistorySkeleton() {
    return (
        <div className="flex items-center gap-3 p-4 border rounded-lg">
            <Skeleton className="h-8 w-8 rounded-full" />
            <div className="flex-1 space-y-2">
                <Skeleton className="h-4 w-[300px]" />
                <Skeleton className="h-3 w-[200px]" />
            </div>
            <Skeleton className="h-4 w-[60px]" />
        </div>
    )
}

export default function ActionsLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div>
                <div className="h-8 w-[200px] bg-muted animate-pulse rounded mb-2" />
                <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
            </div>

            {/* Main Card */}
            <Card>
                <CardHeader>
                    <Skeleton className="h-6 w-[150px] mb-2" />
                    <Skeleton className="h-4 w-[300px]" />
                </CardHeader>
                <CardContent className="space-y-6">
                    {/* Search */}
                    <div className="space-y-2">
                        <Skeleton className="h-4 w-[150px]" />
                        <div className="flex gap-2">
                            <div className="relative flex-1">
                                <div className="absolute left-3 top-1/2 -translate-y-1/2">
                                    <Skeleton className="h-4 w-4" />
                                </div>
                                <Skeleton className="h-10 w-full" />
                            </div>
                            <Skeleton className="h-10 w-[100px]" />
                        </div>
                    </div>

                    {/* Action Types */}
                    <div className="space-y-2">
                        <Skeleton className="h-4 w-[120px]" />
                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                            <ActionCardSkeleton />
                            <ActionCardSkeleton />
                            <ActionCardSkeleton />
                            <ActionCardSkeleton />
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Recent Actions */}
            <Card>
                <CardHeader>
                    <Skeleton className="h-6 w-[180px]" />
                </CardHeader>
                <CardContent className="space-y-3">
                    <ActionHistorySkeleton />
                    <ActionHistorySkeleton />
                    <ActionHistorySkeleton />
                    <ActionHistorySkeleton />
                </CardContent>
            </Card>
        </div>
    )
}
