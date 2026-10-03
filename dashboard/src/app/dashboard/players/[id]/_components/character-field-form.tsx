"use client"

import { useState } from "react"
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
import { usePlayerAction } from "@/hooks/use-player-detail"

export type CharacterField = {
    key: string
    label: string
    dtoKey: string
    type?: "int" | "bigint"
}

type CharacterFieldFormProps = {
    title: string
    description?: string
    note?: string
    action: string
    playerId: number
    char: Record<string, unknown>
    fields: CharacterField[]
    columns?: 3 | 4 | 5
}

type FieldGroupProps = {
    label: string
    value: string | number | boolean | null | undefined
}

function FieldGroup({ label, value }: FieldGroupProps) {
    const display =
        value === null || value === undefined || value === ""
            ? "-"
            : String(value)
    return (
        <div className="space-y-1 rounded-lg border border-border/60 bg-muted/20 p-3">
            <p className="text-xs uppercase tracking-wide text-muted-foreground">
                {label}
            </p>
            <p className="font-medium">{display}</p>
        </div>
    )
}

function gridClass(columns: 3 | 4 | 5) {
    switch (columns) {
        case 3:
            return "md:grid-cols-2 lg:grid-cols-3"
        case 4:
            return "md:grid-cols-2 lg:grid-cols-4"
        case 5:
            return "md:grid-cols-3 lg:grid-cols-5"
    }
}

export function CharacterFieldForm({
    title,
    description,
    note,
    action,
    playerId,
    char,
    fields,
    columns = 4,
}: CharacterFieldFormProps) {
    const mutate = usePlayerAction(playerId)
    const [values, setValues] = useState<Record<string, string>>({})

    const handleChange = (key: string, val: string) => {
        setValues(prev => ({ ...prev, [key]: val }))
    }

    const handleApply = () => {
        const payload: Record<string, unknown> = {}
        for (const field of fields) {
            const raw = values[field.key]
            if (raw === undefined || raw === "") continue
            const num = Number(raw)
            if (!Number.isFinite(num)) continue
            payload[field.key] = field.type === "bigint" ? num : Math.trunc(num)
        }
        if (Object.keys(payload).length === 0) {
            toast.error("No changes to apply")
            return
        }
        mutate.mutate(
            { action, payload },
            {
                onSuccess: () => {
                    setValues({})
                },
            }
        )
    }

    const grid = gridClass(columns)

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">Current {title}</CardTitle>
                </CardHeader>
                <CardContent>
                    <div className={`grid gap-3 ${grid}`}>
                        {fields.map(f => (
                            <FieldGroup
                                key={f.key}
                                label={f.label}
                                value={char[f.dtoKey] as never}
                            />
                        ))}
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">Set {title}</CardTitle>
                    <CardDescription>
                        {description ??
                            "Only fill fields you want to change. Empty fields are ignored."}
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className={`grid gap-3 ${grid}`}>
                        {fields.map(f => (
                            <div key={f.key} className="space-y-1">
                                <Label className="text-xs">{f.label}</Label>
                                <Input
                                    type="number"
                                    placeholder={String(char[f.dtoKey] ?? "")}
                                    value={values[f.key] ?? ""}
                                    onChange={e =>
                                        handleChange(f.key, e.target.value)
                                    }
                                />
                            </div>
                        ))}
                    </div>
                    {note && (
                        <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                            {note}
                        </p>
                    )}
                    <Button
                        size="sm"
                        onClick={handleApply}
                        disabled={mutate.isPending}
                    >
                        Apply Changes
                    </Button>
                </CardContent>
            </Card>
        </div>
    )
}
