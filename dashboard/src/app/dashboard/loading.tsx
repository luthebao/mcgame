"use client"

import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import {
    DashboardStatsSkeleton,
    CardSkeleton,
    TableSkeleton,
    ChartSkeleton,
} from "@/components/skeleton"

export default function DashboardLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div>
                <div className="h-8 w-[300px] bg-muted animate-pulse rounded mb-2" />
                <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
            </div>

            {/* Stats */}
            <DashboardStatsSkeleton />

            {/* Charts */}
            <div className="grid gap-4 md:grid-cols-2">
                <ChartSkeleton />
                <ChartSkeleton />
            </div>

            {/* Recent Activity */}
            <div className="grid gap-4 md:grid-cols-2">
                <CardSkeleton />
                <CardSkeleton />
            </div>
        </div>
    )
}
