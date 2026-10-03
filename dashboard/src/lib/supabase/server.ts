import { createServerClient } from "@supabase/ssr"
import { cookies } from "next/headers"

import {
    getSupabaseServerUrl,
    getSupabasePublishableKey,
} from "@/lib/supabase/env"

export async function createClient() {
    const cookieStore = await cookies()

    return createServerClient(
        getSupabaseServerUrl(),
        getSupabasePublishableKey(),
        {
            cookies: {
                getAll() {
                    return cookieStore.getAll()
                },
                setAll(cookiesToSet) {
                    try {
                        cookiesToSet.forEach(({ name, value, options }) =>
                            cookieStore.set(name, value, options)
                        )
                    } catch {
                        // setAll called from a Server Component — safe to ignore
                        // when middleware handles session refresh
                    }
                },
            },
        }
    )
}
