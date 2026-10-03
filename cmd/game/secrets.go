// Fresh Supabase secrets and legacy HS256 API keys (port of docker/utils/generate-keys.sh).
package main

import (
	"crypto/hmac"
	"crypto/rand"
	"crypto/sha256"
	"encoding/base64"
	"encoding/hex"
	"fmt"
	"time"
)

const jwtLifetime = 5 * 365 * 24 * time.Hour

func randomBytes(n int) ([]byte, error) {
	buf := make([]byte, n)
	if _, err := rand.Read(buf); err != nil {
		return nil, err
	}
	return buf, nil
}

func genHex(n int) (string, error) {
	buf, err := randomBytes(n)
	if err != nil {
		return "", err
	}
	return hex.EncodeToString(buf), nil
}

func genBase64(n int) (string, error) {
	buf, err := randomBytes(n)
	if err != nil {
		return "", err
	}
	return base64.StdEncoding.EncodeToString(buf), nil
}

func b64url(data []byte) string {
	return base64.RawURLEncoding.EncodeToString(data)
}

func signHS256(secret, payload string) string {
	header := `{"alg":"HS256","typ":"JWT"}`
	content := b64url([]byte(header)) + "." + b64url([]byte(payload))
	mac := hmac.New(sha256.New, []byte(secret))
	mac.Write([]byte(content))
	return content + "." + b64url(mac.Sum(nil))
}

func legacySecrets() (map[string]string, error) {
	out := map[string]string{}
	var err error
	gen := func(key string, fn func(int) (string, error), n int) {
		if err != nil {
			return
		}
		out[key], err = fn(n)
	}

	gen("JWT_SECRET", genBase64, 30)
	gen("SECRET_KEY_BASE", genBase64, 48)
	gen("REALTIME_DB_ENC_KEY", genHex, 8)
	gen("VAULT_ENC_KEY", genHex, 16)
	gen("PG_META_CRYPTO_KEY", genBase64, 24)
	gen("LOGFLARE_PUBLIC_ACCESS_TOKEN", genBase64, 24)
	gen("LOGFLARE_PRIVATE_ACCESS_TOKEN", genBase64, 24)
	gen("S3_PROTOCOL_ACCESS_KEY_ID", genHex, 16)
	gen("S3_PROTOCOL_ACCESS_KEY_SECRET", genHex, 32)
	gen("MINIO_ROOT_PASSWORD", genHex, 16)
	gen("POSTGRES_PASSWORD", genHex, 16)
	gen("DASHBOARD_PASSWORD", genHex, 16)
	if err != nil {
		return nil, err
	}

	iat := time.Now().Unix()
	exp := iat + int64(jwtLifetime.Seconds())
	out["ANON_KEY"] = signHS256(out["JWT_SECRET"], fmt.Sprintf(`{"role":"anon","iss":"supabase","iat":%d,"exp":%d}`, iat, exp))
	out["SERVICE_ROLE_KEY"] = signHS256(out["JWT_SECRET"], fmt.Sprintf(`{"role":"service_role","iss":"supabase","iat":%d,"exp":%d}`, iat, exp))
	return out, nil
}
