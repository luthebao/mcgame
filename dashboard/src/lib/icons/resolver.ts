import { createHash } from "crypto"
import { access, readFile, readdir } from "fs/promises"
import { constants as fsConstants } from "fs"
import { extname, join } from "path"

export type IconIndex = {
    directMap: Map<number, string>
    hashedFiles: Set<string>
}

export type IconMatch = {
    path: string
    logicalPath: string
}

const IMAGE_MIME_MAP: Record<string, string> = {
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".webp": "image/webp",
}

const URL_WORD_EXT = 1_000_000_000_000
const URL_WORD_1 = 1_000_000_000
const URL_WORD_2 = 1_000_000
const URL_NUM_LENGTH = 6

const RES_URL_EXT: Record<number, string> = {
    1: "",
    2: ".swf",
    3: ".jpg",
    4: ".png",
    5: ".wav",
    6: ".mp3",
    7: ".ogg",
}

const RES_URL_FOLDER: Record<number, string> = {
    10: "",
    15: "scene/",
    20: "item/",
    30: "item/",
    40: "tile/",
    50: "creature/",
    60: "creature/",
    70: "equip/",
    80: "effect/",
    90: "sound/",
    100: "bullet/",
    110: "emotion/",
    120: "state/",
    130: "ui/",
    140: "skill/",
}

const RES_URL_WORD1: Record<number, string> = {
    10: "",
    15: "SCENE_",
    20: "SITEM_",
    30: "ITEM_",
    40: "TILE_",
    50: "PC_",
    60: "NPC_",
    70: "EQUIP_",
    80: "EFF_",
    90: "WAV_",
    100: "BLT_",
    110: "EM_",
    120: "ST_",
    130: "UI_",
    140: "SKILL_",
}

const RES_URL_WORD2: Record<number, string> = { 10: "", 200: "NORMAL_" }

function md5(input: string): string {
    return createHash("md5").update(input, "utf8").digest("hex")
}

export function buildIconRelativePath(iconCode: number): string {
    if (!Number.isFinite(iconCode) || iconCode <= 0) return ""

    let remaining = Math.trunc(iconCode)
    const extCode = Math.trunc(remaining / URL_WORD_EXT)
    remaining %= URL_WORD_EXT
    const folderCode = Math.trunc(remaining / URL_WORD_1)
    remaining %= URL_WORD_1
    const word2Code = Math.trunc(remaining / URL_WORD_2)

    let suffix = String(remaining)
    suffix =
        suffix.length >= URL_NUM_LENGTH
            ? suffix.slice(-URL_NUM_LENGTH)
            : suffix.padStart(URL_NUM_LENGTH, "0")

    const folder = RES_URL_FOLDER[folderCode] || `UNKNOWN_F_${folderCode}/`
    const word1 = RES_URL_WORD1[folderCode] || `UNKNOWN_W1_${folderCode}_`
    const word2 = RES_URL_WORD2[word2Code] || `UNKNOWN_W2_${word2Code}_`
    const ext = RES_URL_EXT[extCode] || `.UNKNOWN_EXT_${extCode}`

    return `${folder}${word1}${word2}${suffix}${ext}`
}

function buildHashedIconCandidates(iconCode: number): string[] {
    const relativePath = buildIconRelativePath(iconCode)
    if (!relativePath) return []

    const normalized = relativePath.replace(/\\/g, "/")
    return Array.from(
        new Set(
            [
                `icon/${normalized}`,
                normalized,
                `icon/${normalized}`.toLowerCase(),
                normalized.toLowerCase(),
                `res/${normalized}`,
                `assets/${normalized}`,
            ].map(value => md5(value))
        )
    )
}

export async function resolveIconDirectory(): Promise<string> {
    const envDir = (process.env.GM_ICON_DIR || "").trim()
    const candidates = [
        envDir,
        join(process.cwd(), "..", "frontend", "s", "res"),
        join(process.cwd(), "..", "web", "Resource", "icon"),
        join(process.cwd(), "..", "frontend", "public", "icon"),
        join(process.cwd(), "frontend", "s", "res"),
        join(process.cwd(), "web", "Resource", "icon"),
    ].filter(Boolean)

    for (const candidate of candidates) {
        try {
            await access(candidate, fsConstants.R_OK)
            return candidate
        } catch {
            /* continue */
        }
    }

    return ""
}

export async function buildIconIndex(iconDir: string): Promise<IconIndex> {
    const empty: IconIndex = {
        directMap: new Map<number, string>(),
        hashedFiles: new Set<string>(),
    }
    if (!iconDir) return empty

    let entries
    try {
        entries = await readdir(iconDir, { withFileTypes: true })
    } catch {
        return empty
    }

    const directMap = new Map<number, string>()
    const hashedFiles = new Set<string>()

    for (const entry of entries) {
        if (!entry.isFile()) continue
        hashedFiles.add(entry.name.toLowerCase())
        const ext = extname(entry.name).toLowerCase()
        if (!Object.keys(IMAGE_MIME_MAP).includes(ext)) continue
        const base = entry.name.slice(0, -ext.length)
        const iconID = Number.parseInt(base, 10)
        if (!Number.isFinite(iconID)) continue
        directMap.set(iconID, join(iconDir, entry.name))
    }

    return { directMap, hashedFiles }
}

export function resolveHashedIcon(
    iconDir: string,
    iconIndex: IconIndex,
    iconCode: number
): IconMatch | null {
    const directPath = iconIndex.directMap.get(iconCode)
    if (directPath) return { path: directPath, logicalPath: directPath }

    const logicalPath = buildIconRelativePath(iconCode)
    if (!logicalPath) return null

    for (const candidate of buildHashedIconCandidates(iconCode)) {
        if (!iconIndex.hashedFiles.has(candidate)) continue
        return { path: join(iconDir, candidate), logicalPath }
    }

    return null
}

export async function readIconDataUrl(
    filePath: string,
    logicalPath: string
): Promise<string> {
    try {
        const binary = await readFile(filePath)
        const ext = extname(logicalPath || filePath).toLowerCase()
        const mime = IMAGE_MIME_MAP[ext] || "application/octet-stream"
        return `data:${mime};base64,${binary.toString("base64")}`
    } catch {
        return ""
    }
}
