"use client"

import * as React from "react"
import { format } from "date-fns"
import { Calendar as CalendarIcon } from "lucide-react"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Calendar } from "@/components/ui/calendar"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"

export interface DatePickerProps {
    value?: Date
    onChange?: (date: Date | undefined) => void
    placeholder?: string
}

export function DatePicker({
    value,
    onChange,
    placeholder = "Select date",
}: DatePickerProps) {
    const [open, setOpen] = React.useState(false)

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant={"outline"}
                    className={cn(
                        "w-full justify-start text-left font-normal",
                        !value && "text-muted-foreground"
                    )}
                >
                    <CalendarIcon className="mr-2 h-4 w-4" />
                    {value ? (
                        format(value, "dd/MM/yyyy")
                    ) : (
                        <span>{placeholder}</span>
                    )}
                </Button>
            </PopoverTrigger>
            <PopoverContent className="w-auto p-0" align="start">
                <Calendar
                    mode="single"
                    selected={value}
                    onSelect={date => {
                        onChange?.(date as Date)
                        setOpen(false)
                    }}
                    initialFocus
                />
            </PopoverContent>
        </Popover>
    )
}

export interface DateRangePickerProps {
    value?: { from?: Date; to?: Date }
    onChange?: (range: { from?: Date; to?: Date } | undefined) => void
    placeholder?: string
}

export function DateRangePicker({
    value,
    onChange,
    placeholder = "Select date range",
}: DateRangePickerProps) {
    const [open, setOpen] = React.useState(false)

    const selectedRange = React.useMemo(() => {
        if (!value?.from) return undefined
        return {
            from: value.from,
            to: value.to,
        }
    }, [value])

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant={"outline"}
                    className={cn(
                        "w-full justify-start text-left font-normal",
                        !value?.from && "text-muted-foreground"
                    )}
                >
                    <CalendarIcon className="mr-2 h-4 w-4" />
                    {value?.from ? (
                        value.to ? (
                            <>
                                {format(value.from, "dd/MM/yyyy")} -{" "}
                                {format(value.to, "dd/MM/yyyy")}
                            </>
                        ) : (
                            format(value.from, "dd/MM/yyyy")
                        )
                    ) : (
                        <span>{placeholder}</span>
                    )}
                </Button>
            </PopoverTrigger>
            <PopoverContent className="w-auto p-0" align="start">
                <Calendar
                    mode="range"
                    selected={selectedRange}
                    onSelect={range => {
                        onChange?.(range)
                        if (range?.from && range?.to) {
                            setOpen(false)
                        }
                    }}
                    numberOfMonths={2}
                />
            </PopoverContent>
        </Popover>
    )
}
