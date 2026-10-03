"use client"

import { memo } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"

export type CounterEntryDraft = {
    id: string
    value: string
}

export type CounterEditorOption = {
    id: string
    label: string
}

export function CounterOverviewSection({
    title,
    description,
    entries,
    formatPrimary,
    formatSecondary,
    formatValue,
    emptyLabel,
}: {
    title: string
    description: string
    entries: Array<[string, number]>
    formatPrimary: (id: string) => string
    formatSecondary: (id: string) => string
    formatValue: (value: number) => string
    emptyLabel: string
}) {
    return (
        <div className="space-y-3 rounded-lg border border-border/60 bg-muted/10 p-4">
            <div className="space-y-1">
                <h3 className="text-sm font-semibold">{title}</h3>
                <p className="text-xs text-muted-foreground">{description}</p>
            </div>
            {entries.length === 0 ? (
                <p className="rounded-md border border-dashed border-border/60 px-3 py-4 text-sm text-muted-foreground">
                    {emptyLabel}
                </p>
            ) : (
                <div className="max-h-[26rem] space-y-2 overflow-y-auto pr-1">
                    {entries.map(([id, value]) => {
                        const secondary = formatSecondary(id)
                        return (
                            <div
                                key={id}
                                className="flex items-start justify-between gap-4 rounded-md border border-border/60 bg-background/70 px-3 py-2"
                            >
                                <div className="space-y-1">
                                    <p className="text-sm font-medium">
                                        {formatPrimary(id)}
                                    </p>
                                    {secondary ? (
                                        <p className="text-xs text-muted-foreground">
                                            {secondary}
                                        </p>
                                    ) : null}
                                </div>
                                <div className="shrink-0 rounded-md bg-muted px-2 py-1 text-sm font-medium">
                                    {formatValue(value)}
                                </div>
                            </div>
                        )
                    })}
                </div>
            )}
        </div>
    )
}

const CounterEditorRow = memo(function CounterEditorRow({
    entry,
    index,
    valueLabel,
    valueHint,
    selectPlaceholder,
    options,
    formatSecondary,
    onChange,
    onRemove,
    fallbackInputLabel,
}: {
    entry: CounterEntryDraft
    index: number
    valueLabel: string
    valueHint: string
    selectPlaceholder: string
    options: CounterEditorOption[]
    formatSecondary: (id: string) => string
    onChange: (index: number, patch: Partial<CounterEntryDraft>) => void
    onRemove: (index: number) => void
    fallbackInputLabel: string
}) {
    const secondary = formatSecondary(entry.id)
    const selectedValue = entry.id.trim() || undefined

    return (
        <div className="grid gap-3 rounded-md border border-border/60 bg-background/70 p-3 lg:grid-cols-[minmax(0,1fr)_140px_auto]">
            <div className="space-y-1">
                <Label className="text-xs">{selectPlaceholder}</Label>
                {options.length > 0 ? (
                    <Select
                        value={selectedValue}
                        onValueChange={value => onChange(index, { id: value })}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder={selectPlaceholder} />
                        </SelectTrigger>
                        <SelectContent>
                            {options.map(option => (
                                <SelectItem key={option.id} value={option.id}>
                                    {option.label}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                ) : (
                    <Input
                        type="number"
                        min={0}
                        placeholder={fallbackInputLabel}
                        value={entry.id}
                        onChange={event =>
                            onChange(index, { id: event.target.value })
                        }
                    />
                )}
                {secondary ? (
                    <p className="text-[11px] text-muted-foreground">
                        {secondary}
                    </p>
                ) : null}
            </div>
            <div className="space-y-1">
                <Label className="text-xs">{valueLabel}</Label>
                <Input
                    type="number"
                    min={0}
                    value={entry.value}
                    onChange={event =>
                        onChange(index, { value: event.target.value })
                    }
                />
                <p className="text-[11px] text-muted-foreground">{valueHint}</p>
            </div>
            <div className="flex items-end">
                <Button
                    variant="outline"
                    size="sm"
                    onClick={() => onRemove(index)}
                >
                    Remove
                </Button>
            </div>
        </div>
    )
})

export const CounterEditorSection = memo(function CounterEditorSection({
    title,
    description,
    emptyLabel,
    valueLabel,
    valueHint,
    selectPlaceholder,
    entries,
    options,
    formatSecondary,
    onAdd,
    onChange,
    onRemove,
    fallbackInputLabel,
}: {
    title: string
    description: string
    emptyLabel: string
    valueLabel: string
    valueHint: string
    selectPlaceholder: string
    entries: CounterEntryDraft[]
    options: CounterEditorOption[]
    formatSecondary: (id: string) => string
    onAdd: () => void
    onChange: (index: number, patch: Partial<CounterEntryDraft>) => void
    onRemove: (index: number) => void
    fallbackInputLabel: string
}) {
    return (
        <div className="space-y-3 rounded-lg border border-border/60 bg-muted/10 p-4">
            <div className="flex items-start justify-between gap-3">
                <div className="space-y-1">
                    <h3 className="text-sm font-semibold">{title}</h3>
                    <p className="text-xs text-muted-foreground">
                        {description}
                    </p>
                </div>
                <Button variant="outline" size="sm" onClick={onAdd}>
                    Add row
                </Button>
            </div>
            {entries.length === 0 ? (
                <p className="rounded-md border border-dashed border-border/60 px-3 py-4 text-sm text-muted-foreground">
                    {emptyLabel}
                </p>
            ) : (
                <div className="max-h-[28rem] space-y-3 overflow-y-auto pr-1">
                    {entries.map((entry, index) => (
                        <CounterEditorRow
                            key={`${title}-${index}`}
                            entry={entry}
                            index={index}
                            valueLabel={valueLabel}
                            valueHint={valueHint}
                            selectPlaceholder={selectPlaceholder}
                            options={options}
                            formatSecondary={formatSecondary}
                            onChange={onChange}
                            onRemove={onRemove}
                            fallbackInputLabel={fallbackInputLabel}
                        />
                    ))}
                </div>
            )}
        </div>
    )
})
