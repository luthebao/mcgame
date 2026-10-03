"use client"

import { Button } from "@/components/ui/button"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { usePlayerAction } from "@/hooks/use-player-detail"

import {
    type CharacterField,
} from "../_components/character-field-form"

const FIELDS: CharacterField[] = [
    { key: "maxHp", label: "Max HP", dtoKey: "hpMax" },
    { key: "maxMp", label: "Max MP", dtoKey: "mpMax" },
    { key: "maxSp", label: "Max SP", dtoKey: "spMax" },
    { key: "attack", label: "Attack", dtoKey: "baseAttack" },
    { key: "defense", label: "Defense", dtoKey: "baseDefense" },
    { key: "magicAttack", label: "Magic Attack", dtoKey: "baseMagicAttack" },
    { key: "magicDefense", label: "Magic Defense", dtoKey: "baseMagicDefense" },
    { key: "hit", label: "Hit", dtoKey: "propHit" },
    { key: "dodge", label: "Dodge", dtoKey: "propDodge" },
    { key: "critical", label: "Critical", dtoKey: "propCritical" },
    { key: "criticalDmg", label: "Critical Dmg", dtoKey: "baseCriticalDmg" },
    { key: "speed", label: "Speed", dtoKey: "propSpeed" },
]

export function CombatStatsTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    const mutate = usePlayerAction(playerId)

    const handleRefresh = () => {
        mutate.mutate({
            action: "set_combat_stats",
            payload: { refresh: true },
        })
    }

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">Current Combat Stats</CardTitle>
                    <CardDescription>
                        Derived on the server from attributes, aptitude, equipment, buffs,
                        and other runtime modifiers.
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="grid gap-3 md:grid-cols-2 lg:grid-cols-4">
                        {FIELDS.map(field => (
                            <div
                                key={field.key}
                                className="space-y-1 rounded-lg border border-border/60 bg-muted/20 p-3"
                            >
                                <p className="text-xs uppercase tracking-wide text-muted-foreground">
                                    {field.label}
                                </p>
                                <p className="font-medium">
                                    {String(char[field.dtoKey] ?? "-")}
                                </p>
                            </div>
                        ))}
                    </div>
                </CardContent>
            </Card>

            <Card>
                <CardHeader className="pb-3">
                    <CardTitle className="text-base">Refresh Derived Stats</CardTitle>
                    <CardDescription>
                        Derived combat stats are no longer edited directly. Refresh this
                        player to recalculate the cached server-side values.
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <p className="rounded-lg border border-amber-200/60 bg-amber-50/50 px-3 py-2 text-xs text-amber-900 dark:border-amber-900/40 dark:bg-amber-950/30 dark:text-amber-200">
                        Use attribute, progression, equipment, buff, or item actions to
                        change the source inputs. This action only forces a recalculation.
                    </p>
                    <Button
                        size="sm"
                        onClick={handleRefresh}
                        disabled={mutate.isPending}
                    >
                        Refresh Stats
                    </Button>
                </CardContent>
            </Card>
        </div>
    )
}
