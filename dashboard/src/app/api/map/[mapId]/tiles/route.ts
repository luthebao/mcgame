import { NextRequest, NextResponse } from "next/server"
import { readFile } from "fs/promises"
import { join, dirname } from "path"
import { fileURLToPath } from "url"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"

// Get the project root (nrt-inf directory)
// In Next.js server components, we can use process.cwd() and navigate correctly
function getProjectRoot() {
    // process.cwd() in Next.js is the dashboard directory
    // We need to go up one level to get to nrt-inf
    return join(process.cwd(), "..")
}

export async function GET(
    request: NextRequest,
    { params }: { params: Promise<{ mapId: string }> }
) {
    const { mapId } = await params

    try {
        // Path to the map_tiles.json file in the decompile directory
        const projectRoot = getProjectRoot()
        const mapJsonPath = join(
            projectRoot,
            "decompile",
            "web",
            "Resource",
            "map",
            mapId,
            "map_tiles.json"
        )

        const fileContent = await readFile(mapJsonPath, "utf-8")
        const data = JSON.parse(fileContent)

        return NextResponse.json(data)
    } catch (error) {
        console.error(`Error loading map ${mapId}:`, error)
        return NextResponse.json(
            { error: API_MESSAGES.map.tilesLoadFailed, mapId },
            { status: HTTP_STATUS.NOT_FOUND }
        )
    }
}
