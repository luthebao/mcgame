import { notFound } from "next/navigation"

import { BossLootEditorWorkspace } from "../_components/boss-loot-editor-workspace"

type Props = { params: Promise<{ nid: string }> }

export default async function BossLootDetailPage({ params }: Props) {
    const { nid } = await params
    const parsed = Number.parseInt(nid, 10)
    if (!Number.isFinite(parsed) || parsed <= 0) notFound()
    return <BossLootEditorWorkspace nid={parsed} />
}
