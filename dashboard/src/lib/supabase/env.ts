export function getSupabasePublicUrl(): string {
    return process.env.NEXT_PUBLIC_SUPABASE_URL!
}

export function getSupabaseServerUrl(): string {
    return process.env.SUPABASE_INTERNAL_URL || getSupabasePublicUrl()
}

export function getSupabasePublishableKey(): string {
    return process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!
}

export function getSupabaseServiceRoleKey(): string {
    return process.env.SUPABASE_SERVICE_ROLE_KEY!
}
