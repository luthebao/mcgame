"use client"

import { use } from "react"
import Link from "next/link"
import { ArrowLeft } from "lucide-react"

import { usePlayerDetail } from "@/hooks/use-player-detail"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Tabs, TabsContent } from "@/components/ui/tabs"

import { PlayerHero } from "./_components/player-hero"
import { PlayerNav, PlayerNavStrip } from "./_components/player-nav"
import { AttributesTab } from "./_tabs/attributes-tab"
import { CombatStatsTab } from "./_tabs/combat-stats-tab"
import { DressPanelTab } from "./_tabs/dress-panel-tab"
import { FeatureStateTab } from "./_tabs/feature-state-tab"
import { GMTab } from "./_tabs/gm-tab"
import { ItemsTab } from "./_tabs/items-tab"
import { LifeSkillsTab } from "./_tabs/life-skills-tab"
import { OverviewTab } from "./_tabs/overview-tab"
import { PetsTab } from "./_tabs/pets-tab"
import { ProgressionTab } from "./_tabs/progression-tab"
import { RelationshipsTab } from "./_tabs/relationships-tab"
import { ResourcesTab } from "./_tabs/resources-tab"
import { WalletTab } from "./_tabs/wallet-tab"

export default function PlayerManagePage({
    params,
}: {
    params: Promise<{ id: string }>
}) {
    const { id } = use(params)
    const playerId = Number(id)

    const { data, isLoading, error } = usePlayerDetail(id)
    const char = data?.character ?? {}
    const online = data?.online ?? false
    const session = data?.session

    if (!Number.isFinite(playerId) || playerId <= 0) {
        return (
            <div className="space-y-4">
                <p className="text-destructive">Invalid player ID</p>
                <Link href="/dashboard/players">
                    <Button variant="outline" size="sm">
                        <ArrowLeft className="mr-2 h-4 w-4" />
                        Back to Players
                    </Button>
                </Link>
            </div>
        )
    }

    return (
        <div className="space-y-6">
            <PlayerHero
                char={char}
                online={online}
                playerId={playerId}
            />

            {isLoading ? (
                <Card>
                    <CardContent className="py-12 text-center text-muted-foreground">
                        Loading player data...
                    </CardContent>
                </Card>
            ) : error ? (
                <Card>
                    <CardContent className="py-12 text-center text-destructive">
                        Failed to load player: {error.message}
                    </CardContent>
                </Card>
            ) : (
                <Tabs
                    defaultValue="overview"
                    orientation="vertical"
                    className="grid grid-cols-1 gap-6 lg:grid-cols-[220px_1fr]"
                >
                    <div className="lg:hidden">
                        <PlayerNavStrip />
                    </div>
                    <div className="hidden lg:block">
                        <PlayerNav />
                    </div>

                    <div className="min-w-0">
                        <TabsContent value="overview" className="mt-0">
                            <OverviewTab
                                char={char}
                                online={online}
                                session={session}
                                playerId={playerId}
                            />
                        </TabsContent>
                        <TabsContent value="progression" className="mt-0">
                            <ProgressionTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="attributes" className="mt-0">
                            <AttributesTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="combat" className="mt-0">
                            <CombatStatsTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="wallet" className="mt-0">
                            <WalletTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="resources" className="mt-0">
                            <ResourcesTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="dress-panel" className="mt-0">
                            <DressPanelTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="items" className="mt-0">
                            <ItemsTab playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="pets" className="mt-0">
                            <PetsTab playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="life-skills" className="mt-0">
                            <LifeSkillsTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="gm" className="mt-0">
                            <GMTab char={char} playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="feature-state" className="mt-0">
                            <FeatureStateTab playerId={playerId} />
                        </TabsContent>
                        <TabsContent value="relationships" className="mt-0">
                            <RelationshipsTab playerId={playerId} />
                        </TabsContent>
                    </div>
                </Tabs>
            )}
        </div>
    )
}
