"use client"

import Image from "next/image"

import { Badge } from "@/components/ui/badge"
import {
    DialogDescription,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"
import { Separator } from "@/components/ui/separator"
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import type { ItemBrowserRow } from "@/services/item.service"

import {
    getBindTypeLabel,
    getKindLabel,
    getPropTypeLabel,
    getTemplateTableLabel,
    getTradableLabel,
    getUseTypeLabel,
} from "../_lib/shared"

type SendItemSidebarProps = {
    item: ItemBrowserRow | null
    supportsEquipmentOptions: boolean
    itemTypeLabel: string
}

function formatTemplateExpiry(value: number): string {
    if (value <= 0) {
        return "Permanent"
    }

    const raw = String(value)
    if (/^\d{12}$/.test(raw)) {
        return `${raw.slice(6, 8)}/${raw.slice(4, 6)}/${raw.slice(0, 4)} ${raw.slice(8, 10)}:${raw.slice(10, 12)}`
    }

    if (/^\d{14}$/.test(raw)) {
        return `${raw.slice(6, 8)}/${raw.slice(4, 6)}/${raw.slice(0, 4)} ${raw.slice(8, 10)}:${raw.slice(10, 12)}:${raw.slice(12, 14)}`
    }

    return `${value} min`
}

export function SendItemSidebar({
    item,
    supportsEquipmentOptions,
    itemTypeLabel,
}: SendItemSidebarProps) {
    if (!item) {
        return null
    }

    return (
        <>
            <DialogHeader className="gap-2 text-left">
                <DialogTitle>Send item to player</DialogTitle>
                <DialogDescription>{`Item #${item.itemId} - ${item.name}`}</DialogDescription>
            </DialogHeader>

            <div className="flex items-start gap-4 rounded-xl border bg-background p-4">
                {item.iconDataUrl ? (
                    <Image
                        className="size-20 rounded-lg object-cover"
                        src={item.iconDataUrl}
                        alt={`icon-${item.iconId}`}
                        width={80}
                        height={80}
                        unoptimized
                    />
                ) : (
                    <div className="flex size-20 items-center justify-center rounded-lg border bg-muted text-xs text-muted-foreground">
                        No icon
                    </div>
                )}

                <div className="flex min-w-0 flex-1 flex-col gap-3">
                    <div className="flex flex-wrap gap-2">
                        <Badge variant="outline">#{item.itemId}</Badge>
                        <Badge variant="secondary">{itemTypeLabel}</Badge>
                        {item.requiredLevel > 0 ? (
                            <Badge variant="outline">
                                Lv {item.requiredLevel}
                            </Badge>
                        ) : null}
                    </div>

                    <div>
                        <Tooltip>
                            <TooltipTrigger asChild>
                                <p className="truncate text-base font-semibold">
                                    {item.name}
                                </p>
                            </TooltipTrigger>
                            <TooltipContent>{item.name}</TooltipContent>
                        </Tooltip>
                        <p className="mt-1 text-sm text-muted-foreground">
                            {item.description ||
                                "No description available for this item."}
                        </p>
                    </div>
                </div>
            </div>

            <div className="grid gap-3 rounded-xl border bg-background p-4 text-sm">
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Type</span>
                    <span className="font-medium">{itemTypeLabel}</span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Source table</span>
                    <span className="font-medium">{`${getTemplateTableLabel(item.templateTableId, item.templateTableName)} (TBL ${item.templateTableId})`}</span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Max stack</span>
                    <span className="font-medium">{item.maxStack}</span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Template</span>
                    <span className="font-medium">{`Type ${item.templateType} | ${getKindLabel(item.kind)}`}</span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Use type</span>
                    <span className="font-medium">
                        {getUseTypeLabel(item.useType)}
                    </span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Binding</span>
                    <span className="font-medium">
                        {getBindTypeLabel(item.bindType)}
                    </span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Trade</span>
                    <span className="font-medium">
                        {getTradableLabel(item.tradable)}
                    </span>
                </div>
                <div className="flex items-center justify-between gap-4">
                    <span className="text-muted-foreground">Item level</span>
                    <span className="font-medium">
                        {item.templateLevel || "-"}
                    </span>
                </div>
                {supportsEquipmentOptions ? (
                    <>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Socket template
                            </span>
                            <span className="font-medium">
                                {item.meta.socketCount}
                            </span>
                        </div>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Bind prop template
                            </span>
                            <span className="font-medium">
                                {item.meta.bindPropNum}
                            </span>
                        </div>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Endure template
                            </span>
                            <span className="font-medium">
                                {item.meta.endureMax || "-"}
                            </span>
                        </div>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Set ID
                            </span>
                            <span className="font-medium">
                                {item.meta.setId || "-"}
                            </span>
                        </div>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Equip position
                            </span>
                            <span className="font-medium">
                                {item.meta.equipPosition || "-"}
                            </span>
                        </div>
                        <div className="flex items-center justify-between gap-4">
                            <span className="text-muted-foreground">
                                Expiry from template
                            </span>
                            <span className="font-medium">
                                {formatTemplateExpiry(item.meta.expireMinutes)}
                            </span>
                        </div>
                    </>
                ) : null}
            </div>

            {supportsEquipmentOptions ? (
                <>
                    <Separator />

                    <div className="flex flex-col gap-4">
                        <div className="rounded-xl border border-dashed bg-background p-4 text-sm text-muted-foreground">
                            New item sends go through the gameserver admin API.
                            If the character is online and in a map, the server
                            pushes `onAddCharactorSlot` immediately. If offline,
                            the item is saved to DB and received on next login.
                        </div>

                        <div className="flex flex-col gap-2">
                            <p className="text-sm font-medium">
                                Template attributes
                            </p>
                            {item.meta.stats.length > 0 ? (
                                <div className="flex flex-col gap-2 text-sm">
                                    {item.meta.stats.map(stat => (
                                        <div
                                            key={`${stat.type}-${stat.value}`}
                                            className="flex items-center justify-between gap-4 rounded-lg border bg-background px-3 py-2"
                                        >
                                            <span className="text-muted-foreground">
                                                {getPropTypeLabel(stat.type)}
                                            </span>
                                            <span className="font-medium">
                                                {stat.value.toLocaleString(
                                                    "en-US"
                                                )}
                                            </span>
                                        </div>
                                    ))}
                                </div>
                            ) : (
                                <div className="rounded-lg border border-dashed bg-background px-3 py-4 text-sm text-muted-foreground">
                                    This template has no preset property lines.
                                </div>
                            )}
                        </div>
                    </div>
                </>
            ) : (
                <div className="rounded-xl border border-dashed bg-background p-4 text-sm text-muted-foreground">
                    This item will be sent using the item template, prioritizing
                    stacking into existing slots if the same item and
                    bind/durability state match.
                </div>
            )}
        </>
    )
}
