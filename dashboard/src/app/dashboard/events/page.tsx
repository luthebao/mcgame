"use client"

import { useState } from "react"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Switch } from "@/components/ui/switch"
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Slider } from "@/components/ui/slider"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import {
    Calendar,
    Clock,
    TrendingUp,
    Package,
    Plus,
    Edit,
    Trash2,
} from "lucide-react"
import { toast } from "sonner"
import { DatePicker } from "@/components/ui/date-picker"

// Constants
import { EVENT_TYPES, DAYS_OF_WEEK } from "@/constants/events"

// Hooks
import { useToggle } from "@/hooks/use-common"
import { useEventActions } from "@/hooks/use-actions"

// Types
import type { GameEvent } from "@/types"

export default function EventsPage() {
    // State
    const [events, setEvents] = useState<GameEvent[]>([])
    const [selectedEvent, setSelectedEvent] = useState<GameEvent | null>(null)
    const [isCreateDialogOpen, setIsCreateDialogOpen] = useToggle(false)
    const [isEditDialogOpen, setIsEditDialogOpen] = useToggle(false)
    const [eventStartDate, setEventStartDate] = useState<Date>()
    const [eventEndDate, setEventEndDate] = useState<Date>()

    // Actions
    const {
        toggleEventStatus: handleToggleEventStatus,
        createEvent,
        saveEvent,
        deleteEvent,
    } = useEventActions()

    // Handlers
    const toggleEventStatus = (eventId: string) => {
        handleToggleEventStatus(eventId, events, setEvents)
    }

    const handleCreateEvent = () => {
        createEvent()
        setIsCreateDialogOpen(false)
    }

    const handleSaveEvent = () => {
        saveEvent(selectedEvent?.name)
        setIsEditDialogOpen(false)
    }

    const handleDeleteEvent = (eventId: string, eventName: string) => {
        deleteEvent(eventName)
        setEvents(events.filter(e => e.id !== eventId))
        setIsEditDialogOpen(false)
    }

    const handleSelectEvent = (event: GameEvent) => {
        setSelectedEvent(event)
        if (event.startTime) setEventStartDate(new Date(event.startTime))
        if (event.endTime) setEventEndDate(new Date(event.endTime))
        setIsEditDialogOpen(true)
    }

    const getEventColor = (type: keyof typeof EVENT_TYPES) =>
        EVENT_TYPES[type].color
    const getEventLabel = (type: keyof typeof EVENT_TYPES) =>
        EVENT_TYPES[type].label

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-end">
                <Dialog
                    open={isCreateDialogOpen}
                    onOpenChange={setIsCreateDialogOpen}
                >
                    <DialogTrigger asChild>
                        <Button>
                            <Plus className="h-4 w-4 mr-2" />
                            Create new event
                        </Button>
                    </DialogTrigger>
                    <DialogContent className="max-w-2xl">
                        <DialogHeader>
                            <DialogTitle>Create new event</DialogTitle>
                            <DialogDescription>
                                Set up information and configuration for the new
                                event
                            </DialogDescription>
                        </DialogHeader>
                        <div className="space-y-4 py-4">
                            <div>
                                <Label htmlFor="event-name">Event name</Label>
                                <Input
                                    id="event-name"
                                    placeholder="Enter event name..."
                                />
                            </div>
                            <div>
                                <Label htmlFor="event-type">Event type</Label>
                                <Select>
                                    <SelectTrigger>
                                        <SelectValue placeholder="Select event type" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {Object.entries(EVENT_TYPES).map(
                                            ([key, { label }]) => (
                                                <SelectItem
                                                    key={key}
                                                    value={key}
                                                >
                                                    {label}
                                                </SelectItem>
                                            )
                                        )}
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <Label>Start time</Label>
                                    <DatePicker
                                        value={eventStartDate}
                                        onChange={setEventStartDate}
                                        placeholder="Select start date"
                                    />
                                </div>
                                <div>
                                    <Label>End time</Label>
                                    <DatePicker
                                        value={eventEndDate}
                                        onChange={setEventEndDate}
                                        placeholder="Select end date"
                                    />
                                </div>
                            </div>
                            <div>
                                <Label htmlFor="description">Description</Label>
                                <Textarea
                                    id="description"
                                    placeholder="Describe the event..."
                                />
                            </div>
                        </div>
                        <div className="flex justify-end gap-2">
                            <Button
                                variant="outline"
                                onClick={() => setIsCreateDialogOpen(false)}
                            >
                                Cancel
                            </Button>
                            <Button onClick={handleCreateEvent}>
                                Create event
                            </Button>
                        </div>
                    </DialogContent>
                </Dialog>
            </div>

            {events.length === 0 ? (
                <Card>
                    <CardContent className="py-8">
                        <p className="text-sm text-muted-foreground text-center">
                            No events configured.
                        </p>
                    </CardContent>
                </Card>
            ) : (
                <div className="grid gap-6 md:grid-cols-2">
                    {events.map(event => (
                        <Card key={event.id}>
                            <CardHeader>
                                <div className="flex items-start justify-between">
                                    <div className="flex-1">
                                        <div className="flex items-center gap-2 mb-1">
                                            <CardTitle className="text-lg">
                                                {event.name}
                                            </CardTitle>
                                            <Badge
                                                className={`${getEventColor(event.type as keyof typeof EVENT_TYPES)} text-white`}
                                            >
                                                {getEventLabel(
                                                    event.type as keyof typeof EVENT_TYPES
                                                )}
                                            </Badge>
                                        </div>
                                        <CardDescription>
                                            {event.description}
                                        </CardDescription>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <Switch
                                            checked={event.active}
                                            onCheckedChange={() =>
                                                toggleEventStatus(event.id)
                                            }
                                        />
                                        <Badge
                                            variant={
                                                event.active
                                                    ? "success"
                                                    : "secondary"
                                            }
                                        >
                                            {event.active
                                                ? "Active"
                                                : "Inactive"}
                                        </Badge>
                                    </div>
                                </div>
                            </CardHeader>
                            <CardContent>
                                <div className="space-y-4">
                                    <div className="flex items-center gap-4 text-sm">
                                        <div className="flex items-center gap-1">
                                            <Calendar className="h-4 w-4 text-muted-foreground" />
                                            <span>
                                                Start: {event.startTime}
                                            </span>
                                        </div>
                                    </div>
                                    <div className="flex items-center gap-4 text-sm">
                                        <div className="flex items-center gap-1">
                                            <Clock className="h-4 w-4 text-muted-foreground" />
                                            <span>End: {event.endTime}</span>
                                        </div>
                                    </div>

                                    <div className="pt-4 border-t">
                                        <p className="text-sm font-medium mb-3">
                                            Schedule configuration
                                        </p>
                                        <div className="space-y-2">
                                            {event.schedule.map(
                                                (schedule, index) => (
                                                    <div
                                                        key={index}
                                                        className="bg-muted/50 rounded-lg p-3"
                                                    >
                                                        <div className="grid grid-cols-2 gap-2 text-sm">
                                                            <div>
                                                                <span className="text-muted-foreground">
                                                                    Day:{" "}
                                                                </span>
                                                                <span className="font-medium">
                                                                    {
                                                                        DAYS_OF_WEEK[
                                                                            schedule
                                                                                .dayOfWeek
                                                                        ]
                                                                    }
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span className="text-muted-foreground">
                                                                    Time:{" "}
                                                                </span>
                                                                <span className="font-medium">
                                                                    {
                                                                        schedule.startHour
                                                                    }
                                                                    :00 -{" "}
                                                                    {
                                                                        schedule.endHour
                                                                    }
                                                                    :00
                                                                </span>
                                                            </div>
                                                            {schedule.expMultiplier && (
                                                                <div className="flex items-center gap-1">
                                                                    <TrendingUp className="h-3 w-3 text-blue-500" />
                                                                    <span className="text-muted-foreground">
                                                                        EXP:{" "}
                                                                    </span>
                                                                    <span className="font-medium text-blue-500">
                                                                        x
                                                                        {
                                                                            schedule.expMultiplier
                                                                        }
                                                                    </span>
                                                                </div>
                                                            )}
                                                            {schedule.dropMultiplier && (
                                                                <div className="flex items-center gap-1">
                                                                    <Package className="h-3 w-3 text-green-500" />
                                                                    <span className="text-muted-foreground">
                                                                        Drop:{" "}
                                                                    </span>
                                                                    <span className="font-medium text-green-500">
                                                                        x
                                                                        {
                                                                            schedule.dropMultiplier
                                                                        }
                                                                    </span>
                                                                </div>
                                                            )}
                                                        </div>
                                                    </div>
                                                )
                                            )}
                                        </div>
                                    </div>

                                    <div className="flex gap-2 pt-2">
                                        <Button
                                            variant="outline"
                                            size="sm"
                                            className="flex-1"
                                            onClick={() =>
                                                handleSelectEvent(event)
                                            }
                                        >
                                            <Edit className="h-4 w-4 mr-1" />
                                            Edit
                                        </Button>
                                        <Button
                                            variant="outline"
                                            size="sm"
                                            onClick={() =>
                                                handleDeleteEvent(
                                                    event.id,
                                                    event.name
                                                )
                                            }
                                        >
                                            <Trash2 className="h-4 w-4" />
                                        </Button>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            )}

            {/* Edit Dialog */}
            <Dialog open={isEditDialogOpen} onOpenChange={setIsEditDialogOpen}>
                <DialogContent className="max-w-2xl">
                    <DialogHeader>
                        <DialogTitle>
                            Edit event - {selectedEvent?.name}
                        </DialogTitle>
                    </DialogHeader>
                    <Tabs defaultValue="info">
                        <TabsList className="grid w-full grid-cols-2">
                            <TabsTrigger value="info">Info</TabsTrigger>
                            <TabsTrigger value="schedule">
                                Schedule & Rates
                            </TabsTrigger>
                        </TabsList>
                        <TabsContent value="info" className="space-y-4">
                            <div>
                                <Label>Event name</Label>
                                <Input defaultValue={selectedEvent?.name} />
                            </div>
                            <div>
                                <Label>Description</Label>
                                <Textarea
                                    defaultValue={selectedEvent?.description}
                                />
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <Label>Start time</Label>
                                    <DatePicker
                                        value={eventStartDate}
                                        onChange={setEventStartDate}
                                        placeholder="Select start date"
                                    />
                                </div>
                                <div>
                                    <Label>End time</Label>
                                    <DatePicker
                                        value={eventEndDate}
                                        onChange={setEventEndDate}
                                        placeholder="Select end date"
                                    />
                                </div>
                            </div>
                        </TabsContent>
                        <TabsContent value="schedule" className="space-y-4">
                            <p className="text-sm text-muted-foreground">
                                Configure EXP and Drop rates by time slot
                            </p>
                            {selectedEvent?.schedule.map((schedule, index) => (
                                <Card key={index}>
                                    <CardContent className="pt-6">
                                        <div className="space-y-4">
                                            <div>
                                                <Label>Day of week</Label>
                                                <Select
                                                    defaultValue={schedule.dayOfWeek.toString()}
                                                >
                                                    <SelectTrigger>
                                                        <SelectValue />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        {DAYS_OF_WEEK.map(
                                                            (day, i) => (
                                                                <SelectItem
                                                                    key={i}
                                                                    value={i.toString()}
                                                                >
                                                                    {day}
                                                                </SelectItem>
                                                            )
                                                        )}
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                            <div className="grid grid-cols-2 gap-4">
                                                <div>
                                                    <Label>Start hour</Label>
                                                    <Input
                                                        type="number"
                                                        min="0"
                                                        max="23"
                                                        defaultValue={
                                                            schedule.startHour
                                                        }
                                                    />
                                                </div>
                                                <div>
                                                    <Label>End hour</Label>
                                                    <Input
                                                        type="number"
                                                        min="0"
                                                        max="23"
                                                        defaultValue={
                                                            schedule.endHour
                                                        }
                                                    />
                                                </div>
                                            </div>
                                            {schedule.expMultiplier !==
                                                undefined && (
                                                <div>
                                                    <Label>
                                                        EXP Multiplier: x
                                                        {schedule.expMultiplier}
                                                    </Label>
                                                    <Slider
                                                        defaultValue={[
                                                            schedule.expMultiplier *
                                                                50,
                                                        ]}
                                                        max={500}
                                                        step={50}
                                                        className="mt-2"
                                                    />
                                                </div>
                                            )}
                                            {schedule.dropMultiplier !==
                                                undefined && (
                                                <div>
                                                    <Label>
                                                        Drop Multiplier: x
                                                        {
                                                            schedule.dropMultiplier
                                                        }
                                                    </Label>
                                                    <Slider
                                                        defaultValue={[
                                                            schedule.dropMultiplier *
                                                                50,
                                                        ]}
                                                        max={500}
                                                        step={50}
                                                        className="mt-2"
                                                    />
                                                </div>
                                            )}
                                        </div>
                                    </CardContent>
                                </Card>
                            ))}
                            <Button variant="outline" className="w-full">
                                <Plus className="h-4 w-4 mr-2" />
                                Add new time slot
                            </Button>
                        </TabsContent>
                    </Tabs>
                    <div className="flex justify-end gap-2">
                        <Button
                            variant="outline"
                            onClick={() => setIsEditDialogOpen(false)}
                        >
                            Cancel
                        </Button>
                        <Button onClick={handleSaveEvent}>Save changes</Button>
                    </div>
                </DialogContent>
            </Dialog>
        </div>
    )
}
