import { NextRequest, NextResponse } from "next/server"
import { access, readFile, readdir } from "fs/promises"
import { constants as fsConstants } from "fs"
import { extname, join } from "path"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"

type CreatureQuery = {
    search: string
    imageFilter: "all" | "with" | "without"
    page: number
    pageSize: number
}

type CreatureRecord = {
    name: string
    apprId: number
}

type CreatureRow = {
    name: string
    apprId: number
    hasImage: boolean
    imagePath: string
    imageDataUrl: string
}

type CreatureSearchResult = {
    items: CreatureRow[]
    total: number
    page: number
    pageSize: number
    totalPages: number
    mappingCount: number
    sourceFile: string
    imageDirectory: string
    imageCount: number
    lastRefresh: string
    lastError?: string
}

type CreatureCache = {
    mappings: CreatureRecord[]
    imagePaths: Map<number, string>
    sourceFile: string
    imageDirectory: string
    lastRefresh: string
    lastError?: string
}

const DEFAULT_PAGE_SIZE = 60
const MAX_PAGE_SIZE = 200
const IMAGE_EXTENSIONS = new Set([".png", ".jpg", ".jpeg", ".webp"])
const IMAGE_MIME_MAP: Record<string, string> = {
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".webp": "image/webp",
}

export const dynamic = "force-dynamic"

declare global {
    // eslint-disable-next-line no-var
    var __adminDashboardCreatureCache: CreatureCache | undefined
}

function parseIntOr(input: string | null, fallback: number): number {
    if (!input) return fallback
    const parsed = Number.parseInt(input, 10)
    return Number.isFinite(parsed) ? parsed : fallback
}

function normalizeQuery(request: NextRequest): CreatureQuery {
    const params = request.nextUrl.searchParams
    const imageFilterRaw = (params.get("imageFilter") || "all").toLowerCase()
    const imageFilter: CreatureQuery["imageFilter"] =
        imageFilterRaw === "with" || imageFilterRaw === "without"
            ? imageFilterRaw
            : "all"

    const page = Math.max(1, parseIntOr(params.get("page"), 1))
    const pageSize = Math.min(
        MAX_PAGE_SIZE,
        Math.max(1, parseIntOr(params.get("pageSize"), DEFAULT_PAGE_SIZE))
    )

    return {
        search: (params.get("search") || "").trim(),
        imageFilter,
        page,
        pageSize,
    }
}

async function resolveReadableFile(candidates: string[]): Promise<string> {
    for (const candidate of candidates) {
        if (!candidate) continue
        try {
            await access(candidate, fsConstants.R_OK)
            return candidate
        } catch {
            // continue
        }
    }
    return ""
}

async function resolveReadableDirectory(candidates: string[]): Promise<string> {
    for (const candidate of candidates) {
        if (!candidate) continue
        try {
            await access(candidate, fsConstants.R_OK)
            return candidate
        } catch {
            // continue
        }
    }
    return ""
}

async function resolveMonsterApprFile(): Promise<string> {
    const fromEnv = (process.env.GM_MONSTER_APPR_FILE || "").trim()
    return resolveReadableFile([
        fromEnv,
        join(process.cwd(), "..", "tools", "monster_appr.json"),
        join(process.cwd(), "tools", "monster_appr.json"),
    ])
}

async function resolveMonsterImageDirectory(): Promise<string> {
    const fromEnv = (process.env.GM_MONSTER_IMAGE_DIR || "").trim()
    return resolveReadableDirectory([
        fromEnv,
        join(process.cwd(), "..", "decompile", "web", "@resource", "image"),
        join(process.cwd(), "..", "decompile", "web", "Resource", "image"),
        join(process.cwd(), "..", "decompile", "web", "Resource", "images"),
        join(process.cwd(), "..", "web", "@resource", "image"),
        join(process.cwd(), "..", "web", "Resource", "image"),
        join(process.cwd(), "..", "web", "Resource", "images"),
        join(process.cwd(), "decompile", "web", "@resource", "image"),
        join(process.cwd(), "decompile", "web", "Resource", "image"),
        join(process.cwd(), "decompile", "web", "Resource", "images"),
        join(process.cwd(), "web", "@resource", "image"),
        join(process.cwd(), "web", "Resource", "image"),
        join(process.cwd(), "web", "Resource", "images"),
    ])
}

function parseCreatureRecords(payload: unknown): CreatureRecord[] {
    if (!payload || typeof payload !== "object" || Array.isArray(payload)) {
        return []
    }

    const entries = Object.entries(payload as Record<string, unknown>)
    const records: CreatureRecord[] = []

    for (const [nameRaw, apprRaw] of entries) {
        const name = String(nameRaw || "").trim()
        const apprId =
            typeof apprRaw === "number"
                ? Math.trunc(apprRaw)
                : Number.parseInt(String(apprRaw || ""), 10)
        if (!name || !Number.isFinite(apprId) || apprId <= 0) continue

        records.push({
            name,
            apprId,
        })
    }

    records.sort((a, b) => {
        if (a.apprId === b.apprId) return a.name.localeCompare(b.name)
        return a.apprId - b.apprId
    })

    return records
}

