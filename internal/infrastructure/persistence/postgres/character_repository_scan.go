// Open-sourced by BaoLT

// Character select/scan helpers and JSONB marshalling.
// Loads source character data and hydrates runtime combat stats in Go after scan.
package postgres

import (
	"context"
	"encoding/json"
	"strconv"
	"strings"

	"mcgame-server/internal/domain/character"

	"github.com/jackc/pgx/v5"
)

func positionalArgs(n int) string {
	if n <= 0 {
		return ""
	}
	var b strings.Builder
	b.Grow(n * 5)
	for i := 1; i <= n; i++ {
		if i > 1 {
			b.WriteByte(',')
		}
		b.WriteByte('$')
		b.WriteString(strconv.Itoa(i))
	}
	return b.String()
}

const characterSelectQuery = `SELECT * FROM player.query_characters_full($1, $2, $3, $4)`

type characterScanner interface {
	Scan(dest ...interface{}) error
}

func scanSelectedCharacter(scanner characterScanner) (*character.Character, error) {
	char := &character.Character{}
	var petGuardDataJSON []byte
	var bossDailyJSON []byte
	var pmProcessDataJSON []byte

	err := scanner.Scan(
		&char.ID, &char.AccountID, &char.Name, &char.ClassID, &char.Gender,
		&char.Level, &char.Experience, &char.RebirthLvl, &char.RebirthExp,
		&char.Strength, &char.Agility, &char.Stamina, &char.Intelligence, &char.Spirit, &char.AttrPoints,
		&char.MaxAttrPoints, &char.DistributedAttrPoints,
		&char.CurrentHP, &char.CurrentMP, &char.CurrentSP,
		&char.MapID, &char.PosX, &char.PosY, &char.Direction, &char.GuildID,
		&char.Money, &char.MoneyBind, &char.Gold, &char.GoldBind,
		&char.GuildRestoreContrib, &char.GuildRestoreDonate, &char.Pop,
		&char.VIPType, &char.VIPExpiresAt, &char.PMExp, &pmProcessDataJSON, &char.PMFindback,
		&char.DressInfo, &char.BagSlotNum, &char.BankSlotNum, &char.PetMaxNum, &char.TempBagSlots, &char.MxTempBagSlots, &char.GMLevel, &char.SelectedMoneyType, &char.SelectedGoldType,
		&petGuardDataJSON, &bossDailyJSON,
		&char.Ee, &char.En, &char.Ef,
		&char.AptStrength, &char.AptAgility, &char.AptStamina, &char.AptIntelligence, &char.AptEnergy,
		&char.AptStrengthEvolution, &char.AptAgilityEvolution, &char.AptStaminaEvolution, &char.AptIntelligenceEvolution, &char.AptEnergyEvolution,
		&char.CookDex, &char.FishDex, &char.PlantDex, &char.MedicineDex, &char.HerbDex,
		&char.CreatedAt, &char.LastActive, &char.TotalOnline,
		&char.ClassAptStrength, &char.ClassAptAgility, &char.ClassAptStamina, &char.ClassAptIntelligence, &char.ClassAptEnergy,
		&char.Honor, &char.Chivalry, &char.Reputation, &char.Vigor, &char.MaxVigor,
	)
	if err != nil {
		return nil, err
	}

	hydrateCharacterState(char, petGuardDataJSON, bossDailyJSON, pmProcessDataJSON)

	return char, nil
}

func scanSelectedCharacterRows(rows pgx.Rows) ([]*character.Character, error) {
	var characters []*character.Character

	for rows.Next() {
		char, err := scanSelectedCharacter(rows)
		if err != nil {
			return nil, err
		}
		characters = append(characters, char)
	}

	if err := rows.Err(); err != nil {
		return nil, err
	}

	return characters, nil
}

func hydrateCharacterState(char *character.Character, petGuardDataJSON []byte, bossDailyJSON []byte, pmProcessDataJSON []byte) {
	if char == nil {
		return
	}

	char.NormalizeSlotFields()

	if err := json.Unmarshal(petGuardDataJSON, &char.PetGuardData); err != nil || char.PetGuardData == nil {
		char.PetGuardData = map[string]interface{}{
			"lvData":  map[string]interface{}{},
			"petData": map[string]interface{}{},
		}
	}

	if err := json.Unmarshal(bossDailyJSON, &char.BossDaily); err != nil || char.BossDaily == nil {
		char.BossDaily = map[string]interface{}{}
	}

	if err := json.Unmarshal(pmProcessDataJSON, &char.PMProcessData); err != nil || char.PMProcessData == nil {
		char.PMProcessData = map[string]interface{}{}
	}

	char.NormalizeAttributePoints()
	char.RefreshRuntimeStats()
}

func marshalPetGuardData(data map[string]interface{}) []byte {
	if len(data) == 0 {
		return []byte(`{"lvData":{},"petData":{}}`)
	}

	encoded, err := json.Marshal(data)
	if err != nil || len(encoded) == 0 {
		return []byte(`{"lvData":{},"petData":{}}`)
	}

	return encoded
}

func marshalPMProcessData(data map[string]interface{}) []byte {
	if len(data) == 0 {
		return []byte(`{}`)
	}

	encoded, err := json.Marshal(data)
	if err != nil || len(encoded) == 0 {
		return []byte(`{}`)
	}

	return encoded
}

func marshalBossDaily(data map[string]interface{}) []byte {
	if len(data) == 0 {
		return []byte(`{}`)
	}

	encoded, err := json.Marshal(data)
	if err != nil || len(encoded) == 0 {
		return []byte(`{}`)
	}

	return encoded
}

func (r *CharacterRepository) loadCharacterCurrencies(ctx context.Context, char *character.Character) {
	if char == nil {
		return
	}

	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_currencies($1)", char.ID)
	if err != nil {
		return
	}
	defer rows.Close()

	for rows.Next() {
		var cType int
		var amount int64
		if err := rows.Scan(&cType, &amount); err != nil {
			continue
		}
		if a, ok := character.LookupGameKVAccessor(cType); ok {
			a.Set(char, amount)
		}
	}
}

func (r *CharacterRepository) loadCharacterClassProgress(ctx context.Context, char *character.Character) {
	if char == nil {
		return
	}

	var classRank int16
	var questN int32
	if err := r.db.pool.QueryRow(ctx, "select class_rank, quest_n from player.get_character_class_progress($1)", char.ID).Scan(&classRank, &questN); err != nil {
		return
	}
	char.ClassRank = int(classRank)
	char.QuestN = int(questN)
}

func upsertCharacterClassProgress(ctx context.Context, q pgxQueryer, char *character.Character) {
	if char == nil {
		return
	}
	var stored bool
	_ = q.QueryRow(ctx, "select player.upsert_character_class_progress($1, $2::smallint, $3)", char.ID, int16(char.ClassRank), int32(char.QuestN)).Scan(&stored)
}

func upsertCharacterCurrencies(ctx context.Context, q pgxQueryer, char *character.Character) {
	for _, a := range character.GameKVCurrencyAccessors() {
		amount := a.Get(char)
		if amount > 0 || a.Descriptor.AlwaysPersist {
			var upserted bool
			_ = q.QueryRow(ctx, "select player.upsert_character_currency($1, $2, $3)", char.ID, a.Descriptor.TypeID, amount).Scan(&upserted)
		}
	}
}

type pgxQueryer interface {
	QueryRow(ctx context.Context, sql string, args ...any) pgx.Row
}
