import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export function DashboardStatsSkeleton() {
    return (
        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
            {Array.from({ length: 4 }).map((_, i) => (
                <Card key={i}>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <Skeleton className="h-4 w-[100px]" />
                        <Skeleton className="h-4 w-4 rounded-full" />
                    </CardHeader>
                    <CardContent>
                        <Skeleton className="h-8 w-[100px] mb-2" />
                        <Skeleton className="h-3 w-[120px]" />
                    </CardContent>
                </Card>
            ))}
        </div>
    )
}

export function CardSkeleton() {
    return (
        <Card>
            <CardHeader>
                <Skeleton className="h-6 w-[200px] mb-2" />
                <Skeleton className="h-4 w-[300px]" />
            </CardHeader>
            <CardContent className="space-y-4">
                <Skeleton className="h-4 w-full" />
                <Skeleton className="h-4 w-full" />
                <Skeleton className="h-4 w-3/4" />
            </CardContent>
        </Card>
    )
}

export function TableSkeleton({
    rows = 5,
    columns = 6,
}: {
    rows?: number
    columns?: number
}) {
    return (
        <div className="rounded-md border">
            <div className="border-b p-4">
                <div className="flex gap-2">
                    {Array.from({ length: columns }).map((_, i) => (
                        <Skeleton key={i} className="h-4 w-[100px]" />
                    ))}
                </div>
            </div>
            <div className="p-4">
                {Array.from({ length: rows }).map((_, i) => (
                    <div
                        key={i}
                        className="flex gap-2 py-3 border-b last:border-0"
                    >
                        {Array.from({ length: columns }).map((_, j) => (
                            <Skeleton key={j} className="h-4 flex-1" />
                        ))}
                    </div>
                ))}
            </div>
        </div>
    )
}

export function PlayerListSkeleton() {
    return (
        <div className="space-y-4">
            {Array.from({ length: 5 }).map((_, i) => (
                <div
                    key={i}
                    className="flex items-center gap-4 p-4 border rounded-lg"
                >
                    <Skeleton className="h-10 w-10 rounded-full" />
                    <div className="flex-1 space-y-2">
                        <Skeleton className="h-4 w-[150px]" />
                        <Skeleton className="h-3 w-[100px]" />
                    </div>
                    <Skeleton className="h-6 w-[60px] rounded-full" />
                </div>
            ))}
        </div>
    )
}

export function ServerCardSkeleton() {
    return (
        <Card>
            <CardHeader>
                <div className="flex items-start justify-between">
                    <div className="space-y-2">
                        <Skeleton className="h-5 w-[200px]" />
                        <Skeleton className="h-4 w-[100px]" />
                    </div>
                    <Skeleton className="h-6 w-[80px] rounded-full" />
                </div>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="space-y-2">
                    <Skeleton className="h-3 w-[60px]" />
                    <Skeleton className="h-2 w-full" />
                </div>
                <div className="space-y-2">
                    <Skeleton className="h-3 w-[80px]" />
                    <Skeleton className="h-2 w-full" />
                </div>
                <div className="space-y-2">
                    <Skeleton className="h-3 w-[90px]" />
                    <Skeleton className="h-2 w-full" />
                </div>
                <div className="pt-4 border-t space-y-2">
                    <Skeleton className="h-9 w-full" />
                </div>
            </CardContent>
        </Card>
    )
}

export function EventCardSkeleton() {
    return (
        <Card>
            <CardHeader>
                <div className="flex items-start justify-between">
                    <div className="flex-1 space-y-2">
                        <div className="flex items-center gap-2">
                            <Skeleton className="h-5 w-[150px]" />
                            <Skeleton className="h-5 w-[80px] rounded-full" />
                        </div>
                        <Skeleton className="h-4 w-[300px]" />
                    </div>
                    <div className="flex items-center gap-2">
                        <Skeleton className="h-6 w-[16px]" />
                        <Skeleton className="h-6 w-[80px] rounded-full" />
                    </div>
                </div>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="space-y-3">
                    {Array.from({ length: 2 }).map((_, i) => (
                        <div
                            key={i}
                            className="bg-muted/50 rounded-lg p-3 space-y-2"
                        >
                            <Skeleton className="h-3 w-[200px]" />
                            <div className="flex gap-4">
                                <Skeleton className="h-3 w-[100px]" />
                                <Skeleton className="h-3 w-[100px]" />
                            </div>
                        </div>
                    ))}
                </div>
            </CardContent>
        </Card>
    )
}

export function GiftCodeRowSkeleton() {
    return (
        <div className="flex items-center gap-3 p-4 border-b">
            <Skeleton className="h-8 w-[120px]" />
            <div className="flex-1 space-y-2">
                <Skeleton className="h-3 w-[150px]" />
                <Skeleton className="h-3 w-[100px]" />
            </div>
            <Skeleton className="h-2 w-[100px]" />
            <Skeleton className="h-6 w-[60px] rounded-full" />
            <Skeleton className="h-8 w-[80px]" />
        </div>
    )
}

export function ItemCardSkeleton() {
    return (
        <div className="rounded-lg border p-4 space-y-3">
            <div className="flex items-center gap-4">
                <Skeleton className="h-12 w-12 rounded" />
                <div className="flex-1 space-y-2">
                    <Skeleton className="h-4 w-[150px]" />
                    <Skeleton className="h-3 w-[100px]" />
                </div>
                <Skeleton className="h-6 w-[60px] rounded-full" />
            </div>
        </div>
    )
}

export function StatsCardSkeleton({ icon = true }: { icon?: boolean }) {
    return (
        <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <Skeleton className="h-4 w-[140px]" />
                {icon && <Skeleton className="h-4 w-4 rounded" />}
            </CardHeader>
            <CardContent>
                <Skeleton className="h-8 w-[80px]" />
            </CardContent>
        </Card>
    )
}

export function ChartSkeleton() {
    return (
        <Card>
            <CardHeader>
                <Skeleton className="h-5 w-[150px]" />
            </CardHeader>
            <CardContent>
                <div className="space-y-2">
                    <div className="flex items-end gap-2 h-[200px]">
                        {Array.from({ length: 12 }).map((_, i) => (
                            <Skeleton key={i} className="h-full flex-1" />
                        ))}
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}
