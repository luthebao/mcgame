import { redirect } from "next/navigation"

import { APP_ROUTES } from "@/lib/routes"

export default function Home() {
    redirect(APP_ROUTES.dashboard)
}
