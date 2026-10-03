import { NextRequest, NextResponse } from "next/server"

import { API_MESSAGES } from "@/constants/api-messages"
import { HTTP_STATUS } from "@/constants/http-status"
import { resolveErrorMessage } from "@/lib/api/response"
import { createAdminClient } from "@/lib/supabase/admin"

export const dynamic = "force-dynamic"

const TEMPLATE_TABLES: Record<number, { table: string; schema: string }> = {
    19: { table: "data_tbl_equipt_template", schema: "data" },
    29: { table: "data_tbl_item_template", schema: "data" },
}

export async function GET(
    request: NextRequest,
    { params }: { params: Promise<{ id: string }> }
) {
    const { id: idParam } = await params
    const itemId = Number.parseInt(idParam, 10)

    if (!Number.isFinite(itemId) || itemId <= 0) {
        return NextResponse.json(
            { error: "Invalid item ID" },
            { status: HTTP_STATUS.BAD_REQUEST }
        )
    }

    try {
        const supabase = createAdminClient()
        const searchParams = request.nextUrl.searchParams
        const tableIdParam = searchParams.get("tableId")
        const tableId = tableIdParam
            ? Number.parseInt(tableIdParam, 10)
            : null

        let resolvedTableId: number | null = tableId
        let templateTableName = ""

        if (!resolvedTableId || !TEMPLATE_TABLES[resolvedTableId]) {
            const { data: sourceRows } = await supabase
                .from("vw_item_source")
                .select("template_table_id, template_table_name")
                .eq("item_id", itemId)
                .limit(1)

            if (sourceRows && sourceRows.length > 0) {
                resolvedTableId = sourceRows[0].template_table_id as number
                templateTableName = sourceRows[0].template_table_name || ""
            }
        }

        if (!resolvedTableId || !TEMPLATE_TABLES[resolvedTableId]) {
            return NextResponse.json(
                { error: `Template table ${resolvedTableId} not supported` },
                { status: HTTP_STATUS.NOT_FOUND }
            )
        }

        const tableInfo = TEMPLATE_TABLES[resolvedTableId]

        const { data: templateRow, error: templateError } = await supabase
            .schema(tableInfo.schema)
            .from(tableInfo.table)
            .select("*")
            .eq("id", itemId)
            .single()

        if (templateError) {
            return NextResponse.json(
                { error: templateError.message },
                { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
            )
        }

        return NextResponse.json({
            itemId,
            templateTableId: resolvedTableId,
            templateTableName,
            rawTemplate: templateRow,
        })
    } catch (error) {
        const message = resolveErrorMessage(error, API_MESSAGES.common.unknownError)
        return NextResponse.json(
            { error: message },
            { status: HTTP_STATUS.INTERNAL_SERVER_ERROR }
        )
    }
}
