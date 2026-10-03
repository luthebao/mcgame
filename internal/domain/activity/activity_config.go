// Open-sourced by BaoLT

// Activity config domain types for database-driven main activity visibility.
package activity

import "context"

type ActivityConfig struct {
	ID         int
	Name       string
	StyleName  string
	PanelKey   string
	FeatureKey string
	SortType   int
	Enable     bool
	Type       int
	Flag       int
	Note       string
}

type ActivityConfigRepository interface {
	List(ctx context.Context) ([]*ActivityConfig, error)
	Get(ctx context.Context, id int) (*ActivityConfig, error)
}

func (c *ActivityConfig) StartedActEntry() map[string]interface{} {
	if c == nil {
		return map[string]interface{}{}
	}

	entry := map[string]interface{}{
		"id":       c.ID,
		"name":     c.Name,
		"sortType": c.SortType,
	}

	if !c.Enable {
		entry["flag"] = false
		return entry
	}

	if c.Type != 0 {
		entry["type"] = c.Type
		entry["flag"] = c.Flag
		return entry
	}

	entry["flag"] = c.Flag != 0
	return entry
}

func (c *ActivityConfig) ChangeViewEntry() (map[string]interface{}, bool) {
	if c == nil {
		return nil, true
	}

	if c.Type != 0 {
		return nil, true
	}

	flag := 0
	if c.Enable {
		flag = 1
	}

	return map[string]interface{}{
		"id":       c.ID,
		"sortType": c.SortType,
		"flag":     flag,
	}, false
}
