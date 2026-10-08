# House instructions

Canonical always-on preferences for Danny. Not part of the `skills.sh` install.

## Source of truth

Edit only [`AGENTS.md`](AGENTS.md) in this folder. Then run `./install.sh` so harness homes pick up the change.

## What install does

| Harness | Target | Method |
| --- | --- | --- |
| Codex | `~/.codex/AGENTS.md` | Symlink to this `AGENTS.md` |
| Claude Code | `~/.claude/CLAUDE.md` | Symlink to this `AGENTS.md` |
| Cursor | `~/.cursor/rules/house.mdc` | Regenerated copy with `alwaysApply: true` frontmatter (Cursor ignores plain `.md` in that folder) |

Existing non-symlink targets are backed up next to themselves with a timestamp suffix before replace.

## Install

From this directory:

```bash
./install.sh
```

Re-run after every edit to `AGENTS.md`.
