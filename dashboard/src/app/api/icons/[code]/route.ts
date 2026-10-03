import { readFile } from "fs/promises"
import { extname } from "path"
import { NextRequest, NextResponse } from "next/server"

import {
    buildIconIndex,
    resolveIconDirectory,
    resolveHashedIcon,
    type IconIndex,
} from "@/lib/icons/resolver"

export const dynamic = "force-dynamic"

const MIME_MAP: Record<string, string> = {
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".webp": "image/webp",
}

let cachedDir: string | null = null
let cachedIndex: IconIndex | null = null
let cachedAt = 0
const CACHE_TTL_MS = 60_000

async function getIndex(): Promise<{ dir: string; index: IconIndex }> {
    const now = Date.now()
    if (cachedDir !== null && cachedIndex && now - cachedAt < CACHE_TTL_MS) {
        return { dir: cachedDir, index: cachedIndex }
    }
    const dir = await resolveIconDirectory()
    const index = await buildIconIndex(dir)
    cachedDir = dir
    cachedIndex = index
    cachedAt = now
    return { dir, index }
}

export async function GET(
    _req: NextRequest,
    context: { params: Promise<{ code: string }> }
) {
    const { code } = await context.params
    const iconCode = Number(code)
    if (!Number.isFinite(iconCode) || iconCode <= 0) {
        return new NextResponse(null, { status: 404 })
    }

    const { dir, index } = await getIndex()
    if (!dir) return new NextResponse(null, { status: 404 })

    const match = resolveHashedIcon(dir, index, iconCode)
    if (!match) return new NextResponse(null, { status: 404 })

    try {
        const binary = await readFile(match.path)
        const ext = extname(match.logicalPath || match.path).toLowerCase()
        const mime = MIME_MAP[ext] || "application/octet-stream"
        return new NextResponse(new Uint8Array(binary), {
            status: 200,
            headers: {
                "Content-Type": mime,
                "Cache-Control": "public, max-age=86400, immutable",
            },
        })
    } catch {
        return new NextResponse(null, { status: 404 })
    }
}
