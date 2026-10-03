"use client"

import { useCallback, useEffect, useState } from "react"
import { Save } from "lucide-react"
import { toast } from "sonner"

import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { getErrorMessage } from "@/services/api"
import {
    type SceneItemRow,
    sceneItemService,
} from "@/services/scene-item.service"

type EditPositionDialogProps = {
    item: SceneItemRow | null
    open: boolean
    onOpenChange: (open: boolean) => void
    onSaved: () => void
}

export function EditPositionDialog({
    item,
    open,
    onOpenChange,
    onSaved,
}: EditPositionDialogProps) {
    const [posX, setPosX] = useState(0)
    const [posY, setPosY] = useState(0)
    const [saving, setSaving] = useState(false)

    useEffect(() => {
        if (open && item) {
            setPosX(item.posX)
            setPosY(item.posY)
        }
    }, [open, item])

    const handleSave = useCallback(async () => {
        if (!item) return

        setSaving(true)
        try {
            await sceneItemService.updatePosition(item.id, posX, posY)
            toast.success(`Đã cập nhật vị trí #${item.id} → (${posX}, ${posY})`)
            onSaved()
            onOpenChange(false)
        } catch (err) {
            toast.error(getErrorMessage(err))
        } finally {
            setSaving(false)
        }
    }, [item, posX, posY, onSaved, onOpenChange])

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="max-w-md">
                <DialogHeader>
                    <DialogTitle className="flex items-center gap-2">
                        Chỉnh vị trí
                        {item ? (
                            <Badge variant="outline" className="font-mono">
                                #{item.id} {item.name}
                            </Badge>
                        ) : null}
                    </DialogTitle>
                </DialogHeader>

                {item ? (
                    <div className="space-y-4">
                        <div className="grid grid-cols-2 gap-4 text-sm text-muted-foreground">
                            <div>
                                Map ID:{" "}
                                <span className="font-mono text-foreground">
                                    {item.mapId}
                                </span>
                            </div>
                            <div>
                                Template:{" "}
                                <span className="font-mono text-foreground">
                                    {item.tid}
                                </span>
                            </div>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label htmlFor="pos-x">Pos X</Label>
                                <Input
                                    id="pos-x"
                                    type="number"
                                    value={posX}
                                    onChange={e =>
                                        setPosX(
                                            Math.max(
                                                0,
                                                Number(e.target.value) || 0
                                            )
                                        )
                                    }
                                    min={0}
                                />
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="pos-y">Pos Y</Label>
                                <Input
                                    id="pos-y"
                                    type="number"
                                    value={posY}
                                    onChange={e =>
                                        setPosY(
                                            Math.max(
                                                0,
                                                Number(e.target.value) || 0
                                            )
                                        )
                                    }
                                    min={0}
                                />
                            </div>
                        </div>

                        <Button
                            className="w-full"
                            onClick={() => void handleSave()}
                            disabled={saving}
                        >
                            <Save className="mr-2 h-4 w-4" />
                            {saving ? "Đang lưu..." : "Lưu vị trí"}
                        </Button>
                    </div>
                ) : null}
            </DialogContent>
        </Dialog>
    )
}
