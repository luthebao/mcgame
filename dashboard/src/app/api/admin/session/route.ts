import { jsonSuccess } from "@/lib/api/response"
import { createClient } from "@/lib/supabase/server"

export async function DELETE() {
    const supabase = await createClient()
    await supabase.auth.signOut()
    return jsonSuccess({ ok: true })
}
