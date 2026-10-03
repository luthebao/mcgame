import { NextResponse } from "next/server"
import { readdir } from "fs/promises"
import { join } from "path"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"

function getProjectRoot() {
    return join(process.cwd(), "..")
}

interface MapChunkMeta {
    row: number
    col: number
    filename: string
}

export async function GET(
    request: Request,
    { params }: { params: Promise<{ mapId: string }> }
) {
    const { mapId } = await params

    try {
        const projectRoot = getProjectRoot()
        const mapDir = join(projectRoot, "web", "Resource", "map", mapId)
        const entries = await readdir(mapDir, { withFileTypes: true })

        const chunks: MapChunkMeta[] = []
        for (const entry of entries) {
            if (!entry.isFile()) continue
            const match = entry.name.match(
                /^(\d+)_(\d+)\.(jpg|jpeg|png|webp)$/i
            )
            if (!match) continue

            chunks.push({
                row: parseInt(match[1], 10),
                col: parseInt(match[2], 10),
                filename: entry.name,
            })
        }

        chunks.sort((a, b) => a.row - b.row || a.col - b.col)

        const maxRow = chunks.reduce((acc, item) => Math.max(acc, item.row), -1)
        const maxCol = chunks.reduce((acc, item) => Math.max(acc, item.col), -1)

        return NextResponse.json({
            mapId,
            chunkCount: chunks.length,
            rows: maxRow + 1,
            cols: maxCol + 1,
            chunks,
        })
    } catch (error) {
        return NextResponse.json(
            { error: API_MESSAGES.map.chunksLoadFailed, mapId },
            { status: HTTP_STATUS.NOT_FOUND }
        )
    }
}
