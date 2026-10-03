"use client"

import { useCallback } from "react"
import { toast as sonnerToast } from "sonner"

export function useEventActions() {
    const toggleEventStatus = useCallback(
        (
            eventId: string,
            events: any[],
            setEvents: (events: any[]) => void
        ) => {
            setEvents(
                events.map((e: any) =>
                    e.id === eventId ? { ...e, active: !e.active } : e
                )
            )

            const event = events.find((e: any) => e.id === eventId)
            const newStatus = !event?.active

            if (newStatus) {
                sonnerToast.success(`${event?.name} activated`, {
                    description: "Event is now active",
                })
            } else {
                sonnerToast.warning(`${event?.name} deactivated`, {
                    description: "Event has been deactivated",
                })
            }
        },
        []
    )

    const createEvent = useCallback(() => {
        sonnerToast.success("Event created!", {
            description: "New event has been created and activated.",
        })
    }, [])

    const saveEvent = useCallback((eventName?: string) => {
        sonnerToast.success("Changes saved", {
            description: `Configuration for ${eventName} has been updated.`,
        })
    }, [])

    const deleteEvent = useCallback((eventName: string) => {
        sonnerToast.error("Event deleted", {
            description: `${eventName} has been removed from the system.`,
        })
    }, [])

    return {
        toggleEventStatus,
        createEvent,
        saveEvent,
        deleteEvent,
    }
}

export function useServerActions() {
    const restartServer = useCallback((serverName: string) => {
        sonnerToast.success("Server restarted", {
            description: `${serverName} will be restarted in a few minutes.`,
        })
    }, [])

    const toggleMaintenance = useCallback(
        (serverName: string, enabled: boolean) => {
            if (enabled) {
                sonnerToast.info("Maintenance mode", {
                    description: `${serverName} has entered maintenance mode.`,
                })
            } else {
                sonnerToast.success("Server online", {
                    description: `${serverName} is back online.`,
                })
            }
        },
        []
    )

    const broadcastMessage = useCallback((message: string) => {
        sonnerToast.success("Notification sent", {
            description: `Broadcast sent to all servers: "${message}"`,
        })
    }, [])

    return {
        restartServer,
        toggleMaintenance,
        broadcastMessage,
    }
}

export function usePlayerActions() {
    const banPlayer = useCallback((playerName: string, reason: string) => {
        sonnerToast.error(`Account banned`, {
            description: `${playerName} has been banned. Reason: ${reason}`,
        })
    }, [])

    const unbanPlayer = useCallback((playerName: string) => {
        sonnerToast.success(`Account unbanned`, {
            description: `${playerName} has been unbanned.`,
        })
    }, [])

    const mutePlayer = useCallback((playerName: string, duration: number) => {
        sonnerToast.warning(`Chat muted`, {
            description: `${playerName} cannot chat for ${duration} minutes.`,
        })
    }, [])

    const kickPlayer = useCallback((playerName: string) => {
        sonnerToast.warning(`Player kicked`, {
            description: `${playerName} has been kicked from the game.`,
        })
    }, [])

    const compensatePlayer = useCallback(
        (playerName: string, reward: string) => {
            sonnerToast.success(`Compensated`, {
                description: `${playerName} received: ${reward}`,
            })
        },
        []
    )

    return {
        banPlayer,
        unbanPlayer,
        mutePlayer,
        kickPlayer,
        compensatePlayer,
    }
}

export function useEconomyActions() {
    const updateShopItem = useCallback((itemName: string) => {
        sonnerToast.success(`Updated`, {
            description: `Price and stock for "${itemName}" have been updated.`,
        })
    }, [])

    const createShopItem = useCallback(() => {
        sonnerToast.success(`Item added`, {
            description: "New item has been added to the shop.",
        })
    }, [])

    const deleteShopItem = useCallback((itemName: string) => {
        sonnerToast.error(`Item deleted`, {
            description: `"${itemName}" has been removed from the shop.`,
        })
    }, [])

    return {
        updateShopItem,
        createShopItem,
        deleteShopItem,
    }
}
