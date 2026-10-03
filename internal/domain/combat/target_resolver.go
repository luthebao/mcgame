// Open-sourced by BaoLT

// Target resolver handles skill target selection based on target types.
// Implements all 12 target types from client Battle.as.
// Supports area effects (V=vertical, H=horizontal, C=cross, R=random).
package combat

import (
	"math/rand"
	"sort"
	"strconv"
)

type TargetType int

const (
	TargetSelf          TargetType = 0
	TargetEnemy         TargetType = 1
	TargetTeam          TargetType = 2
	TargetAllEnemy      TargetType = 3
	TargetAllTeam       TargetType = 4
	TargetAll           TargetType = 5
	TargetDeadTeam      TargetType = 6
	TargetDeadEnemy     TargetType = 7
	TargetAllDead       TargetType = 8
	TargetRandomEnemy   TargetType = 9
	TargetRandomTeam    TargetType = 10
	TargetRandomAll     TargetType = 11
	TargetSelfPlayer    TargetType = 12
	TargetSelfPet       TargetType = 13
	TargetEnemyPlayer   TargetType = 14
	TargetEnemyCreature TargetType = 15
	TargetEnemyNoBoss   TargetType = 16
	TargetTeamPlayer    TargetType = 17
	TargetTeamPet       TargetType = 18
	TargetPlayer        TargetType = 19
)

type AreaType string

const (
	AreaNone       AreaType = ""
	AreaVertical   AreaType = "V"
	AreaHorizontal AreaType = "H"
	AreaCross      AreaType = "C"
	AreaRandom     AreaType = "R"
)

const (
	BattleGridWidth  = 5
	BattleGridHeight = 4
	MaxPosition      = BattleGridWidth * BattleGridHeight
)

type TargetResolver struct {
	battle *Battle
}

type targetPredicate func(*Participant) bool

func NewTargetResolver(battle *Battle) *TargetResolver {
	return &TargetResolver{battle: battle}
}

func (r *TargetResolver) ResolveTargets(
	actor *Participant,
	selectedTargetID string,
	targetType TargetType,
	areaType AreaType,
	areaSize int,
) []*Participant {
	switch targetType {
	case TargetSelf:
		return []*Participant{actor}

	case TargetSelfPlayer:
		return singleResolvedTarget(r.resolveSelfPlayer(actor), true)

	case TargetSelfPet:
		return singleResolvedTarget(r.resolveSelfPet(actor), true)

	case TargetEnemy:
		return r.resolveSingleWithArea(selectedTargetID, r.enemyPredicate(actor), areaType, areaSize, true)

	case TargetEnemyPlayer:
		return r.resolveSingleWithArea(selectedTargetID, r.enemyPlayerPredicate(actor), areaType, areaSize, true)

	case TargetEnemyCreature:
		return r.resolveSingleWithArea(selectedTargetID, r.enemyCreaturePredicate(actor), areaType, areaSize, true)

	case TargetEnemyNoBoss:
		return r.resolveSingleWithArea(selectedTargetID, r.enemyNoBossPredicate(actor), areaType, areaSize, true)

	case TargetTeam:
		return r.resolveSingleWithArea(selectedTargetID, r.teamPredicate(actor), areaType, areaSize, true)

	case TargetTeamPlayer:
		return r.resolveSingleWithArea(selectedTargetID, r.teamPlayerPredicate(actor), areaType, areaSize, true)

	case TargetTeamPet:
		return r.resolveSingleWithArea(selectedTargetID, r.teamPetPredicate(actor), areaType, areaSize, true)

	case TargetAllEnemy:
		return r.filteredParticipants(r.enemyPredicate(actor), true)

	case TargetAllTeam:
		return r.filteredParticipants(r.teamPredicate(actor), true)

	case TargetAll:
		return r.getAll(true)

	case TargetPlayer:
		return r.resolveSingleWithArea(selectedTargetID, r.playerPredicate(), areaType, areaSize, true)

	case TargetDeadTeam:
		return r.filteredParticipants(r.teamPredicate(actor), false)

	case TargetDeadEnemy:
		return r.filteredParticipants(r.enemyPredicate(actor), false)

	case TargetAllDead:
		return r.getAll(false)

	case TargetRandomEnemy:
		return r.getRandomTargets(getOppositeSide(actor.Side), areaSize, true)

	case TargetRandomTeam:
		return r.getRandomTargets(actor.Side, areaSize, true)

	case TargetRandomAll:
		return r.getRandomFromAll(areaSize, true)

	default:
		return r.resolveSingleWithArea(selectedTargetID, r.enemyPredicate(actor), areaType, areaSize, true)
	}
}

