package main

import (
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"math/big"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func decodeSig(t *testing.T, token string) (string, []byte) {
	t.Helper()
	parts := strings.Split(token, ".")
	if len(parts) != 3 {
		t.Fatalf("token has %d parts", len(parts))
	}
	sig, err := base64.RawURLEncoding.DecodeString(parts[2])
	if err != nil {
		t.Fatal(err)
	}
	return parts[0] + "." + parts[1], sig
}

func TestLegacySecretsSignHS256(t *testing.T) {
	secrets, err := legacySecrets()
	if err != nil {
		t.Fatal(err)
	}
	content, sig := decodeSig(t, secrets["ANON_KEY"])
	mac := hmac.New(sha256.New, []byte(secrets["JWT_SECRET"]))
	mac.Write([]byte(content))
	if !hmac.Equal(mac.Sum(nil), sig) {
		t.Fatal("ANON_KEY signature does not verify")
	}
}

func TestAuthKeysSignES256(t *testing.T) {
	keys, err := authKeys("secret")
	if err != nil {
		t.Fatal(err)
	}
	var jwks struct {
		Keys []map[string]any `json:"keys"`
	}
	if err := json.Unmarshal([]byte(keys["JWT_JWKS"]), &jwks); err != nil {
		t.Fatal(err)
	}
	if _, leaked := jwks.Keys[0]["d"]; leaked {
		t.Fatal("public JWKS must not carry the private scalar")
	}
	x, _ := base64.RawURLEncoding.DecodeString(jwks.Keys[0]["x"].(string))
	y, _ := base64.RawURLEncoding.DecodeString(jwks.Keys[0]["y"].(string))
	pub := &ecdsa.PublicKey{Curve: elliptic.P256(), X: new(big.Int).SetBytes(x), Y: new(big.Int).SetBytes(y)}

	content, sig := decodeSig(t, keys["SERVICE_ROLE_KEY_ASYMMETRIC"])
	digest := sha256.Sum256([]byte(content))
	if !ecdsa.Verify(pub, digest[:], new(big.Int).SetBytes(sig[:32]), new(big.Int).SetBytes(sig[32:])) {
		t.Fatal("ES256 signature does not verify against the public JWKS")
	}
	if !strings.HasPrefix(keys["SUPABASE_PUBLISHABLE_KEY"], "sb_publishable_") || !strings.HasPrefix(keys["SUPABASE_SECRET_KEY"], "sb_secret_") {
		t.Fatal("unexpected opaque key prefix")
	}
}

func TestEnvFileSetAndCRLF(t *testing.T) {
	path := filepath.Join(t.TempDir(), ".env")
	if err := os.WriteFile(path, []byte("A=1\r\nB=2\r\n"), 0o600); err != nil {
		t.Fatal(err)
	}
	env, err := loadEnv(path)
	if err != nil {
		t.Fatal(err)
	}
	env.set("A", "x")
	env.set("C", "3")
	if err := env.save(); err != nil {
		t.Fatal(err)
	}
	data, _ := os.ReadFile(path)
	if string(data) != "A=x\nB=2\nC=3\n" {
		t.Fatalf("got %q", data)
	}
}
