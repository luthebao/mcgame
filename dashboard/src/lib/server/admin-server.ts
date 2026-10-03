import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { type AdminSession } from "@/lib/admin-auth"
import { ADMIN_SERVER_ENDPOINTS } from "@/lib/api/endpoints"
import { jsonError, resolveErrorMessage } from "@/lib/api/response"

const adminServerBaseURLVariables = [
    "GAME_SERVER_HTTP_URL",
    "ADMIN_SERVER_API_URL",
] as const
const localAdminServerHost = "127.0.0.1"

let cachedAdminServerBaseURL: string | undefined

function normalizeAdminServerBaseURL(raw: string): string {
    const value = raw.trim()
    if (!value) {
        return ""
    }

    if (value.startsWith("http://") || value.startsWith("https://")) {
        try {
            const url = new URL(value)
            if (
                url.hostname === "0.0.0.0" ||
                url.hostname === "::" ||
                url.hostname === "[::]"
            ) {
                url.hostname = localAdminServerHost
            }
            return url.toString()
        } catch {
            return ""
        }
    }

    let host = value
    if (host.startsWith(":")) {
        host = `${localAdminServerHost}${host}`
    }

    const lastColonIndex = host.lastIndexOf(":")
    if (lastColonIndex > 0) {
        const hostname = host.slice(0, lastColonIndex)
        const port = host.slice(lastColonIndex + 1)
        if (
            (hostname === "0.0.0.0" ||
                hostname === "::" ||
                hostname === "[::]") &&
            port
        ) {
            host = `${localAdminServerHost}:${port}`
        }
    }

    try {
        return new URL(`http://${host}`).toString()
    } catch {
        return ""
    }
}

async function getAdminServerBaseURL(): Promise<string> {
    if (cachedAdminServerBaseURL !== undefined) {
        return cachedAdminServerBaseURL
    }

    for (const variableName of adminServerBaseURLVariables) {
        const value = process.env[variableName]
        if (value && value.trim()) {
            cachedAdminServerBaseURL = normalizeAdminServerBaseURL(value)
            return cachedAdminServerBaseURL
        }
    }

    cachedAdminServerBaseURL = ""
    return cachedAdminServerBaseURL
}

async function getUpstreamURL(
    pathname: string,
    search = ""
): Promise<URL | null> {
    const baseURL = await getAdminServerBaseURL()
    if (!baseURL) {
        return null
    }

    const normalizedPathname = pathname.replace(/^\/+/, "")
    const url = new URL(
        normalizedPathname,
        baseURL.endsWith("/") ? baseURL : `${baseURL}/`
    )
    if (search) {
        url.search = search
    }
    return url
}

function buildAdminHeaders(
    session: AdminSession,
    contentType?: string | null
): Headers {
    const headers = new Headers({
        Accept: "application/json",
        Authorization: `Bearer ${session.secret}`,
        "X-Admin-Secret": session.secret,
    })

    if (session.user) {
        headers.set("X-Admin-User", session.user)
    }
    if (contentType) {
        headers.set("Content-Type", contentType)
    }

    return headers
}

export async function fetchAdminServerJSON<T>(
    session: AdminSession,
    pathname: string,
    search = ""
): Promise<T> {
    const upstreamURL = await getUpstreamURL(pathname, search)
    if (!upstreamURL) {
        throw new Error(API_MESSAGES.admin.adminServerEnvRequired)
    }

    const upstreamResponse = await fetch(upstreamURL, {
        method: "GET",
        headers: buildAdminHeaders(session),
        cache: "no-store",
    })

    const rawBody = await upstreamResponse.text()
    let payload: unknown = null

    if (rawBody.trim()) {
        try {
            payload = JSON.parse(rawBody)
        } catch {
            payload = null
        }
    }

    if (!upstreamResponse.ok) {
        if (payload && typeof payload === "object" && "message" in payload) {
            const message = String(
                (payload as { message?: unknown }).message || ""
            ).trim()
            if (message) {
                throw new Error(message)
            }
        }

        throw new Error(API_MESSAGES.admin.failedToReachAdminServer)
    }

    return payload as T
}

export async function verifyAdminCredentials(
    session: AdminSession
): Promise<Response> {
    const upstreamURL = await getUpstreamURL(ADMIN_SERVER_ENDPOINTS.auth)
    if (!upstreamURL) {
        return jsonError({
            code: "admin_server_unavailable",
            message: API_MESSAGES.admin.adminServerEnvRequired,
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        })
    }

    try {
        return await fetch(upstreamURL, {
            method: "POST",
            headers: buildAdminHeaders(session),
            cache: "no-store",
        })
    } catch (error) {
        return jsonError({
            code: "admin_server_unavailable",
            message: resolveErrorMessage(
                error,
                API_MESSAGES.admin.failedToReachAdminServer
            ),
            status: HTTP_STATUS.BAD_GATEWAY,
        })
    }
}

export async function proxyAdminServerRequest(
    request: NextRequest,
    session: AdminSession,
    pathname: string
): Promise<NextResponse> {
    const upstreamURL = await getUpstreamURL(pathname, request.nextUrl.search)
    if (!upstreamURL) {
        return jsonError({
            code: "admin_server_unavailable",
            message: API_MESSAGES.admin.adminServerEnvRequired,
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        })
    }

    const contentType = request.headers.get("Content-Type")
    const bodyText =
        request.method === "GET" || request.method === "HEAD"
            ? undefined
            : await request.text()

    try {
        const upstreamResponse = await fetch(upstreamURL, {
            method: request.method,
            headers: buildAdminHeaders(session, contentType),
            body: bodyText && bodyText.length > 0 ? bodyText : undefined,
            cache: "no-store",
        })

        const responseBody = await upstreamResponse.text()
        const responseHeaders = new Headers()
        const upstreamContentType = upstreamResponse.headers.get("Content-Type")
        if (upstreamContentType) {
            responseHeaders.set("Content-Type", upstreamContentType)
        }

        return new NextResponse(responseBody, {
            status: upstreamResponse.status,
            headers: responseHeaders,
        })
    } catch (error) {
        return jsonError({
            code: "admin_server_unavailable",
            message: resolveErrorMessage(
                error,
                API_MESSAGES.admin.failedToReachAdminServer
            ),
            status: HTTP_STATUS.BAD_GATEWAY,
        })
    }
}
