/**
 * Base API configuration and utilities
 */

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { buildDashboardAPIPath } from "@/lib/api/endpoints"
import { APP_ROUTES } from "@/lib/routes"

export class ApiError extends Error {
    constructor(
        public message: string,
        public status: number,
        public data?: any
    ) {
        super(message)
        this.name = "ApiError"
    }
}

export async function fetchAPI<T>(
    endpoint: string,
    options?: RequestInit
): Promise<T> {
    const url = buildDashboardAPIPath(endpoint)

    const response = await fetch(url, {
        headers: {
            "Content-Type": "application/json",
            ...options?.headers,
        },
        ...options,
    })

    if (!response.ok) {
        const error = await response.json().catch(() => ({
            message: response.statusText,
        }))
        if (
            response.status === HTTP_STATUS.UNAUTHORIZED &&
            endpoint.startsWith("/admin") &&
            typeof window !== "undefined"
        ) {
            window.location.assign(APP_ROUTES.login)
        }
        throw new ApiError(
            error.message || API_MESSAGES.common.apiError,
            response.status,
            error
        )
    }

    return response.json() as Promise<T>
}

export function buildQueryString<T extends object>(params: T): string {
    const searchParams = new URLSearchParams()
    Object.entries(
        params as Record<string, string | number | boolean | null | undefined>
    ).forEach(([key, value]) => {
        if (value !== undefined && value !== null) {
            searchParams.append(key, String(value))
        }
    })
    return searchParams.toString()
}

export function getErrorMessage(error: unknown): string {
    if (error instanceof Error) {
        return error.message
    }
    return API_MESSAGES.common.unexpectedError
}