func (r *TargetResolver) resolveSingleWithArea(
	selectedTargetID string,
	predicate targetPredicate,
	areaType AreaType,
	areaSize int,
	aliveOnly bool,
) []*Participant {
	var primaryTarget *Participant

	if selectedTargetID != "" {
		primaryTarget = r.resolveSelectedTarget(selectedTargetID, predicate, aliveOnly)
	}

	if primaryTarget == nil {
		primaryTarget = r.nearestMatchingTargetByPosition(selectedTargetID, predicate, aliveOnly)
	}

	if primaryTarget == nil {
		primaryTarget = r.randomMatchingTarget(predicate, aliveOnly)
	}

	if primaryTarget == nil {
		return []*Participant{}
	}

	if areaType == AreaNone {
		return []*Participant{primaryTarget}
	}

	return r.getAreaTargets(primaryTarget, predicate, areaType, areaSize, aliveOnly)
}

func (r *TargetResolver) resolveSelectedTarget(selectedTargetID string, predicate targetPredicate, aliveOnly bool) *Participant {
	byID := r.battle.GetParticipant(selectedTargetID)
	byPosition := participantByPositionString(r.battle, selectedTargetID)
	return chooseTargetCandidate(byID, byPosition, predicate, aliveOnly)
}

func participantByPositionString(battle *Battle, selectedTargetID string) *Participant {
	position, err := strconv.Atoi(selectedTargetID)
	if err != nil {
		return nil
	}

	return battle.GetParticipantByPosition(position)
}

func chooseTargetCandidate(byID, byPosition *Participant, predicate targetPredicate, aliveOnly bool) *Participant {
	if byID != nil && predicate(byID) && (!aliveOnly || byID.IsAlive) {
		return byID
	}
	if byPosition != nil && predicate(byPosition) && (!aliveOnly || byPosition.IsAlive) {
		return byPosition
	}
	return nil
}

func (r *TargetResolver) getAreaTargets(
	center *Participant,
	predicate targetPredicate,
	areaType AreaType,
	size int,
	aliveOnly bool,
) []*Participant {
	pattern := r.areaPatternTargets(center, predicate, areaType)
	return capAndFilterAreaTargets(pattern, size, aliveOnly)
}

func battleGridCoord(position int) GridCoord {
	if coord, ok := BattleGridCoords[BattlePosition(position)]; ok {
		return coord
	}
	return GridCoord{
		X: position % BattleGridWidth,
		Y: position / BattleGridWidth,
	}
}

func (r *TargetResolver) getAllBySide(side Side, aliveOnly bool) []*Participant {
	result := make([]*Participant, 0)
	for _, p := range r.battle.Participants {
		if p.Side != side {
			continue
		}
		if aliveOnly && !p.IsAlive {
			continue
		}
		if !aliveOnly && p.IsAlive {
			continue
		}
		result = append(result, p)
	}
	return result
}

func (r *TargetResolver) filteredParticipants(predicate targetPredicate, aliveOnly bool) []*Participant {
	result := make([]*Participant, 0)
	for _, p := range r.battle.Participants {
		if !predicate(p) {
			continue
		}
		if aliveOnly && !p.IsAlive {
			continue
		}
		if !aliveOnly && p.IsAlive {
			continue
		}
		result = append(result, p)
	}
	return result
}

