// Asymmetric auth keys (port of docker/utils/add-new-auth-keys.sh): EC P-256 key pair as JWKS,
// ES256 API keys and opaque sb_publishable_ / sb_secret_ keys. Replaces the node dependency.
package main

import (
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/rand"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"os"
	"regexp"
	"strings"
	"time"
)

const opaqueProjectRef = "supabase-self-hosted"

type ecJWK struct {
	Kty    string   `json:"kty"`
	Kid    string   `json:"kid"`
	Use    string   `json:"use"`
	KeyOps []string `json:"key_ops"`
	Alg    string   `json:"alg"`
	Ext    bool     `json:"ext"`
	Crv    string   `json:"crv"`
	X      string   `json:"x"`
	Y      string   `json:"y"`
	D      string   `json:"d,omitempty"`
}

type octJWK struct {
	Kty string `json:"kty"`
	K   string `json:"k"`
	Alg string `json:"alg"`
}

func newUUID() (string, error) {
	b, err := randomBytes(16)
	if err != nil {
		return "", err
	}
	b[6] = (b[6] & 0x0f) | 0x40
	b[8] = (b[8] & 0x3f) | 0x80
	return fmt.Sprintf("%x-%x-%x-%x-%x", b[0:4], b[4:6], b[6:8], b[8:10], b[10:16]), nil
}

func signES256(key *ecdsa.PrivateKey, kid string, payload string) (string, error) {
	header := fmt.Sprintf(`{"alg":"ES256","typ":"JWT","kid":%q}`, kid)
	content := b64url([]byte(header)) + "." + b64url([]byte(payload))
	digest := sha256.Sum256([]byte(content))
	r, s, err := ecdsa.Sign(rand.Reader, key, digest[:])
	if err != nil {
		return "", err
	}
	sig := make([]byte, 64)
	r.FillBytes(sig[:32])
	s.FillBytes(sig[32:])
	return content + "." + b64url(sig), nil
}

func opaqueKey(prefix string) (string, error) {
	buf, err := randomBytes(17)
	if err != nil {
		return "", err
	}
	intermediate := prefix + b64url(buf)[:22]
	sum := sha256.Sum256([]byte(opaqueProjectRef + "|" + intermediate))
	return intermediate + "_" + base64.RawURLEncoding.EncodeToString(sum[:])[:8], nil
}

func authKeys(jwtSecret string) (map[string]string, error) {
	key, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
	if err != nil {
		return nil, err
	}
	kid, err := newUUID()
	if err != nil {
		return nil, err
	}

	pub, err := key.PublicKey.Bytes()
	if err != nil {
		return nil, err
	}
	priv, err := key.Bytes()
	if err != nil {
		return nil, err
	}
	x, y, d := b64url(pub[1:33]), b64url(pub[33:65]), b64url(priv)
	oct := octJWK{Kty: "oct", K: b64url([]byte(jwtSecret)), Alg: "HS256"}
	private := ecJWK{Kty: "EC", Kid: kid, Use: "sig", KeyOps: []string{"sign", "verify"}, Alg: "ES256", Ext: true, Crv: "P-256", X: x, Y: y, D: d}
	public := ecJWK{Kty: "EC", Kid: kid, Use: "sig", KeyOps: []string{"verify"}, Alg: "ES256", Ext: true, Crv: "P-256", X: x, Y: y}

	jwtKeys, err := json.Marshal([]any{private, oct})
	if err != nil {
		return nil, err
	}
	jwtJWKS, err := json.Marshal(map[string]any{"keys": []any{public, oct}})
	if err != nil {
		return nil, err
	}

	iat := time.Now().Unix()
	exp := iat + int64(jwtLifetime.Seconds())
	anon, err := signES256(key, kid, fmt.Sprintf(`{"role":"anon","iss":"supabase","iat":%d,"exp":%d}`, iat, exp))
	if err != nil {
		return nil, err
	}
	service, err := signES256(key, kid, fmt.Sprintf(`{"role":"service_role","iss":"supabase","iat":%d,"exp":%d}`, iat, exp))
	if err != nil {
		return nil, err
	}
	publishable, err := opaqueKey("sb_publishable_")
	if err != nil {
		return nil, err
	}
	secret, err := opaqueKey("sb_secret_")
	if err != nil {
		return nil, err
	}

	return map[string]string{
		"SUPABASE_PUBLISHABLE_KEY":    publishable,
		"SUPABASE_SECRET_KEY":         secret,
		"ANON_KEY_ASYMMETRIC":         anon,
		"SERVICE_ROLE_KEY_ASYMMETRIC": service,
		"JWT_KEYS":                    string(jwtKeys),
		"JWT_JWKS":                    string(jwtJWKS),
	}, nil
}

var composeJWKSLine = regexp.MustCompile(`(?m)^([ ]*)#((?:GOTRUE_JWT_KEYS|API_JWT_JWKS|JWT_JWKS|SUPABASE_JWKS):)`)

func enableComposeJWKS(path string) error {
	data, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	text := composeJWKSLine.ReplaceAllString(string(data), "$1$2")
	if text != string(data) {
		if err := os.WriteFile(path, []byte(text), 0o644); err != nil {
			return err
		}
	}
	for _, name := range []string{"GOTRUE_JWT_KEYS:", "API_JWT_JWKS:", "JWT_JWKS:", "SUPABASE_JWKS:"} {
		if !regexp.MustCompile(`(?m)^[ ]*` + regexp.QuoteMeta(name)).MatchString(text) {
			return fmt.Errorf("%s is not active in %s; uncomment the auth configuration manually", strings.TrimSuffix(name, ":"), path)
		}
	}
	return nil
}
