// Open-sourced by BaoLT

// Battle entity represents an active combat instance with participants.
// Manages turn-based combat flow with rounds, actions, and victory conditions.
// Thread-safe with mutex protection for concurrent access.
package combat

import (
	"fmt"
	"sync"
	"time"

	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/domain/stats"

	"github.com/google/uuid"
)

type BattleType int

const (
	BattleTypePVE          BattleType = 1
	BattleTypePVP          BattleType = 2
	BattleTypeArena        BattleType = 3
	BattleTypeBoss         BattleType = 4
	BattleTypeStarInstance BattleType = 5
)

type BattleState int

const (
	BattleStateWaiting   BattleState = 0
	BattleStateActive    BattleState = 1
	BattleStateEnded     BattleState = 2
	BattleStateCancelled BattleState = 3
)

type Side int

const (
	SidePlayer Side = 0
	SideEnemy  Side = 1
)

type ActionType int

const (
	ActionTypeAttack       ActionType = 1
	ActionTypeSkill        ActionType = 2
	ActionTypeItem         ActionType = 3
	ActionTypeDefend       ActionType = 4
	ActionTypeFlee         ActionType = 5
	ActionTypeAuto         ActionType = 6
	ActionTypeMoveToTarget ActionType = 7
	ActionTypeBack         ActionType = 8
	ActionTypeDie          ActionType = 9
	ActionTypeTurnBack     ActionType = 10
	ActionTypeHurt         ActionType = 11
	ActionTypeIdle         ActionType = 12
	ActionTypeDefended     ActionType = 13
	ActionTypeTurnTo       ActionType = 14
)

const (
	MaxRounds       = 30
	TurnTimeout     = 30
	MaxParticipants = 10
)

type ParticipantType int

const (
	ParticipantTypeCharacter ParticipantType = 2
	ParticipantTypeCreature  ParticipantType = 12
	ParticipantTypePet       ParticipantType = 39
)

type Participant struct {
	ID           string
	Name         string
	Side         Side
	IsNPC        bool
	Level        int
	MaxHP        int
	CurrentHP    int
	MaxMP        int
	CurrentMP    int
	MaxSP        int
	CurrentSP    int
	Attack       int
	Defense      int
	MagicAttack  int
	MagicDefense int
	Speed        int
	Hit          int
	Dodge        int
	Critical     int
	CriticalDmg  int
	Counter      int
	Combo        int
	PraDef       int
	PraMagDef    int
	ReduceHurt1  int
	ReduceHurt2  int
	ResiCritical int
	ResiDefy     int
	EnhPhyHurt   int
	EnhMagicHurt int
	IsAlive      bool
	Position     int
	EntityType   ParticipantType
	EntityID     int64
	ResCode      int
	IconCode     int
	ColorCode    int
	BossFlag     int
	WithCloud    int
	Element      int
	ExpReward    int
	OwnerID      int64

	Star          int
	WeaponResCode int64
	Ee            string
	Ef            bool
	En            int
	PetColor      int

	DeathImmuneUsed bool
	EffStats         stats.EffectiveStats
}

func NewParticipant(id, name string, side Side, isNPC bool) *Participant {
	return &Participant{
		ID:      id,
		Name:    name,
		Side:    side,
		IsNPC:   isNPC,
		IsAlive: true,
	}
}

func (p *Participant) TakeDamage(damage int) {
	p.CurrentHP -= damage
	if p.CurrentHP <= 0 {
		p.CurrentHP = 0
		p.IsAlive = false
	}
}

func (p *Participant) Heal(amount int) {
	p.CurrentHP += amount
	if p.CurrentHP > p.MaxHP {
		p.CurrentHP = p.MaxHP
	}
}

func (p *Participant) UseMP(amount int) bool {
	if p.CurrentMP < amount {
		return false
	}
	p.CurrentMP -= amount
	return true
}

