"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Label } from "@/components/ui/label"
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip"
import type { GemOption } from "@/services/item.service"

import { getGemOptionLabel } from "../_lib/shared"

type GemsCardProps = {
    socketCount: number
    gems: string[]
    gemOptions: GemOption[]
    gemOptionsById: Map<number, GemOption>
    gemOptionsLoading: boolean
    sending: boolean
    onUpdateGemValue: (index: number, value: string) => void
}

export function GemsCard({
    socketCount,
    gems,
    gemOptions,
    gemOptionsById,
    gemOptionsLoading,
    sending,
    onUpdateGemValue,
}: GemsCardProps) {
    return (
        <Card className="min-w-0">
            <CardHeader>
                <CardTitle>Embedded Gems</CardTitle>
            </CardHeader>
            <CardContent>
                {socketCount > 0 ? (
                    <div className="grid gap-3 sm:grid-cols-2">
                        {gems.map((gemValue, index) => (
                            <div
                                key={`gem-${index}`}
                                className="flex flex-col gap-2"
                            >
                                <Label htmlFor={`send-gem-${index}`}>
                                    Socket {index + 1}
                                </Label>
                                <Select
                                    value={gemValue || "__none__"}
                                    onValueChange={value =>
                                        onUpdateGemValue(
                                            index,
                                            value === "__none__" ? "" : value
                                        )
                                    }
                                    disabled={sending || gemOptionsLoading}
                                >
                                    <Tooltip>
                                        <TooltipTrigger asChild>
                                            <SelectTrigger
                                                id={`send-gem-${index}`}
                                                className="w-full min-w-0"
                                            >
                                                <SelectValue
                                                    placeholder={
                                                        gemOptionsLoading
                                                            ? "Loading gem list..."
                                                            : "Select gem"
                                                    }
                                                />
                                            </SelectTrigger>
                                        </TooltipTrigger>
                                        <TooltipContent className="max-w-md">
                                            {gemValue
                                                ? (() => {
                                                      const selectedGem =
                                                          gemOptionsById.get(
                                                              Number.parseInt(
                                                                  gemValue,
                                                                  10
                                                              )
                                                          )
                                                      return selectedGem
                                                          ? getGemOptionLabel(
                                                                selectedGem
                                                            )
                                                          : `Gem #${gemValue}`
                                                  })()
                                                : gemOptionsLoading
                                                  ? "Loading gem list..."
                                                  : "Select gem"}
                                        </TooltipContent>
                                    </Tooltip>
                                    <SelectContent>
                                        <SelectGroup>
                                            <SelectItem value="__none__">
                                                No gem
                                            </SelectItem>
                                            {gemOptions.map(gem => (
                                                <SelectItem
                                                    key={gem.itemId}
                                                    value={String(gem.itemId)}
                                                >
                                                    {getGemOptionLabel(gem)}
                                                </SelectItem>
                                            ))}
                                        </SelectGroup>
                                    </SelectContent>
                                </Select>
                            </div>
                        ))}
                    </div>
                ) : (
                    <div className="rounded-xl border border-dashed px-3 py-4 text-sm text-muted-foreground">
                        This template has no sockets for embedding gems.
                    </div>
                )}
            </CardContent>
        </Card>
    )
}
