import { createBrowserClient } from "@supabase/ssr"

import {
    getSupabasePublicUrl,
    getSupabasePublishableKey,
} from "@/lib/supabase/env"

export function createClient() {
    return createBrowserClient(
        getSupabasePublicUrl(),
        getSupabasePublishableKey()
    )
}