func (p *Participant) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"id":       fmt.Sprintf("%d", p.EntityID),
		"type":     int(p.EntityType),
		"name":     p.Name,
		"level":    p.Level,
		"hpMax":    float64(p.MaxHP),
		"hp":       float64(p.CurrentHP),
		"mpMax":    float64(p.MaxMP),
		"battleId": p.Position,
		"resCode":  fmt.Sprintf("%d", p.ResCode),
	}

	if p.IconCode > 0 {
		dto["iconCode"] = fmt.Sprintf("%d", p.IconCode)
	}

	dto["colorCode"] = fmt.Sprintf("%d", p.ColorCode)

	switch p.EntityType {
	case ParticipantTypeCreature:
		dto["mp"] = float64(p.CurrentMP)
		dto["bossFlag"] = fmt.Sprintf("%d", p.BossFlag)
		if p.WithCloud != 0 {
			dto["withCloud"] = fmt.Sprintf("%d", p.WithCloud)
		} else {
			dto["withCloud"] = "-1"
		}

	case ParticipantTypePet:
		dto["id"] = p.EntityID
		dto["mp"] = float64(p.CurrentMP)
		dto["resCode"] = p.ResCode
		dto["colorCode"] = p.ColorCode
		if p.IconCode > 0 {
			dto["iconCode"] = p.IconCode
		}
		dto["bossFlag"] = 0
		dto["element"] = int(p.Element)
		dto["currentHp"] = float64(p.CurrentHP)
		dto["currentMp"] = float64(p.CurrentMP)
		if p.OwnerID > 0 {
			dto["cid"] = p.OwnerID
		}
		if p.PetColor != 0 {
			dto["c"] = p.PetColor
		}

	case ParticipantTypeCharacter:
		dto["mp"] = fmt.Sprintf("%d", p.CurrentMP)
		dto["sp"] = fmt.Sprintf("%d", p.CurrentSP)
		dto["spMax"] = p.MaxSP
		dto["star"] = fmt.Sprintf("%d", p.Star)
		dto["ee"] = p.Ee
		dto["ef"] = p.Ef
		dto["en"] = p.En
		if p.WeaponResCode > 0 {
			dto["wp"] = fmt.Sprintf("%d", p.WeaponResCode)
		}
	}

	return dto
}

type BattleAction struct {
	Round            int
	ActorID          string
	ActorPosition    int
	ActionType       ActionType
	BehaviorID       int
	SkillID          int
	SkillType        domainskill.SkillType
	TargetID         string
	TargetPosition   int
	Damage           int
	IsCritical       bool
	IsMiss           bool
	IsNPC            bool
	FrontEffID       int
	AttackEffID      int
	SkillEffID       int
	GlobalFrontEffID int
	GlobalBackEffID  int
	BulletID         int
	Effects          []string
	Timestamp        time.Time
	TargetNewHP      int
	TargetDisplayHP  int
	HasDisplayHP     bool
	TargetNewMP      int
	ActorNewMP       int
	SkillName        string
	SourceState      map[string]interface{}
	TargetState      map[string]interface{}
	Extra            map[string]interface{}
}

