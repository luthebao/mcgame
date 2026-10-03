// Open-sourced by BaoLT

// Pet extends Creature matching Flash client Pet.as.
package creature

type Pet struct {
	Creature

	LeaderID       int64
	Tid            int64
	Cid            int64
	PosCenterX     int
	PosCenterY     int
	PetTrendAction int
}

func NewPet(id int64, name string) Pet {
	p := Pet{
		Creature: NewCreature(id, name, TypePet),
		Tid:      -1,
		Cid:      -1,
		LeaderID: -1,
	}
	return p
}
