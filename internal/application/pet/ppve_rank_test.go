// Open-sourced by BaoLT

package pet

import (
	"context"
	"errors"
	"testing"

	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

type fakePPVERank struct {
	res      *domainfeature.PPVERankResult
	err      error
	gotLimit int
	gotChar  int64
}

func (f *fakePPVERank) PPVEGetRank(_ context.Context, charID int64, limit int) (*domainfeature.PPVERankResult, error) {
	f.gotChar = charID
	f.gotLimit = limit
	return f.res, f.err
}

func TestGetRank_MapsEntriesAndMyRank(t *testing.T) {
	svc := NewPPVEService(newPPVEFeatureRepo(), &ppveCharRepo{}, zap.NewNop())
	rank := &fakePPVERank{res: &domainfeature.PPVERankResult{
		Entries: []domainfeature.PPVERankRow{
			{CID: "101", Name: "Alpha", ClassID: "1", Level: 50, FloorNum: 30},
			{CID: "102", Name: "Bravo", ClassID: "2", Level: 40, FloorNum: 10},
		},
		MyRank: 1,
	}}
	svc.SetRankProvider(rank)

	entries, myRank, err := svc.GetRank(context.Background(), 102, PPVERankLimit)
	if err != nil {
		t.Fatalf("GetRank: %v", err)
	}
	if rank.gotChar != 102 || rank.gotLimit != PPVERankLimit {
		t.Fatalf("provider got (char=%d, limit=%d), want (102, %d)", rank.gotChar, rank.gotLimit, PPVERankLimit)
	}
	if myRank != 1 {
		t.Fatalf("myRank = %d, want 1", myRank)
	}
	if len(entries) != 2 {
		t.Fatalf("entries = %d, want 2", len(entries))
	}
	if entries[0].CID != "101" || entries[0].ClassID != "1" || entries[0].FloorNum != 30 || entries[0].Level != 50 || entries[0].Name != "Alpha" {
		t.Fatalf("entry[0] mismatch: %+v", entries[0])
	}
	if entries[1].CID != "102" || entries[1].FloorNum != 10 {
		t.Fatalf("entry[1] mismatch: %+v", entries[1])
	}
}

func TestGetRank_NilProviderReturnsEmpty(t *testing.T) {
	svc := NewPPVEService(newPPVEFeatureRepo(), &ppveCharRepo{}, zap.NewNop())
	entries, myRank, err := svc.GetRank(context.Background(), 1, PPVERankLimit)
	if err != nil {
		t.Fatalf("GetRank: %v", err)
	}
	if len(entries) != 0 || myRank != -1 {
		t.Fatalf("nil provider: got (%d entries, myRank %d), want (0, -1)", len(entries), myRank)
	}
}

func TestGetRank_PropagatesError(t *testing.T) {
	svc := NewPPVEService(newPPVEFeatureRepo(), &ppveCharRepo{}, zap.NewNop())
	svc.SetRankProvider(&fakePPVERank{err: errors.New("db down")})
	if _, _, err := svc.GetRank(context.Background(), 1, PPVERankLimit); err == nil {
		t.Fatal("expected error to propagate, got nil")
	}
}
