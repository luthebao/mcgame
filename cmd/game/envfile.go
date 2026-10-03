// Minimal KEY=value .env reader/writer. Line endings are normalised to LF so a CRLF checkout
// on Windows does not leak carriage returns into secrets.
package main

import (
	"os"
	"strings"
)

type envFile struct {
	path  string
	lines []string
}

func loadEnv(path string) (*envFile, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	text := strings.ReplaceAll(string(data), "\r\n", "\n")
	text = strings.TrimSuffix(text, "\n")
	return &envFile{path: path, lines: strings.Split(text, "\n")}, nil
}

func (e *envFile) get(key string) string {
	prefix := key + "="
	for _, line := range e.lines {
		if value, ok := strings.CutPrefix(line, prefix); ok {
			return value
		}
	}
	return ""
}

func (e *envFile) set(key, value string) {
	prefix := key + "="
	found := false
	for i, line := range e.lines {
		if strings.HasPrefix(line, prefix) {
			e.lines[i] = prefix + value
			found = true
		}
	}
	if !found {
		e.lines = append(e.lines, prefix+value)
	}
}

func (e *envFile) save() error {
	return os.WriteFile(e.path, []byte(strings.Join(e.lines, "\n")+"\n"), 0o600)
}
