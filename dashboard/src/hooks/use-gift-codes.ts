"use client"

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query"

import {
    giftCodeService,
    type GiftCodeCampaignView,
} from "@/services/gift-code.service"

export function useGiftCodeCampaigns(limit = 100) {
    return useQuery({
        queryKey: ["gift-code-campaigns", limit],
        queryFn: () => giftCodeService.listCampaigns(limit),
        staleTime: 10_000,
    })
}

export function useCreateCampaign() {
    const queryClient = useQueryClient()
    return useMutation({
        mutationFn: (
            payload: Parameters<typeof giftCodeService.createCampaign>[0]
        ) => giftCodeService.createCampaign(payload),
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["gift-code-campaigns"] })
        },
    })
}

export function useUpdateCampaign() {
    const queryClient = useQueryClient()
    return useMutation({
        mutationFn: ({
            campaignId,
            payload,
        }: {
            campaignId: number
            payload: Parameters<typeof giftCodeService.updateCampaign>[1]
        }) => giftCodeService.updateCampaign(campaignId, payload),
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["gift-code-campaigns"] })
        },
    })
}

export function useDeleteCampaign() {
    const queryClient = useQueryClient()
    return useMutation({
        mutationFn: (campaignId: number) =>
            giftCodeService.deleteCampaign(campaignId),
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["gift-code-campaigns"] })
        },
    })
}

export function useToggleCampaign() {
    const queryClient = useQueryClient()
    return useMutation({
        mutationFn: ({
            campaignId,
            active,
        }: {
            campaignId: number
            active: boolean
        }) => giftCodeService.toggleCampaignStatus(campaignId, active),
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["gift-code-campaigns"] })
        },
    })
}
