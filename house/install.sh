#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/AGENTS.md"

if [[ ! -f "$SRC" ]]; then
  echo "missing $SRC" >&2
  exit 1
fi

backup_if_needed() {
  local target="$1"
  if [[ -e "$target" || -L "$target" ]]; then
    if [[ -L "$target" && "$(readlink "$target")" == "$SRC" ]]; then
      return 0
    fi
    local stamp
    stamp="$(date +%Y%m%d-%H%M%S)"
    local backup="${target}.bak.${stamp}"
    mv "$target" "$backup"
    echo "backed up $target -> $backup"
  fi
}

link_to() {
  local target="$1"
  mkdir -p "$(dirname "$target")"
  if [[ -L "$target" && "$(readlink "$target")" == "$SRC" ]]; then
    echo "ok  $target (symlink)"
    return 0
  fi
  backup_if_needed "$target"
  ln -s "$SRC" "$target"
  echo "linked $target -> $SRC"
}

write_cursor_mdc() {
  local target="$HOME/.cursor/rules/house.mdc"
  mkdir -p "$(dirname "$target")"
  local tmp
  tmp="$(mktemp)"
  cat >"$tmp" <<EOF
---
description: Danny house styles from dnywh/skills house/AGENTS.md
alwaysApply: true
---

EOF
  cat "$SRC" >>"$tmp"
  if [[ -f "$target" ]] && cmp -s "$tmp" "$target"; then
    rm "$tmp"
    echo "ok  $target (up to date)"
    return 0
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    backup_if_needed "$target"
  fi
  mv "$tmp" "$target"
  echo "wrote $target"
}

link_to "$HOME/.codex/AGENTS.md"
link_to "$HOME/.claude/CLAUDE.md"
write_cursor_mdc

echo "done"
