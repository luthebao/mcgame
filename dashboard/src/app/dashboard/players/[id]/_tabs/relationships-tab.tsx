"use client"

import { useState } from "react"
import { useQueryClient } from "@tanstack/react-query"
import { Pencil, Trash2, X } from "lucide-react"
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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { usePlayerAction } from "@/hooks/use-player-detail"
import { useRelationships } from "@/hooks/use-relationships"
import {
    RELATIONSHIP_TYPES,
    type Relationship,
} from "@/types/player-management"
import { toInt } from "../_lib/numbers"

const EDITABLE_TYPES = RELATIONSHIP_TYPES.filter(t => t.value !== 1)

function typeLabel(type: number): string {
    return RELATIONSHIP_TYPES.find(t => t.value === type)?.label ?? String(type)
}

type EditFormState = {
    type: string
    intimacy: string
    nickname: string
    groupId: string
}

function RelationshipEditDialog({
    playerId,
    relationship,
    onClose,
    onChange,
}: {
    playerId: number
    relationship: Relationship | null
    onClose: () => void
    onChange: () => void
}) {
    const action = usePlayerAction(playerId)
    const [form, setForm] = useState<EditFormState>({
        type: "",
        intimacy: "",
        nickname: "",
        groupId: "",
    })

    if (!relationship) return null

    const set = <K extends keyof EditFormState>(k: K, v: EditFormState[K]) =>
        setForm(prev => ({ ...prev, [k]: v }))

    const reset = () =>
        setForm({ type: "", intimacy: "", nickname: "", groupId: "" })

    const handleSave = () => {
        const payload: Record<string, unknown> = {
            relationshipId: relationship.id,
        }
        const type = toInt(form.type)
        if (type !== undefined) payload.type = type
        const intimacy = toInt(form.intimacy)
        if (intimacy !== undefined) payload.intimacy = intimacy
        const groupId = toInt(form.groupId)
        if (groupId !== undefined) payload.groupId = groupId
        if (form.nickname !== "") payload.nickname = form.nickname

        if (Object.keys(payload).length <= 1) {
            toast.error("No changes to apply")
            return
        }

        action.mutate(
            { action: "set_relationship", payload },
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
            open={!!relationship}
            onOpenChange={open => {
                if (!open) {
                    reset()
                    onClose()
                }
            }}
        >
            <DialogContent className="max-w-md">
                <DialogHeader>
                    <DialogTitle>
                        {relationship.otherName} (#{relationship.otherId}){" "}
                        <Badge variant="secondary">
                            {typeLabel(relationship.type)}
                        </Badge>
                    </DialogTitle>
                </DialogHeader>

                <div className="grid grid-cols-2 gap-3 pt-2">
                    <div className="col-span-2 space-y-1">
                        <Label className="text-xs">Type</Label>
                        <Select
                            value={form.type}
                            onValueChange={v => set("type", v)}
                        >
                            <SelectTrigger>
                                <SelectValue
                                    placeholder={typeLabel(relationship.type)}
                                />
                            </SelectTrigger>
                            <SelectContent>
                                {EDITABLE_TYPES.map(t => (
                                    <SelectItem
                                        key={t.value}
                                        value={String(t.value)}
                                    >
                                        {t.label}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Intimacy</Label>
                        <Input
                            type="number"
                            placeholder={String(relationship.intimacy)}
                            value={form.intimacy}
                            onChange={e => set("intimacy", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Group ID</Label>
                        <Input
                            type="number"
                            placeholder={String(relationship.groupId)}
                            value={form.groupId}
                            onChange={e => set("groupId", e.target.value)}
                        />
                    </div>
                    <div className="col-span-2 space-y-1">
                        <Label className="text-xs">Nickname</Label>
                        <Input
                            placeholder={relationship.nickname}
                            value={form.nickname}
                            onChange={e => set("nickname", e.target.value)}
                        />
                    </div>
                </div>

                <DialogFooter className="gap-2 sm:justify-end">
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
                        onClick={handleSave}
                        disabled={action.isPending}
                    >
                        Apply
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}

type CreateFormState = {
    otherId: string
    otherName: string
    type: string
    groupId: string
    nickname: string
    intimacy: string
    mirror: boolean
}

function emptyCreateForm(): CreateFormState {
    return {
        otherId: "",
        otherName: "",
        type: "",
        groupId: "",
        nickname: "",
        intimacy: "",
        mirror: false,
    }
}

function CreateRelationshipCard({
    playerId,
    onChange,
}: {
    playerId: number
    onChange: () => void
}) {
    const action = usePlayerAction(playerId)
    const [form, setForm] = useState<CreateFormState>(emptyCreateForm())

    const set = <K extends keyof CreateFormState>(
        k: K,
        v: CreateFormState[K]
    ) => setForm(prev => ({ ...prev, [k]: v }))

    const mirrorDisabled = form.type === "1"

    const handleCreate = () => {
        const type = toInt(form.type)
        if (type === undefined) {
            toast.error("Type is required")
            return
        }
        const otherId = toInt(form.otherId)
        const otherName = form.otherName.trim()
        if (otherId === undefined && otherName === "") {
            toast.error("Provide an other ID or name")
            return
        }

        const payload: Record<string, unknown> = { type }
        if (otherId !== undefined) payload.otherId = otherId
        if (otherName !== "") payload.otherName = otherName
        const groupId = toInt(form.groupId)
        if (groupId !== undefined) payload.groupId = groupId
        if (form.nickname !== "") payload.nickname = form.nickname
        const intimacy = toInt(form.intimacy)
        if (intimacy !== undefined) payload.intimacy = intimacy
        if (form.mirror && !mirrorDisabled) payload.mirror = true

        action.mutate(
            { action: "set_relationship", payload },
            {
                onSuccess: () => {
                    onChange()
                    setForm(emptyCreateForm())
                },
            }
        )
    }

    return (
        <Card>
            <CardHeader className="pb-3">
                <CardTitle className="text-base">Create relationship</CardTitle>
            </CardHeader>
            <CardContent>
                <div className="grid grid-cols-2 gap-3">
                    <div className="space-y-1">
                        <Label className="text-xs">Other ID</Label>
                        <Input
                            type="number"
                            placeholder="character id"
                            value={form.otherId}
                            onChange={e => set("otherId", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Other Name</Label>
                        <Input
                            placeholder="character name"
                            value={form.otherName}
                            onChange={e => set("otherName", e.target.value)}
                        />
                    </div>
                    <div className="col-span-2 space-y-1">
                        <Label className="text-xs">Type</Label>
                        <Select
                            value={form.type}
                            onValueChange={v => set("type", v)}
                        >
                            <SelectTrigger>
                                <SelectValue placeholder="Select type" />
                            </SelectTrigger>
                            <SelectContent>
                                {RELATIONSHIP_TYPES.map(t => (
                                    <SelectItem
                                        key={t.value}
                                        value={String(t.value)}
                                    >
                                        {t.label}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Group ID</Label>
                        <Input
                            type="number"
                            placeholder="optional"
                            value={form.groupId}
                            onChange={e => set("groupId", e.target.value)}
                        />
                    </div>
                    <div className="space-y-1">
                        <Label className="text-xs">Intimacy</Label>
                        <Input
                            type="number"
                            placeholder="optional"
                            value={form.intimacy}
                            onChange={e => set("intimacy", e.target.value)}
                        />
                    </div>
                    <div className="col-span-2 space-y-1">
                        <Label className="text-xs">Nickname</Label>
                        <Input
                            placeholder="optional"
                            value={form.nickname}
                            onChange={e => set("nickname", e.target.value)}
                        />
                    </div>
                    <div className="col-span-2 flex items-center justify-between rounded-md border border-border/40 px-3 py-2">
                        <Label className="text-xs">
                            Tạo cả hai chiều (mirror)
                        </Label>
                        <Switch
                            checked={form.mirror && !mirrorDisabled}
                            disabled={mirrorDisabled}
                            onCheckedChange={v => set("mirror", v)}
                        />
                    </div>
                </div>
                <div className="flex justify-end pt-3">
                    <Button
                        size="sm"
                        onClick={handleCreate}
                        disabled={action.isPending}
                    >
                        Create
                    </Button>
                </div>
            </CardContent>
        </Card>
    )
}

export function RelationshipsTab({ playerId }: { playerId: number }) {
    const { data, isLoading, error } = useRelationships(playerId)
    const queryClient = useQueryClient()
    const [selected, setSelected] = useState<Relationship | null>(null)
    const action = usePlayerAction(playerId)

    const invalidate = () => {
        void queryClient.invalidateQueries({
            queryKey: ["relationships", String(playerId)],
        })
    }

    const handleDelete = (rel: Relationship) => {
        if (
            !confirm(
                `Delete relationship with ${rel.otherName} (#${rel.otherId})?`
            )
        )
            return
        action.mutate(
            {
                action: "delete_relationship",
                payload: { relationshipId: rel.id },
            },
            { onSuccess: invalidate }
        )
    }

    if (isLoading) {
        return (
            <div className="py-12 text-center text-muted-foreground">
                Loading relationships...
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

    const relationships = data ?? []

    return (
        <div className="space-y-4">
            <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-3">
                    <CardTitle className="text-base">Relationships</CardTitle>
                    <Badge variant="secondary" className="font-mono">
                        {relationships.length}
                    </Badge>
                </CardHeader>
                <CardContent>
                    {relationships.length === 0 ? (
                        <p className="py-6 text-center text-sm text-muted-foreground">
                            No relationships.
                        </p>
                    ) : (
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Type</TableHead>
                                    <TableHead>Other</TableHead>
                                    <TableHead>Group</TableHead>
                                    <TableHead>Nickname</TableHead>
                                    <TableHead>Intimacy</TableHead>
                                    <TableHead>Created</TableHead>
                                    <TableHead className="text-right">
                                        Actions
                                    </TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {relationships.map(rel => (
                                    <TableRow key={rel.id}>
                                        <TableCell>
                                            <Badge variant="secondary">
                                                {typeLabel(rel.type)}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            {rel.otherName} (#{rel.otherId})
                                        </TableCell>
                                        <TableCell>{rel.groupId}</TableCell>
                                        <TableCell>{rel.nickname}</TableCell>
                                        <TableCell>{rel.intimacy}</TableCell>
                                        <TableCell className="text-xs text-muted-foreground">
                                            {rel.createdAt}
                                        </TableCell>
                                        <TableCell className="text-right">
                                            <div className="flex justify-end gap-1">
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    onClick={() =>
                                                        setSelected(rel)
                                                    }
                                                >
                                                    <Pencil className="h-4 w-4" />
                                                </Button>
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    onClick={() =>
                                                        handleDelete(rel)
                                                    }
                                                    disabled={action.isPending}
                                                >
                                                    <Trash2 className="h-4 w-4 text-destructive" />
                                                </Button>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    )}
                </CardContent>
            </Card>

            <CreateRelationshipCard
                playerId={playerId}
                onChange={invalidate}
            />

            <RelationshipEditDialog
                playerId={playerId}
                relationship={selected}
                onClose={() => setSelected(null)}
                onChange={invalidate}
            />
        </div>
    )
}
