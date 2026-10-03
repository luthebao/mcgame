// Open-sourced by BaoLT

package group

import "context"

type Repository interface {
	FindByID(ctx context.Context, id int64) (*Group, error)
	FindByMember(ctx context.Context, charID int64) (*Group, error)
	Create(ctx context.Context, g *Group) (*Group, error)
	Update(ctx context.Context, g *Group) error
	Delete(ctx context.Context, id int64) error
	ListByMap(ctx context.Context, mapID int) ([]*Group, error)
}
