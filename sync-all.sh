#!/usr/bin/env bash

set -e

ROOT="${1:-$PWD}"

echo "Scanning for git repositories under: $ROOT"
echo

find "$ROOT" -type d -name ".git" | while read gitdir; do
    repo="$(dirname "$gitdir")"
    echo "Syncing: $repo"
    cd "$repo"

    git add .
    git commit -m "sync" 2>/dev/null || true
    git pull --rebase
    git push

    echo
done
