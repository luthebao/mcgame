import { NextResponse } from "next/server"

import { HTTP_STATUS, type HttpStatusCode } from "@/constants/http-status"
import { API_MESSAGES } from "@/constants/api-messages"

type JsonObject = Record<string, unknown>

type JsonErrorOptions = {
    code: string
    message: string
    status: HttpStatusCode
    data?: JsonObject
}

export function jsonSuccess<T extends JsonObject>(
    payload: T,
    status: HttpStatusCode = HTTP_STATUS.OK
): NextResponse<T> {
    return NextResponse.json(payload, { status })
}

export function jsonError({
    code,
    message,
    status,
    data,
}: JsonErrorOptions): NextResponse {
    return NextResponse.json(
        {
            ok: false,
            error_code: code,
            message,
            ...data,
        },
        { status }
    )
}

export function resolveErrorMessage(
    error: unknown,
    fallback: string = API_MESSAGES.common.unknownError
): string {
    return error instanceof Error ? error.message : fallback
}