func (a *BattleAction) ToDTO() map[string]interface{} {
	tSObj := map[string]interface{}{}
	isDamageAction := a.ActionType == ActionTypeAttack || a.ActionType == ActionTypeSkill
	if a.Damage < 0 {
		tSObj["rHp"] = a.TargetNewHP
	} else if isDamageAction && a.Damage > 0 && !a.IsMiss {
		damageDisplayHP := a.TargetNewHP
		if a.HasDisplayHP {
			damageDisplayHP = a.TargetDisplayHP
		}
		tSObj["hHp"] = damageDisplayHP
		if a.IsCritical {
			tSObj["cri"] = true
		}
	}
	if a.SkillEffID > 0 {
		tSObj["skillEff"] = a.SkillEffID
	}
	if a.AttackEffID > 0 {
		tSObj["attackEff"] = a.AttackEffID
	}

	if a.ActionType == ActionTypeItem && a.TargetNewMP > 0 {
		tSObj["rMp"] = a.TargetNewMP
	}
	for key, value := range a.TargetState {
		tSObj[key] = value
	}

	sSObj := map[string]interface{}{}
	if a.ActorNewMP > 0 {
		sSObj["uMp"] = a.ActorNewMP
	}
	if a.SkillName != "" {
		sSObj["skill"] = a.SkillName
	}
	if a.FrontEffID > 0 {
		sSObj["frontEff"] = a.FrontEffID
	}
	if a.GlobalFrontEffID > 0 {
		sSObj["gfe"] = a.GlobalFrontEffID
	}
	if a.GlobalBackEffID > 0 {
		sSObj["gbe"] = a.GlobalBackEffID
	}
	if a.BulletID > 0 {
		sSObj["bullet"] = a.BulletID
	}
	for key, value := range a.SourceState {
		sSObj[key] = value
	}

	bid := a.ActionTypeToBehavior()
	delay := a.GetActionDelay()

	result := map[string]interface{}{
		"sid":   a.ActorPosition,
		"tid":   a.TargetPosition,
		"bid":   bid,
		"sSObj": sSObj,
		"tSObj": tSObj,
		"delay": delay,
	}

	if len(a.Effects) > 0 {
		result["effects"] = a.Effects
	}
	for key, value := range a.Extra {
		result[key] = value
	}

	return result
}

func (a *BattleAction) GetActionDelay() int {
	switch a.ActionType {
	case ActionTypeMoveToTarget:
		return 200
	case ActionTypeAttack, ActionTypeSkill:
		if a.ActionType == ActionTypeSkill && (a.SkillType == domainskill.SkillTypeMagic || a.SkillType == domainskill.SkillTypeDebuff) {
			return 500
		}
		return 400
	case ActionTypeBack:
		return 0
	case ActionTypeTurnBack:
		return 300
	case ActionTypeDefend, ActionTypeFlee, ActionTypeItem:
		return 300
	case ActionTypeDefended:
		return 0
	case ActionTypeDie:
		return 200
	case ActionTypeHurt:
		return 100
	case ActionTypeIdle:
		return 0
	case ActionTypeTurnTo:
		return 100
	default:
		return 200
	}
}

func (a *BattleAction) ActionTypeToBehavior() int {
	if a.BehaviorID > 0 {
		return a.BehaviorID
	}
	switch a.ActionType {
	case ActionTypeAttack:
		return 3
	case ActionTypeSkill:
		return 7
	case ActionTypeDefend:
		return 0
	case ActionTypeItem:
		return 7
	case ActionTypeFlee:
		return 10130
	case ActionTypeMoveToTarget:
		return 1
	case ActionTypeBack:
		return 10080
	case ActionTypeTurnBack:
		return 10100
	case ActionTypeDie:
		if a.IsNPC {
			return 10120
		}
		return 4
	case ActionTypeHurt:
		return 5
	case ActionTypeDefended:
		return 6
	case ActionTypeIdle:
		return 0
	case ActionTypeTurnTo:
		return 10110
	default:
		return 3
	}
}

type BattleResult struct {
	WinnerSide       Side
	ExpReward        int64
	MoneyReward      int64
	ItemRewards      []ItemDrop
	CurrencyRewards  []CurrencyDrop
	PetRewards       []PetReward
	CharacterRewards map[int64]*CharacterReward
	BattleTime       int
}

type ItemDrop struct {
	CharacterID int64
	TemplateID  int
	Type        int
	Quality     int
	Bound       bool
	StackCount  int
	ItemData    map[string]interface{}
}

func (d ItemDrop) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"characterId": d.CharacterID,
		"templateId":  d.TemplateID,
		"type":        d.Type,
		"quality":     d.Quality,
		"bound":       d.Bound,
		"count":       d.StackCount,
	}
	if d.ItemData != nil {
		dto["item"] = d.ItemData
	}
	return dto
}

type CurrencyDrop struct {
	CharacterID int64
	ClientKey   string
	Label       string
	Delta       int64
	Total       int64
	IsExp       bool
	LeveledUp   bool
}

