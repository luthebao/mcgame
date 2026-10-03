"use client"

import { useParams, useRouter } from "next/navigation"
import { useEffect, useState } from "react"
import { toast } from "sonner"

import { LineForm } from "@/components/lines/line-form"
import { gatewayConfigService, type GatewayLine } from "@/services/gateway-config.service"

export default function EditLinePage() {
    const params = useParams<{ id: string }>()
    const router = useRouter()
    const [line, setLine] = useState<GatewayLine | null>(null)
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const id = Number(params.id)
        if (!Number.isFinite(id)) {
            toast.error("Invalid line id")
            router.push("/dashboard")
            return
        }

        gatewayConfigService
            .list()
            .then(items => {
                const found = items.find(item => item.id === id)
                if (!found) {
                    toast.error(`Line ${id} not found`)
                    router.push("/dashboard")
                    return
                }
                setLine(found)
            })
            .catch(error => {
                toast.error(error instanceof Error ? error.message : "Load failed")
                router.push("/dashboard")
            })
            .finally(() => setLoading(false))
    }, [params.id, router])

    if (loading) {
        return (
            <div className="space-y-6 p-6">
                <p className="text-sm text-muted-foreground">Loading…</p>
            </div>
        )
    }

    if (!line) return null

    return (
        <div className="space-y-6 p-6">
            <div>
                <h1 className="text-2xl font-bold">Edit gateway line</h1>
                <p className="text-sm text-muted-foreground">
                    Saving here re-upserts the row. The Go server&apos;s config store refreshes automatically.
                </p>
            </div>
            <LineForm mode="edit" initial={line} />
        </div>
    )
}