func (r *TargetResolver) randomMatchingTarget(predicate targetPredicate, aliveOnly bool) *Participant {
	candidates := r.filteredParticipants(predicate, aliveOnly)
	if len(candidates) == 0 {
		return nil
	}
	return candidates[rand.Intn(len(candidates))]
}

func (r *TargetResolver) nearestMatchingTargetByPosition(selectedTargetID string, predicate targetPredicate, aliveOnly bool) *Participant {
	if selectedTargetID == "" {
		return nil
	}
	deadPosition := deadAnchorPosition(r.battle, selectedTargetID)
	if deadPosition < 0 {
		return nil
	}
	candidates := r.filteredParticipants(predicate, aliveOnly)
	if len(candidates) == 0 {
		return nil
	}
	sort.SliceStable(candidates, func(i, j int) bool {
		return candidates[i].Position < candidates[j].Position
	})
	for _, c := range candidates {
		if c.Position == deadPosition {
			continue
		}
		return c
	}
	return nil
}

func deadAnchorPosition(battle *Battle, selectedTargetID string) int {
	if p := battle.GetParticipant(selectedTargetID); p != nil {
		return p.Position
	}
	if pos, err := strconv.Atoi(selectedTargetID); err == nil {
		return pos
	}
	return -1
}

func singleResolvedTarget(target *Participant, aliveOnly bool) []*Participant {
	if target == nil {
		return []*Participant{}
	}
	if aliveOnly && !target.IsAlive {
		return []*Participant{}
	}
	return []*Participant{target}
}

func (r *TargetResolver) areaPatternTargets(center *Participant, predicate targetPredicate, areaType AreaType) []*Participant {
	switch areaType {
	case AreaVertical:
		return r.verticalTargets(center, predicate)
	case AreaHorizontal:
		return r.horizontalTargets(center, predicate)
	case AreaCross:
		return r.crossTargets(center, predicate)
	case AreaRandom:
		return r.randomAreaTargets(center, predicate)
	default:
		return []*Participant{center}
	}
}

func verticalNeighborY(y int) int {
	if y == 0 || y == 2 {
		return y + 1
	}
	return y - 1
}

func (r *TargetResolver) verticalTargets(center *Participant, predicate targetPredicate) []*Participant {
	targets := make([]*Participant, 0, 2)
	centerCoord := battleGridCoord(center.Position)
	if neighbor := r.participantAtCoord(centerCoord.X, verticalNeighborY(centerCoord.Y), predicate, center.ID); neighbor != nil {
		targets = append(targets, neighbor)
	}
	targets = append(targets, center)
	return targets
}

func (r *TargetResolver) horizontalTargets(center *Participant, predicate targetPredicate) []*Participant {
	centerCoord := battleGridCoord(center.Position)
	targets := []*Participant{center}
	for delta := 1; delta < BattleGridWidth; delta++ {
		if left := r.participantAtCoord(centerCoord.X-delta, centerCoord.Y, predicate, center.ID); left != nil {
			targets = append(targets, left)
		}
		if right := r.participantAtCoord(centerCoord.X+delta, centerCoord.Y, predicate, center.ID); right != nil {
			targets = append(targets, right)
		}
	}
	return targets
}

func (r *TargetResolver) crossTargets(center *Participant, predicate targetPredicate) []*Participant {
	centerCoord := battleGridCoord(center.Position)
	targets := make([]*Participant, 0, 4)
	if vertical := r.participantAtCoord(centerCoord.X, verticalNeighborY(centerCoord.Y), predicate, center.ID); vertical != nil {
		targets = append(targets, vertical)
	}
	if left := r.participantAtCoord(centerCoord.X-1, centerCoord.Y, predicate, center.ID); left != nil {
		targets = append(targets, left)
	}
	if right := r.participantAtCoord(centerCoord.X+1, centerCoord.Y, predicate, center.ID); right != nil {
		targets = append(targets, right)
	}
	targets = append(targets, center)
	return targets
}

func (r *TargetResolver) randomAreaTargets(center *Participant, predicate targetPredicate) []*Participant {
	targets := make([]*Participant, 0)
	for _, p := range r.battle.Participants {
		if p.ID == center.ID {
			continue
		}
		if !predicate(p) {
			continue
		}
		targets = append(targets, p)
	}
	targets = append(targets, center)
	return targets
}

