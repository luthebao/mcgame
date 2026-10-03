"use client"

import { useEffect, useState } from "react"
import Image from "next/image"

import { Badge } from "@/components/ui/badge"
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogDescription,
} from "@/components/ui/dialog"
import { Separator } from "@/components/ui/separator"
import { getErrorMessage } from "@/services/api"
import { fetchAPI } from "@/services/api"
import { DASHBOARD_API_ENDPOINTS } from "@/lib/api/endpoints"
import type { ItemBrowserRow } from "@/services/item.service"

import {
    ITEM_TYPE_LABELS,
    KIND_LABELS,
    getBindTypeLabel,
    getKindLabel,
    getPropTypeLabel,
    getTemplateTypeLabel,
    getTradableLabel,
    getUseTypeLabel,
} from "../_lib/shared"

type TemplateDetailResponse = {
    itemId: number
    name: string
    templateTableId: number
    templateTableName: string
    rawTemplate: Record<string, unknown> | null
    message?: string
}

function val(row: Record<string, unknown>, key: string): string {
    const v = row[key]
    if (v === null || v === undefined) return "-"
    return String(v)
}

function intVal(row: Record<string, unknown>, key: string): number {
    const v = row[key]
    if (v === null || v === undefined) return 0
    return Number(v)
}

type FieldRowProps = {
    label: string
    children: React.ReactNode
    mono?: boolean
}

function FieldRow({ label, children, mono }: FieldRowProps) {
    return (
        <div className="flex gap-4 py-1.5">
            <span className="text-sm text-muted-foreground shrink-0 min-w-[140px]">{label}</span>
            <span className={`min-w-0 text-sm font-medium break-words ${mono ? "font-mono" : ""}`}>
                {children}
            </span>
        </div>
    )
}

type ItemDetailDialogProps = {
    open: boolean
    onOpenChange: (open: boolean) => void
    item: ItemBrowserRow | null
}

