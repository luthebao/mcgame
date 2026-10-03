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

function FieldGroup({
    label,
    value,
}: {
    label: string
    value: string | number | null | undefined
}) {
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

function addPositiveInt(
    payload: Record<string, number>,
    key: string,
    raw: string
) {
    if (raw.trim() === "") return
    const parsed = Math.trunc(Number(raw))
    if (Number.isFinite(parsed) && parsed >= 0) {
        payload[key] = parsed
    }
}

export function ProgressionTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    const action = usePlayerAction(playerId)
    const [levelDelta, setLevelDelta] = useState("")
    const [experienceDelta, setExperienceDelta] = useState("")
    const [soulLevel, setSoulLevel] = useState("")
    const [soulExp, setSoulExp] = useState("")
    const [soulPoints, setSoulPoints] = useState("")

    const handleApply = () => {
        const payload: Record<string, number> = {}
        const parsedLevelDelta = Math.trunc(Number(levelDelta))
        const parsedExperienceDelta = Math.trunc(Number(experienceDelta))

        if (
            levelDelta.trim() !== "" &&
            Number.isFinite(parsedLevelDelta) &&
            parsedLevelDelta > 0
        ) {
            payload.levelDelta = parsedLevelDelta
        }
        if (
            experienceDelta.trim() !== "" &&
            Number.isFinite(parsedExperienceDelta) &&
            parsedExperienceDelta > 0
        ) {
            payload.experienceDelta = parsedExperienceDelta
        }

        if (Object.keys(payload).length === 0) {
            toast.error("Enter a positive Up level or Add exp amount")
            return
        }

        action.mutate(
            { action: "advance_progression", payload },
            {
                onSuccess: () => {
                    setLevelDelta("")
                    setExperienceDelta("")
                },
            }
        )
    }

    const handleSetProgression = () => {
        const payload: Record<string, number> = {}
        addPositiveInt(payload, "soulLevel", soulLevel)
        addPositiveInt(payload, "soulExp", soulExp)
        addPositiveInt(payload, "soulPoints", soulPoints)

        if (Object.keys(payload).length === 0) {
            toast.error("Enter a value for at least one soul field")
            return
        }

        action.mutate(
            { action: "set_progression", payload },
            {
                onSuccess: () => {
                    setSoulLevel("")
                    setSoulExp("")
                    setSoulPoints("")
                },
            }
        )
    }

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">
                        Current Progression
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="grid gap-3 md:grid-cols-2">
                        <FieldGroup
                            label="Level"
                            value={char.level as number}
                        />
                        <FieldGroup
                            label="Experience"
                            value={char.experience as number}
                        />
                        <FieldGroup
                            label="Soul Level"
                            value={char.soulLevel as number}
                        />
                        <FieldGroup
                            label="Soul Exp"
                            value={char.soulExp as number}
                        />
                        <FieldGroup
                            label="Soul Points"
                            value={char.soulPoints as number}
                        />
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">
                        Progression Actions
                    </CardTitle>
                    <CardDescription>
                        Use positive values only. Up level increases from the
                        current level. Add exp adds on top of the current
                        experience.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-4 md:grid-cols-2">
                        <div className="space-y-1">
                            <Label className="text-xs">Up level</Label>
                            <Input
                                type="number"
                                min={1}
                                placeholder="Levels to gain"
                                value={levelDelta}
                                onChange={e => setLevelDelta(e.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Add exp</Label>
                            <Input
                                type="number"
                                min={1}
                                placeholder="Experience to add"
                                value={experienceDelta}
                                onChange={e =>
                                    setExperienceDelta(e.target.value)
                                }
                            />
                        </div>
                    </div>
                    <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                        Up level uses the server progression helper and clears
                        current exp before any added exp is applied. Add exp
                        uses the server experience gain flow, so level-ups still
                        follow server rules.
                    </p>
                    <Button
                        size="sm"
                        onClick={handleApply}
                        disabled={action.isPending}
                    >
                        Apply Progression
                    </Button>
                </CardContent>
            </Card>

            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">
                        Set Progression (direct)
                    </CardTitle>
                    <CardDescription>
                        Set Soul Training values directly. Leave a field blank to
                        keep its current value.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-4 md:grid-cols-3">
                        <div className="space-y-1">
                            <Label className="text-xs">Soul Level</Label>
                            <Input
                                type="number"
                                min={0}
                                placeholder="Soul level"
                                value={soulLevel}
                                onChange={e => setSoulLevel(e.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Soul Exp</Label>
                            <Input
                                type="number"
                                min={0}
                                placeholder="Soul exp"
                                value={soulExp}
                                onChange={e => setSoulExp(e.target.value)}
                            />
                        </div>
                        <div className="space-y-1">
                            <Label className="text-xs">Soul Points</Label>
                            <Input
                                type="number"
                                min={0}
                                placeholder="Soul points"
                                value={soulPoints}
                                onChange={e => setSoulPoints(e.target.value)}
                            />
                        </div>
                    </div>
                    <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                        This sets values directly, bypassing the level-up flow.
                        Soul Points is the same balance shown as Pha Lê (soulPnt)
                        in the Wallet tab.
                    </p>
                    <Button
                        size="sm"
                        onClick={handleSetProgression}
                        disabled={action.isPending}
                    >
                        Set Progression
                    </Button>
                </CardContent>
            </Card>
        </div>
    )
}
