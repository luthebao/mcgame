// Open-sourced by BaoLT

package item

import (
	"context"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func TestPotionHandler_CanHandle(t *testing.T) {
	h := &potionEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 9999, UseType: 3}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for UseType==3")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 9999, UseType: 0}
	if h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=false for unknown template with UseType!=3")
	}
}

func TestPotionHandler_CanHandle_LookupTable(t *testing.T) {
	h := &potionEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 1, UseType: 0}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for HP potion template ID 1")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 158, UseType: 0}
	if !h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=true for MP potion template ID 158")
	}
}

func TestPotionHandler_Apply_HealHP(t *testing.T) {
	h := &potionEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, CurrentHP: 500, MaxHP: 1000, CurrentMP: 200, MaxMP: 500}
	it := &domainitem.Item{ID: 1, TemplateID: 100, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 3, I1: 300, I2: 0}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.HPHealed != 300 {
		t.Fatalf("expected HPHealed=300, got %d", result.HPHealed)
	}
	if char.CurrentHP != 800 {
		t.Fatalf("expected CurrentHP=800, got %d", char.CurrentHP)
	}
	if result.MPRestored != 0 {
		t.Fatalf("expected MPRestored=0, got %d", result.MPRestored)
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
}

func TestPotionHandler_Apply_HealMP(t *testing.T) {
	h := &potionEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, CurrentHP: 1000, MaxHP: 1000, CurrentMP: 200, MaxMP: 500}
	it := &domainitem.Item{ID: 1, TemplateID: 100, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 3, I1: 0, I2: 150}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.MPRestored != 150 {
		t.Fatalf("expected MPRestored=150, got %d", result.MPRestored)
	}
	if char.CurrentMP != 350 {
		t.Fatalf("expected CurrentMP=350, got %d", char.CurrentMP)
	}
	if result.HPHealed != 0 {
		t.Fatalf("expected HPHealed=0, got %d", result.HPHealed)
	}
}

func TestPotionHandler_Apply_LookupFallback(t *testing.T) {
	h := &potionEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, CurrentHP: 100, MaxHP: 5000, CurrentMP: 100, MaxMP: 5000}
	it := &domainitem.Item{ID: 1, TemplateID: 1, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 1, UseType: 0, I1: 0, I2: 0}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.HPHealed != 300 {
		t.Fatalf("expected HPHealed=300 from lookup table, got %d", result.HPHealed)
	}
	if char.CurrentHP != 400 {
		t.Fatalf("expected CurrentHP=400, got %d", char.CurrentHP)
	}
}

func TestPotionHandler_Apply_CapsToMissing(t *testing.T) {
	h := &potionEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, CurrentHP: 950, MaxHP: 1000}
	it := &domainitem.Item{ID: 1, TemplateID: 100, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 3, I1: 300}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.HPHealed != 50 {
		t.Fatalf("expected HPHealed=50 (capped), got %d", result.HPHealed)
	}
	if char.CurrentHP != 1000 {
		t.Fatalf("expected CurrentHP=1000, got %d", char.CurrentHP)
	}
}

func TestBoxHandler_CanHandle(t *testing.T) {
	h := &boxEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 1, I1: 50}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for UseType==1 and I1>0")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 100, UseType: 1, I1: 0}
	if h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=false when I1==0")
	}

	tpl3 := &models.ItemTemplateTemplate{ID: 100, UseType: 2, I1: 50}
	if h.CanHandle(tpl3) {
		t.Fatal("expected CanHandle=false for UseType!=1")
	}
}

func TestBoxHandler_Apply(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	h := &boxEffectHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 10, TemplateID: 200, StackCount: 1, IsBound: true}
	tpl := &models.ItemTemplateTemplate{ID: 200, UseType: 1, I1: 50, I2: 3}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
	if len(result.GrantedItems) != 1 {
		t.Fatalf("expected 1 granted item, got %d", len(result.GrantedItems))
	}
	granted := result.GrantedItems[0]
	if granted.TemplateID != 50 {
		t.Fatalf("expected TemplateID=50, got %d", granted.TemplateID)
	}
	if granted.Count != 3 {
		t.Fatalf("expected Count=3, got %d", granted.Count)
	}
	if !granted.IsBound {
		t.Fatal("expected IsBound=true")
	}
	if granted.Item == nil {
		t.Fatal("expected granted.Item to be non-nil")
	}
}

func TestBoxHandler_Apply_DefaultCount(t *testing.T) {
	h := &boxEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 10, TemplateID: 200, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 200, UseType: 1, I1: 50, I2: 0}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if len(result.GrantedItems) != 1 {
		t.Fatalf("expected 1 granted item, got %d", len(result.GrantedItems))
	}
	if result.GrantedItems[0].Count != 1 {
		t.Fatalf("expected Count=1 (default), got %d", result.GrantedItems[0].Count)
	}
}

