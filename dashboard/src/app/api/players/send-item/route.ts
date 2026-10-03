import { NextRequest } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { ADMIN_SERVER_ENDPOINTS } from "@/lib/api/endpoints"
import { jsonError } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { proxyAdminServerRequest } from "@/lib/server/admin-server"

export const dynamic = "force-dynamic"

export async function POST(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return jsonError({
            code: "admin_login_required",
            message: API_MESSAGES.admin.loginRequired,
            status: HTTP_STATUS.UNAUTHORIZED,
        })
    }

    return proxyAdminServerRequest(
        request,
        session,
        ADMIN_SERVER_ENDPOINTS.playerSendItem
    )
}
