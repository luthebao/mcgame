"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
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
import { Textarea } from "@/components/ui/textarea"

import {
    ELEMENT_OPTIONS,
    QILING_PROP_OPTIONS,
    buildDefaultPetStoneSlots,
    formatQilingValue,
    getElementLabel,
    getQilingPropLabel,
    getQilingTierMeta,
    type QilingDraftLine,
} from "../_lib/shared"

type SpecialFlagsCardProps = {
    sending: boolean
    supportsSublimationBuilder: boolean
    supportsQilingBuilder: boolean
    supportsPetFlag3: boolean
    sublimeId: string
    sublimeElement: string
    sublimeAdd: string
    qilingLines: QilingDraftLine[]
    petStoneSlots: boolean[]
    petStoneSkillId: string
    generatedFlag: string
    generatedFlag2: string
    generatedFlag3: string
    flagOverride: string
    flag2Override: string
    flag3Override: string
    rawProperties: string
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
}

function buildQilingPreview(line: QilingDraftLine): {
    text: string
    color: string
} {
    const propType = Number.parseInt(line.type || "0", 10)
    const value = Number.parseFloat(line.value || "0")
    const max = Number.parseFloat(line.max || "0")

    if (
        !Number.isFinite(propType) ||
        propType <= 0 ||
        !Number.isFinite(max) ||
        max <= 0
    ) {
        return {
            text: "Bo trong",
            color: "#94A3B8",
        }
    }

    const tier = getQilingTierMeta(Number.isFinite(value) ? value : 0, max)
    const fullSuffix = Number.isFinite(value) && value >= max ? " (Day)" : ""

    return {
        text: `${getQilingPropLabel(propType)}: ${formatQilingValue(propType, Number.isFinite(value) ? value : 0)}${fullSuffix}`,
        color: tier.color,
    }
}

function renderGeneratedValue(value: string): string {
    return value || "(khong tao tu form)"
}

