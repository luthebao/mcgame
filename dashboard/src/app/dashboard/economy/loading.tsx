"use client"

import {
    DashboardStatsSkeleton,
    TableSkeleton,
    CardSkeleton,
} from "@/components/skeleton"

export default function EconomyLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div>
                <div className="h-8 w-[300px] bg-muted animate-pulse rounded mb-2" />
                <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
            </div>

            {/* Stats */}
            <DashboardStatsSkeleton />

            {/* Alerts Card */}
            <CardSkeleton />

            {/* Tables */}
            <TableSkeleton rows={5} columns={7} />
            <TableSkeleton rows={5} columns={7} />
        </div>
    )
}
