// Open-sourced by BaoLT

// Building extends Charactor matching Flash client Building.as.
package creature

type Building struct {
	Charactor

	Layer      int
	BuildState string
	BuildType  int
	Tid        int
}

func NewBuilding(id int64, name string) Building {
	b := Building{
		Charactor: NewCharactor(id, name),
	}
	b.Creature.Type = TypeBuilding
	b.Creature.ColorCode = 0
	return b
}
