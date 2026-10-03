import { fetchAPI } from "./api"

export type GatewayLine = {
    id: number
    name: string
    url: string
    max_clients: number
    auction: boolean
    guild: boolean
    status: "online" | "offline" | "maintenance"
    sort_order: number
    created_at: string
    updated_at: string
}

export type GatewayLineInput = {
    id?: number
    name: string
    url: string
    maxClients: number
    auction: boolean
    guild: boolean
    status: "online" | "offline" | "maintenance"
    sortOrder: number
}

type ListResponse = { ok: boolean; items?: GatewayLine[]; message?: string }
type SingleResponse = { ok: boolean; line?: GatewayLine; message?: string }
type DeleteResponse = { ok: boolean; id?: number; message?: string }

export const gatewayConfigService = {
    async list(): Promise<GatewayLine[]> {
        const res = await fetchAPI<ListResponse>("/lines")
        if (!res.ok || !res.items) throw new Error(res.message || "failed to list lines")
        return res.items
    },

    async create(input: GatewayLineInput): Promise<GatewayLine> {
        const res = await fetchAPI<SingleResponse>("/lines", {
            method: "POST",
            body: JSON.stringify(input),
        })
        if (!res.ok || !res.line) throw new Error(res.message || "failed to create line")
        return res.line
    },

    async update(id: number, input: Partial<GatewayLineInput>): Promise<GatewayLine> {
        const res = await fetchAPI<SingleResponse>(`/lines/${id}`, {
            method: "PATCH",
            body: JSON.stringify(input),
        })
        if (!res.ok || !res.line) throw new Error(res.message || "failed to update line")
        return res.line
    },

    async remove(id: number): Promise<number> {
        const res = await fetchAPI<DeleteResponse>(`/lines/${id}`, {
            method: "DELETE",
        })
        if (!res.ok || res.id === undefined) throw new Error(res.message || "failed to delete line")
        return res.id
    },
}
