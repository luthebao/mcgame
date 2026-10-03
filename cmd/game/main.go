// Cross-platform replacement for `make game <setup|up|down|reset>` (docker/utils/game.sh).
// Pure Go, so it runs natively on Windows without make, sh, openssl or node.
// Build: go build -o bin/game ./cmd/game (Windows: -o bin/game.exe). Run from anywhere inside the repo.
// CONFIRM=1 or -y answers the questions.
package main

import (
	"fmt"
	"os"
)

const usage = "usage: game [-y] <setup|up|down|reset>..."

func main() {
	assumeYes := os.Getenv("CONFIRM") == "1"
	var commands []string
	for _, arg := range os.Args[1:] {
		if arg == "-y" || arg == "--yes" {
			assumeYes = true
			continue
		}
		commands = append(commands, arg)
	}
	if len(commands) == 0 {
		fmt.Fprintln(os.Stderr, usage)
		os.Exit(2)
	}
	for _, command := range commands {
		switch command {
		case "setup", "up", "down", "reset":
		default:
			fmt.Fprintln(os.Stderr, usage)
			os.Exit(2)
		}
	}

	stack, err := newStack(assumeYes)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	for _, command := range commands {
		if err := stack.run(command); err != nil {
			fmt.Fprintln(os.Stderr, err)
			os.Exit(1)
		}
	}
}
