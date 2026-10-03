// Open-sourced by BaoLT

// Pet Talent bag delta protocol helpers. Stone mutation RPCs reply with an
// incremental {a:{...}, d:{...}} delta applied to the client's in-memory bag:
//
//	a[slot] = {tid, ln}   added/updated entry (ln = new stack count)
//	d[slot] = {ln}        removed/decremented entry (ln = remaining count, 0 = gone)
//
// reduceBag/addStone mutate State.Bag and record the corresponding delta cell so
// the persisted state and the wire reply stay consistent.
package pettalent

type delta struct {
	add map[int]BagEntry
	del map[int]int
}

func newDelta() *delta {
	return &delta{add: map[int]BagEntry{}, del: map[int]int{}}
}

func (d *delta) toMap() map[string]interface{} {
	a := make(map[string]interface{}, len(d.add))
	for slot, entry := range d.add {
		a[itoa(slot)] = map[string]interface{}{"tid": entry.T, "ln": entry.N}
	}
	dd := make(map[string]interface{}, len(d.del))
	for slot, ln := range d.del {
		dd[itoa(slot)] = map[string]interface{}{"ln": ln}
	}
	return map[string]interface{}{"a": a, "d": dd}
}

func (s *Service) reduceBag(state *State, d *delta, slot, count int) {
	entry, ok := state.Bag[slot]
	if !ok {
		return
	}
	entry.N -= count
	if entry.N <= 0 {
		delete(state.Bag, slot)
		d.del[slot] = 0
		return
	}
	state.Bag[slot] = entry
	d.del[slot] = entry.N
}

func (s *Service) addStone(state *State, d *delta, tid, count int) error {
	if tid <= 0 || count <= 0 {
		return ErrStoneMismatch
	}
	for slot, entry := range state.Bag {
		if entry.T == tid {
			entry.N += count
			state.Bag[slot] = entry
			d.add[slot] = entry
			return nil
		}
	}
	slot := freeBagSlot(state, d)
	if slot == 0 {
		return ErrBagFull
	}
	entry := BagEntry{T: tid, N: count}
	state.Bag[slot] = entry
	d.add[slot] = entry
	return nil
}

func freeBagSlot(state *State, d *delta) int {
	for slot := 1; slot <= maxBagSlot; slot++ {
		if _, used := state.Bag[slot]; used {
			continue
		}
		if _, pendingDel := d.del[slot]; pendingDel {
			continue
		}
		return slot
	}
	return 0
}

func (s *Service) addStoneAtSlot(state *State, d *delta, slot, tid, count int) error {
	if tid <= 0 || count <= 0 {
		return ErrStoneMismatch
	}
	if existing, ok := state.Bag[slot]; ok && existing.T == tid {
		existing.N += count
		state.Bag[slot] = existing
		d.add[slot] = existing
		return nil
	}
	if _, ok := state.Bag[slot]; ok {
		return s.addStone(state, d, tid, count)
	}
	entry := BagEntry{T: tid, N: count}
	state.Bag[slot] = entry
	d.add[slot] = entry
	return nil
}
