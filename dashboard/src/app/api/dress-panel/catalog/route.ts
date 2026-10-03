import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { readAdminSessionFromRequest } from "@/lib/server/admin-session"
import { createAdminClient } from "@/lib/supabase/admin"

type DressRow = {
    id: number
    name: string | null
    type: number | null
    equipt_id: number | null
    recipe_id: number | null
}

type RecipeRow = {
    id: number
    name: string | null
    type: number | null
    product: number | null
}

type ItemRow = {
    id: number
    name: string | null
}

type DressPanelBookOption = {
    id: number
    name: string
    type: number
    itemId: number
    itemName: string
    recipeId: number
    recipeName: string
}

type DressPanelRecipeOption = {
    id: number
    name: string
    type: number
    product: number
    productName: string
}

export const dynamic = "force-dynamic"

function asInt(value: unknown, fallback = 0): number {
    if (typeof value === "number" && Number.isFinite(value))
        return Math.trunc(value)
    if (typeof value === "string" && value.trim()) {
        const parsed = Number.parseInt(value, 10)
        if (Number.isFinite(parsed)) return parsed
    }
    return fallback
}

function fallbackName(kind: string, id: number): string {
    return `${kind} #${id}`
}

export async function GET(request: NextRequest) {
    const session = await readAdminSessionFromRequest(request)
    if (!session) {
        return NextResponse.json(
            {
                ok: false,
                bookOptions: [],
                recipeOptions: [],
                message: API_MESSAGES.admin.loginRequired,
            },
            { status: HTTP_STATUS.UNAUTHORIZED }
        )
    }

    try {
        const supabase = createAdminClient()

        const [
            { data: dressRows, error: dressError },
            { data: recipeRows, error: recipeError },
        ] = await Promise.all([
            supabase
                .schema("data")
                .from("data_tbl_dress")
                .select("id, name, type, equipt_id, recipe_id")
                .order("type", { ascending: true })
                .order("id", { ascending: true }),
            supabase
                .schema("data")
                .from("data_tbl_recipe")
                .select("id, name, type, product")
                .order("type", { ascending: true })
                .order("id", { ascending: true }),
        ])

        if (dressError) throw new Error(dressError.message)
        if (recipeError) throw new Error(recipeError.message)

        const recipeNameById = new Map<number, string>()
        for (const row of (recipeRows || []) as RecipeRow[]) {
            const id = asInt(row.id)
            if (id <= 0) continue
            recipeNameById.set(
                id,
                row.name?.trim() || fallbackName("Recipe", id)
            )
        }

        const itemIDs = Array.from(
            new Set(
                ((dressRows || []) as DressRow[])
                    .map(row => asInt(row.equipt_id))
                    .filter(id => id > 0)
            )
        )

        const itemNameById = new Map<number, string>()
        if (itemIDs.length > 0) {
            const { data: itemRows, error: itemError } = await supabase
                .schema("data")
                .from("data_tbl_item_template")
                .select("id, name")
                .in("id", itemIDs)

            if (itemError) throw new Error(itemError.message)

            for (const row of (itemRows || []) as ItemRow[]) {
                const id = asInt(row.id)
                if (id <= 0) continue
                itemNameById.set(
                    id,
                    row.name?.trim() || fallbackName("Item", id)
                )
            }
        }

        const bookOptions: DressPanelBookOption[] = (
            (dressRows || []) as DressRow[]
        ).map(row => {
            const id = asInt(row.id)
            const recipeId = asInt(row.recipe_id)
            const itemId = asInt(row.equipt_id)

            return {
                id,
                name: row.name?.trim() || fallbackName("Dress", id),
                type: asInt(row.type),
                itemId,
                itemName:
                    itemId > 0
                        ? itemNameById.get(itemId) ||
                          fallbackName("Item", itemId)
                        : "",
                recipeId,
                recipeName:
                    recipeId > 0
                        ? recipeNameById.get(recipeId) ||
                          fallbackName("Recipe", recipeId)
                        : "",
            }
        })

        const recipeOptions: DressPanelRecipeOption[] = (
            (recipeRows || []) as RecipeRow[]
        ).map(row => {
            const id = asInt(row.id)
            const product = asInt(row.product)

            return {
                id,
                name: row.name?.trim() || fallbackName("Recipe", id),
                type: asInt(row.type),
                product,
                productName:
                    product > 0
                        ? recipeNameById.get(product) ||
                          fallbackName("Recipe", product)
                        : "",
            }
        })

        return NextResponse.json({
            ok: true,
            bookOptions,
            recipeOptions,
        })
    } catch (error) {
        const message = resolveErrorMessage(
            error,
            API_MESSAGES.items.dressPanelOptionsLoadFailed
        )
        return NextResponse.json(
            { ok: false, bookOptions: [], recipeOptions: [], message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
