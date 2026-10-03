"use client"

import Image from "next/image"
import { useState, useEffect, useMemo, useRef, useCallback } from "react"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import { Badge } from "@/components/ui/badge"
import {
    Map,
    ZoomIn,
    ZoomOut,
    RotateCcw,
    Search,
    Navigation,
} from "lucide-react"
import {
    DASHBOARD_API_ENDPOINTS,
    buildDashboardAPIPath,
} from "@/lib/api/endpoints"

// Available map IDs
const AVAILABLE_MAPS = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "101",
    "1000",
    "10000",
    "10001",
    "10002",
    "10010",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2010",
    "2013",
    "2019",
    "2031",
    "2032",
    "2033",
    "2034",
    "2035",
    "2036",
    "2037",
    "2040",
    "2041",
    "2042",
    "2043",
    "2044",
    "2051",
    "2052",
    "2053",
    "2054",
    "2055",
    "2056",
    "4001",
    "4002",
    "4003",
    "4004",
    "4005",
    "4006",
    "4007",
    "20001",
].sort((a, b) => parseInt(a) - parseInt(b))

interface MapTile {
    row: number
    col: number
    serverX: number | null
    serverY: number | null
    type: number
}

interface MapData {
    tiles: Array<{ x: number; y: number; type: number }>
    tile_count: number
    xRange: { min: number; max: number }
    yRange: { min: number; max: number }
    offsetX: number
    offsetY: number
}

interface MapChunk {
    row: number
    col: number
    filename: string
}

interface MapChunksData {
    chunkCount: number
    rows: number
    cols: number
    chunks: MapChunk[]
}

const MIN_TILE_SIZE = 40
const MAX_TILE_SIZE = 200
const MAP_RENDER_SCALE = 0.5