func TestWalletHandler_CanHandle(t *testing.T) {
	h := &walletEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 643}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for known wallet template ID 643")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 4673}
	if !h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=true for known wallet template ID 4673")
	}

	tpl3 := &models.ItemTemplateTemplate{ID: 9999}
	if h.CanHandle(tpl3) {
		t.Fatal("expected CanHandle=false for unknown template ID")
	}
}

func TestWalletHandler_Apply_GrantsMoney(t *testing.T) {
	h := &walletEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, Money: 1000}
	it := &domainitem.Item{ID: 1, TemplateID: 643, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 643, I1: 500}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if char.Money != 1500 {
		t.Fatalf("expected Money=1500, got %d", char.Money)
	}
	if result.Message == "" {
		t.Fatal("expected non-empty message")
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
}

func TestWalletHandler_Apply_FallbackToGold(t *testing.T) {
	h := &walletEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1, Money: 100}
	it := &domainitem.Item{ID: 1, TemplateID: 643, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 643, I1: 0, Gold: 2000}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if char.Money != 2100 {
		t.Fatalf("expected Money=2100, got %d", char.Money)
	}
	if result.Message == "" {
		t.Fatal("expected non-empty message")
	}
}

func TestBuffHandler_CanHandle(t *testing.T) {
	h := &buffEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 2}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for UseType==2")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 100, UseType: 1}
	if h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=false for UseType!=2")
	}
}

func TestBuffHandler_Apply(t *testing.T) {
	h := &buffEffectHandler{}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 100, StackCount: 1}
	tpl := &models.ItemTemplateTemplate{ID: 100, UseType: 2, Name: "Thuốc Tăng Lực"}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
	if result.Message != "Đã sử dụng Thuốc Tăng Lực" {
		t.Fatalf("unexpected message: %q", result.Message)
	}
}

func TestDefaultHandler_AlwaysHandles(t *testing.T) {
	h := &defaultEffectHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 1, UseType: 0}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for any template")
	}

	ctx := context.Background()
	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1}

	result, err := h.Apply(ctx, nil, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
}

func TestDefaultHandler_RejectsUnhandledBoxTypes(t *testing.T) {
	h := &defaultEffectHandler{}
	ctx := context.Background()
	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 2918}

	tpl550 := &models.ItemTemplateTemplate{ID: 2918, Type: 550, UseType: 1}
	_, err := h.Apply(ctx, nil, char, it, tpl550)
	if err == nil {
		t.Fatal("expected error for unhandled type 550 box")
	}

	tpl508 := &models.ItemTemplateTemplate{ID: 100, Type: 508, UseType: 1}
	_, err = h.Apply(ctx, nil, char, it, tpl508)
	if err == nil {
		t.Fatal("expected error for unhandled type 508 box")
	}
}

func TestGiftBoxHandler_CanHandle(t *testing.T) {
	h := &giftBoxEffectHandler{}

	tpl := &models.ItemTemplateTemplate{UseType: 1, Type: 550, Name: "Túi Pet Tím", Description: "Chứa 3 pet. Có thể chọn nhận 1 trong 3"}
	if !h.CanHandle(tpl) {
		t.Fatal("expected to handle choose-one")
	}

	tpl2 := &models.ItemTemplateTemplate{UseType: 1, Type: 550, Name: "Túi Pet", Description: "Chứa pet Kim Ngưu"}
	if h.CanHandle(tpl2) {
		t.Fatal("expected to NOT handle regular pet bag")
	}
}

func TestCurrencyName(t *testing.T) {
	if currencyName(0) != "bạc" {
		t.Fatalf("expected 'bạc', got %q", currencyName(0))
	}
	if currencyName(1) != "vàng" {
		t.Fatalf("expected 'vàng', got %q", currencyName(1))
	}
	if currencyName(2) != "danh vọng" {
		t.Fatalf("expected 'danh vọng', got %q", currencyName(2))
	}
	if currencyName(99) != "tiền" {
		t.Fatalf("expected 'tiền', got %q", currencyName(99))
	}
}

func TestPetBagHandler_CanHandle(t *testing.T) {
	h := &petBagEffectHandler{}

	tpl := &models.ItemTemplateTemplate{UseType: 1, Type: 550, Name: "Túi Pet", Description: "Chứa pet Kim Ngưu"}
	if !h.CanHandle(tpl) {
		t.Fatal("expected to handle regular pet bag")
	}

	tpl2 := &models.ItemTemplateTemplate{UseType: 1, Type: 550, Name: "Túi", Description: "Có thể chọn nhận 1 trong 3 pet"}
	if h.CanHandle(tpl2) {
		t.Fatal("expected to NOT handle choose-one")
	}
}
