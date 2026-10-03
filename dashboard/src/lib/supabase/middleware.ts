import { createServerClient } from "@supabase/ssr"
import { NextResponse, type NextRequest } from "next/server"

import {
    getSupabaseServerUrl,
    getSupabasePublishableKey,
} from "@/lib/supabase/env"

function hasAuthCookies(request: NextRequest): boolean {
    return request.cookies
        .getAll()
        .some(c => c.name.startsWith("sb-") && c.name.includes("-auth-token"))
}

function clearAuthCookies(request: NextRequest, response: NextResponse) {
    request.cookies
        .getAll()
        .filter(c => c.name.startsWith("sb-"))
        .forEach(({ name }) => {
            request.cookies.delete(name)
            response.cookies.set(name, "", { maxAge: 0, path: "/" })
        })
}

export async function updateSession(request: NextRequest) {
    let supabaseResponse = NextResponse.next({ request })

    if (!hasAuthCookies(request)) {
        return { user: null, supabaseResponse }
    }

    const supabase = createServerClient(
        getSupabaseServerUrl(),
        getSupabasePublishableKey(),
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll()
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value }) =>
                        request.cookies.set(name, value)
                    )
                    supabaseResponse = NextResponse.next({ request })
                    cookiesToSet.forEach(({ name, value, options }) =>
                        supabaseResponse.cookies.set(name, value, options)
                    )
                },
            },
        }
    )

    const {
        data: { user },
        error,
    } = await supabase.auth.getUser()

    if (error) {
        clearAuthCookies(request, supabaseResponse)
        return { user: null, supabaseResponse }
    }

    return { user, supabaseResponse }
}
