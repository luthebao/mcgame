"use client"

import { useEffect, useState } from "react"
import { useQueryClient } from "@tanstack/react-query"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { usePlayerAction } from "@/hooks/use-player-detail"
import { useFeatureStates } from "@/hooks/use-feature-states"
import {
    FEATURE_SYSTEMS,
    type FeatureScalarField,
    type FeatureState,
    type FeatureSystem,
} from "@/types/player-management"

function readScalar(
    featureKey: string,
    state: Record<string, unknown>,
    field: FeatureScalarField
): string {
    if (featureKey === "explorer_medal") {
        const info = state.info
        if (typeof info === "string" && info.includes("|")) {
            const [level, score] = info.split("|")
            const value = field.path === "level" ? level : score
            return value?.trim() ?? ""
        }
        return ""
    }
    const raw = state[field.path]
    if (raw === null || raw === undefined) return ""
    if (typeof raw === "number" || typeof raw === "string") return String(raw)
    return ""
}

function applyScalar(
    featureKey: string,
    state: Record<string, unknown>,
    scalars: Record<string, string>,
    fields: FeatureScalarField[]
): Record<string, unknown> | null {
    if (featureKey === "explorer_medal") {
        const levelRaw = scalars.level ?? ""
        const scoreRaw = scalars.score ?? ""
        if (levelRaw.trim() === "" && scoreRaw.trim() === "") return state
        const level = Math.trunc(Number(levelRaw))
        const score = Math.trunc(Number(scoreRaw))
        if (!Number.isFinite(level) || !Number.isFinite(score)) {
            toast.error("Explorer medal level and score must be numbers")
            return null
        }
        return { ...state, info: `${level}|${score}` }
    }
    const next: Record<string, unknown> = { ...state }
    for (const field of fields) {
        const raw = scalars[field.path] ?? ""
        if (raw.trim() === "") continue
        const parsed = Math.trunc(Number(raw))
        if (!Number.isFinite(parsed)) {
            toast.error(`${field.label} must be a number`)
            return null
        }
        next[field.path] = parsed
    }
    return next
}

function FeatureCard({
    system,
    current,
    playerId,
    onSaved,
}: {
    system: FeatureSystem
    current: Record<string, unknown>
    playerId: number
    onSaved: () => void
}) {
    const action = usePlayerAction(playerId)
    const fields = system.scalarFields ?? []
    const [scalars, setScalars] = useState<Record<string, string>>({})
    const [json, setJson] = useState("")

    useEffect(() => {
        const next: Record<string, string> = {}
        for (const field of fields) {
            next[field.path] = readScalar(system.featureKey, current, field)
        }
        setScalars(next)
        setJson(JSON.stringify(current, null, 2))
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [system.featureKey, JSON.stringify(current)])

    const handleSave = () => {
        let parsed: Record<string, unknown>
        try {
            const value = json.trim() === "" ? {} : JSON.parse(json)
            if (
                typeof value !== "object" ||
                value === null ||
                Array.isArray(value)
            ) {
                toast.error(`${system.label}: state must be a JSON object`)
                return
            }
            parsed = value as Record<string, unknown>
        } catch (err) {
            toast.error(
                `${system.label}: invalid JSON — ${
                    err instanceof Error ? err.message : String(err)
                }`
            )
            return
        }

        const merged =
            fields.length > 0
                ? applyScalar(system.featureKey, parsed, scalars, fields)
                : parsed
        if (merged === null) return

        action.mutate(
            {
                action: "set_feature_state",
                payload: { featureKey: system.featureKey, state: merged },
            },
            {
                onSuccess: () => {
                    onSaved()
                },
            }
        )
    }

    return (
        <Card>
            <CardHeader className="pb-3">
                <CardTitle className="text-base">{system.label}</CardTitle>
                <CardDescription className="font-mono text-xs">
                    {system.featureKey}
                </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
                {fields.length > 0 && (
                    <div className="grid gap-4 md:grid-cols-2">
                        {fields.map(field => (
                            <div key={field.path} className="space-y-1">
                                <Label className="text-xs">{field.label}</Label>
                                <Input
                                    type="number"
                                    min={field.min}
                                    max={field.max}
                                    placeholder={
                                        field.min !== undefined ||
                                        field.max !== undefined
                                            ? `${field.min ?? ""}–${
                                                  field.max ?? ""
                                              }`
                                            : "value"
                                    }
                                    value={scalars[field.path] ?? ""}
                                    onChange={e =>
                                        setScalars(prev => ({
                                            ...prev,
                                            [field.path]: e.target.value,
                                        }))
                                    }
                                />
                            </div>
                        ))}
                    </div>
                )}

                <div className="space-y-1">
                    <Label className="text-xs">Raw State (JSON)</Label>
                    <Textarea
                        rows={6}
                        value={json}
                        onChange={e => setJson(e.target.value)}
                        className="font-mono text-xs"
                        placeholder="{}"
                    />
                    <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                        {fields.length > 0
                            ? "Guided fields are merged into this JSON on save, overriding matching keys. Edit the JSON directly for any other fields."
                            : "Edit the full feature state as raw JSON. Writes persist to the database only."}
                    </p>
                </div>

                <Button
                    size="sm"
                    onClick={handleSave}
                    disabled={action.isPending}
                >
                    Save {system.label}
                </Button>
            </CardContent>
        </Card>
    )
}

export function FeatureStateTab({ playerId }: { playerId: number }) {
    const { data, isLoading, error } = useFeatureStates(playerId)
    const queryClient = useQueryClient()

    const handleSaved = () => {
        void queryClient.invalidateQueries({
            queryKey: ["feature-states", String(playerId)],
        })
    }

    if (isLoading) {
        return (
            <div className="py-12 text-center text-muted-foreground">
                Loading feature states...
            </div>
        )
    }
    if (error) {
        return (
            <div className="py-12 text-center text-destructive">
                {error.message}
            </div>
        )
    }

    const states: FeatureState[] = data ?? []
    const byKey = new Map<string, Record<string, unknown>>()
    for (const entry of states) {
        byKey.set(entry.featureKey, entry.state ?? {})
    }

    return (
        <div className="space-y-4">
            {FEATURE_SYSTEMS.map(system => (
                <FeatureCard
                    key={system.featureKey}
                    system={system}
                    current={byKey.get(system.featureKey) ?? {}}
                    playerId={playerId}
                    onSaved={handleSaved}
                />
            ))}
        </div>
    )
}