func (d CurrencyDrop) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"characterId": d.CharacterID,
		"clientKey":   d.ClientKey,
		"label":       d.Label,
		"delta":       d.Delta,
		"total":       d.Total,
		"isExp":       d.IsExp,
		"leveledUp":   d.LeveledUp,
	}
}

type PetReward struct {
	CharacterID int64
	PetID       int64
	PetData     map[string]interface{}
}

func (r PetReward) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"characterId": r.CharacterID,
		"petId":       r.PetID,
	}
	if r.PetData != nil {
		dto["pet"] = r.PetData
	}
	return dto
}

type CharacterReward struct {
	CharacterID     int64
	ExpReward       int64
	MoneyReward     int64
	LeveledUp       bool
	ItemRewards     []ItemDrop
	CurrencyRewards []CurrencyDrop
	PetRewards      []PetReward
}

func (r *BattleResult) EnsureCharacterReward(characterID int64) *CharacterReward {
	if r.CharacterRewards == nil {
		r.CharacterRewards = make(map[int64]*CharacterReward)
	}
	if existing := r.CharacterRewards[characterID]; existing != nil {
		return existing
	}
	reward := &CharacterReward{
		CharacterID:     characterID,
		ItemRewards:     make([]ItemDrop, 0),
		CurrencyRewards: make([]CurrencyDrop, 0),
		PetRewards:      make([]PetReward, 0),
	}
	r.CharacterRewards[characterID] = reward
	return reward
}

func (r *BattleResult) CharacterReward(characterID int64) *CharacterReward {
	if r == nil || r.CharacterRewards == nil {
		return nil
	}
	return r.CharacterRewards[characterID]
}

func (r *BattleResult) ToDTO() map[string]interface{} {
	items := make([]map[string]interface{}, 0, len(r.ItemRewards))
	for _, drop := range r.ItemRewards {
		items = append(items, drop.ToDTO())
	}
	currencies := make([]map[string]interface{}, 0, len(r.CurrencyRewards))
	for _, drop := range r.CurrencyRewards {
		currencies = append(currencies, drop.ToDTO())
	}
	pets := make([]map[string]interface{}, 0, len(r.PetRewards))
	for _, reward := range r.PetRewards {
		pets = append(pets, reward.ToDTO())
	}
	return map[string]interface{}{
		"winner":     int(r.WinnerSide),
		"exp":        r.ExpReward,
		"money":      r.MoneyReward,
		"items":      items,
		"currencies": currencies,
		"pets":       pets,
		"battleTime": r.BattleTime,
	}
}

func (r *BattleResult) ToDTOForCharacter(characterID int64) map[string]interface{} {
	if r == nil {
		return map[string]interface{}{
			"winner":     int(SideEnemy),
			"exp":        int64(0),
			"money":      int64(0),
			"items":      []map[string]interface{}{},
			"currencies": []map[string]interface{}{},
			"pets":       []map[string]interface{}{},
			"battleTime": 0,
		}
	}

	items := make([]map[string]interface{}, 0)
	currencies := make([]map[string]interface{}, 0)
	pets := make([]map[string]interface{}, 0)
	expReward := r.ExpReward
	moneyReward := r.MoneyReward

	if reward := r.CharacterReward(characterID); reward != nil {
		expReward = reward.ExpReward
		moneyReward = reward.MoneyReward
		items = make([]map[string]interface{}, 0, len(reward.ItemRewards))
		for _, drop := range reward.ItemRewards {
			items = append(items, drop.ToDTO())
		}
		currencies = make([]map[string]interface{}, 0, len(reward.CurrencyRewards))
		for _, drop := range reward.CurrencyRewards {
			currencies = append(currencies, drop.ToDTO())
		}
		pets = make([]map[string]interface{}, 0, len(reward.PetRewards))
		for _, petReward := range reward.PetRewards {
			pets = append(pets, petReward.ToDTO())
		}
	}

	return map[string]interface{}{
		"winner":     int(r.WinnerSide),
		"exp":        expReward,
		"money":      moneyReward,
		"items":      items,
		"currencies": currencies,
		"pets":       pets,
		"battleTime": r.BattleTime,
	}
}

