"use client"

import * as React from "react"
import { DayPicker } from "react-day-picker"
import { vi } from "date-fns/locale"

import { cn } from "@/lib/utils"
import { buttonVariants } from "@/components/ui/button"

export type CalendarProps = React.ComponentProps<typeof DayPicker>

function Calendar({
    className,
    classNames,
    showOutsideDays = true,
    ...props
}: CalendarProps) {
    return (
        <DayPicker
            locale={vi}
            showOutsideDays={showOutsideDays}
            className={cn("p-3", className)}
            classNames={{
                root: "relative",
                months: "flex flex-col sm:flex-row space-y-4 sm:space-x-4 sm:space-y-0",
                month: "space-y-4",
                caption:
                    "relative flex items-center justify-center pt-1 w-full",
                caption_label: "truncate text-sm font-medium",
                nav: "flex items-center space-x-1",
                button_next: cn(
                    buttonVariants({ variant: "outline" }),
                    "absolute right-1 h-7 w-7 bg-transparent p-0 opacity-50 hover:opacity-100"
                ),
                button_previous: cn(
                    buttonVariants({ variant: "outline" }),
                    "absolute left-1 h-7 w-7 bg-transparent p-0 opacity-50 hover:opacity-100"
                ),
                month_grid: "w-full border-collapse space-y-1",
                weekdays: "flex",
                weekday:
                    "w-9 rounded-md font-normal text-[0.8rem] text-muted-foreground",
                week: "mt-2 flex w-full",
                day: cn(
                    "relative p-0 text-center text-sm focus-within:relative focus-within:z-20",
                    "h-9 w-9"
                ),
                day_button: cn(
                    buttonVariants({ variant: "ghost" }),
                    "h-9 w-9 p-0 font-normal"
                ),
                day_today: "bg-accent text-accent-foreground",
                day_outside: "text-muted-foreground opacity-50",
                day_selected:
                    "bg-primary text-primary-foreground hover:bg-primary hover:text-primary-foreground",
                day_disabled: "text-muted-foreground opacity-50",
                day_hidden: "invisible",
                ...classNames,
            }}
            components={{
                Chevron: ({
                    className: chevronClassName,
                    orientation = "right",
                }) => (
                    <span className={chevronClassName}>
                        {orientation === "left"
                            ? "<"
                            : orientation === "right"
                              ? ">"
                              : orientation === "up"
                                ? "^"
                                : "v"}
                    </span>
                ),
            }}
            {...props}
        />
    )
}

Calendar.displayName = "Calendar"

export { Calendar }
