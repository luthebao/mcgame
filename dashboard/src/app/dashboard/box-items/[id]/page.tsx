import { notFound } from "next/navigation"

import { BoxItemAwardWorkspace } from "../_components/box-item-award-workspace"

type BoxItemDetailPageProps = {
    params: Promise<{
        id: string
    }>
}

export default async function BoxItemDetailPage({
    params,
}: BoxItemDetailPageProps) {
    const { id } = await params
    const itemId = Number.parseInt(id, 10)

    if (!Number.isFinite(itemId) || itemId <= 0) {
        notFound()
    }

    return <BoxItemAwardWorkspace itemId={itemId} />
}
