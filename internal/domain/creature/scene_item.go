// Open-sourced by BaoLT

// SceneItem standalone model matching Flash client SceneItem.as.
package creature

type SceneItem struct {
	ID         int64
	Tid        int
	Name       string
	PosX       int
	PosY       int
	PosDir     int
	PosMapID   int
	BrightCode int
	ColorCode  int
	OwnerID    int64

	ResCode int64
	Kind    int
	Type    int
}

func NewSceneItem(id int64, tid int, name string) SceneItem {
	return SceneItem{
		ID:   id,
		Tid:  tid,
		Name: name,
	}
}
