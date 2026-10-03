// Open-sourced by BaoLT

package chatfmt

import (
	"context"
	"encoding/json"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func TestFormatLink_MatchesClientAnchorFormat(t *testing.T) {
	got := FormatLink(Link{
		Type:  LinkTypeEventTooltip,
		ID:    17,
		Name:  "Không Gian Đa Chiều",
		Color: "#00FF00",
	})

	want := `<font color="#00FF00"><a href="event:L_ET|17|Không Gian Đa Chiều">[Không Gian Đa Chiều]</a></font>`
	if got != want {
		t.Fatalf("FormatLink() = %q, want %q", got, want)
	}
}

func TestFormatLink_UsesCustomDisplayAndEscapesHTML(t *testing.T) {
	got := FormatLink(Link{
		Type:    LinkTypeNPC,
		ID:      1166,
		Name:    `Reck "Guide" <NPC>`,
		Display: `【Reck "Guide" <NPC>】`,
		Color:   "00ff00",
	})

	want := `<font color="#00FF00"><a href="event:L_N|1166|Reck &#34;Guide&#34; &lt;NPC&gt;">【Reck &#34;Guide&#34; &lt;NPC&gt;】</a></font>`
	if got != want {
		t.Fatalf("FormatLink() = %q, want %q", got, want)
	}
}

func TestFormatLink_ReturnsEmptyForInvalidInput(t *testing.T) {
	if got := FormatLink(Link{Type: LinkTypeMap, ID: 0, Name: "Map"}); got != "" {
		t.Fatalf("FormatLink() with invalid id = %q, want empty", got)
	}
	if got := FormatLink(Link{Type: "", ID: 1, Name: "Map"}); got != "" {
		t.Fatalf("FormatLink() with invalid type = %q, want empty", got)
	}
	if got := FormatLink(Link{Type: LinkTypeMap, ID: 1, Name: ""}); got != "" {
		t.Fatalf("FormatLink() with empty name = %q, want empty", got)
	}
}

func TestExpandTokens_ReplacesTokenizedLinks(t *testing.T) {
	got := ExpandTokens(`Đi đến [@N|2549|Sứ Giả Thủ Hộ Jery|0|0|0] ngay`)
	want := `Đi đến <font color="#FFCC00"><a href="event:L_N|2549|Sứ Giả Thủ Hộ Jery">[Sứ Giả Thủ Hộ Jery]</a></font> ngay`
	if got != want {
		t.Fatalf("ExpandTokens() = %q, want %q", got, want)
	}
}

func TestExpandTokens_PreservesExistingFontWrapper(t *testing.T) {
	got := ExpandTokens(`3<FONT COLOR="#FFCC00">[@N|457|Thương Hội Trưởng Bàng Bối|0|0|0]</FONT> `)
	want := `3<FONT COLOR="#FFCC00"><a href="event:L_N|457|Thương Hội Trưởng Bàng Bối">[Thương Hội Trưởng Bàng Bối]</a></FONT> `
	if got != want {
		t.Fatalf("ExpandTokens() = %q, want %q", got, want)
	}
}

func TestExpandTokens_UsesTokenColorForGenericLinks(t *testing.T) {
	got := ExpandTokens(`Nhận [@TITLE|99|Danh Hiệu|3|0|0]`)
	want := `Nhận <font color="#FF00FF"><a href="event:L_TITLE|99|Danh Hiệu">[Danh Hiệu]</a></font>`
	if got != want {
		t.Fatalf("ExpandTokens() = %q, want %q", got, want)
	}
}

func TestExpandTokensWithResolver_UsesTemplateColor(t *testing.T) {
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{
		json.RawMessage(`{"id":6001,"name":"Ngoc","color":2}`),
	}); err != nil {
		t.Fatalf("LoadTable() error = %v", err)
	}

	got := ExpandTokensWithResolver(`Nhận [@ITT|6001|Ngoc|8|0|0]`, NewGameDataLinkResolver(manager, nil))
	want := `Nhận <font color="#0066FF"><a href="event:L_ITT|6001|Ngoc">[Ngoc]</a></font>`
	if got != want {
		t.Fatalf("ExpandTokensWithResolver() = %q, want %q", got, want)
	}
}

func TestExpandTokensWithResolver_UsesEquipmentInstanceQualityAndPrefix(t *testing.T) {
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable("TBL_EQUIPT_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":7001,"name":"Kiem Sat","color":3}`),
	}); err != nil {
		t.Fatalf("LoadTable() error = %v", err)
	}

	repo := &testItemRepo{
		item: &domainitem.Item{
			ID:         9001,
			TemplateID: 7001,
			ItemType:   domainitem.ItemTypeEquipment,
			ColorCode:  4,
			Properties: map[string]interface{}{
				"preNameType": 5,
			},
		},
	}

	got := ExpandTokensWithResolver(`Khoe [@EQ|9001|Old Name|8|0|0]`, NewGameDataLinkResolver(manager, repo))
	want := `Khoe <font color="#FF00FF"><a href="event:L_EQ|9001|Trác Việt Kiem Sat">[Trác Việt Kiem Sat]</a></font>`
	if got != want {
		t.Fatalf("ExpandTokensWithResolver() = %q, want %q", got, want)
	}
}

type testItemRepo struct {
	item *domainitem.Item
}

func (r *testItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	if r.item != nil && r.item.ID == id {
		return r.item, nil
	}
	return nil, nil
}

func (r *testItemRepo) FindByCharacterID(context.Context, int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *testItemRepo) FindByCharacterAndSlotType(context.Context, int64, domainitem.SlotType) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *testItemRepo) FindBySlot(context.Context, int64, domainitem.SlotType, int) (*domainitem.Item, error) {
	return nil, nil
}

func (r *testItemRepo) FindEquipped(context.Context, int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *testItemRepo) Create(context.Context, *domainitem.Item) error {
	return nil
}

func (r *testItemRepo) Update(context.Context, *domainitem.Item) error {
	return nil
}

func (r *testItemRepo) Delete(context.Context, int64) error {
	return nil
}

func (r *testItemRepo) DeleteByCharacterID(context.Context, int64) error {
	return nil
}

func (r *testItemRepo) MoveItem(context.Context, int64, domainitem.SlotType, int) error {
	return nil
}

func (r *testItemRepo) UpdateStack(context.Context, int64, int) error {
	return nil
}

func (r *testItemRepo) FindFirstEmptySlot(context.Context, int64, domainitem.SlotType, int) (int, error) {
	return 0, nil
}

func (r *testItemRepo) CountBySlotType(context.Context, int64, domainitem.SlotType) (int, error) {
	return 0, nil
}
