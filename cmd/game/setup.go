// game setup: docker/.env from .env.example with fresh secrets, keeping the Google sign-in
// values of an existing file. Secrets are written to the file and never printed.
package main

import (
	"fmt"
	"os"
	"path/filepath"
)

var carriedKeys = []string{"GOOGLE_ENABLED", "GOOGLE_CLIENT_ID", "GOOGLE_SECRET"}

func (s *stack) setup() error {
	if s.hasDatabase() {
		if err := s.confirm("A database made with the current secrets exists; new secrets need a new database. Wipe it?"); err != nil {
			return err
		}
		if err := s.wipe(); err != nil {
			return err
		}
	}

	carried := map[string]string{}
	if old, err := loadEnv(s.envPath); err == nil {
		for _, key := range carriedKeys {
			if value := old.get(key); value != "" {
				carried[key] = value
			}
		}
	}

	env, err := loadEnv(filepath.Join(s.dir, ".env.example"))
	if err != nil {
		return err
	}
	env.path = s.envPath
	for key, value := range carried {
		env.set(key, value)
	}

	secrets, err := legacySecrets()
	if err != nil {
		return err
	}
	keys, err := authKeys(secrets["JWT_SECRET"])
	if err != nil {
		return err
	}
	for _, group := range []map[string]string{secrets, keys} {
		for key, value := range group {
			env.set(key, value)
		}
	}
	if err := env.save(); err != nil {
		return err
	}
	if err := os.Chmod(s.envPath, 0o600); err != nil {
		return err
	}
	if err := enableComposeJWKS(s.composePath); err != nil {
		fmt.Fprintln(os.Stderr, "warning:", err)
	}
	fmt.Println("===> docker/.env is ready; start the stack with: game up")
	return nil
}