type BattleWatcher interface {
	SendCallback(method string, args ...interface{}) error
}

type Battle struct {
	ID                       string
	BattleType               BattleType
	State                    BattleState
	CurrentRound             int
	Participants             []*Participant
	Actions                  []*BattleAction
	Result                   *BattleResult
	CreatedAt                time.Time
	StartedAt                *time.Time
	EndedAt                  *time.Time
	MapID                    int
	ChannelID                int
	LogID                    int64
	WarMapSid                int
	WarMapLevel              int
	BattleFieldID            string
	PendingCommands          map[string]*BattleCommand
	ProcessedActors          map[string]bool
	RoundComplete            bool
	PlayerFled               bool
	BootstrapAutoDefendFired bool
	Watchers                 []BattleWatcher
	StatusManager            *StatusEffectManager
	PendingPetRewards        []PetReward
	BossCtx                  *BossContext
	mu                       sync.RWMutex
}

type BossContext struct {
	BossNID int
	Source  string
	Tier    string
}

func NewBattle(battleType BattleType, mapID int) *Battle {
	return &Battle{
		ID:                uuid.New().String(),
		BattleType:        battleType,
		State:             BattleStateWaiting,
		CurrentRound:      0,
		Participants:      make([]*Participant, 0),
		Actions:           make([]*BattleAction, 0),
		CreatedAt:         time.Now(),
		MapID:             mapID,
		PendingCommands:   make(map[string]*BattleCommand),
		ProcessedActors:   make(map[string]bool),
		RoundComplete:     true,
		StatusManager:     NewStatusEffectManager(),
		PendingPetRewards: make([]PetReward, 0),
	}
}

func (b *Battle) AddPetReward(reward PetReward) {
	b.mu.Lock()
	defer b.mu.Unlock()
	b.PendingPetRewards = append(b.PendingPetRewards, reward)
}

func (b *Battle) GetPendingPetRewards() []PetReward {
	b.mu.RLock()
	defer b.mu.RUnlock()
	rewards := make([]PetReward, len(b.PendingPetRewards))
	copy(rewards, b.PendingPetRewards)
	return rewards
}

func (b *Battle) AddParticipant(p *Participant) bool {
	b.mu.Lock()
	defer b.mu.Unlock()

	if len(b.Participants) >= MaxParticipants {
		return false
	}

	b.Participants = append(b.Participants, p)
	return true
}

func (b *Battle) GetParticipant(id string) *Participant {
	b.mu.RLock()
	defer b.mu.RUnlock()

	for _, p := range b.Participants {
		if p.ID == id {
			return p
		}
	}
	return nil
}

func (b *Battle) GetOwnerPet(ownerID int64) *Participant {
	b.mu.RLock()
	defer b.mu.RUnlock()

	for _, p := range b.Participants {
		if p.Side != SidePlayer || p.EntityType != ParticipantTypePet || p.OwnerID != ownerID || !p.IsAlive {
			continue
		}
		return p
	}
	return nil
}

func (b *Battle) RemoveParticipant(id string) *Participant {
	b.mu.Lock()
	defer b.mu.Unlock()

	for idx, p := range b.Participants {
		if p.ID != id {
			continue
		}
		removed := p
		b.Participants = append(b.Participants[:idx], b.Participants[idx+1:]...)
		return removed
	}
	return nil
}

func (b *Battle) GetParticipantByPosition(position int) *Participant {
	b.mu.RLock()
	defer b.mu.RUnlock()

	for _, p := range b.Participants {
		if p.Position == position {
			return p
		}
	}
	return nil
}

func (b *Battle) GetParticipantsBySide(side Side) []*Participant {
	b.mu.RLock()
	defer b.mu.RUnlock()

	result := make([]*Participant, 0)
	for _, p := range b.Participants {
		if p.Side == side {
			result = append(result, p)
		}
	}
	return result
}

