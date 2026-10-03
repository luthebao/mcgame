import { NextRequest, NextResponse } from "next/server"
import { readFile } from "fs/promises"
import { join } from "path"

// Get the project root (nrt-inf directory)
function getProjectRoot() {
    // process.cwd() in Next.js is the dashboard directory
    // We need to go up one level to get to nrt-inf
    return join(process.cwd(), "..")
}

// 1x1 transparent PNG for missing tiles
const transparentPng = Buffer.from(
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==",
    "base64"
)

export async function GET(
    request: NextRequest,
    { params }: { params: Promise<{ mapId: string; path: string[] }> }
) {
    const { mapId, path } = await params

    try {
        // The path array contains the filename (e.g., ["0_0.jpg"])
        const filename = path.join("/")

        // Path to map images in web/Resource (contains map tiles + small.jpg preview)
        const projectRoot = getProjectRoot()
        const imagePath = join(
            projectRoot,
            "web",
            "Resource",
            "map",
            mapId,
            filename
        )

        const imageBuffer = await readFile(imagePath)

        // Determine content type based on file extension
        const ext = filename.split(".").pop()?.toLowerCase()
        const contentType =
            ext === "jpg" || ext === "jpeg"
                ? "image/jpeg"
                : ext === "png"
                  ? "image/png"
                  : ext === "webp"
                    ? "image/webp"
                    : "image/jpeg"

        return new NextResponse(imageBuffer, {
            headers: {
                "Content-Type": contentType,
                "Cache-Control": "public, max-age=31536000, immutable",
            },
        })
    } catch (error) {
        // Return transparent PNG for missing tiles (no error logged)
        return new NextResponse(transparentPng, {
            headers: {
                "Content-Type": "image/png",
                "Cache-Control": "public, max-age=60",
            },
        })
    }
}
