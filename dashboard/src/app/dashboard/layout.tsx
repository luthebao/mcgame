import { Sidebar } from "@/components/sidebar"
import { Header } from "@/components/header"
import { DEFAULT_ADMIN_USER } from "@/lib/admin-auth"

export default function DashboardLayout({
    children,
}: {
    children: React.ReactNode
}) {
    const adminUser = DEFAULT_ADMIN_USER

    return (
        <div className="flex h-screen overflow-hidden">
            <Sidebar adminUser={adminUser} />
            <div className="flex flex-1 flex-col overflow-hidden">
                <Header adminUser={adminUser} />
                <main className="flex-1 overflow-y-auto bg-muted/40 p-6">
                    {children}
                </main>
            </div>
        </div>
    )
}
