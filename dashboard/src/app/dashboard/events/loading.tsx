"use client"

import { EventCardSkeleton } from "@/components/skeleton"

export default function EventsLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="flex items-center justify-between">
                <div>
                    <div className="h-8 w-[200px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
                </div>
                <div className="h-10 w-[140px] bg-muted animate-pulse rounded" />
            </div>

            {/* Event Cards Grid */}
            <div className="grid gap-6 md:grid-cols-2">
                <EventCardSkeleton />
                <EventCardSkeleton />
                <EventCardSkeleton />
                <EventCardSkeleton />
            </div>
        </div>
    )
}