export function ItemDetailDialog({ open, onOpenChange, item }: ItemDetailDialogProps) {
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState("")
    const [template, setTemplate] = useState<Record<string, unknown> | null>(null)

    useEffect(() => {
        if (!open || !item) {
            setTemplate(null)
            setError("")
            return
        }

        let cancelled = false
        const load = async () => {
            setLoading(true)
            setError("")
            try {
                const res = await fetchAPI<TemplateDetailResponse>(
                    DASHBOARD_API_ENDPOINTS.itemDetail(item.itemId, item.templateTableId)
                )
                if (!cancelled) {
                    setTemplate(res.rawTemplate)
                }
            } catch (err) {
                if (!cancelled) {
                    setError(getErrorMessage(err))
                }
            } finally {
                if (!cancelled) {
                    setLoading(false)
                }
            }
        }
        void load()
        return () => { cancelled = true }
    }, [open, item])

    if (!item) return null

    const t = template

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="max-w-2xl max-h-[85vh] overflow-y-auto">
                <DialogHeader>
                    <DialogTitle className="flex items-center gap-3">
                        {item.iconDataUrl ? (
                            <Image
                                className="size-10 rounded object-cover"
                                src={item.iconDataUrl}
                                alt={`icon-${item.iconId}`}
                                width={40}
                                height={40}
                                unoptimized
                            />
                        ) : null}
                        <span>{item.name}</span>
                        <Badge variant="outline" className="font-mono">#{item.itemId}</Badge>
                    </DialogTitle>
                    <DialogDescription>
                        {item.description || "Không có mô tả."}
                    </DialogDescription>
                </DialogHeader>

                {loading && (
                    <p className="text-sm text-muted-foreground py-4 text-center">
                        Đang tải dữ liệu template...
                    </p>
                )}

                {error && (
                    <p className="text-sm text-destructive py-2">{error}</p>
                )}

                {!loading && t ? (
                    <div className="flex flex-col gap-4">
                        <Separator />

                        <div>
                            <h4 className="text-sm font-semibold mb-2">Thông tin cơ bản</h4>
                            <div className="rounded-lg border px-3">
                                <FieldRow label="ID">{val(t, "id")}</FieldRow>
                                <FieldRow label="Tên">{val(t, "name")}</FieldRow>
                                <FieldRow label="Mô tả">{val(t, "description")}</FieldRow>
                                <FieldRow label="Bảng template">
                                    {item.templateTableName} (TBL {item.templateTableId})
                                </FieldRow>
                                <FieldRow label="Kind">
                                    {intVal(t, "kind")} - {getKindLabel(intVal(t, "kind"))}
                                </FieldRow>
                                <FieldRow label="Type">
                                    {intVal(t, "type")} - {getTemplateTypeLabel(intVal(t, "type"))}
                                </FieldRow>
                                <FieldRow label="Cách dùng">
                                    {intVal(t, "use_type")} - {getUseTypeLabel(intVal(t, "use_type"))}
                                </FieldRow>
                                <FieldRow label="Yêu cầu cấp">{val(t, "req_level")}</FieldRow>
                                <FieldRow label="Cấp vật phẩm">{val(t, "item_level")}</FieldRow>
                                <FieldRow label="Stack tối đa">{val(t, "stack_max")}</FieldRow>
                                <FieldRow label="Giá bán">{val(t, "price")}</FieldRow>
                                <FieldRow label="Vàng">{val(t, "gold")}</FieldRow>
                                <FieldRow label="Danh dự">{val(t, "honor")}</FieldRow>
                                <FieldRow label="Khóa">
                                    {getBindTypeLabel(intVal(t, "bind_type"))} ({intVal(t, "bind_type")})
                                </FieldRow>
                                <FieldRow label="Giao dịch">
                                    {getTradableLabel(intVal(t, "tradable"))} ({intVal(t, "tradable")})
                                </FieldRow>
                                <FieldRow label="Icon Code" mono>{val(t, "icon_code")}</FieldRow>
                                <FieldRow label="Color">{val(t, "color")}</FieldRow>
                                <FieldRow label="Color Code">{val(t, "color_code")}</FieldRow>
                                <FieldRow label="Res Code" mono>{val(t, "res_code")}</FieldRow>
                            </div>
                        </div>

                        {"position" in t && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Trang bị</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Vị trí">{val(t, "position")}</FieldRow>
                                    <FieldRow label="Độ bền tối đa">{val(t, "endure_max")}</FieldRow>
                                    <FieldRow label="Số lỗ khảm">{val(t, "hole_num")}</FieldRow>
                                    <FieldRow label="Set ID">{val(t, "suit_id")}</FieldRow>
                                    <FieldRow label="Số dòng thuộc tính chính">{val(t, "bind_prop_num")}</FieldRow>
                                    <FieldRow label="Thuộc tính chính 1">
                                        {getPropTypeLabel(intVal(t, "main_prop1"))} ({intVal(t, "main_prop1")}) = {val(t, "main_prop_num1")}
                                    </FieldRow>
                                    <FieldRow label="Thuộc tính chính 2">
                                        {getPropTypeLabel(intVal(t, "main_prop2"))} ({intVal(t, "main_prop2")}) = {val(t, "main_prop_num2")}
                                    </FieldRow>
                                    <FieldRow label="Thuộc tính phụ 1">
                                        {getPropTypeLabel(intVal(t, "prop1"))} ({intVal(t, "prop1")}) = {val(t, "prop_num1")}
                                    </FieldRow>
                                    <FieldRow label="Thuộc tính phụ 2">
                                        {getPropTypeLabel(intVal(t, "prop2"))} ({intVal(t, "prop2")}) = {val(t, "prop_num2")}
                                    </FieldRow>
                                    <FieldRow label="Active Equip ID">{val(t, "active_equip_id")}</FieldRow>
                                    <FieldRow label="Active Prop Type">{val(t, "active_prop_type")}</FieldRow>
                                    <FieldRow label="Active Prop Num">{val(t, "active_prop_num")}</FieldRow>
                                    <FieldRow label="Có thể sửa">{intVal(t, "repairable") === 1 ? "Có" : "Không"}</FieldRow>
                                    <FieldRow label="Có thể chế tạo">{intVal(t, "makable") === 1 ? "Có" : "Không"}</FieldRow>
                                    <FieldRow label="Tỉ lệ thành công">{val(t, "succ_rate")}</FieldRow>
                                    <FieldRow label="ID template nâng cấp tiếp">{val(t, "next_equ_tid")}</FieldRow>
                                    <FieldRow label="Bright Code" mono>{val(t, "bright_code")}</FieldRow>
                                    <FieldRow label="Wav Code" mono>{val(t, "wav_code")}</FieldRow>
                                    <FieldRow label="Single Flag">{val(t, "single_flag")}</FieldRow>
                                    <FieldRow label="Is Test">{val(t, "is_test")}</FieldRow>
                                    <FieldRow label="T">{val(t, "t")}</FieldRow>
                                </div>
                            </div>
                        )}

                        {"req_class" in t && val(t, "req_class") !== "-" && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Yêu cầu nghề nghiệp</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Req Class">{val(t, "req_class")}</FieldRow>
                                    {"req_class_id" in t && (
                                        <FieldRow label="Req Class ID">{val(t, "req_class_id")}</FieldRow>
                                    )}
                                </div>
                            </div>
                        )}

                        {"require_item1" in t && intVal(t, "require_item1") > 0 && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Vật phẩm cần thiết</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Vật phẩm 1">#{val(t, "require_item1")} x{val(t, "require_num1")}</FieldRow>
                                    {intVal(t, "require_item2") > 0 && (
                                        <FieldRow label="Vật phẩm 2">#{val(t, "require_item2")} x{val(t, "require_num2")}</FieldRow>
                                    )}
                                    {intVal(t, "require_item3") > 0 && (
                                        <FieldRow label="Vật phẩm 3">#{val(t, "require_item3")} x{val(t, "require_num3")}</FieldRow>
                                    )}
                                </div>
                            </div>
                        )}

                        {"skill_id" in t && intVal(t, "skill_id") > 0 && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Kỹ năng</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Skill ID">{val(t, "skill_id")}</FieldRow>
                                    <FieldRow label="Loại thuộc tính">{getPropTypeLabel(intVal(t, "prop_type"))} ({intVal(t, "prop_type")})</FieldRow>
                                    <FieldRow label="Số dòng thuộc tính">{val(t, "propl_num")}</FieldRow>
                                    <FieldRow label="ID nâng cấp tiếp">{val(t, "next_jewel_tid")}</FieldRow>
                                </div>
                            </div>
                        )}

                        {"artifact_skill" in t && val(t, "artifact_skill") !== "-" && val(t, "artifact_skill") !== "" && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Thần Khí Skill</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Artifact Skill">{val(t, "artifact_skill")}</FieldRow>
                                </div>
                            </div>
                        )}

                        {"pro_time" in t && val(t, "pro_time") !== "-" && val(t, "pro_time") !== "" && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Thời gian chế tạo</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Pro Time">{val(t, "pro_time")}</FieldRow>
                                </div>
                            </div>
                        )}

                        {"res_code_male" in t && val(t, "res_code_male") !== "-" && val(t, "res_code_male") !== "" && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Res Code</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Res Code Male" mono>{val(t, "res_code_male")}</FieldRow>
                                    <FieldRow label="Res Code Male 2" mono>{val(t, "res_code_male2")}</FieldRow>
                                    <FieldRow label="Res Code Female" mono>{val(t, "res_code_female")}</FieldRow>
                                    <FieldRow label="Res Code Female 2" mono>{val(t, "res_code_female2")}</FieldRow>
                                </div>
                            </div>
                        )}

                        {"i1" in t && intVal(t, "i1") > 0 && (
                            <div>
                                <h4 className="text-sm font-semibold mb-2">Vật phẩm chế tạo</h4>
                                <div className="rounded-lg border px-3">
                                    <FieldRow label="Công thức 1">#{val(t, "i1")} x{val(t, "n1")}</FieldRow>
                                    {intVal(t, "i2") > 0 && (
                                        <FieldRow label="Công thức 2">#{val(t, "i2")} x{val(t, "n2")}</FieldRow>
                                    )}
                                    {intVal(t, "i3") > 0 && (
                                        <FieldRow label="Công thức 3">#{val(t, "i3")} x{val(t, "n3")}</FieldRow>
                                    )}
                                </div>
                            </div>
                        )}

                        <div>
                            <h4 className="text-sm font-semibold mb-2">Dữ liệu thô (JSON)</h4>
                            <pre className="rounded-lg border bg-muted p-3 text-xs overflow-x-auto max-h-64">
                                {JSON.stringify(t, null, 2)}
                            </pre>
                        </div>
                    </div>
                ) : null}
            </DialogContent>
        </Dialog>
    )
}