async function buildImagePathMap(
    imageDirectory: string
): Promise<Map<number, string>> {
    if (!imageDirectory) return new Map<number, string>()

    const entries = await readdir(imageDirectory, { withFileTypes: true })
    const imagePaths = new Map<number, string>()

    for (const entry of entries) {
        if (!entry.isFile()) continue
        const ext = extname(entry.name).toLowerCase()
        if (!IMAGE_EXTENSIONS.has(ext)) continue

        const base = entry.name.slice(0, -ext.length)
        const apprId = Number.parseInt(base, 10)
        if (!Number.isFinite(apprId)) continue

        imagePaths.set(apprId, join(imageDirectory, entry.name))
    }

    return imagePaths
}

async function loadCreatureCache(forceRefresh = false): Promise<CreatureCache> {
    if (!forceRefresh && global.__adminDashboardCreatureCache) {
        return global.__adminDashboardCreatureCache
    }

    const sourceFile = await resolveMonsterApprFile()
    const imageDirectory = await resolveMonsterImageDirectory()
    const loadedAt = new Date().toISOString()

    let mappings: CreatureRecord[] = []
    let imagePaths = new Map<number, string>()
    let lastError = ""

    if (!sourceFile) {
        lastError = API_MESSAGES.creatures.monsterApprFileNotFound
    } else {
        try {
            const raw = await readFile(sourceFile, "utf8")
            const payload = JSON.parse(raw) as unknown
            mappings = parseCreatureRecords(payload)
        } catch (error) {
            lastError = resolveErrorMessage(
                error,
                API_MESSAGES.creatures.monsterApprParseFailed
            )
        }
    }

    if (!imageDirectory) {
        lastError = lastError || API_MESSAGES.creatures.imageDirectoryNotFound
    } else {
        try {
            imagePaths = await buildImagePathMap(imageDirectory)
        } catch (error) {
            const message = resolveErrorMessage(
                error,
                API_MESSAGES.creatures.imageDirectoryScanFailed
            )
            lastError = lastError ? `${lastError}; ${message}` : message
        }
    }

    const cache: CreatureCache = {
        mappings,
        imagePaths,
        sourceFile,
        imageDirectory,
        lastRefresh: loadedAt,
        lastError: lastError || undefined,
    }

    global.__adminDashboardCreatureCache = cache
    return cache
}

function totalPages(total: number, pageSize: number): number {
    if (total === 0) return 0
    return Math.ceil(total / pageSize)
}

function matchesSearch(record: CreatureRecord, search: string): boolean {
    if (!search) return true
    const lowered = search.toLowerCase()
    if (record.name.toLowerCase().includes(lowered)) return true
    return String(record.apprId).includes(lowered)
}

function applyImageFilter(
    rows: CreatureRow[],
    imageFilter: CreatureQuery["imageFilter"]
): CreatureRow[] {
    if (imageFilter === "all") return rows
    if (imageFilter === "with") return rows.filter(row => row.hasImage)
    return rows.filter(row => !row.hasImage)
}

async function withImageData(rows: CreatureRow[]): Promise<CreatureRow[]> {
    return Promise.all(
        rows.map(async row => {
            if (!row.hasImage || !row.imagePath) return row

            try {
                const binary = await readFile(row.imagePath)
                const ext = extname(row.imagePath).toLowerCase()
                const mime = IMAGE_MIME_MAP[ext] || "application/octet-stream"
                const imageDataUrl = `data:${mime};base64,${binary.toString("base64")}`
                return { ...row, imageDataUrl }
            } catch {
                return row
            }
        })
    )
}

export async function GET(request: NextRequest) {
    const query = normalizeQuery(request)
    const forceRefresh = request.nextUrl.searchParams.get("refresh") === "1"

    const fallbackResult: CreatureSearchResult = {
        items: [],
        total: 0,
        page: query.page,
        pageSize: query.pageSize,
        totalPages: 0,
        mappingCount: 0,
        sourceFile: "",
        imageDirectory: "",
        imageCount: 0,
        lastRefresh: new Date().toISOString(),
    }

    try {
        const cache = await loadCreatureCache(forceRefresh)
        const mappedRows: CreatureRow[] = cache.mappings.map(record => {
            const imagePath = cache.imagePaths.get(record.apprId) || ""
            return {
                name: record.name,
                apprId: record.apprId,
                hasImage: Boolean(imagePath),
                imagePath,
                imageDataUrl: "",
            }
        })

        const matched = applyImageFilter(
            mappedRows.filter(row =>
                matchesSearch(
                    { name: row.name, apprId: row.apprId },
                    query.search
                )
            ),
            query.imageFilter
        )

        const total = matched.length
        const pages = totalPages(total, query.pageSize)
        const safePage = pages > 0 ? Math.min(query.page, pages) : 1
        const start = (safePage - 1) * query.pageSize
        const pageRows = matched.slice(start, start + query.pageSize)
        const rowsWithImages = await withImageData(pageRows)

        const result: CreatureSearchResult = {
            items: rowsWithImages,
            total,
            page: safePage,
            pageSize: query.pageSize,
            totalPages: pages,
            mappingCount: cache.mappings.length,
            sourceFile: cache.sourceFile,
            imageDirectory: cache.imageDirectory,
            imageCount: cache.imagePaths.size,
            lastRefresh: cache.lastRefresh,
            lastError: cache.lastError,
        }

        return NextResponse.json(result)
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.common.unknownErrorLowercase
        )
        return NextResponse.json(
            {
                ...fallbackResult,
                lastError: message,
            },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
