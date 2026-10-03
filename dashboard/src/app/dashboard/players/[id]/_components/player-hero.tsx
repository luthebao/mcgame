"use client"

import Link from "next/link"
import { ArrowLeft, Shield } from "lucide-react"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { cn } from "@/lib/utils"

type PlayerHeroProps = {
    char: Record<string, unknown>
    online: boolean
    playerId: number
}

function toNumber(value: unknown): number | undefined {
    if (value === null || value === undefined || value === "") return undefined
    const num = typeof value === "number" ? value : Number(value)
    return Number.isFinite(num) ? num : undefined
}

function formatCompact(value: number): string {
    if (Math.abs(value) >= 1000) {
        return new Intl.NumberFormat("en", {
            notation: "compact",
            maximumFractionDigits: 1,
        }).format(value)
    }
    return value.toLocaleString()
}

type Chip = {
    label: string
    value: number
    tone?: "default" | "money" | "gold"
}

function StatChip({ label, value, tone = "default" }: Chip) {
    return (
        <span
            className={cn(
                "inline-flex items-center gap-1.5 rounded-full border px-2.5 py-1 text-xs font-medium",
                tone === "money" &&
                    "border-slate-300/60 bg-slate-100/60 text-slate-700 dark:border-slate-600/50 dark:bg-slate-800/50 dark:text-slate-200",
                tone === "gold" &&
                    "border-amber-300/60 bg-amber-100/60 text-amber-800 dark:border-amber-700/50 dark:bg-amber-950/40 dark:text-amber-300",
                tone === "default" &&
                    "border-border/60 bg-muted/40 text-muted-foreground"
            )}
            title={`${label}: ${value.toLocaleString()}`}
        >
            <span className="uppercase tracking-wide opacity-70">{label}</span>
            <span className="font-semibold text-foreground">
                {formatCompact(value)}
            </span>
        </span>
    )
}

export function PlayerHero({ char, online, playerId }: PlayerHeroProps) {
    const name = (char.name as string) || `Player #${playerId}`
    const level = toNumber(char.level)
    const gmLevel = toNumber(char.gmLevel)

    const chips: Chip[] = []
    const pushChip = (label: string, raw: unknown, tone?: Chip["tone"]) => {
        const num = toNumber(raw)
        if (num !== undefined) chips.push({ label, value: num, tone })
    }

    pushChip("STR", char.attStrength)
    pushChip("AGI", char.attAgility)
    pushChip("STA", char.attStamina)
    pushChip("INT", char.attIntelligence)
    pushChip("ATK", char.baseAttack)
    pushChip("Bạc", char.money, "money")
    pushChip("Vàng", char.gold, "gold")

    return (
        <div className="sticky top-0 z-10 rounded-xl border border-border/60 bg-gradient-to-br from-card/95 via-card/90 to-muted/60 p-5 shadow-sm backdrop-blur supports-[backdrop-filter]:bg-card/70">
            <div className="flex flex-wrap items-start justify-between gap-4">
                <div className="flex items-start gap-4">
                    <Link href="/dashboard/players">
                        <Button variant="outline" size="sm">
                            <ArrowLeft className="mr-2 h-4 w-4" />
                            Back
                        </Button>
                    </Link>
                    <div className="space-y-1">
                        <div className="flex flex-wrap items-center gap-2">
                            <h1 className="text-2xl font-bold leading-tight">
                                {name}
                            </h1>
                            <Badge variant={online ? "success" : "secondary"}>
                                {online ? "Online" : "Offline"}
                            </Badge>
                            {gmLevel !== undefined && gmLevel > 0 ? (
                                <Badge variant="warning" className="gap-1">
                                    <Shield className="h-3 w-3" />
                                    GM {gmLevel}
                                </Badge>
                            ) : null}
                        </div>
                        <p className="text-sm text-muted-foreground">
                            ID: {playerId}
                            {level !== undefined ? ` | Level ${level}` : ""}
                        </p>
                    </div>
                </div>
            </div>

            {chips.length > 0 ? (
                <div className="mt-4 flex flex-wrap gap-2">
                    {chips.map(chip => (
                        <StatChip
                            key={chip.label}
                            label={chip.label}
                            value={chip.value}
                            tone={chip.tone}
                        />
                    ))}
                </div>
            ) : null}
        </div>
    )
}
