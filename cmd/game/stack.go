// The compose stack lifecycle (port of docker/utils/game.sh): up, down, reset, plus the
// confirmation prompt and the docker / supabase CLI plumbing.
package main

import (
	"bufio"
	"bytes"
	"fmt"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"time"
)

type stack struct {
	root        string
	dir         string
	envPath     string
	composePath string
	assumeYes   bool
}

func newStack(assumeYes bool) (*stack, error) {
	root, err := findRepoRoot()
	if err != nil {
		return nil, err
	}
	dir := filepath.Join(root, "docker")
	return &stack{
		root:        root,
		dir:         dir,
		envPath:     filepath.Join(dir, ".env"),
		composePath: filepath.Join(dir, "docker-compose.yml"),
		assumeYes:   assumeYes,
	}, nil
}

func findRepoRoot() (string, error) {
	dir, err := os.Getwd()
	if err != nil {
		return "", err
	}
	for {
		if _, err := os.Stat(filepath.Join(dir, "docker", "docker-compose.yml")); err == nil {
			return dir, nil
		}
		parent := filepath.Dir(dir)
		if parent == dir {
			return "", fmt.Errorf("docker/docker-compose.yml not found; run game from inside the repository")
		}
		dir = parent
	}
}

func (s *stack) run(command string) error {
	switch command {
	case "setup":
		return s.setup()
	case "up":
		return s.up()
	case "down":
		return s.down()
	case "reset":
		return s.reset()
	}
	return fmt.Errorf(usage)
}

func (s *stack) composeCmd(args ...string) *exec.Cmd {
	env := s.envPath
	if _, err := os.Stat(env); err != nil {
		env = filepath.Join(s.dir, ".env.example")
	}
	full := append([]string{"compose", "--env-file", env, "-f", s.composePath}, args...)
	return exec.Command("docker", full...)
}

func attach(cmd *exec.Cmd) *exec.Cmd {
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Stdin = os.Stdin
	return cmd
}

func (s *stack) compose(args ...string) error {
	return attach(s.composeCmd(args...)).Run()
}

func (s *stack) composeOutput(args ...string) (string, error) {
	var out bytes.Buffer
	cmd := s.composeCmd(args...)
	cmd.Stdout = &out
	err := cmd.Run()
	return strings.TrimSpace(out.String()), err
}

func (s *stack) confirm(question string) error {
	if s.assumeYes {
		return nil
	}
	if info, err := os.Stdin.Stat(); err == nil && info.Mode()&os.ModeCharDevice != 0 {
		fmt.Printf("%s (y/N) ", question)
		reply, _ := bufio.NewReader(os.Stdin).ReadString('\n')
		if strings.HasPrefix(strings.ToLower(strings.TrimSpace(reply)), "y") {
			return nil
		}
	}
	return fmt.Errorf("aborted; run again with -y or CONFIRM=1 to skip the question")
}

func (s *stack) hasDatabase() bool {
	entries, err := os.ReadDir(filepath.Join(s.dir, "volumes", "db", "data"))
	return err == nil && len(entries) > 0
}

func (s *stack) wipe() error {
	fmt.Println("===> Removing the containers, their volumes, the database and storage...")
	if err := s.compose("--profile", "*", "down", "-v", "--remove-orphans"); err != nil {
		return err
	}
	for _, sub := range []string{filepath.Join("volumes", "db", "data"), filepath.Join("volumes", "storage")} {
		if err := os.RemoveAll(filepath.Join(s.dir, sub)); err != nil {
			return err
		}
	}
	return nil
}

func (s *stack) down() error {
	return s.compose("--profile", "*", "down", "--remove-orphans")
}

func (s *stack) reset() error {
	if err := s.confirm("Wipe the database and storage back to the migrations and seeds?"); err != nil {
		return err
	}
	if err := s.wipe(); err != nil {
		return err
	}
	return s.up()
}

func (s *stack) up() error {
	if _, err := os.Stat(s.envPath); err != nil {
		return fmt.Errorf("missing docker/.env; run: game setup")
	}
	if err := s.migrate(); err != nil {
		return err
	}
	fmt.Println("===> Starting every service...")
	if err := s.compose("up", "-d", "--build", "--remove-orphans"); err != nil {
		return err
	}
	prune := exec.Command("docker", "image", "prune", "-f", "--filter", "label=com.docker.compose.project=mcgame")
	if err := attach(prune).Run(); err != nil {
		fmt.Fprintln(os.Stderr, "warning: docker image prune failed:", err)
	}
	if err := exec.Command("docker", "builder", "prune", "-f").Run(); err != nil {
		fmt.Fprintln(os.Stderr, "warning: docker builder prune failed:", err)
	}
	return nil
}

func (s *stack) psql(db, query string) (string, error) {
	return s.composeOutput("exec", "-T", "db", "psql", "-U", "postgres", "-d", db, "-tAc", query)
}

func (s *stack) waitForDatabase() error {
	fmt.Println("===> Starting the database...")
	if err := s.compose("up", "-d", "db"); err != nil {
		return err
	}
	deadline := time.Now().Add(5 * time.Minute)
	for time.Now().Before(deadline) {
		if _, err := s.composeOutput("exec", "-T", "db", "pg_isready", "-U", "postgres", "-h", "localhost"); err == nil {
			return nil
		}
		time.Sleep(time.Second)
	}
	return fmt.Errorf("database did not become ready within 5 minutes")
}

func (s *stack) migrate() error {
	env, err := loadEnv(s.envPath)
	if err != nil {
		return err
	}
	for _, key := range []string{"POSTGRES_DIRECT_PORT", "POSTGRES_DB", "POSTGRES_PASSWORD"} {
		if env.get(key) == "" {
			return fmt.Errorf("missing %s in %s", key, s.envPath)
		}
	}
	db := env.get("POSTGRES_DB")
	dbURL := (&url.URL{
		Scheme:   "postgresql",
		User:     url.UserPassword("postgres", env.get("POSTGRES_PASSWORD")),
		Host:     "127.0.0.1:" + env.get("POSTGRES_DIRECT_PORT"),
		Path:     "/" + db,
		RawQuery: "sslmode=disable",
	}).String()

	if err := s.waitForDatabase(); err != nil {
		return err
	}

	history, _ := s.psql(db, "select to_regclass('supabase_migrations.schema_migrations') is not null")
	applied := "0"
	if history == "true" {
		if applied, err = s.psql(db, "select count(*) from supabase_migrations.schema_migrations"); err != nil {
			return err
		}
		if applied == "0" {
			tables, _ := s.psql(db, "select to_regclass('data.data_tbl_achievement') is not null")
			if tables == "true" {
				return fmt.Errorf("the migration history is empty but the game tables exist: a half-applied database; run 'game reset'")
			}
		}
	}

	fmt.Println("===> Applying migrations...")
	args := []string{"db", "push", "--workdir", s.root, "--db-url", dbURL}
	if history != "true" || applied == "0" {
		args = append(args, "--include-seed")
	}
	args = append(args, "--yes")
	push := attach(exec.Command("supabase", args...))
	push.Env = append(os.Environ(), "PGSSLMODE=disable")
	if err := push.Run(); err != nil {
		return fmt.Errorf("supabase db push failed (is the Supabase CLI installed and on PATH?): %w", err)
	}
	return nil
}
