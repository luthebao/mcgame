"use client"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Dialog, DialogContent, DialogFooter } from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import type { GemOption, ItemBrowserRow } from "@/services/item.service"

import {
    ELEMENT_OPTIONS,
    PRE_NAME_TYPE_OPTIONS,
    getElementLabel,
    getPreNameTypeLabel,
    type EditablePropLine,
    type QilingDraftLine,
} from "../_lib/shared"
import { CharacterPicker } from "./character-picker"
import { GemsCard } from "./gems-card"
import { PropertyLinesCard } from "./property-lines-card"
import { SendItemSidebar } from "./send-item-sidebar"
import { SpecialFlagsCard } from "./special-flags-card"

type SendItemDialogState = {
    open: boolean
    sending: boolean
    item: ItemBrowserRow | null
    playerId: string
    count: string
    advancedEnabled: boolean
    binded: boolean
    color: string
    strengthenLevel: string
    endureLeft: string
    endureMax: string
    maker: string
    element: string
    preNameType: string
    holeNum: string
    bindMainPropNum1: string
    bindMainPropNum2: string
    propsLines: EditablePropLine[]
    gems: string[]
    sublimeId: string
    sublimeElement: string
    sublimeAdd: string
    qilingLines: QilingDraftLine[]
    petStoneSlots: boolean[]
    petStoneSkillId: string
    flagOverride: string
    flag2Override: string
    flag3Override: string
    generatedFlag: string
    generatedFlag2: string
    generatedFlag3: string
    rawProperties: string
}

type SendItemDialogDerived = {
    supportsEquipmentOptions: boolean
    supportsSublimationBuilder: boolean
    supportsQilingBuilder: boolean
    supportsPetFlag3: boolean
    itemTypeLabel: string
    socketCount: number
    gemOptions: GemOption[]
    gemOptionsById: Map<number, GemOption>
    gemOptionsLoading: boolean
}

type SendItemDialogActions = {
    onOpenChange: (open: boolean) => void
    onPlayerIdChange: (value: string) => void
    onCountChange: (value: string) => void
    onAdvancedEnabledChange: (value: boolean) => void
    onBindedChange: (value: boolean) => void
    onColorChange: (value: string) => void
    onStrengthenLevelChange: (value: string) => void
    onEndureLeftChange: (value: string) => void
    onEndureMaxChange: (value: string) => void
    onMakerChange: (value: string) => void
    onElementChange: (value: string) => void
    onPreNameTypeChange: (value: string) => void
    onHoleNumChange: (value: string) => void
    onBindMainPropNum1Change: (value: string) => void
    onBindMainPropNum2Change: (value: string) => void
    onUpdatePropLine: (
        index: number,
        field: "type" | "value",
        value: string
    ) => void
    onUpdateGemValue: (index: number, value: string) => void
    onSublimeIdChange: (value: string) => void
    onSublimeElementChange: (value: string) => void
    onSublimeAddChange: (value: string) => void
    onQilingLineChange: (
        index: number,
        field: "type" | "value" | "max",
        value: string
    ) => void
    onPetStoneSlotChange: (index: number, value: boolean) => void
    onPetStoneSkillIdChange: (value: string) => void
    onFlagOverrideChange: (value: string) => void
    onFlag2OverrideChange: (value: string) => void
    onFlag3OverrideChange: (value: string) => void
    onRawPropertiesChange: (value: string) => void
    onSubmit: () => void
}

export type SendItemDialogProps = {
    state: SendItemDialogState
    derived: SendItemDialogDerived
    actions: SendItemDialogActions
}