export function SpecialFlagsCard({
    sending,
    supportsSublimationBuilder,
    supportsQilingBuilder,
    supportsPetFlag3,
    sublimeId,
    sublimeElement,
    sublimeAdd,
    qilingLines,
    petStoneSlots,
    petStoneSkillId,
    generatedFlag,
    generatedFlag2,
    generatedFlag3,
    flagOverride,
    flag2Override,
    flag3Override,
    rawProperties,
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
}: SpecialFlagsCardProps) {
    const normalizedPetStoneSlots =
        petStoneSlots.length > 0 ? petStoneSlots : buildDefaultPetStoneSlots()

    return (
        <Card>
            <CardHeader>
                <CardTitle>Flag dac biet</CardTitle>
                <p className="text-sm text-muted-foreground">
                    Client khong doc `flag` theo mot kieu duy nhat. Form nay uu
                    tien build san cho thang hoa, Ky Linh va pet stone, con o
                    duoi van giu raw override cho case dac biet.
                </p>
            </CardHeader>
            <CardContent className="flex flex-col gap-6">
                <div className="grid gap-6 2xl:grid-cols-2">
                    <div className="flex flex-col gap-4 rounded-xl border p-4">
                        <div className="flex flex-col gap-1">
                            <p className="font-medium">flag / Thang hoa</p>
                            <p className="text-sm text-muted-foreground">
                                Dung cho equipment thuong va pet equip. Truong
                                hop than khi o vi tri 15-20 co format rieng, nen
                                luc do ban nen paste raw override.
                            </p>
                        </div>

                        {supportsSublimationBuilder ? (
                            <>
                                <div className="grid gap-3 md:grid-cols-3">
                                    <div className="flex flex-col gap-2">
                                        <Label htmlFor="send-sublime-id">
                                            Moc thang hoa
                                        </Label>
                                        <Input
                                            id="send-sublime-id"
                                            type="number"
                                            min={0}
                                            value={sublimeId}
                                            onChange={event =>
                                                onSublimeIdChange(
                                                    event.target.value
                                                )
                                            }
                                            disabled={sending}
                                        />
                                    </div>

                                    <div className="flex flex-col gap-2">
                                        <Label htmlFor="send-sublime-element">
                                            Nguyen to
                                        </Label>
                                        <Select
                                            value={sublimeElement || "0"}
                                            onValueChange={
                                                onSublimeElementChange
                                            }
                                            disabled={sending}
                                        >
                                            <SelectTrigger id="send-sublime-element">
                                                <SelectValue placeholder="Chon nguyen to" />
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
                                                                {option.label} (
                                                                {option.value})
                                                            </SelectItem>
                                                        )
                                                    )}
                                                </SelectGroup>
                                            </SelectContent>
                                        </Select>
                                    </div>

                                    <div className="flex flex-col gap-2">
                                        <Label htmlFor="send-sublime-add">
                                            Bonus ti le (%)
                                        </Label>
                                        <Input
                                            id="send-sublime-add"
                                            type="number"
                                            min={0}
                                            step="0.001"
                                            value={sublimeAdd}
                                            onChange={event =>
                                                onSublimeAddChange(
                                                    event.target.value
                                                )
                                            }
                                            disabled={sending}
                                        />
                                    </div>
                                </div>

                                <div className="rounded-lg bg-muted/40 p-3 text-sm text-muted-foreground">{`Element hien tai: ${getElementLabel(Number.parseInt(sublimeElement || "0", 10) || 0)} | sublimeAdd duoc client cong vao ti le thanh cong o panel thang hoa.`}</div>
                            </>
                        ) : (
                            <div className="rounded-lg border border-dashed px-3 py-4 text-sm text-muted-foreground">
                                Item nay dung `flag` theo format rieng cua than
                                khi/phap bao. Form tren khong tu generate cho
                                no, ban hay dung raw override ben duoi.
                            </div>
                        )}

                        <div className="flex flex-col gap-2">
                            <Label htmlFor="generated-flag">
                                Chuoi raw sinh ra
                            </Label>
                            <Textarea
                                id="generated-flag"
                                value={renderGeneratedValue(generatedFlag)}
                                readOnly
                                className="min-h-[88px] font-mono text-xs"
                            />
                        </div>
                    </div>

                    <div className="flex flex-col gap-4 rounded-xl border p-4">
                        <div className="flex flex-col gap-1">
                            <p className="font-medium">flag2 / Ky Linh</p>
                            <p className="text-sm text-muted-foreground">
                                Client doc 3 dong `0..2`, moi dong gom `t` la
                                thuoc tinh, `v` la gia tri hien tai, `max` la
                                tran toi da.
                            </p>
                        </div>

                        {supportsQilingBuilder ? (
                            <div className="flex flex-col gap-3">
                                {qilingLines.map((line, index) => {
                                    const preview = buildQilingPreview(line)
                                    return (
                                        <div
                                            key={line.slot}
                                            className="grid gap-3 rounded-lg border p-3 xl:grid-cols-[minmax(0,1.2fr)_minmax(0,0.8fr)_minmax(0,0.8fr)]"
                                        >
                                            <div className="flex flex-col gap-2">
                                                <Label>{`Dong ${index + 1}`}</Label>
                                                <Select
                                                    value={line.type || "0"}
                                                    onValueChange={value =>
                                                        onQilingLineChange(
                                                            index,
                                                            "type",
                                                            value
                                                        )
                                                    }
                                                    disabled={sending}
                                                >
                                                    <SelectTrigger>
                                                        <SelectValue placeholder="Chon thuoc tinh Ky Linh" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        <SelectGroup>
                                                            <SelectItem value="0">
                                                                Bo trong
                                                            </SelectItem>
                                                            {QILING_PROP_OPTIONS.map(
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
                                                <div
                                                    className="rounded-md bg-muted/40 px-3 py-2 text-xs font-medium"
                                                    style={{
                                                        color: preview.color,
                                                    }}
                                                >
                                                    {preview.text}
                                                </div>
                                            </div>

                                            <div className="flex flex-col gap-2">
                                                <Label>Gia tri hien tai</Label>
                                                <Input
                                                    type="number"
                                                    min={0}
                                                    step="0.001"
                                                    value={line.value}
                                                    onChange={event =>
                                                        onQilingLineChange(
                                                            index,
                                                            "value",
                                                            event.target.value
                                                        )
                                                    }
                                                    disabled={sending}
                                                />
                                            </div>

                                            <div className="flex flex-col gap-2">
                                                <Label>Tran toi da</Label>
                                                <Input
                                                    type="number"
                                                    min={0}
                                                    step="0.001"
                                                    value={line.max}
                                                    onChange={event =>
                                                        onQilingLineChange(
                                                            index,
                                                            "max",
                                                            event.target.value
                                                        )
                                                    }
                                                    disabled={sending}
                                                />
                                            </div>
                                        </div>
                                    )
                                })}
                            </div>
                        ) : (
                            <div className="rounded-lg border border-dashed px-3 py-4 text-sm text-muted-foreground">
                                Builder nay chi hop voi equipment kind 1-4 va
                                req level tren 150. Cac item khac van co the
                                dung raw override.
                            </div>
                        )}

                        <div className="flex flex-col gap-2">
                            <Label htmlFor="generated-flag-2">
                                Chuoi raw sinh ra
                            </Label>
                            <Textarea
                                id="generated-flag-2"
                                value={renderGeneratedValue(generatedFlag2)}
                                readOnly
                                className="min-h-[88px] font-mono text-xs"
                            />
                        </div>
                    </div>
                </div>

                <div className="flex flex-col gap-4 rounded-xl border p-4">
                    <div className="flex flex-col gap-1">
                        <p className="font-medium">flag3 / Pet stone</p>
                        <p className="text-sm text-muted-foreground">
                            Client tooltip pet equip chi check co da o o 1..6,
                            va neu `flag3[1][2]` ton tai thi hien skill cua da o
                            thu nhat.
                        </p>
                    </div>

                    {supportsPetFlag3 ? (
                        <>
                            <div className="grid gap-3 md:grid-cols-3 xl:grid-cols-6">
                                {normalizedPetStoneSlots.map(
                                    (enabled, index) => (
                                        <div
                                            key={index}
                                            className="flex items-center justify-between rounded-lg border px-3 py-2"
                                        >
                                            <div className="flex flex-col gap-1">
                                                <span className="text-sm font-medium">{`O da ${index + 1}`}</span>
                                                <span className="text-xs text-muted-foreground">
                                                    Bat/tat
                                                </span>
                                            </div>
                                            <Switch
                                                checked={enabled}
                                                onCheckedChange={value =>
                                                    onPetStoneSlotChange(
                                                        index,
                                                        value
                                                    )
                                                }
                                                disabled={sending}
                                            />
                                        </div>
                                    )
                                )}
                            </div>

                            <div className="grid gap-3 md:grid-cols-[minmax(0,0.9fr)_minmax(0,1.3fr)]">
                                <div className="flex flex-col gap-2">
                                    <Label htmlFor="send-pet-stone-skill">
                                        Skill ID o da 1
                                    </Label>
                                    <Input
                                        id="send-pet-stone-skill"
                                        type="number"
                                        min={0}
                                        value={petStoneSkillId}
                                        onChange={event =>
                                            onPetStoneSkillIdChange(
                                                event.target.value
                                            )
                                        }
                                        disabled={sending}
                                    />
                                </div>
                                <div className="rounded-lg bg-muted/40 px-3 py-3 text-sm text-muted-foreground">
                                    Neu co skill ID, form se tu bat o da 1 va
                                    serialize vao `flag3[1][2]` de client hien
                                    dong `KN Bao Thach`.
                                </div>
                            </div>
                        </>
                    ) : (
                        <div className="rounded-lg border border-dashed px-3 py-4 text-sm text-muted-foreground">
                            flag3 chu yeu dung cho pet equip kind 9. Item hien
                            tai khong mo builder nay, nhung ban van co the paste
                            raw override neu can test.
                        </div>
                    )}

                    <div className="flex flex-col gap-2">
                        <Label htmlFor="generated-flag-3">
                            Chuoi raw sinh ra
                        </Label>
                        <Textarea
                            id="generated-flag-3"
                            value={renderGeneratedValue(generatedFlag3)}
                            readOnly
                            className="min-h-[88px] font-mono text-xs"
                        />
                    </div>
                </div>

                <div className="flex flex-col gap-4 rounded-xl border border-dashed p-4">
                    <div className="flex flex-col gap-1">
                        <p className="font-medium">Raw override</p>
                        <p className="text-sm text-muted-foreground">
                            Neu textbox duoi day co gia tri, API se uu tien
                            chuoi raw ban paste vao thay vi chuoi form tu sinh.
                        </p>
                    </div>

                    <div className="grid gap-4 xl:grid-cols-2">
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="send-flag-override">
                                flag raw override
                            </Label>
                            <Textarea
                                id="send-flag-override"
                                value={flagOverride}
                                onChange={event =>
                                    onFlagOverrideChange(event.target.value)
                                }
                                placeholder="{sublimeElement:1,sublimeAdd:0,sublimeId:50}"
                                disabled={sending}
                            />
                        </div>

                        <div className="flex flex-col gap-2">
                            <Label htmlFor="send-flag-2-override">
                                flag2 raw override
                            </Label>
                            <Textarea
                                id="send-flag-2-override"
                                value={flag2Override}
                                onChange={event =>
                                    onFlag2OverrideChange(event.target.value)
                                }
                                placeholder="{0:{t:60,v:0.025,max:0.025}}"
                                disabled={sending}
                            />
                        </div>

                        <div className="flex flex-col gap-2">
                            <Label htmlFor="send-flag-3-override">
                                flag3 raw override
                            </Label>
                            <Textarea
                                id="send-flag-3-override"
                                value={flag3Override}
                                onChange={event =>
                                    onFlag3OverrideChange(event.target.value)
                                }
                                placeholder="{1:[1,1,12345],2:[1]}"
                                disabled={sending}
                            />
                        </div>

                        <div className="flex flex-col gap-2">
                            <Label htmlFor="send-raw-properties">
                                Raw properties JSON
                            </Label>
                            <Textarea
                                id="send-raw-properties"
                                value={rawProperties}
                                onChange={event =>
                                    onRawPropertiesChange(event.target.value)
                                }
                                placeholder={'{"timeStamp":null}'}
                                className="min-h-[140px] font-mono text-xs"
                                disabled={sending}
                            />
                        </div>
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}