func (b *Battle) GetAliveParticipants(side Side) []*Participant {
	b.mu.RLock()
	defer b.mu.RUnlock()

	result := make([]*Participant, 0)
	for _, p := range b.Participants {
		if p.Side == side && p.IsAlive {
			result = append(result, p)
		}
	}
	return result
}

func (b *Battle) CountAlivePlayerCharacters() int {
	b.mu.RLock()
	defer b.mu.RUnlock()

	count := 0
	for _, p := range b.Participants {
		if p.Side != SidePlayer || p.EntityType != ParticipantTypeCharacter || !p.IsAlive {
			continue
		}
		count++
	}
	return count
}

func (b *Battle) IsPlayerCommandActor(participant *Participant) bool {
	if participant == nil || participant.EntityType != ParticipantTypeCharacter {
		return false
	}
	if b.BattleType == BattleTypePVP {
		return true
	}
	return participant.Side == SidePlayer
}

func (b *Battle) MissingPlayerCommandActors(commands map[string]*BattleCommand) []string {
	b.mu.RLock()
	defer b.mu.RUnlock()

	missing := make([]string, 0)
	for _, participant := range b.Participants {
		if !b.IsPlayerCommandActor(participant) || !participant.IsAlive {
			continue
		}
		if _, exists := commands[participant.ID]; exists {
			continue
		}
		missing = append(missing, participant.ID)
	}
	return missing
}

func (b *Battle) Start() {
	b.mu.Lock()
	defer b.mu.Unlock()

	now := time.Now()
	b.State = BattleStateActive
	b.StartedAt = &now
	b.CurrentRound = 1
}

func (b *Battle) NextRound() bool {
	b.mu.Lock()
	defer b.mu.Unlock()

	if b.CurrentRound >= MaxRounds {
		return false
	}
	b.CurrentRound++
	return true
}

func (b *Battle) AddAction(action *BattleAction) {
	b.mu.Lock()
	defer b.mu.Unlock()

	action.Round = b.CurrentRound
	action.Timestamp = time.Now()
	b.Actions = append(b.Actions, action)
}

func (b *Battle) End(result *BattleResult) {
	b.mu.Lock()
	defer b.mu.Unlock()

	now := time.Now()
	b.State = BattleStateEnded
	b.EndedAt = &now
	b.Result = result

	if b.StartedAt != nil {
		result.BattleTime = int(now.Sub(*b.StartedAt).Seconds())
	}
}

func (b *Battle) Cancel() {
	b.mu.Lock()
	defer b.mu.Unlock()

	now := time.Now()
	b.State = BattleStateCancelled
	b.EndedAt = &now
}

func (b *Battle) IsActive() bool {
	b.mu.RLock()
	defer b.mu.RUnlock()
	return b.State == BattleStateActive
}

func (b *Battle) IsEnded() bool {
	b.mu.RLock()
	defer b.mu.RUnlock()
	return b.State == BattleStateEnded || b.State == BattleStateCancelled
}

func (b *Battle) CheckVictory() (bool, Side) {
	b.mu.RLock()
	defer b.mu.RUnlock()

	playerAlive := false
	enemyAlive := false

	for _, p := range b.Participants {
		if !p.IsAlive {
			continue
		}
		switch p.Side {
		case SidePlayer:
			playerAlive = true
		case SideEnemy:
			enemyAlive = true
		}
	}

	if !playerAlive && !enemyAlive {
		return true, SideEnemy
	}
	if !enemyAlive {
		return true, SidePlayer
	}
	if !playerAlive {
		return true, SideEnemy
	}
	return false, SidePlayer
}

func (b *Battle) SetPendingCommands(commands map[string]*BattleCommand) {
	b.mu.Lock()
	defer b.mu.Unlock()

	b.PendingCommands = commands
	b.ProcessedActors = make(map[string]bool)
	b.RoundComplete = false
}

