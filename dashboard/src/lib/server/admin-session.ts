import {
    DEFAULT_ADMIN_USER,
    type AdminSession,
    getAdminSecret,
} from "@/lib/admin-auth"

function buildOpenSession(): AdminSession {
    return {
        secret: getAdminSecret(),
        user: DEFAULT_ADMIN_USER,
    }
}

export async function readAdminSessionFromCookies(): Promise<AdminSession> {
    return buildOpenSession()
}

export async function readAdminSessionFromRequest(
    _request?: unknown
): Promise<AdminSession> {
    return buildOpenSession()
}
