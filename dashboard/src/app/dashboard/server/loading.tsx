"use client"

import { ServerCardSkeleton } from "@/components/skeleton"

export default function ServerLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="flex items-center justify-between">
                <div>
                    <div className="h-8 w-[250px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
                </div>
                <div className="h-10 w-[180px] bg-muted animate-pulse rounded" />
            </div>

            {/* Server Cards Grid */}
            <div className="grid gap-6 md:grid-cols-2">
                <ServerCardSkeleton />
                <ServerCardSkeleton />
                <ServerCardSkeleton />
                <ServerCardSkeleton />
            </div>
        </div>
    )
}