export default function MapViewerPage() {
    // State
    const [currentMapId, setCurrentMapId] = useState("10001")
    const [tileSize, setTileSize] = useState(MIN_TILE_SIZE)
    const [defaultTileSize, setDefaultTileSize] = useState(MIN_TILE_SIZE)
    const [showOverlays, setShowOverlays] = useState(true)
    const [showCoords, setShowCoords] = useState(false)
    const [mapData, setMapData] = useState<MapData | null>(null)
    const [tileGrid, setTileGrid] = useState<MapTile[][]>([])
    const [mapPreviewAvailable, setMapPreviewAvailable] = useState(true)
    const [mapChunks, setMapChunks] = useState<MapChunk[]>([])
    const [mapChunkRows, setMapChunkRows] = useState(0)
    const [mapChunkCols, setMapChunkCols] = useState(0)
    const [selectedTile, setSelectedTile] = useState<{
        row: number
        col: number
    } | null>(null)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState<string | null>(null)

    // Coordinate conversion settings
    const [coordScale, setCoordScale] = useState(50)
    const [coordOffsetX, setCoordOffsetX] = useState(6)
    const [coordOffsetY, setCoordOffsetY] = useState(7)

    // Search state
    const [searchRow, setSearchRow] = useState("")
    const [searchCol, setSearchCol] = useState("")
    const [serverX, setServerX] = useState("")
    const [serverY, setServerY] = useState("")
    const [convertResult, setConvertResult] = useState<string | null>(null)

    const mapContainerRef = useRef<HTMLDivElement>(null)

    // Grid dimensions
    const [gridRows, setGridRows] = useState(30)
    const [gridCols, setGridCols] = useState(50)

    const processMapData = useCallback((data: any) => {
        if (!data.tiles || !Array.isArray(data.tiles)) {
            throw new Error("Invalid map data format")
        }

        // Find coordinate ranges
        let minX = Infinity,
            maxX = -Infinity
        let minY = Infinity,
            maxY = -Infinity

        data.tiles.forEach((tile: { x: number; y: number; type: number }) => {
            if (tile.x < minX) minX = tile.x
            if (tile.x > maxX) maxX = tile.x
            if (tile.y < minY) minY = tile.y
            if (tile.y > maxY) maxY = tile.y
        })

        // Calculate grid dimensions
        const serverRows = maxY - minY + 1
        const serverCols = maxX - minX + 1
        const rows = Math.max(30, serverRows)
        const cols = Math.max(50, serverCols)

        setGridRows(rows)
        setGridCols(cols)

        // Build tile grid
        const grid: MapTile[][] = []
        for (let r = 0; r < rows; r++) {
            grid[r] = []
            for (let c = 0; c < cols; c++) {
                grid[r][c] = {
                    row: r,
                    col: c,
                    serverX: null,
                    serverY: null,
                    type: -1,
                }
            }
        }

        // Map server coordinates to tile grid
        data.tiles.forEach((tile: { x: number; y: number; type: number }) => {
            const tileRow = tile.y - minY
            const tileCol = tile.x - minX

            if (
                tileRow >= 0 &&
                tileRow < rows &&
                tileCol >= 0 &&
                tileCol < cols
            ) {
                if (grid[tileRow]) {
                    grid[tileRow][tileCol] = {
                        row: tileRow,
                        col: tileCol,
                        serverX: tile.x,
                        serverY: tile.y,
                        type: tile.type,
                    }
                }
            }
        })

        setTileGrid(grid)
        setMapData({
            tiles: data.tiles,
            tile_count: data.tile_count || data.tiles.length,
            xRange: { min: minX, max: maxX },
            yRange: { min: minY, max: maxY },
            offsetX: minX,
            offsetY: minY,
        })

        return { rows, cols }
    }, [])

    const loadMap = useCallback(
        async (mapId: string) => {
            setLoading(true)
            setError(null)
            setMapPreviewAvailable(true)
            setMapChunks([])
            setMapChunkRows(0)
            setMapChunkCols(0)
            setSelectedTile(null)

            try {
                // Load collision tiles + map chunks metadata
                const [tilesResponse, chunksResponse] = await Promise.all([
                    fetch(
                        buildDashboardAPIPath(
                            DASHBOARD_API_ENDPOINTS.mapTiles(mapId)
                        )
                    ),
                    fetch(
                        buildDashboardAPIPath(
                            DASHBOARD_API_ENDPOINTS.mapChunks(mapId)
                        )
                    ),
                ])

                if (!tilesResponse.ok) {
                    throw new Error(
                        `Failed to load map_tiles.json for map ${mapId}`
                    )
                }

                const tilesData = await tilesResponse.json()
                processMapData(tilesData)

                if (chunksResponse.ok) {
                    const chunksData: MapChunksData =
                        await chunksResponse.json()
                    setMapChunks(chunksData.chunks || [])
                    setMapChunkRows(chunksData.rows || 0)
                    setMapChunkCols(chunksData.cols || 0)

                    setDefaultTileSize(MIN_TILE_SIZE)
                    setTileSize(MIN_TILE_SIZE)
                } else {
                    setDefaultTileSize(MIN_TILE_SIZE)
                    setTileSize(MIN_TILE_SIZE)
                }
            } catch (err) {
                setError(
                    err instanceof Error ? err.message : "Failed to load map"
                )
                console.error("Error loading map:", err)
            } finally {
                setLoading(false)
            }
        },
        [processMapData]
    )

    // Load map data on initial render and when map ID changes
    useEffect(() => {
        loadMap(currentMapId)
    }, [currentMapId, loadMap])

    const handleTileClick = (row: number, col: number) => {
        setSelectedTile({ row, col })

        // Scroll tile into view
        const tileElement = document.querySelector(
            `[data-row="${row}"][data-col="${col}"]`
        )
        if (tileElement) {
            tileElement.scrollIntoView({
                behavior: "smooth",
                block: "center",
                inline: "center",
            })
        }
    }

    const goToTile = () => {
        const row = parseInt(searchRow)
        const col = parseInt(searchCol)

        if (isNaN(row) || isNaN(col)) {
            setConvertResult("Please enter valid tile coordinates")
            return
        }

        if (row < 0 || row >= gridRows || col < 0 || col >= gridCols) {
            setConvertResult(
                `Tile coordinates out of range. Valid: row 0-${gridRows - 1}, col 0-${gridCols - 1}`
            )
            return
        }

        handleTileClick(row, col)
        setConvertResult(`Navigated to tile (${row}, ${col})`)
    }

    const convertServerToTile = () => {
        const sx = parseInt(serverX)
        const sy = parseInt(serverY)

        if (isNaN(sx) || isNaN(sy)) {
            setConvertResult("Please enter valid server coordinates")
            return
        }

        const tileCol = Math.floor(sx / coordScale) - coordOffsetX
        const tileRow = Math.floor(sy / coordScale) - coordOffsetY

        if (
            tileRow < 0 ||
            tileRow >= gridRows ||
            tileCol < 0 ||
            tileCol >= gridCols
        ) {
            setConvertResult(`Tile (${tileRow}, ${tileCol}) out of bounds`)
            return
        }

        const tile = tileGrid[tileRow]?.[tileCol]
        const typeInfo =
            tile?.type === 0
                ? "Walkable"
                : tile?.type === 2
                  ? "Blocked"
                  : "Unknown"

        setConvertResult(
            `Server (${sx}, ${sy}) -> Tile (${tileRow}, ${tileCol}) - Type: ${typeInfo}`
        )
        handleTileClick(tileRow, tileCol)
    }

    const zoomIn = () => {
        setTileSize(prev => Math.min(MAX_TILE_SIZE, prev + 10))
    }

    const zoomOut = () => {
        setTileSize(prev => Math.max(MIN_TILE_SIZE, prev - 10))
    }

    const resetZoom = () => {
        setTileSize(defaultTileSize)
    }

    // Calculate statistics once per tile grid update
    const stats = useMemo(() => {
        if (!mapData) {
            return null
        }

        let walkable = 0
        let blocked = 0
        for (const row of tileGrid) {
            for (const tile of row) {
                if (tile.type === 0) walkable++
                if (tile.type === 2) blocked++
            }
        }

        return { walkable, blocked }
    }, [mapData, tileGrid])

    // Get selected tile info
    const selectedTileInfo =
        selectedTile !== null
            ? tileGrid[selectedTile.row]?.[selectedTile.col]
            : null
    const renderedTileSize = Math.max(
        1,
        Math.round(tileSize * MAP_RENDER_SCALE)
    )
    const mapStageWidth = gridCols * renderedTileSize
    const mapStageHeight = gridRows * renderedTileSize
    const chunkBounds = useMemo(() => {
        if (mapChunks.length === 0) {
            return { minRow: 0, minCol: 0 }
        }

        let minRow = Number.POSITIVE_INFINITY
        let minCol = Number.POSITIVE_INFINITY

        for (const chunk of mapChunks) {
            if (chunk.row < minRow) minRow = chunk.row
            if (chunk.col < minCol) minCol = chunk.col
        }

        return {
            minRow: Number.isFinite(minRow) ? minRow : 0,
            minCol: Number.isFinite(minCol) ? minCol : 0,
        }
    }, [mapChunks])

    return (
        <div className="flex h-[calc(100vh-9rem)] min-h-[680px] gap-3 overflow-hidden">
            {/* Left Column */}
            <aside className="w-[320px] shrink-0 overflow-y-auto pr-1">
                <div className="space-y-2">
                    <Card>
                        <CardHeader className="p-3 pb-2">
                            <CardTitle className="text-base">
                                Map Controls
                            </CardTitle>
                            <CardDescription className="text-xs">
                                Select map and adjust display settings
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-2 p-3 pt-0">
                            <div>
                                <Label htmlFor="mapSelect" className="text-xs">
                                    Map ID
                                </Label>
                                <Select
                                    value={currentMapId}
                                    onValueChange={setCurrentMapId}
                                >
                                    <SelectTrigger
                                        id="mapSelect"
                                        className="h-8 w-full"
                                    >
                                        <SelectValue placeholder="Select map" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {AVAILABLE_MAPS.map(mapId => (
                                            <SelectItem
                                                key={mapId}
                                                value={mapId}
                                            >
                                                Map {mapId}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>

                            <p className="text-xs text-muted-foreground">
                                Tile Size: {tileSize}px
                            </p>

                            <div className="space-y-1">
                                <div className="flex items-center gap-2">
                                    <Switch
                                        id="showOverlays"
                                        checked={showOverlays}
                                        onCheckedChange={setShowOverlays}
                                    />
                                    <Label
                                        htmlFor="showOverlays"
                                        className="text-xs"
                                    >
                                        Show tile types
                                    </Label>
                                </div>
                                <div className="flex items-center gap-2">
                                    <Switch
                                        id="showCoords"
                                        checked={showCoords}
                                        onCheckedChange={setShowCoords}
                                    />
                                    <Label
                                        htmlFor="showCoords"
                                        className="text-xs"
                                    >
                                        Show coordinates
                                    </Label>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader className="p-2 pb-1">
                            <CardTitle className="text-sm">
                                Current Tile
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-1 p-2 pt-0 text-xs">
                            <div className="flex justify-between">
                                <span className="text-muted-foreground">
                                    Tile (Row, Col):
                                </span>
                                <span className="font-mono font-medium">
                                    {selectedTile
                                        ? `(${selectedTile.row}, ${selectedTile.col})`
                                        : "-"}
                                </span>
                            </div>
                            <div className="flex justify-between">
                                <span className="text-muted-foreground">
                                    Server (X, Y):
                                </span>
                                <span className="font-mono font-medium">
                                    {selectedTileInfo &&
                                    selectedTileInfo.serverX !== null
                                        ? `(${selectedTileInfo.serverX}, ${selectedTileInfo.serverY})`
                                        : "-"}
                                </span>
                            </div>
                            <div className="flex justify-between">
                                <span className="text-muted-foreground">
                                    Type:
                                </span>
                                <Badge
                                    variant={
                                        selectedTileInfo?.type === 0
                                            ? "default"
                                            : selectedTileInfo?.type === 2
                                              ? "destructive"
                                              : "secondary"
                                    }
                                >
                                    {selectedTileInfo?.type === 0
                                        ? "Walkable"
                                        : selectedTileInfo?.type === 2
                                          ? "Blocked"
                                          : (selectedTileInfo?.type ?? -1) >= 0
                                            ? `Type ${selectedTileInfo!.type}`
                                            : "Unknown"}
                                </Badge>
                            </div>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader className="p-2 pb-1">
                            <CardTitle className="flex items-center gap-2 text-sm">
                                <Search className="h-3.5 w-3.5" />
                                Find by Server Coord
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-2 p-2 pt-0">
                            <div className="grid grid-cols-2 gap-2">
                                <div>
                                    <Label
                                        htmlFor="serverX"
                                        className="text-xs"
                                    >
                                        Server X
                                    </Label>
                                    <Input
                                        id="serverX"
                                        type="number"
                                        className="h-8"
                                        value={serverX}
                                        onChange={e =>
                                            setServerX(e.target.value)
                                        }
                                        placeholder="425"
                                    />
                                </div>
                                <div>
                                    <Label
                                        htmlFor="serverY"
                                        className="text-xs"
                                    >
                                        Server Y
                                    </Label>
                                    <Input
                                        id="serverY"
                                        type="number"
                                        className="h-8"
                                        value={serverY}
                                        onChange={e =>
                                            setServerY(e.target.value)
                                        }
                                        placeholder="400"
                                    />
                                </div>
                            </div>
                            <Button
                                onClick={convertServerToTile}
                                className="w-full"
                                size="sm"
                            >
                                Find & Go To
                            </Button>
                            {convertResult && (
                                <div className="rounded bg-muted p-2 text-xs">
                                    {convertResult}
                                </div>
                            )}
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader className="p-2 pb-1">
                            <CardTitle className="flex items-center gap-2 text-sm">
                                <Navigation className="h-3.5 w-3.5" />
                                Go To Tile
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-2 p-2 pt-0">
                            <div className="grid grid-cols-2 gap-2">
                                <div>
                                    <Label
                                        htmlFor="searchRow"
                                        className="text-xs"
                                    >
                                        Tile Row
                                    </Label>
                                    <Input
                                        id="searchRow"
                                        type="number"
                                        className="h-8"
                                        value={searchRow}
                                        onChange={e =>
                                            setSearchRow(e.target.value)
                                        }
                                        placeholder="0"
                                    />
                                </div>
                                <div>
                                    <Label
                                        htmlFor="searchCol"
                                        className="text-xs"
                                    >
                                        Tile Col
                                    </Label>
                                    <Input
                                        id="searchCol"
                                        type="number"
                                        className="h-8"
                                        value={searchCol}
                                        onChange={e =>
                                            setSearchCol(e.target.value)
                                        }
                                        placeholder="0"
                                    />
                                </div>
                            </div>
                            <Button
                                onClick={goToTile}
                                className="w-full"
                                size="sm"
                                variant="secondary"
                            >
                                Go To Tile
                            </Button>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader className="p-2 pb-1">
                            <CardTitle className="text-sm">Legend</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-1.5 p-2 pt-0 text-xs">
                            <div className="flex items-center gap-2">
                                <div className="h-4 w-4 rounded border border-green-500 bg-green-500/30" />
                                <span>Walkable (Type 0)</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="h-4 w-4 rounded border border-red-500 bg-red-500/30" />
                                <span>Blocked (Type 2)</span>
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="h-4 w-4 rounded border-2 border-yellow-500 bg-yellow-500/60" />
                                <span>Selected</span>
                            </div>
                        </CardContent>
                    </Card>

                    {stats && (
                        <Card>
                            <CardHeader className="p-2 pb-1">
                                <CardTitle className="text-sm">
                                    Map Statistics
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-1 p-2 pt-0 text-xs">
                                <div className="flex justify-between">
                                    <span className="text-muted-foreground">
                                        Map ID:
                                    </span>
                                    <span className="font-medium">
                                        {currentMapId}
                                    </span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-muted-foreground">
                                        Grid size:
                                    </span>
                                    <span className="font-medium">
                                        {gridCols} x {gridRows}
                                    </span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-muted-foreground">
                                        Walkable:
                                    </span>
                                    <span className="font-medium text-green-600">
                                        {stats.walkable}
                                    </span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-muted-foreground">
                                        Blocked:
                                    </span>
                                    <span className="font-medium text-red-600">
                                        {stats.blocked}
                                    </span>
                                </div>
                                {mapData?.xRange && (
                                    <>
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">
                                                Server X range:
                                            </span>
                                            <span className="font-medium text-xs">
                                                {mapData.xRange.min} -{" "}
                                                {mapData.xRange.max}
                                            </span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">
                                                Server Y range:
                                            </span>
                                            <span className="font-medium text-xs">
                                                {mapData.yRange.min} -{" "}
                                                {mapData.yRange.max}
                                            </span>
                                        </div>
                                    </>
                                )}
                            </CardContent>
                        </Card>
                    )}
                </div>
            </aside>

            {/* Map Display */}
            <section className="min-h-0 min-w-0 flex-1">
                <Card className="h-full overflow-hidden">
                    <CardContent className="flex h-full min-h-0 min-w-0 overflow-hidden p-3">
                        {loading ? (
                            <div className="flex h-full w-full items-center justify-center">
                                <div className="text-center">
                                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4" />
                                    <p className="text-muted-foreground">
                                        Loading map...
                                    </p>
                                </div>
                            </div>
                        ) : error ? (
                            <div className="flex h-full w-full items-center justify-center">
                                <div className="text-center text-red-500">
                                    <p className="font-medium">
                                        Error loading map
                                    </p>
                                    <p className="text-sm">{error}</p>
                                </div>
                            </div>
                        ) : (
                            <div className="relative flex h-full min-h-0 min-w-0 flex-1 overflow-hidden">
                                <div
                                    ref={mapContainerRef}
                                    className="h-full w-full min-w-0 overflow-auto rounded-lg border bg-slate-950"
                                >
                                    <div
                                        className="relative"
                                        style={{
                                            width: mapStageWidth,
                                            height: mapStageHeight,
                                        }}
                                    >
                                        {mapChunks.length > 0 &&
                                        mapChunkRows > 0 &&
                                        mapChunkCols > 0 ? (
                                            <div className="absolute inset-0 pointer-events-none select-none">
                                                {mapChunks.map(chunk => {
                                                    const normalizedCol =
                                                        chunk.col -
                                                        chunkBounds.minCol
                                                    const normalizedRow =
                                                        chunk.row -
                                                        chunkBounds.minRow
                                                    const left = Math.round(
                                                        (normalizedCol *
                                                            mapStageWidth) /
                                                            mapChunkCols
                                                    )
                                                    const right = Math.round(
                                                        ((normalizedCol + 1) *
                                                            mapStageWidth) /
                                                            mapChunkCols
                                                    )
                                                    const top = Math.round(
                                                        (normalizedRow *
                                                            mapStageHeight) /
                                                            mapChunkRows
                                                    )
                                                    const bottom = Math.round(
                                                        ((normalizedRow + 1) *
                                                            mapStageHeight) /
                                                            mapChunkRows
                                                    )

                                                    return (
                                                        <Image
                                                            key={chunk.filename}
                                                            src={buildDashboardAPIPath(
                                                                DASHBOARD_API_ENDPOINTS.mapTileAsset(
                                                                    currentMapId,
                                                                    chunk.filename
                                                                )
                                                            )}
                                                            alt=""
                                                            width={200}
                                                            height={200}
                                                            unoptimized
                                                            loading="lazy"
                                                            className="absolute object-fill [image-rendering:pixelated]"
                                                            style={{
                                                                left,
                                                                top,
                                                                width: Math.max(
                                                                    1,
                                                                    right - left
                                                                ),
                                                                height: Math.max(
                                                                    1,
                                                                    bottom - top
                                                                ),
                                                            }}
                                                        />
                                                    )
                                                })}
                                            </div>
                                        ) : (
                                            mapPreviewAvailable && (
                                                <Image
                                                    src={buildDashboardAPIPath(
                                                        DASHBOARD_API_ENDPOINTS.mapTileAsset(
                                                            currentMapId,
                                                            "small.jpg"
                                                        )
                                                    )}
                                                    alt={`Map ${currentMapId} preview`}
                                                    fill
                                                    unoptimized
                                                    priority
                                                    sizes="100vw"
                                                    className="absolute inset-0 object-fill pointer-events-none select-none [image-rendering:pixelated]"
                                                    onError={() =>
                                                        setMapPreviewAvailable(
                                                            false
                                                        )
                                                    }
                                                />
                                            )
                                        )}

                                        {!mapPreviewAvailable && (
                                            <div className="absolute inset-0 bg-slate-900" />
                                        )}

                                        <div
                                            className="absolute inset-0 box-border grid gap-0 border-l border-t border-slate-800/80"
                                            style={{
                                                gridTemplateColumns: `repeat(${gridCols}, ${renderedTileSize}px)`,
                                                gridTemplateRows: `repeat(${gridRows}, ${renderedTileSize}px)`,
                                            }}
                                        >
                                            {tileGrid.map((row, rowIndex) =>
                                                row.map((tile, colIndex) => {
                                                    const isSelected =
                                                        selectedTile?.row ===
                                                            rowIndex &&
                                                        selectedTile?.col ===
                                                            colIndex

                                                    return (
                                                        <div
                                                            key={`${rowIndex}-${colIndex}`}
                                                            data-row={rowIndex}
                                                            data-col={colIndex}
                                                            className={`
                              relative cursor-pointer border-b border-r border-slate-800/80
                              hover:ring-1 hover:ring-white/70 hover:z-10
                              ${isSelected ? "z-10 ring-2 ring-yellow-400 ring-inset" : ""}
                              ${showOverlays && tile.type === 0 ? "bg-green-500/20" : ""}
                              ${showOverlays && tile.type === 2 ? "bg-red-500/20" : ""}
                            `}
                                                            style={{
                                                                width: renderedTileSize,
                                                                height: renderedTileSize,
                                                            }}
                                                            onClick={() =>
                                                                handleTileClick(
                                                                    rowIndex,
                                                                    colIndex
                                                                )
                                                            }
                                                        >
                                                            {/* Coordinates overlay */}
                                                            {showCoords && (
                                                                <div className="absolute bottom-0 right-0 bg-black/70 text-white text-[9px] px-1 rounded-tl">
                                                                    {tile.serverX !==
                                                                    null
                                                                        ? `S:${tile.serverX},${tile.serverY}`
                                                                        : `${rowIndex},${colIndex}`}
                                                                </div>
                                                            )}
                                                        </div>
                                                    )
                                                })
                                            )}
                                        </div>
                                    </div>
                                </div>

                                <div className="absolute bottom-3 right-3 z-20 flex items-center gap-2 rounded-md border border-slate-700 bg-slate-900/90 p-2 shadow-lg backdrop-blur">
                                    <Button
                                        onClick={zoomIn}
                                        size="icon"
                                        variant="outline"
                                        className="h-8 w-8"
                                    >
                                        <ZoomIn className="h-4 w-4" />
                                    </Button>
                                    <Button
                                        onClick={zoomOut}
                                        size="icon"
                                        variant="outline"
                                        className="h-8 w-8"
                                    >
                                        <ZoomOut className="h-4 w-4" />
                                    </Button>
                                    <Button
                                        onClick={resetZoom}
                                        size="icon"
                                        variant="outline"
                                        className="h-8 w-8"
                                    >
                                        <RotateCcw className="h-4 w-4" />
                                    </Button>
                                </div>
                            </div>
                        )}
                    </CardContent>
                </Card>
            </section>
        </div>
    )
}
