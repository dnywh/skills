---
name: stacked-prs
description: >-
  Splits work into GitHub stacked pull requests that are each mergeable on
  their own. Use when the user asks to stack PRs, split work into PRs, or
  de-risk a large change with a stack.
---

# Stacked PRs

_Approach learned from an internal August 2026 Supabase Slack thread by Ivan Vasilov._

Stacked PRs have always been possible. Since mid 2026 GitHub has native support, so use [their implementation](https://docs.github.com/en/pull-requests/reference/stacked-prs-cli-commands).

The point is to de-risk shipping. Each PR in the stack must be mergeable on its own. Do not stack only to make review chunks smaller.

## How to split

When it makes sense, go **code first**:

1. Queries, hooks, and package changes
2. Components
3. Tests

An alternative, when it makes sense, is shipping **features one by one**. Smallest feature first, then more, then more. Ask if you are unsure which split is safer.

Do not put an unusable half-feature on main. "Mergeable on its own" means the product still works if later PRs never land.

## GitHub

Use GitHub's stacked PR CLI, not a handmade branch-onto-branch ritual. Do not rename a branch that already has an open PR: GitHub closes the PR.

Each stacked PR still follows the `make-pr` skill (draft, sentence-case headings, `## To test`, no extra comments). Only open PRs when the user asked to stack or to make the PRs.

## What not to do

- One conceptual change sliced into arbitrary file-sized PRs
- A stack where PR 2 is required before PR 1 is safe
- Tests-only as PR 1 when the product change is untested and already merged