func (b *Battle) ClearPendingCommands() {
	b.mu.Lock()
	defer b.mu.Unlock()

	b.PendingCommands = make(map[string]*BattleCommand)
}

func (b *Battle) RemovePendingCommand(actorID string) {
	b.mu.Lock()
	defer b.mu.Unlock()

	delete(b.PendingCommands, actorID)
}

func (b *Battle) GetPendingCommands() map[string]*BattleCommand {
	b.mu.RLock()
	defer b.mu.RUnlock()

	result := make(map[string]*BattleCommand)
	for k, v := range b.PendingCommands {
		result[k] = v
	}
	return result
}

func (b *Battle) MarkActorProcessed(actorID string) {
	b.mu.Lock()
	defer b.mu.Unlock()

	b.ProcessedActors[actorID] = true
}

func (b *Battle) IsActorProcessed(actorID string) bool {
	b.mu.RLock()
	defer b.mu.RUnlock()

	return b.ProcessedActors[actorID]
}

func (b *Battle) IsRoundComplete() bool {
	b.mu.RLock()
	defer b.mu.RUnlock()

	return b.RoundComplete
}

func (b *Battle) SetRoundComplete() {
	b.mu.Lock()
	defer b.mu.Unlock()

	b.RoundComplete = true
	b.PendingCommands = make(map[string]*BattleCommand)
	b.ProcessedActors = make(map[string]bool)
}

func (b *Battle) HasPendingCommands() bool {
	b.mu.RLock()
	defer b.mu.RUnlock()

	return len(b.PendingCommands) > 0
}

func (b *Battle) DefeatParticipant(participantID string) bool {
	b.mu.Lock()
	defer b.mu.Unlock()

	for _, participant := range b.Participants {
		if participant.ID != participantID {
			continue
		}
		participant.CurrentHP = 0
		participant.IsAlive = false
		return true
	}
	return false
}

func (b *Battle) SetPlayerFled() {
	b.mu.Lock()
	defer b.mu.Unlock()

	b.PlayerFled = true
}

func (b *Battle) HasPlayerFled() bool {
	b.mu.RLock()
	defer b.mu.RUnlock()

	return b.PlayerFled
}

func (b *Battle) ToDTO() map[string]interface{} {
	b.mu.RLock()
	defer b.mu.RUnlock()

	participants := make(map[string]interface{}, len(b.Participants))
	for _, p := range b.Participants {
		participants[fmt.Sprintf("%d", p.Position)] = p.ToDTO()
	}

	actions := make([]map[string]interface{}, len(b.Actions))
	for i, a := range b.Actions {
		actions[i] = a.ToDTO()
	}

	dto := map[string]interface{}{
		"id":           b.ID,
		"battleType":   int(b.BattleType),
		"state":        int(b.State),
		"currentRound": b.CurrentRound,
		"cList":        participants,
		"actions":      actions,
		"mapId":        b.MapID,
	}

	if b.Result != nil {
		dto["result"] = b.Result.ToDTO()
	}

	return dto
}

func (b *Battle) AddWatcher(w BattleWatcher) {
	b.mu.Lock()
	defer b.mu.Unlock()
	for _, existing := range b.Watchers {
		if existing == w {
			return
		}
	}
	b.Watchers = append(b.Watchers, w)
}

func (b *Battle) RemoveWatcher(w BattleWatcher) {
	b.mu.Lock()
	defer b.mu.Unlock()
	filtered := make([]BattleWatcher, 0, len(b.Watchers))
	for _, existing := range b.Watchers {
		if existing != w {
			filtered = append(filtered, existing)
		}
	}
	b.Watchers = filtered
}

func (b *Battle) BroadcastToWatchers(method string, data interface{}) {
	b.mu.RLock()
	watchers := make([]BattleWatcher, len(b.Watchers))
	copy(watchers, b.Watchers)
	b.mu.RUnlock()

	for _, w := range watchers {
		if err := w.SendCallback(method, data); err != nil {
			b.RemoveWatcher(w)
		}
	}
}
