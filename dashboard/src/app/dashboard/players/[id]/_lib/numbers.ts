export function toInt(value: string): number | undefined {
    if (value === "") return undefined
    const n = Number(value)
    return Number.isFinite(n) ? Math.trunc(n) : undefined
}
