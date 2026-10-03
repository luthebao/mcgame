// Open-sourced by BaoLT

// Flat bonus aggregator: bonus sources emit []FlatBonus and ApplyTo folds them into EffectiveStats.
package stats

type FlatBonus struct {
	ID     PropID
	Amount int64
}

type Aggregator struct {
	entries []FlatBonus
}

func (a *Aggregator) Add(id PropID, amount int64) {
	if id <= 0 || amount == 0 {
		return
	}
	a.entries = append(a.entries, FlatBonus{ID: id, Amount: amount})
}

func (a *Aggregator) AddAll(bonuses []FlatBonus) {
	for _, b := range bonuses {
		a.Add(b.ID, b.Amount)
	}
}

func (a *Aggregator) ApplyTo(base *EffectiveStats) {
	for _, e := range a.entries {
		base.Add(e.ID, e.Amount)
	}
}

func (a *Aggregator) Entries() []FlatBonus {
	return a.entries
}

func (a *Aggregator) Len() int {
	return len(a.entries)
}
