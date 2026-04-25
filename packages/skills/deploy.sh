#!/bin/bash
# packages/skills/ の内容を .claude/skills/ にデプロイする

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SRC="$REPO_ROOT/packages/skills"
DST="$REPO_ROOT/.claude/skills"

mkdir -p "$DST"

for skill_dir in "$SRC"/*/; do
  name=$(basename "$skill_dir")
  cp -r "$skill_dir" "$DST/"
  echo "deployed: $name"
done