export function SendItemDialog({
    state,
    derived,
    actions,
}: SendItemDialogProps) {
    const {
        open,
        sending,
        item,
        playerId,
        count,
        advancedEnabled,
        binded,
        color,
        strengthenLevel,
        endureLeft,
        endureMax,
        maker,
        element,
        preNameType,
        holeNum,
        bindMainPropNum1,
        bindMainPropNum2,
        propsLines,
        gems,
        sublimeId,
        sublimeElement,
        sublimeAdd,
        qilingLines,
        petStoneSlots,
        petStoneSkillId,
        flagOverride,
        flag2Override,
        flag3Override,
        generatedFlag,
        generatedFlag2,
        generatedFlag3,
        rawProperties,
    } = state

    const {
        supportsEquipmentOptions,
        supportsSublimationBuilder,
        supportsQilingBuilder,
        supportsPetFlag3,
        itemTypeLabel,
        socketCount,
        gemOptions,
        gemOptionsById,
        gemOptionsLoading,
    } = derived

    const {
        onOpenChange,
        onPlayerIdChange,
        onCountChange,
        onAdvancedEnabledChange,
        onBindedChange,
        onColorChange,
        onStrengthenLevelChange,
        onEndureLeftChange,
        onEndureMaxChange,
        onMakerChange,
        onElementChange,
        onPreNameTypeChange,
        onHoleNumChange,
        onBindMainPropNum1Change,
        onBindMainPropNum2Change,
        onUpdatePropLine,
        onUpdateGemValue,
        onSublimeIdChange,
        onSublimeElementChange,
        onSublimeAddChange,
        onQilingLineChange,
        onPetStoneSlotChange,
        onPetStoneSkillIdChange,
        onFlagOverrideChange,
        onFlag2OverrideChange,
        onFlag3OverrideChange,
        onRawPropertiesChange,
        onSubmit,
    } = actions

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="h-[92vh] max-h-[92vh] w-[96vw] max-w-[1500px] gap-0 overflow-hidden p-0">
                <div className="grid h-full min-h-0 lg:grid-cols-[340px_minmax(0,1fr)]">
                    <div className="flex min-h-0 flex-col gap-4 overflow-y-auto bg-muted/30 p-6">
                        <SendItemSidebar
                            item={item}
                            supportsEquipmentOptions={supportsEquipmentOptions}
                            itemTypeLabel={itemTypeLabel}
                        />
                    </div>

                    <div className="flex min-h-0 flex-col">
                        <div className="flex-1 overflow-y-auto p-6">
                            <div className="flex flex-col gap-6">
                                <Card>
                                    <CardHeader>
                                        <CardTitle>Send info</CardTitle>
                                    </CardHeader>
                                    <CardContent className="grid gap-4 md:grid-cols-2">
                                        <div className="flex flex-col gap-2">
                                            <Label>Character</Label>
                                            <CharacterPicker
                                                value={playerId}
                                                onChange={onPlayerIdChange}
                                                disabled={sending}
                                            />
                                        </div>

                                        <div className="flex flex-col gap-2">
                                            <Label htmlFor="send-item-count">
                                                Quantity
                                            </Label>
                                            <Input
                                                id="send-item-count"
                                                type="number"
                                                min={1}
                                                value={count}
                                                onChange={event =>
                                                    onCountChange(
                                                        event.target.value
                                                    )
                                                }
                                                placeholder="1"
                                                disabled={sending}
                                            />
                                        </div>
                                    </CardContent>
                                </Card>

                                {supportsEquipmentOptions ? (
                                    <>
                                        <Card>
                                            <CardHeader className="flex flex-row items-start justify-between gap-4">
                                                <div className="flex flex-col gap-1">
                                                    <CardTitle>
                                                        Customize instance
                                                    </CardTitle>
                                                    <p className="text-sm text-muted-foreground">
                                                        This form maps to client
                                                        fields in `TipEquip.as`:
                                                        `binded`, `upgradeNum`,
                                                        `preNameType`, `flag`,
                                                        `flag2`, `holeNum`,
                                                        `t1..t10`, `endureLeft`.
                                                    </p>
                                                </div>
                                                <div className="flex items-center gap-3">
                                                    <span className="text-sm font-medium">
                                                        Enable custom
                                                    </span>
                                                    <Switch
                                                        checked={
                                                            advancedEnabled
                                                        }
                                                        onCheckedChange={
                                                            onAdvancedEnabledChange
                                                        }
                                                        disabled={sending}
                                                    />
                                                </div>
                                            </CardHeader>
                                            <CardContent className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                                                <div className="flex items-center justify-between rounded-xl border px-3 py-2">
                                                    <div className="flex flex-col gap-1">
                                                        <Label htmlFor="send-binded">
                                                            Binded
                                                        </Label>
                                                        <p className="text-xs text-muted-foreground">
                                                            Maps to `is_bound`
                                                            and `inst.binded`
                                                        </p>
                                                    </div>
                                                    <Switch
                                                        id="send-binded"
                                                        checked={binded}
                                                        onCheckedChange={
                                                            onBindedChange
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-color">
                                                        Color
                                                    </Label>
                                                    <Input
                                                        id="send-color"
                                                        type="number"
                                                        min={0}
                                                        value={color}
                                                        onChange={event =>
                                                            onColorChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-strengthen-level">
                                                        UpgradeNum
                                                    </Label>
                                                    <Input
                                                        id="send-strengthen-level"
                                                        type="number"
                                                        min={0}
                                                        value={strengthenLevel}
                                                        onChange={event =>
                                                            onStrengthenLevelChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-endure-left">
                                                        Endure left
                                                    </Label>
                                                    <Input
                                                        id="send-endure-left"
                                                        type="number"
                                                        min={0}
                                                        value={endureLeft}
                                                        onChange={event =>
                                                            onEndureLeftChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-endure-max">
                                                        Endure max
                                                    </Label>
                                                    <Input
                                                        id="send-endure-max"
                                                        type="number"
                                                        min={0}
                                                        value={endureMax}
                                                        onChange={event =>
                                                            onEndureMaxChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-maker">
                                                        Maker
                                                    </Label>
                                                    <Input
                                                        id="send-maker"
                                                        value={maker}
                                                        onChange={event =>
                                                            onMakerChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        placeholder="Crafter name"
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-element">
                                                        Element
                                                    </Label>
                                                    <Select
                                                        value={element || "0"}
                                                        onValueChange={
                                                            onElementChange
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    >
                                                        <SelectTrigger id="send-element">
                                                            <SelectValue placeholder="Select element" />
                                                        </SelectTrigger>
                                                        <SelectContent>
                                                            <SelectGroup>
                                                                {ELEMENT_OPTIONS.map(
                                                                    option => (
                                                                        <SelectItem
                                                                            key={
                                                                                option.value
                                                                            }
                                                                            value={String(
                                                                                option.value
                                                                            )}
                                                                        >
                                                                            {
                                                                                option.label
                                                                            }{" "}
                                                                            (
                                                                            {
                                                                                option.value
                                                                            }
                                                                            )
                                                                        </SelectItem>
                                                                    )
                                                                )}
                                                            </SelectGroup>
                                                        </SelectContent>
                                                    </Select>
                                                    <p className="text-xs text-muted-foreground">{`Selected: ${getElementLabel(Number.parseInt(element || "0", 10) || 0)}`}</p>
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-pre-name-type">
                                                        Pre name type
                                                    </Label>
                                                    <Select
                                                        value={
                                                            preNameType || "0"
                                                        }
                                                        onValueChange={
                                                            onPreNameTypeChange
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    >
                                                        <SelectTrigger id="send-pre-name-type">
                                                            <SelectValue placeholder="Select prefix" />
                                                        </SelectTrigger>
                                                        <SelectContent>
                                                            <SelectGroup>
                                                                {PRE_NAME_TYPE_OPTIONS.map(
                                                                    option => (
                                                                        <SelectItem
                                                                            key={
                                                                                option.value
                                                                            }
                                                                            value={String(
                                                                                option.value
                                                                            )}
                                                                        >
                                                                            {
                                                                                option.label
                                                                            }{" "}
                                                                            (
                                                                            {
                                                                                option.value
                                                                            }
                                                                            )
                                                                        </SelectItem>
                                                                    )
                                                                )}
                                                            </SelectGroup>
                                                        </SelectContent>
                                                    </Select>
                                                    <p className="text-xs text-muted-foreground">{`Selected: ${getPreNameTypeLabel(Number.parseInt(preNameType || "0", 10) || 0)}`}</p>
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-hole-num">
                                                        Hole num
                                                    </Label>
                                                    <Input
                                                        id="send-hole-num"
                                                        type="number"
                                                        min={0}
                                                        max={10}
                                                        value={holeNum}
                                                        onChange={event =>
                                                            onHoleNumChange(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-bind-main-prop-1">
                                                        Bind main prop 1
                                                    </Label>
                                                    <Input
                                                        id="send-bind-main-prop-1"
                                                        type="number"
                                                        min={0}
                                                        value={bindMainPropNum1}
                                                        onChange={event =>
                                                            onBindMainPropNum1Change(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Label htmlFor="send-bind-main-prop-2">
                                                        Bind main prop 2
                                                    </Label>
                                                    <Input
                                                        id="send-bind-main-prop-2"
                                                        type="number"
                                                        min={0}
                                                        value={bindMainPropNum2}
                                                        onChange={event =>
                                                            onBindMainPropNum2Change(
                                                                event.target
                                                                    .value
                                                            )
                                                        }
                                                        disabled={
                                                            sending ||
                                                            !advancedEnabled
                                                        }
                                                    />
                                                </div>
                                            </CardContent>
                                        </Card>

                                        {advancedEnabled ? (
                                            <div className="grid items-start gap-6 2xl:grid-cols-[minmax(0,1.2fr)_minmax(0,1fr)]">
                                                <PropertyLinesCard
                                                    sending={sending}
                                                    propsLines={propsLines}
                                                    onUpdatePropLine={
                                                        onUpdatePropLine
                                                    }
                                                />

                                                <div className="flex min-w-0 flex-col gap-6">
                                                    <GemsCard
                                                        socketCount={
                                                            socketCount
                                                        }
                                                        gems={gems}
                                                        gemOptions={gemOptions}
                                                        gemOptionsById={
                                                            gemOptionsById
                                                        }
                                                        gemOptionsLoading={
                                                            gemOptionsLoading
                                                        }
                                                        sending={sending}
                                                        onUpdateGemValue={
                                                            onUpdateGemValue
                                                        }
                                                    />

                                                    <SpecialFlagsCard
                                                        sending={sending}
                                                        supportsSublimationBuilder={
                                                            supportsSublimationBuilder
                                                        }
                                                        supportsQilingBuilder={
                                                            supportsQilingBuilder
                                                        }
                                                        supportsPetFlag3={
                                                            supportsPetFlag3
                                                        }
                                                        sublimeId={sublimeId}
                                                        sublimeElement={
                                                            sublimeElement
                                                        }
                                                        sublimeAdd={sublimeAdd}
                                                        qilingLines={
                                                            qilingLines
                                                        }
                                                        petStoneSlots={
                                                            petStoneSlots
                                                        }
                                                        petStoneSkillId={
                                                            petStoneSkillId
                                                        }
                                                        generatedFlag={
                                                            generatedFlag
                                                        }
                                                        generatedFlag2={
                                                            generatedFlag2
                                                        }
                                                        generatedFlag3={
                                                            generatedFlag3
                                                        }
                                                        flagOverride={
                                                            flagOverride
                                                        }
                                                        flag2Override={
                                                            flag2Override
                                                        }
                                                        flag3Override={
                                                            flag3Override
                                                        }
                                                        rawProperties={
                                                            rawProperties
                                                        }
                                                        onSublimeIdChange={
                                                            onSublimeIdChange
                                                        }
                                                        onSublimeElementChange={
                                                            onSublimeElementChange
                                                        }
                                                        onSublimeAddChange={
                                                            onSublimeAddChange
                                                        }
                                                        onQilingLineChange={
                                                            onQilingLineChange
                                                        }
                                                        onPetStoneSlotChange={
                                                            onPetStoneSlotChange
                                                        }
                                                        onPetStoneSkillIdChange={
                                                            onPetStoneSkillIdChange
                                                        }
                                                        onFlagOverrideChange={
                                                            onFlagOverrideChange
                                                        }
                                                        onFlag2OverrideChange={
                                                            onFlag2OverrideChange
                                                        }
                                                        onFlag3OverrideChange={
                                                            onFlag3OverrideChange
                                                        }
                                                        onRawPropertiesChange={
                                                            onRawPropertiesChange
                                                        }
                                                    />
                                                </div>
                                            </div>
                                        ) : (
                                            <Card>
                                                <CardContent className="pt-6">
                                                    <div className="rounded-xl border border-dashed px-3 py-4 text-sm text-muted-foreground">
                                                        Custom options are
                                                        disabled. The item will
                                                        be sent as-is from the
                                                        template. Stackable
                                                        items will be stacked
                                                        into existing slots when
                                                        possible.
                                                    </div>
                                                </CardContent>
                                            </Card>
                                        )}
                                    </>
                                ) : (
                                    <Card>
                                        <CardContent className="pt-6">
                                            <div className="rounded-xl border border-dashed px-3 py-4 text-sm text-muted-foreground">
                                                This item does not support
                                                custom options. It will be sent
                                                using the template defaults and
                                                stacked into existing slots when
                                                possible.
                                            </div>
                                        </CardContent>
                                    </Card>
                                )}
                            </div>
                        </div>

                        <div className="border-t p-6">
                            <DialogFooter>
                                <Button
                                    type="button"
                                    variant="outline"
                                    onClick={() => onOpenChange(false)}
                                    disabled={sending}
                                >
                                    Cancel
                                </Button>
                                <Button
                                    type="button"
                                    onClick={() => void onSubmit()}
                                    disabled={sending || !item}
                                >
                                    {sending ? "Sending..." : "Send item"}
                                </Button>
                            </DialogFooter>
                        </div>
                    </div>
                </div>
            </DialogContent>
        </Dialog>
    )
}
