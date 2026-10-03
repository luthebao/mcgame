import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { ADMIN_SERVER_ENDPOINTS } from "@/lib/api/endpoints"
import { jsonError, resolveErrorMessage } from "@/lib/api/response"
import { proxyAdminServerRequest } from "@/lib/server/admin-server"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"

export const dynamic = "force-dynamic"

export async function POST(
    request: NextRequest,
    { params }: { params: Promise<{ id: string }> }
) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return jsonError({
            code: "admin_auth_required",
            message: API_MESSAGES.admin.loginRequired,
            status: HTTP_STATUS.UNAUTHORIZED,
        })
    }

    return proxyAdminServerRequest(
        request,
        session,
        ADMIN_SERVER_ENDPOINTS.playerAction
    )
}
