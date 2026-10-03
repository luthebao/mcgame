"use client"

import { useState } from "react"
import { useQueryClient } from "@tanstack/react-query"
import { Heart, Star, Trash2, X, Zap } from "lucide-react"
import { toast } from "sonner"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import {
    Dialog,
    DialogContent,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Switch } from "@/components/ui/switch"
import {
    Tooltip,
    TooltipContent,
    TooltipProvider,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import { usePlayerAction } from "@/hooks/use-player-detail"
import { usePlayerPets } from "@/hooks/use-player-inventory"
import type { PetData } from "@/types/player-management"
import { toInt } from "../_lib/numbers"

const ELEMENT_LABELS: Record<number, { label: string; color: string }> = {
    0: { label: "None", color: "text-slate-400" },
    1: { label: "Fire", color: "text-red-500" },
    2: { label: "Water", color: "text-blue-500" },
    3: { label: "Wood", color: "text-green-500" },
    4: { label: "Metal", color: "text-yellow-500" },
    5: { label: "Earth", color: "text-amber-700" },
}

function PetCard({ pet, onClick }: { pet: PetData; onClick: () => void }) {
    const el = ELEMENT_LABELS[pet.element] ?? ELEMENT_LABELS[0]
    const bound = String(pet.binded ?? "0") !== "0"

    return (
        <TooltipProvider delayDuration={150}>
            <Tooltip>
                <TooltipTrigger asChild>
                    <button
                        type="button"
                        onClick={onClick}
                        className="group relative flex flex-col items-stretch gap-2 rounded-lg border-2 border-border/40 bg-gradient-to-br from-slate-800 to-slate-900 p-3 text-left transition hover:border-primary/60 hover:shadow-lg"
                    >
                        <div className="flex items-center justify-between gap-2">
                            <span className="truncate text-sm font-semibold text-slate-100">
                                {pet.petName}
                            </span>
                            <Badge variant="secondary" className="text-[10px]">
                                Lv {pet.level}
                            </Badge>
                        </div>
                        <div className={`text-xs ${el.color}`}>
                            ● {el.label}
                        </div>
                        <div className="flex aspect-square items-center justify-center rounded bg-slate-950/60 text-xs font-mono text-slate-400">
                            tpl #{pet.tid}
                        </div>
                        <div className="flex items-center justify-between text-[10px] text-muted-foreground">
                            <span className="flex items-center gap-0.5">
                                {Array.from({
                                    length: Math.min(5, pet.upgradeNum),
                                }).map((_, i) => (
                                    <Star
                                        key={i}
                                        className="h-3 w-3 fill-amber-400 text-amber-400"
                                    />
                                ))}
                                {pet.upgradeNum > 5 && (
                                    <span className="ml-1">
                                        +{pet.upgradeNum - 5}
                                    </span>
                                )}
                            </span>
                            {bound && (
                                <Badge
                                    variant="destructive"
                                    className="px-1 text-[10px]"
                                >
                                    Bound
                                </Badge>
                            )}
                        </div>
                    </button>
                </TooltipTrigger>
                <TooltipContent side="top" className="max-w-sm space-y-1">
                    <p className="font-semibold">
                        {pet.petName} (#{pet.id})
                    </p>
                    <p className="text-xs text-muted-foreground">
                        Lv {pet.level} · Exp {String(pet.exp)} · Stars{" "}
                        {pet.upgradeNum} · Evo {pet.evolutionLv}
                    </p>
                    <div className="grid grid-cols-2 gap-x-3 text-xs">
                        <span>
                            STR: {pet.aptStrength}
                            {pet.aptStrengthEx ? ` +${pet.aptStrengthEx}` : ""}
                        </span>
                        <span>
                            AGI: {pet.aptAgility}
                            {pet.aptAgilityEx ? ` +${pet.aptAgilityEx}` : ""}
                        </span>
                        <span>
                            STA: {pet.aptStamina}
                            {pet.aptStaminaEx ? ` +${pet.aptStaminaEx}` : ""}
                        </span>
                        <span>
                            INT: {pet.aptIntelligence}
                            {pet.aptIntelligenceEx
                                ? ` +${pet.aptIntelligenceEx}`
                                : ""}
                        </span>
                        <span>
                            ENG: {pet.aptEnergy}
                            {pet.aptEnergyEx ? ` +${pet.aptEnergyEx}` : ""}
                        </span>
                        <span>Grow: {Number(pet.growRate).toFixed(2)}</span>
                    </div>
                    <div className="flex items-center gap-3 text-xs pt-1">
                        <span className="flex items-center gap-1">
                            <Heart className="h-3 w-3 text-red-400" />
                            {pet.currentHp}/{pet.hpMax}
                        </span>
                        <span className="flex items-center gap-1">
                            <Zap className="h-3 w-3 text-blue-400" />
                            {pet.currentMp}/{pet.mpMax}
                        </span>
                    </div>
                </TooltipContent>
            </Tooltip>
        </TooltipProvider>
    )
}

type PetFormState = {
    name: string
    level: string
    experience: string
    upgradeNum: string
    evolutionLv: string
    aptStrength: string
    aptAgility: string
    aptStamina: string
    aptIntelligence: string
    aptEnergy: string
    aptStrengthEx: string
    aptAgilityEx: string
    aptStaminaEx: string
    aptIntelligenceEx: string
    aptEnergyEx: string
    element: string
    isFollowing?: boolean
    isBound?: boolean
}

function emptyForm(): PetFormState {
    return {
        name: "",
        level: "",
        experience: "",
        upgradeNum: "",
        evolutionLv: "",
        aptStrength: "",
        aptAgility: "",
        aptStamina: "",
        aptIntelligence: "",
        aptEnergy: "",
        aptStrengthEx: "",
        aptAgilityEx: "",
        aptStaminaEx: "",
        aptIntelligenceEx: "",
        aptEnergyEx: "",
        element: "",
    }
}

function PetEditDialog({
    playerId,
    pet,
    onClose,
    onChange,
}: {
    playerId: number
    pet: PetData | null
    onClose: () => void
    onChange: () => void
}) {
    const action = usePlayerAction(playerId)
    const [form, setForm] = useState<PetFormState>(emptyForm())

    if (!pet) return null

    const set = <K extends keyof PetFormState>(k: K, v: PetFormState[K]) =>
        setForm(prev => ({ ...prev, [k]: v }))

    const reset = () => {
        setForm(emptyForm())
    }

    const handleUpdate = () => {
        const payload: Record<string, unknown> = { petId: pet.id }
        if (form.name.trim()) payload.name = form.name.trim()
        const numericFields: Array<[keyof PetFormState, string]> = [
            ["level", "level"],
            ["upgradeNum", "upgradeNum"],
            ["evolutionLv", "evolutionLv"],
            ["aptStrength", "aptStrength"],
            ["aptAgility", "aptAgility"],
            ["aptStamina", "aptStamina"],
            ["aptIntelligence", "aptIntelligence"],
            ["aptEnergy", "aptEnergy"],
            ["aptStrengthEx", "aptStrengthEx"],
            ["aptAgilityEx", "aptAgilityEx"],
            ["aptStaminaEx", "aptStaminaEx"],
            ["aptIntelligenceEx", "aptIntelligenceEx"],
            ["aptEnergyEx", "aptEnergyEx"],
            ["element", "element"],
        ]
        for (const [formKey, payloadKey] of numericFields) {
            const n = toInt(form[formKey] as string)
            if (n !== undefined) payload[payloadKey] = n
        }
        if (form.experience !== "") {
            const n = Number(form.experience)
            if (Number.isFinite(n)) payload.experience = Math.trunc(n)
        }
        if (form.isFollowing !== undefined)
            payload.isFollowing = form.isFollowing
        if (form.isBound !== undefined) payload.isBound = form.isBound

        if (Object.keys(payload).length <= 1) {
            toast.error("No changes to apply")
            return
        }

        action.mutate(
            { action: "update_pet", payload },
            {
                onSuccess: () => {
                    onChange()
                    reset()
                    onClose()
                },
            }
        )
    }

    const handleDelete = () => {
        if (!confirm(`Delete pet ${pet.petName} (#${pet.id})?`)) return
        action.mutate(
            { action: "delete_pet", payload: { petId: pet.id } },
            {
                onSuccess: () => {
                    onChange()
                    reset()
                    onClose()
                },
            }
        )
    }

    return (
        <Dialog
            open={!!pet}
            onOpenChange={open => {
                if (!open) {
                    reset()
                    onClose()
                }
            }}
        >
            <DialogContent className="max-w-xl">
                <DialogHeader>
                    <DialogTitle>
                        {pet.petName}{" "}
                        <Badge variant="secondary">#{pet.id}</Badge>
                    </DialogTitle>
                </DialogHeader>

                <div className="grid grid-cols-2 gap-3 pt-2 sm:grid-cols-3">
                    <div className="col-span-2 space-y-1 sm:col-span-3">
                        <Label className="text-xs">Name</Label>
                        <Input
                            placeholder={pet.petName}
                            value={form.name}
                            onChange={e => set("name", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Level</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.level)}
                            value={form.level}
                            onChange={e => set("level", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Experience</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.exp)}
                            value={form.experience}
                            onChange={e => set("experience", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Stars</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.upgradeNum)}
                            value={form.upgradeNum}
                            onChange={e => set("upgradeNum", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Evolution</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.evolutionLv)}
                            value={form.evolutionLv}
                            onChange={e => set("evolutionLv", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Element</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.element)}
                            value={form.element}
                            onChange={e => set("element", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">STR</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptStrength)}
                            value={form.aptStrength}
                            onChange={e => set("aptStrength", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">AGI</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptAgility)}
                            value={form.aptAgility}
                            onChange={e => set("aptAgility", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">STA</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptStamina)}
                            value={form.aptStamina}
                            onChange={e => set("aptStamina", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">INT</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptIntelligence)}
                            value={form.aptIntelligence}
                            onChange={e =>
                                set("aptIntelligence", e.target.value)
                            }
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">ENG</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptEnergy)}
                            value={form.aptEnergy}
                            onChange={e => set("aptEnergy", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">STR+</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptStrengthEx)}
                            value={form.aptStrengthEx}
                            onChange={e => set("aptStrengthEx", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">AGI+</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptAgilityEx)}
                            value={form.aptAgilityEx}
                            onChange={e => set("aptAgilityEx", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">STA+</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptStaminaEx)}
                            value={form.aptStaminaEx}
                            onChange={e => set("aptStaminaEx", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">INT+</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptIntelligenceEx)}
                            value={form.aptIntelligenceEx}
                            onChange={e =>
                                set("aptIntelligenceEx", e.target.value)
                            }
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">ENG+</Label>
                        <Input
                            type="number"
                            placeholder={String(pet.aptEnergyEx)}
                            value={form.aptEnergyEx}
                            onChange={e => set("aptEnergyEx", e.target.value)}
                        />
                    </div>
                    <div className="col-span-2 flex items-center justify-between rounded-md border border-border/40 px-3 py-2 sm:col-span-3">
                        <Label className="text-xs">Bound</Label>
                        <Switch
                            checked={
                                form.isBound ??
                                String(pet.binded ?? "0") !== "0"
                            }
                            onCheckedChange={v => set("isBound", v)}
                        />
                    </div>
                </div>

                <DialogFooter className="gap-2 sm:justify-between">
                    <Button
                        variant="destructive"
                        size="sm"
                        onClick={handleDelete}
                        disabled={action.isPending}
                    >
                        <Trash2 className="mr-1 h-4 w-4" /> Delete
                    </Button>
                    <div className="flex gap-2">
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => {
                                reset()
                                onClose()
                            }}
                        >
                            <X className="mr-1 h-4 w-4" /> Cancel
                        </Button>
                        <Button
                            size="sm"
                            onClick={handleUpdate}
                            disabled={action.isPending}
                        >
                            Apply
                        </Button>
                    </div>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}

export function PetsTab({ playerId }: { playerId: number }) {
    const { data, isLoading, error, refetch } = usePlayerPets(playerId)
    const queryClient = useQueryClient()
    const [selected, setSelected] = useState<PetData | null>(null)

    const handleChange = () => {
        void refetch()
        void queryClient.invalidateQueries({
            queryKey: ["player-detail", String(playerId)],
        })
    }

    if (isLoading) {
        return (
            <div className="py-12 text-center text-muted-foreground">
                Loading pets...
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
    if (!data) return null

    return (
        <div className="space-y-4">
            <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-3">
                    <CardTitle className="text-base">Pets</CardTitle>
                    <Badge variant="secondary" className="font-mono">
                        {data.pets.length}/{data.petSlots}
                    </Badge>
                </CardHeader>
                <CardContent>
                    {data.pets.length === 0 ? (
                        <p className="py-6 text-center text-sm text-muted-foreground">
                            No pets.
                        </p>
                    ) : (
                        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5">
                            {data.pets.map(pet => (
                                <PetCard
                                    key={pet.id}
                                    pet={pet}
                                    onClick={() => setSelected(pet)}
                                />
                            ))}
                        </div>
                    )}
                    <p className="mt-3 text-xs text-muted-foreground">
                        Hover a pet for details. Click to edit or delete.
                    </p>
                </CardContent>
            </Card>

            <PetEditDialog
                playerId={playerId}
                pet={selected}
                onClose={() => setSelected(null)}
                onChange={handleChange}
            />
        </div>
    )
}
