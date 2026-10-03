#!/bin/sh
# make game <setup|up|down|reset>: the one compose stack (docker/docker-compose.yml) for dev and
# prod. setup writes docker/.env with fresh secrets, up starts the database, applies migrations
# (and the seeds on a fresh database) and starts every service, down stops them, reset wipes the
# database and storage back to migrations plus seeds. CONFIRM=1 answers the questions.

set -e

repo_root=$(CDPATH= cd -- "$(dirname "$0")/../.." && pwd)
dir="$repo_root/docker"
env_file="$dir/.env"
compose_file="$dir/docker-compose.yml"

compose() {
	env="$env_file"
	[ -f "$env" ] || env="$dir/.env.example"
	docker compose --env-file "$env" -f "$compose_file" "$@"
}

read_env() {
	value=$(grep -E "^$1=" "$env_file" | head -n 1 | cut -d '=' -f 2-)
	if [ -z "$value" ]; then
		echo "Missing $1 in $env_file"
		exit 1
	fi
	printf '%s' "$value"
}

confirm() {
	[ "${CONFIRM:-}" = "1" ] && return 0
	if [ -t 0 ]; then
		printf '%s (y/N) ' "$1"
		read -r reply
		case "$reply" in
			[Yy]*) return 0 ;;
		esac
	fi
	echo "Aborted. Run again with CONFIRM=1 to skip the question."
	exit 1
}

has_database() {
	[ -d "$dir/volumes/db/data" ] && [ -n "$(ls -A "$dir/volumes/db/data" 2>/dev/null)" ]
}

wipe() {
	echo "===> Removing the containers, their volumes, the database and storage..."
	compose --profile "*" down -v --remove-orphans
	rm -rf "$dir/volumes/db/data" "$dir/volumes/storage"
}

# setup starts docker/.env over from .env.example, keeps the Google sign-in values the old file
# had, and generates every secret with Supabase's own scripts.
setup() {
	if has_database; then
		confirm "A database made with the current secrets exists; new secrets need a new database. Wipe it?"
		wipe
	fi
	carried=""
	if [ -f "$env_file" ]; then
		carried=$(grep -E '^(GOOGLE_ENABLED|GOOGLE_CLIENT_ID|GOOGLE_SECRET)=' "$env_file" || true)
	fi
	cp "$dir/.env.example" "$env_file"
	chmod 600 "$env_file"
	echo "$carried" | while IFS= read -r line; do
		[ -n "$line" ] || continue
		key=${line%%=*}
		value=${line#*=}
		sed -i.old -e "s|^$key=.*$|$key=$value|" "$env_file"
	done
	(cd "$dir" && sh utils/generate-keys.sh --update-env && sh utils/add-new-auth-keys.sh --update-env)
	rm -f "$dir/.env.old" "$dir/docker-compose.yml.old"
	echo "===> docker/.env is ready; start the stack with: make game up"
}

migrate() {
	direct_port=$(read_env POSTGRES_DIRECT_PORT)
	db_name=$(read_env POSTGRES_DB)
	password=$(read_env POSTGRES_PASSWORD)
	export PGSSLMODE=disable
	db_url="postgresql://postgres:${password}@127.0.0.1:${direct_port}/${db_name}?sslmode=disable"

	echo "===> Starting the database..."
	compose up -d db
	until compose exec -T db pg_isready -U postgres -h localhost >/dev/null 2>&1; do
		sleep 1
	done

	history=$(compose exec -T db psql -U postgres -d "$db_name" -tAc "select to_regclass('supabase_migrations.schema_migrations') is not null" | tr -d '[:space:]')
	applied=0
	if [ "$history" = "true" ]; then
		applied=$(compose exec -T db psql -U postgres -d "$db_name" -tAc "select count(*) from supabase_migrations.schema_migrations" | tr -d '[:space:]')
		if [ "$applied" = "0" ]; then
			tables=$(compose exec -T db psql -U postgres -d "$db_name" -tAc "select to_regclass('data.data_tbl_achievement') is not null" | tr -d '[:space:]')
			if [ "$tables" = "true" ]; then
				echo "The migration history is empty but the game tables exist: a half-applied database."
				echo "Run 'make game reset'."
				exit 1
			fi
		fi
	fi

	echo "===> Applying migrations..."
	if [ "$history" = "true" ] && [ "$applied" != "0" ]; then
		supabase db push --workdir "$repo_root" --db-url "$db_url" --yes
	else
		supabase db push --workdir "$repo_root" --db-url "$db_url" --include-seed --yes
	fi
}

up() {
	if [ ! -f "$env_file" ]; then
		echo "Missing docker/.env; run: make game setup"
		exit 1
	fi
	migrate
	echo "===> Starting every service..."
	compose up -d --build --remove-orphans
	docker image prune -f --filter label=com.docker.compose.project=mcgame
	docker builder prune -f >/dev/null
}

down() {
	compose --profile "*" down --remove-orphans
}

reset() {
	confirm "Wipe the database and storage back to the migrations and seeds?"
	wipe
	up
}

case "$1" in
	setup) setup ;;
	up) up ;;
	down) down ;;
	reset) reset ;;
	*)
		echo "usage: make game <setup|up|down|reset>"
		exit 2
		;;
esac
