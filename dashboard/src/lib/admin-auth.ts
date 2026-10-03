export const DEFAULT_ADMIN_USER = "Admin"

export type AdminSession = {
    secret: string
    user: string
}

export function getAdminDisplayName(user: string): string {
    return user.trim() || DEFAULT_ADMIN_USER
}

export function getAdminSecret(): string {
    return (process.env.ADMIN_SECRET || "").trim()
}