func (r *TargetResolver) participantAtCoord(x, y int, predicate targetPredicate, excludedID string) *Participant {
	for _, p := range r.battle.Participants {
		if p.ID == excludedID {
			continue
		}
		if !predicate(p) {
			continue
		}
		coord := battleGridCoord(p.Position)
		if coord.X == x && coord.Y == y {
			return p
		}
	}
	return nil
}

func capAndFilterAreaTargets(pattern []*Participant, size int, aliveOnly bool) []*Participant {
	if size <= 0 {
		size = 1
	}
	if size > len(pattern) {
		size = len(pattern)
	}
	targets := make([]*Participant, 0, size)
	for i := 0; i < size; i++ {
		target := pattern[i]
		if target == nil {
			continue
		}
		if aliveOnly && !target.IsAlive {
			continue
		}
		targets = append(targets, target)
	}
	return targets
}

func (r *TargetResolver) enemyPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return p != nil && p.Side == getOppositeSide(actor.Side)
	}
}

func (r *TargetResolver) enemyPlayerPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return r.enemyPredicate(actor)(p) && p.EntityType == ParticipantTypeCharacter
	}
}

func (r *TargetResolver) enemyCreaturePredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return r.enemyPredicate(actor)(p) && p.EntityType == ParticipantTypeCreature
	}
}

func (r *TargetResolver) enemyNoBossPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return r.enemyPredicate(actor)(p) && p.BossFlag == 0
	}
}

func (r *TargetResolver) teamPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return p != nil && p.Side == actor.Side
	}
}

func (r *TargetResolver) teamPlayerPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return r.teamPredicate(actor)(p) && p.EntityType == ParticipantTypeCharacter
	}
}

func (r *TargetResolver) teamPetPredicate(actor *Participant) targetPredicate {
	return func(p *Participant) bool {
		return r.teamPredicate(actor)(p) && p.EntityType == ParticipantTypePet
	}
}

func (r *TargetResolver) playerPredicate() targetPredicate {
	return func(p *Participant) bool {
		return p != nil && p.EntityType == ParticipantTypeCharacter
	}
}

func (r *TargetResolver) resolveSelfPlayer(actor *Participant) *Participant {
	if actor == nil {
		return nil
	}
	if actor.EntityType == ParticipantTypeCharacter {
		return actor
	}
	if actor.OwnerID <= 0 {
		return nil
	}
	for _, p := range r.battle.Participants {
		if p.EntityType != ParticipantTypeCharacter || p.Side != actor.Side {
			continue
		}
		if p.EntityID == actor.OwnerID {
			return p
		}
	}
	return nil
}

func (r *TargetResolver) resolveSelfPet(actor *Participant) *Participant {
	if actor == nil {
		return nil
	}
	if actor.EntityType == ParticipantTypePet {
		return actor
	}
	for _, p := range r.battle.Participants {
		if p.EntityType != ParticipantTypePet || p.Side != actor.Side {
			continue
		}
		if p.OwnerID == actor.EntityID {
			return p
		}
	}
	return nil
}

func (r *TargetResolver) getAll(aliveOnly bool) []*Participant {
	result := make([]*Participant, 0)
	for _, p := range r.battle.Participants {
		if aliveOnly && !p.IsAlive {
			continue
		}
		if !aliveOnly && p.IsAlive {
			continue
		}
		result = append(result, p)
	}
	return result
}

func (r *TargetResolver) getRandomTargets(side Side, count int, aliveOnly bool) []*Participant {
	candidates := r.getAllBySide(side, aliveOnly)
	if len(candidates) == 0 {
		return []*Participant{}
	}

	if count >= len(candidates) {
		return candidates
	}

	shuffled := make([]*Participant, len(candidates))
	copy(shuffled, candidates)
	rand.Shuffle(len(shuffled), func(i, j int) {
		shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
	})

	return shuffled[:count]
}

