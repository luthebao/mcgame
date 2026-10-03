import { NextRequest } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { jsonError, jsonSuccess, resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

export const revalidate = 300

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return jsonError({
            code: "admin_auth_required",
            message: API_MESSAGES.admin.loginRequired,
            status: HTTP_STATUS.UNAUTHORIZED,
        })
    }

    try {
        const supabase = createAdminClient()
        const { data, error } = await supabase
            .schema("data")
            .from("data_tbl_map")
            .select("id, name, safe_x, safe_y")
            .order("id", { ascending: true })

        if (error) throw new Error(error.message)

        return jsonSuccess({
            maps: (data || []).map(row => ({
                id: Number(row.id),
                name: String(row.name || ""),
                safeX: Number(row.safe_x || 0),
                safeY: Number(row.safe_y || 0),
            })),
        })
    } catch (err) {
        return jsonError({
            code: "maps_list_failed",
            message: resolveErrorMessage(err),
            status: HTTP_STATUS.INTERNAL_SERVER_ERROR,
        })
    }
}
