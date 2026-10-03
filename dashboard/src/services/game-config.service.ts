import { fetchAPI } from "./api"

export type GameConfigGroup = "server" | "tuning" | "gm"

export type GameConfigEntry = {
    key: string
    value: unknown
    description: string | null
    category?: string | null
    updated_at: string
}

type ListResponse = {
    ok: boolean
    group?: GameConfigGroup
    items?: GameConfigEntry[]
    message?: string
}

type PatchResponse = {
    ok: boolean
    group?: GameConfigGroup
    item?: GameConfigEntry
    message?: string
}

type DeleteResponse = {
    ok: boolean
    group?: GameConfigGroup
    key?: string
    message?: string
}

export type GameConfigPatch = {
    key: string
    value: unknown
    description?: string
    category?: string
}

export const gameConfigService = {
    async list(group: GameConfigGroup): Promise<GameConfigEntry[]> {
        const res = await fetchAPI<ListResponse>(`/game-config/${group}`)
        if (!res.ok || !res.items) throw new Error(res.message || `failed to list ${group}`)
        return res.items
    },

    async upsert(group: GameConfigGroup, patch: GameConfigPatch): Promise<GameConfigEntry> {
        const res = await fetchAPI<PatchResponse>(`/game-config/${group}`, {
            method: "PATCH",
            body: JSON.stringify(patch),
        })
        if (!res.ok || !res.item) throw new Error(res.message || `failed to update ${group}`)
        return res.item
    },

    async remove(group: GameConfigGroup, key: string): Promise<string> {
        const res = await fetchAPI<DeleteResponse>(`/game-config/${group}`, {
            method: "DELETE",
            body: JSON.stringify({ key }),
        })
        if (!res.ok || !res.key) throw new Error(res.message || `failed to delete ${group} key`)
        return res.key
    },
}
