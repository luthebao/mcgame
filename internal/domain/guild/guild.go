// Open-sourced by BaoLT

// Guild domain entity representing a player guild.
// Matches database schema from migration 011_comprehensive_game_schema.up.sql
// ToDTO emits the 18-key live wire shape including daliyCost (protocol misspelling preserved).
// iconCode is emitted as nil when Icon == 0 (no emblem) to match live protocol where absent emblem sends null.
package guild

import (
	"encoding/json"
	"strconv"
	"time"
)

const (
	RankApplicant  = -1
	RankLeader     = 1
	RankViceLeader = 2
	RankOfficer    = 3
	RankElite      = 4
	RankVeteran    = 5
	RankMember     = 6
)

// Guild represents a player guild
type Guild struct {
	ID       int64
	Name     string
	LeaderID int64

	// Guild info
	Level         int
	Experience    int64
	Population    int
	MaxPopulation int
	Icon          int

	// Guild resources
	Funds             int64
	ContributionTotal int64

	// Guild settings
	Announcement         string
	Description          string
	JoinLevelReq         int
	JoinApprovalRequired bool

	// Activity tracking
	ActivityPoints    int
	LastActivityReset *time.Time

	CreatedAt time.Time
	UpdatedAt time.Time

	Members       []*GuildMember
	Applications  []*GuildApplication
	RankSettings  []map[string]interface{}
	BankPageCount int
	SkillDevData  map[string]interface{}
	SkillLevels   map[int]int
	Warehouse     map[string]interface{}
}

type GuildMember struct {
	ID          int64
	GuildID     int64
	CharacterID int64

	CharacterName  string
	CharacterLevel int
	CharacterClass int
	CharacterExp   int64

	Rank int
	Duty string

	ContributionNormal int64
	ContributionDonate int64
	ContributionTotal  int64
	ContributionWeekly int64

	CanInvite           bool
	CanKick             bool
	CanEditAnnouncement bool
	CanAccessWarehouse  bool
	CanManageWarehouse  bool

	JoinedAt   time.Time
	LastOnline *time.Time
	Online     bool
}

func (g *Guild) ToDTO() map[string]interface{} {
	members := make([]map[string]interface{}, 0, len(g.Members))
	for _, m := range g.Members {
		members = append(members, m.ToDTO())
	}

	skillDataStr := g.buildSkillDataJSON()

	var createdAtStr interface{} = nil
	if !g.CreatedAt.IsZero() {
		createdAtStr = g.CreatedAt.Format("2006-01-02 15:04:05")
	}

	var iconCode interface{} = nil
	if g.Icon != 0 {
		iconCode = strconv.Itoa(g.Icon)
	}

	return map[string]interface{}{
		"id":           strconv.FormatInt(g.ID, 10),
		"name":         g.Name,
		"cid":          strconv.FormatInt(g.LeaderID, 10),
		"ln":           g.LeaderID,
		"level":        strconv.Itoa(g.Level),
		"exp":          g.Experience,
		"iconCode":     iconCode,
		"money":        g.Funds,
		"guildInfo":    g.Description,
		"bagSlotNum":   strconv.Itoa(g.BankPageCount),
		"memLimit":     strconv.Itoa(g.MaxPopulation),
		"dailyProduce": "0",
		"daliyCost":    "0",
		"moneyLimit":   "0",
		"time":         createdAtStr,
		"timeStamp":    nil,
		"totalExp":     g.Experience,
		"skillData":    skillDataStr,
		"announcement": g.Announcement,
		"joinLevelReq": g.JoinLevelReq,
		"memberNumber": g.Population,
		"members":      members,
	}
}

func (g *Guild) buildSkillDataJSON() string {
	if len(g.SkillLevels) == 0 {
		return "{}"
	}
	m := make(map[string]int, len(g.SkillLevels))
	for skillID, level := range g.SkillLevels {
		m[strconv.Itoa(skillID)] = level
	}
	raw, err := json.Marshal(m)
	if err != nil {
		return "{}"
	}
	return string(raw)
}

func (m *GuildMember) ToDTO() map[string]interface{} {
	online := 0
	if m.Online || (m.LastOnline != nil && time.Since(*m.LastOnline) < 5*time.Minute) {
		online = 1
	}

	return map[string]interface{}{
		"id":            m.ID,
		"tableId":       m.ID,
		"gid":           m.GuildID,
		"cid":           m.CharacterID,
		"rank":          m.Rank,
		"status":        online,
		"name":          m.CharacterName,
		"level":         m.CharacterLevel,
		"class":         m.CharacterClass,
		"memberClass":   m.CharacterClass,
		"note":          m.Note(),
		"duty":          m.Duty,
		"normalContrib": m.ContributionNormal,
		"donateContrib": m.ContributionDonate,
		"contribution":  m.ContributionTotal,
	}
}

func (m *GuildMember) IsLeader() bool {
	return m.Rank == RankLeader
}

func (m *GuildMember) IsViceLeader() bool {
	return m.Rank == RankViceLeader
}

func (m *GuildMember) CanManageMembers() bool {
	return m.IsLeader() || m.IsViceLeader() || m.CanInvite || m.CanKick
}

func (m *GuildMember) Note() string {
	return m.CharacterName + "|" + itoa(m.CharacterClass) + "|" + itoa64(m.CharacterExp)
}

func itoa(value int) string {
	return strconv.Itoa(value)
}

func itoa64(value int64) string {
	return strconv.FormatInt(value, 10)
}
