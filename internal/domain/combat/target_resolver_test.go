// Open-sourced by BaoLT

package combat

import "testing"

func TestTargetResolverResolveTargets_UsesSelectedBattlePosition(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	targetZero := NewParticipant("2", "enemy-zero", SideEnemy, true)
	targetZero.Position = 0
	targetZero.IsAlive = true
	battle.AddParticipant(targetZero)

	targetTwo := NewParticipant("3", "enemy-two", SideEnemy, true)
	targetTwo.Position = 2
	targetTwo.IsAlive = true
	battle.AddParticipant(targetTwo)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, "0", TargetEnemy, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].Position != 0 {
		t.Fatalf("targets[0].Position = %d, want 0", targets[0].Position)
	}
}

func TestTargetResolverResolveTargets_FallsBackToAliveEnemyWhenSelectedEnemyIsDeadAndIDCollidesWithAlly(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	ally := NewParticipant("2", "ally", SidePlayer, false)
	ally.Position = 11
	ally.IsAlive = true
	battle.AddParticipant(ally)

	deadEnemy := NewParticipant("npc_2", "enemy-dead", SideEnemy, true)
	deadEnemy.Position = 2
	deadEnemy.IsAlive = false
	battle.AddParticipant(deadEnemy)

	aliveEnemy := NewParticipant("npc_0", "enemy-alive", SideEnemy, true)
	aliveEnemy.Position = 0
	aliveEnemy.IsAlive = true
	battle.AddParticipant(aliveEnemy)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, "2", TargetEnemy, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].ID == ally.ID {
		t.Fatalf("targets[0] = ally %q, want enemy", ally.ID)
	}
	if targets[0].Side != SideEnemy {
		t.Fatalf("targets[0].Side = %v, want SideEnemy", targets[0].Side)
	}
	if !targets[0].IsAlive {
		t.Fatalf("targets[0].IsAlive = false, want alive enemy")
	}
}

func TestTargetResolverResolveTargets_DeadTargetFallsBackToLowestAlivePosition(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("actor", "player", SidePlayer, false)
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	deadEnemy := NewParticipant("npc_dead", "enemy-dead", SideEnemy, true)
	deadEnemy.Position = 2
	deadEnemy.IsAlive = false
	battle.AddParticipant(deadEnemy)

	enemyHigh := NewParticipant("npc_high", "enemy-high", SideEnemy, true)
	enemyHigh.Position = 4
	enemyHigh.IsAlive = true
	battle.AddParticipant(enemyHigh)

	enemyLow := NewParticipant("npc_low", "enemy-low", SideEnemy, true)
	enemyLow.Position = 1
	enemyLow.IsAlive = true
	battle.AddParticipant(enemyLow)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, "2", TargetEnemy, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].Position != 1 {
		t.Fatalf("targets[0].Position = %d, want 1 (lowest alive enemy position)", targets[0].Position)
	}
}

func TestTargetResolverResolveTargets_PrefersTargetSideWhenIDCollidesWithPosition(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	ally := NewParticipant("2", "ally", SidePlayer, false)
	ally.Position = 11
	ally.IsAlive = true
	battle.AddParticipant(ally)

	enemy := NewParticipant("56", "enemy-two", SideEnemy, true)
	enemy.Position = 2
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, "2", TargetEnemy, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].ID != "56" {
		t.Fatalf("targets[0].ID = %q, want %q", targets[0].ID, "56")
	}
	if targets[0].Position != 2 {
		t.Fatalf("targets[0].Position = %d, want 2", targets[0].Position)
	}
}

func TestTargetResolverResolveTargets_HorizontalAreaUsesBattleGridLayout(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	center := NewParticipant("2", "enemy-center", SideEnemy, true)
	center.Position = 0
	center.IsAlive = true
	battle.AddParticipant(center)

	sameRowNeighbor := NewParticipant("3", "enemy-left", SideEnemy, true)
	sameRowNeighbor.Position = 2
	sameRowNeighbor.IsAlive = true
	battle.AddParticipant(sameRowNeighbor)

	otherRow := NewParticipant("4", "enemy-pet", SideEnemy, true)
	otherRow.Position = 5
	otherRow.IsAlive = true
	battle.AddParticipant(otherRow)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, "0", TargetEnemy, AreaHorizontal, 2)
	if len(targets) != 2 {
		t.Fatalf("len(targets) = %d, want 2", len(targets))
	}
	if targets[0].Position != 0 {
		t.Fatalf("targets[0].Position = %d, want 0", targets[0].Position)
	}
	if targets[1].Position != 2 {
		t.Fatalf("targets[1].Position = %d, want 2", targets[1].Position)
	}
}

func TestTargetResolverResolveTargets_TargetEnemyCreatureExcludesEnemyPlayer(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.EntityType = ParticipantTypeCharacter
	actor.IsAlive = true
	battle.AddParticipant(actor)

	enemyPlayer := NewParticipant("2", "enemy-player", SideEnemy, false)
	enemyPlayer.Position = 0
	enemyPlayer.EntityType = ParticipantTypeCharacter
	enemyPlayer.IsAlive = true
	battle.AddParticipant(enemyPlayer)

	enemyCreature := NewParticipant("3", "enemy-creature", SideEnemy, true)
	enemyCreature.Position = 2
	enemyCreature.EntityType = ParticipantTypeCreature
	enemyCreature.IsAlive = true
	battle.AddParticipant(enemyCreature)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, enemyPlayer.ID, TargetEnemyCreature, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].ID != enemyCreature.ID {
		t.Fatalf("targets[0].ID = %q, want %q", targets[0].ID, enemyCreature.ID)
	}
}

func TestTargetResolverResolveTargets_TargetPlayerAllowsEnemyCharacter(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.EntityType = ParticipantTypeCharacter
	actor.IsAlive = true
	battle.AddParticipant(actor)

	enemyPlayer := NewParticipant("2", "enemy-player", SideEnemy, false)
	enemyPlayer.Position = 0
	enemyPlayer.EntityType = ParticipantTypeCharacter
	enemyPlayer.IsAlive = true
	battle.AddParticipant(enemyPlayer)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, enemyPlayer.ID, TargetPlayer, AreaNone, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].ID != enemyPlayer.ID {
		t.Fatalf("targets[0].ID = %q, want %q", targets[0].ID, enemyPlayer.ID)
	}
}

func TestTargetResolverResolveTargets_VerticalAreaCapsBeforeKeepingClickedTarget(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.Position = 10
	actor.EntityType = ParticipantTypeCharacter
	actor.IsAlive = true
	battle.AddParticipant(actor)

	clickedTarget := NewParticipant("2", "enemy-center", SideEnemy, true)
	clickedTarget.Position = 0
	clickedTarget.EntityType = ParticipantTypeCreature
	clickedTarget.IsAlive = true
	battle.AddParticipant(clickedTarget)

	verticalNeighbor := NewParticipant("3", "enemy-front", SideEnemy, true)
	verticalNeighbor.Position = 5
	verticalNeighbor.EntityType = ParticipantTypeCreature
	verticalNeighbor.IsAlive = true
	battle.AddParticipant(verticalNeighbor)

	resolver := NewTargetResolver(battle)

	targets := resolver.ResolveTargets(actor, clickedTarget.ID, TargetEnemy, AreaVertical, 1)
	if len(targets) != 1 {
		t.Fatalf("len(targets) = %d, want 1", len(targets))
	}
	if targets[0].ID != verticalNeighbor.ID {
		t.Fatalf("targets[0].ID = %q, want %q", targets[0].ID, verticalNeighbor.ID)
	}
}
