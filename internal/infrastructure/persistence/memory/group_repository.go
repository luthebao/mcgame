// Open-sourced by BaoLT

package memory

import (
	"context"
	"sync"
	"time"

	"mcgame-server/internal/domain/group"
)

type GroupRepository struct {
	mu       sync.RWMutex
	groups   map[int64]*group.Group
	memberIx map[int64]int64 // charID -> groupID
	nextID   int64
}

func NewGroupRepository() *GroupRepository {
	return &GroupRepository{
		groups:   make(map[int64]*group.Group),
		memberIx: make(map[int64]int64),
		nextID:   1,
	}
}

func (r *GroupRepository) FindByID(ctx context.Context, id int64) (*group.Group, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if g, ok := r.groups[id]; ok {
		copy := *g
		copy.Members = append([]group.Member(nil), g.Members...)
		return &copy, nil
	}
	return nil, nil
}

func (r *GroupRepository) FindByMember(ctx context.Context, charID int64) (*group.Group, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if gid, ok := r.memberIx[charID]; ok {
		if g, ok2 := r.groups[gid]; ok2 {
			copy := *g
			copy.Members = append([]group.Member(nil), g.Members...)
			return &copy, nil
		}
	}
	return nil, nil
}

func (r *GroupRepository) Create(ctx context.Context, g *group.Group) (*group.Group, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	g.ID = r.nextID
	r.nextID++
	now := time.Now()
	g.CreatedAt = now
	g.UpdatedAt = now
	r.groups[g.ID] = cloneGroup(g)
	for _, m := range g.Members {
		r.memberIx[m.CharID] = g.ID
	}
	copy := *g
	copy.Members = append([]group.Member(nil), g.Members...)
	return &copy, nil
}

func (r *GroupRepository) Update(ctx context.Context, g *group.Group) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if _, ok := r.groups[g.ID]; !ok {
		return nil
	}
	// clear old members index
	for cid, gid := range r.memberIx {
		if gid == g.ID {
			delete(r.memberIx, cid)
		}
	}
	g.UpdatedAt = time.Now()
	r.groups[g.ID] = cloneGroup(g)
	for _, m := range g.Members {
		r.memberIx[m.CharID] = g.ID
	}
	return nil
}

func (r *GroupRepository) Delete(ctx context.Context, id int64) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if g, ok := r.groups[id]; ok {
		for _, m := range g.Members {
			delete(r.memberIx, m.CharID)
		}
		delete(r.groups, id)
	}
	return nil
}

func (r *GroupRepository) ListByMap(ctx context.Context, mapID int) ([]*group.Group, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	result := []*group.Group{}
	for _, g := range r.groups {
		if g.MapID == mapID || mapID == 0 {
			copy := *g
			copy.Members = append([]group.Member(nil), g.Members...)
			result = append(result, &copy)
		}
	}
	return result, nil
}

func cloneGroup(g *group.Group) *group.Group {
	copy := *g
	copy.Members = append([]group.Member(nil), g.Members...)
	copy.Applications = append([]group.Application(nil), g.Applications...)
	return &copy
}
