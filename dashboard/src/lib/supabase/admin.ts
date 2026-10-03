import { createClient } from "@supabase/supabase-js"

import {
    getSupabaseServerUrl,
    getSupabaseServiceRoleKey,
} from "@/lib/supabase/env"

export function createAdminClient() {
    return createClient(getSupabaseServerUrl(), getSupabaseServiceRoleKey(), {
        auth: { autoRefreshToken: false, persistSession: false },
    })
}
