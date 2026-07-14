#!/usr/bin/env sh
set -eu

project="nest-orm-test"
root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
keep="${KEEP_NEST_DATABASES:-0}"

cleanup() {
    if [ "$keep" != "1" ]; then
        docker compose -p "$project" down --volumes --remove-orphans
    fi
}

trap cleanup EXIT INT TERM
cd "$root"
docker compose -p "$project" up -d --wait
NEST_POSTGRES_E2E=1 NEST_MYSQL_E2E=1 rvpm test
