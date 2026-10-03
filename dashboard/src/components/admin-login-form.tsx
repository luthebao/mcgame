"use client"

import { FormEvent, startTransition, useState } from "react"
import { useRouter } from "next/navigation"
import { Shield, KeyRound, Mail } from "lucide-react"

import { Button } from "@/components/ui/button"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { createClient } from "@/lib/supabase/client"
import { APP_ROUTES } from "@/lib/routes"

export function AdminLoginForm() {
    const router = useRouter()
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [error, setError] = useState<string | null>(null)
    const [isSubmitting, setIsSubmitting] = useState(false)

    async function handleSubmit(event: FormEvent<HTMLFormElement>) {
        event.preventDefault()

        setIsSubmitting(true)
        setError(null)

        try {
            const supabase = createClient()
            const { error: authError } = await supabase.auth.signInWithPassword(
                {
                    email,
                    password,
                }
            )

            if (authError) {
                setError(authError.message)
                return
            }

            startTransition(() => {
                router.replace(APP_ROUTES.dashboard)
                router.refresh()
            })
        } catch (err) {
            setError(
                err instanceof Error
                    ? err.message
                    : "Unable to connect to the auth server"
            )
        } finally {
            setIsSubmitting(false)
        }
    }

    return (
        <Card className="border-border/60 bg-background/95 shadow-2xl backdrop-blur">
            <CardHeader className="space-y-3">
                <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-primary/10 text-primary">
                    <Shield className="h-6 w-6" />
                </div>
                <div className="space-y-1">
                    <CardTitle className="text-2xl">Admin Login</CardTitle>
                    <CardDescription>
                        Sign in with your Supabase account to access the
                        dashboard.
                    </CardDescription>
                </div>
            </CardHeader>
            <CardContent>
                <form className="space-y-5" onSubmit={handleSubmit}>
                    <div className="space-y-2">
                        <Label htmlFor="admin-email">Email</Label>
                        <div className="relative">
                            <Mail className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                            <Input
                                id="admin-email"
                                type="email"
                                value={email}
                                onChange={event => setEmail(event.target.value)}
                                placeholder="admin@example.com"
                                className="pl-10"
                                autoComplete="email"
                                required
                            />
                        </div>
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="admin-password">Password</Label>
                        <div className="relative">
                            <KeyRound className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                            <Input
                                id="admin-password"
                                type="password"
                                value={password}
                                onChange={event =>
                                    setPassword(event.target.value)
                                }
                                placeholder="Enter password"
                                className="pl-10"
                                autoComplete="current-password"
                                required
                            />
                        </div>
                    </div>

                    {error ? (
                        <div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive">
                            {error}
                        </div>
                    ) : null}

                    <Button
                        type="submit"
                        className="w-full"
                        disabled={isSubmitting}
                    >
                        {isSubmitting
                            ? "Authenticating..."
                            : "Sign in to dashboard"}
                    </Button>
                </form>
            </CardContent>
        </Card>
    )
}
