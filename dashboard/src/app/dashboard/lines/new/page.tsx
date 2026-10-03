import { LineForm } from "@/components/lines/line-form"

export default function NewLinePage() {
    return (
        <div className="space-y-6 p-6">
            <div>
                <h1 className="text-2xl font-bold">New gateway line</h1>
                <p className="text-sm text-muted-foreground">
                    Adds a row to public.gateway_config. The running server picks it up via LISTEN/NOTIFY.
                </p>
            </div>
            <LineForm mode="create" />
        </div>
    )
}