func (r *TargetResolver) getRandomFromAll(count int, aliveOnly bool) []*Participant {
	candidates := r.getAll(aliveOnly)
	if len(candidates) == 0 {
		return []*Participant{}
	}

	if count >= len(candidates) {
		return candidates
	}

	shuffled := make([]*Participant, len(candidates))
	copy(shuffled, candidates)
	rand.Shuffle(len(shuffled), func(i, j int) {
		shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
	})

	return shuffled[:count]
}

func (r *TargetResolver) GetValidTargets(actor *Participant, targetType TargetType, aliveOnly bool) []*Participant {
	switch targetType {
	case TargetSelf:
		if aliveOnly && !actor.IsAlive {
			return []*Participant{}
		}
		return []*Participant{actor}

	case TargetSelfPlayer:
		return singleResolvedTarget(r.resolveSelfPlayer(actor), aliveOnly)

	case TargetSelfPet:
		return singleResolvedTarget(r.resolveSelfPet(actor), aliveOnly)

	case TargetEnemy, TargetRandomEnemy:
		return r.filteredParticipants(r.enemyPredicate(actor), aliveOnly)

	case TargetEnemyPlayer:
		return r.filteredParticipants(r.enemyPlayerPredicate(actor), aliveOnly)

	case TargetEnemyCreature:
		return r.filteredParticipants(r.enemyCreaturePredicate(actor), aliveOnly)

	case TargetEnemyNoBoss:
		return r.filteredParticipants(r.enemyNoBossPredicate(actor), aliveOnly)

	case TargetTeam, TargetRandomTeam:
		return r.filteredParticipants(r.teamPredicate(actor), aliveOnly)

	case TargetTeamPlayer:
		return r.filteredParticipants(r.teamPlayerPredicate(actor), aliveOnly)

	case TargetTeamPet:
		return r.filteredParticipants(r.teamPetPredicate(actor), aliveOnly)

	case TargetAllEnemy:
		return r.filteredParticipants(r.enemyPredicate(actor), aliveOnly)

	case TargetAllTeam:
		return r.filteredParticipants(r.teamPredicate(actor), aliveOnly)

	case TargetAll, TargetRandomAll:
		return r.getAll(aliveOnly)

	case TargetPlayer:
		return r.filteredParticipants(r.playerPredicate(), aliveOnly)

	case TargetDeadTeam:
		return r.filteredParticipants(r.teamPredicate(actor), false)

	case TargetDeadEnemy:
		return r.filteredParticipants(r.enemyPredicate(actor), false)

	case TargetAllDead:
		return r.getAll(false)

	default:
		return r.getAllBySide(getOppositeSide(actor.Side), aliveOnly)
	}
}

func getOppositeSide(side Side) Side {
	if side == SidePlayer {
		return SideEnemy
	}
	return SidePlayer
}

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func PositionToGridCoords(position int) (x, y int) {
	coord := battleGridCoord(position)
	x = coord.X
	y = coord.Y
	return
}

func GridCoordsToPosition(x, y int) int {
	return y*BattleGridWidth + x
}

func GetAdjacentPositions(position int) []int {
	x, y := PositionToGridCoords(position)
	adjacent := make([]int, 0, 4)

	if x > 0 {
		adjacent = append(adjacent, GridCoordsToPosition(x-1, y))
	}
	if x < BattleGridWidth-1 {
		adjacent = append(adjacent, GridCoordsToPosition(x+1, y))
	}
	if y > 0 {
		adjacent = append(adjacent, GridCoordsToPosition(x, y-1))
	}
	if y < BattleGridHeight-1 {
		adjacent = append(adjacent, GridCoordsToPosition(x, y+1))
	}

	return adjacent
}

func GetDistance(pos1, pos2 int) int {
	x1, y1 := PositionToGridCoords(pos1)
	x2, y2 := PositionToGridCoords(pos2)
	return abs(x1-x2) + abs(y1-y2)
}

func IsInRange(attackerPos, defenderPos int, maxRange int) bool {
	return GetDistance(attackerPos, defenderPos) <= maxRange
}
