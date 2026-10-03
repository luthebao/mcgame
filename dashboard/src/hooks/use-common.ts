"use client"

import { useEffect, useState } from "react"

export function useDebounce<T>(value: T, delay: number = 500): T {
    const [debouncedValue, setDebouncedValue] = useState<T>(value)

    useEffect(() => {
        const handler = setTimeout(() => setDebouncedValue(value), delay)
        return () => clearTimeout(handler)
    }, [value, delay])

    return debouncedValue
}

export function useToggle(initialValue: boolean = false) {
    const [value, setValue] = useState(initialValue)
    const toggle = () => setValue(prev => !prev)
    return [value, setValue, toggle] as const
}
