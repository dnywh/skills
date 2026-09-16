---
name: stacked-prs
description: >-
  Splits work into stacked pull requests that are each mergeable on their own,
  following Danny White's de-risking approach. Use when the user asks to stack
  PRs, split work into PRs, or de-risk a large change with a stack.
---

# Stacked PRs

_Approach learned from an internal August 2026 Supabase Slack thread by Ivan Vasilov._

The point is to de-risk shipping. Each PR in the stack must be mergeable on its own. Do not stack only to make review chunks smaller.

## How to split

When it makes sense, go **code first**:

1. Queries, hooks, and package changes
2. Components
3. Tests

An alternative, when it makes sense, is shipping **features one by one**. Smallest feature first, then more, then more. Ask if you are unsure which split is safer.

Do not put an unusable half-feature on main. "Mergeable on its own" means the product still works if later PRs never land.

## Two valid shapes

**Independent PRs into trunk** when layers do not need each other. Each PR targets `main`/`master`, ships alone, and later PRs never landing is fine. Prefer this when the split is feature-by-feature.

**Dependent GitHub stacks** when later layers truly build on earlier ones and you want native stack UI / one-click merge. Use [GitHub's stacked PR CLI](https://docs.github.com/en/pull-requests/reference/stacked-prs-cli-commands) (`gh stack`), not a handmade branch-onto-branch ritual.

Do not force `gh stack` onto an already-open tip PR just to look stacked. Renaming or re-layering that branch is messy; GitHub closes PRs on rename. Keep the tip branch name, open lower layers as separate PRs, mention the related PR numbers in each description, and rebase the tip after lower layers merge.

## GitHub

Each stacked PR still follows the `make-pr` skill (sentence-case headings, `## To test`, no extra comments). Only open PRs when the user asked to stack or to make the PRs.

Draft vs ready: tip can stay draft until lower layers land. Lower layers you want reviewed now should be ready for review, not blanketed as draft. Example: PR 1 ready for review; tip stays draft until PR 1 merges.

## What not to do

- One conceptual change sliced into arbitrary file-sized PRs
- A stack where PR 2 is required before PR 1 is safe
- Tests-only as PR 1 when the product change is untested and already merged
