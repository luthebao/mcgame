"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"
import { PlayerListSkeleton } from "@/components/skeleton"

export default function PlayersLoading() {
    return (
        <div className="space-y-6">
            {/* Page Header */}
            <div className="flex items-center justify-between">
                <div>
                    <div className="h-8 w-[300px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[400px] bg-muted animate-pulse rounded" />
                </div>
            </div>

            {/* Search Card */}
            <Card>
                <CardHeader>
                    <div className="h-5 w-[200px] bg-muted animate-pulse rounded mb-2" />
                    <div className="h-4 w-[300px] bg-muted animate-pulse rounded" />
                </CardHeader>
                <CardContent>
                    <div className="relative">
                        <div className="absolute left-3 top-1/2 -translate-y-1/2">
                            <div className="h-4 w-4 bg-muted animate-pulse rounded" />
                        </div>
                        <div className="h-10 w-full bg-muted animate-pulse rounded pl-10" />
                    </div>
                </CardContent>
            </Card>

            {/* Players List */}
            <Card>
                <CardHeader>
                    <div className="h-6 w-[250px] bg-muted animate-pulse rounded" />
                </CardHeader>
                <CardContent>
                    <PlayerListSkeleton />
                    <PlayerListSkeleton />
                </CardContent>
            </Card>
        </div>
    )
}
