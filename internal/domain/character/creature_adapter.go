// Open-sourced by BaoLT

// Character to player-creature adapter.
package character

import (
	"time"

	"mcgame-server/internal/domain/creature"
)

func (c *Character) ToCreatureModel() creature.Player {
	p := creature.NewPlayer(c.ID, c.Name)
	p.ClassID = c.ClassID
	p.Gender = c.Gender
	p.Level = c.Level
	p.PosMapID = c.MapID
	p.PosX = float64(c.PosX)
	p.PosY = float64(c.PosY)
	p.Dir = c.Direction
	p.CurrentHP = c.CurrentHP
	p.CurrentMP = c.CurrentMP
	p.HPMax = c.MaxHP
	p.MPMax = c.MaxMP
	p.HP = c.CurrentHP
	p.MP = c.CurrentMP
	p.SPMax = c.MaxSP
	p.CurrentSP = c.CurrentSP

	p.AttStrength = c.Strength
	p.AttAgility = c.Agility
	p.AttStamina = c.Stamina
	p.AttIntelligence = c.Intelligence
	p.AttEnergy = c.Spirit

	p.Money = c.Money
	p.MoneyBind = c.MoneyBind
	p.Gold = c.Gold
	p.GoldBind = c.GoldBind

	p.Exp = c.Experience
	p.ExpRe = c.RebirthExp
	p.LevelRe = c.RebirthLvl
	p.PmLevel = c.CurrentPMLevel(time.Now())
	p.VipT = c.VIPType

	p.BagSlotNum = c.BagSlotNum
	p.BankSlotNum = c.BankSlotNum
	p.PetMaxNum = c.PetMaxNum
	p.DressInfo = c.DressInfo
	p.TotalOnline = c.TotalOnline

	return p
}
