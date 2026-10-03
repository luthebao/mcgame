import { cookies } from "next/headers"
import { redirect } from "next/navigation"

import { AdminLoginForm } from "@/components/admin-login-form"
import { APP_ROUTES } from "@/lib/routes"
import { createClient } from "@/lib/supabase/server"

async function hasValidSession(): Promise<boolean> {
    const cookieStore = await cookies()
    const hasAuth = cookieStore
        .getAll()
        .some(c => c.name.startsWith("sb-") && c.name.includes("-auth-token"))
    if (!hasAuth) {
        return false
    }

    const supabase = await createClient()
    const {
        data: { user },
    } = await supabase.auth.getUser()
    return Boolean(user)
}

export default async function LoginPage() {
    if (await hasValidSession()) {
        redirect(APP_ROUTES.dashboard)
    }

    return (
        <main className="relative flex min-h-screen items-center justify-center overflow-hidden bg-slate-950 px-6 py-16 text-slate-50">
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_top,_rgba(56,189,248,0.24),_transparent_38%),radial-gradient(circle_at_bottom_right,_rgba(249,115,22,0.18),_transparent_36%),linear-gradient(135deg,_rgba(15,23,42,0.98),_rgba(2,6,23,1))]" />
            <div className="absolute left-[-10%] top-[10%] h-64 w-64 rounded-full bg-cyan-400/10 blur-3xl" />
            <div className="absolute bottom-[-8%] right-[4%] h-72 w-72 rounded-full bg-orange-400/10 blur-3xl" />

            <div className="relative z-10 grid w-full max-w-5xl gap-10 lg:grid-cols-[1.1fr_0.9fr]">
                <section className="space-y-6 self-center">
                    <p className="text-sm font-medium uppercase tracking-[0.35em] text-cyan-300/80">
                        Game Master Access
                    </p>
                    <div className="space-y-4">
                        <h1 className="max-w-2xl text-4xl font-semibold leading-tight text-white md:text-5xl">
                            Sign in to the admin dashboard for realtime
                            operations.
                        </h1>
                        <p className="max-w-xl text-base leading-7 text-slate-300">
                            After signing in, your session is managed by
                            Supabase Auth and automatically proxied to the game
                            server admin APIs, including the realtime player
                            list and HTTP admin chat.
                        </p>
                    </div>

                    <div className="grid gap-3 text-sm text-slate-300 md:grid-cols-2">
                        <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur">
                            <p className="font-medium text-white">
                                Supabase Auth
                            </p>
                            <p className="mt-2 leading-6">
                                Sign in with email and password. Sessions are
                                securely managed via Supabase SSR.
                            </p>
                        </div>
                        <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur">
                            <p className="font-medium text-white">
                                Protected dashboard flow
                            </p>
                            <p className="mt-2 leading-6">
                                `/dashboard` will automatically redirect to this
                                page if you are not signed in.
                            </p>
                        </div>
                    </div>
                </section>

                <section className="self-center">
                    <AdminLoginForm />
                </section>
            </div>
        </main>
    )
}
