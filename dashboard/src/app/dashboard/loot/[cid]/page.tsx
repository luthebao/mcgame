import { notFound } from "next/navigation"

import { LootEditorWorkspace } from "../_components/loot-editor-workspace"

type Props = { params: Promise<{ cid: string }> }

export default async function LootDetailPage({ params }: Props) {
    const { cid } = await params
    const parsed = Number.parseInt(cid, 10)
    if (!Number.isFinite(parsed) || parsed <= 0) notFound()
    return <LootEditorWorkspace cid={parsed} />
}
