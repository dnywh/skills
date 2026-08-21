---
name: make-pr
description: >-
  Drafts a GitHub pull request in Danny White's format. Use when the user says
  make a PR, draft a PR, get ready for review, or invokes /make-pr. Does not
  open a pull request unless the user explicitly asked.
---

# Make a PR

Only create a pull request when the user explicitly asks (for example `/make-pr`, "make a PR", "draft a PR", or "get ready for review"). Do not open a PR as a side effect of other work.

Use `gh` for GitHub (issues, PRs, checks, releases). Do not add Copilot or other reviewers unless asked. Do not rename a branch that already has an open PR as GitHub closes the PR.

## Titles

- **Commit title:** lowercase, like `update x`. No trailing period. Focus on why, not what. Proper nouns keep their usual casing.
- **PR title:** conventional commits with a scope, like `feat(studio): fixes thing`. No trailing period.

## Drafting the PR

Follow `.github/pull_request_template.md` when it exists. Skip the first "YES" contributing section (or similar) and any "Additional context" section (or similar). Add a `## To test` section with clear callsites for a reviewer who doesn't have much time and just needs to click around the most important, easy-to-find callsites. Keep the overall description succinct. No em dashes. Write headings in sentence case.

If the repo has no `.github/pull_request_template.md`, skip the template and still add `## To test`. If the template has no "YES" contributing section or "Additional context" section, skip those instructions.

## To test

Write callsites a busy reviewer can click without setup. Prefer:

- A route or page they can open
- The control to click, in the state it should already be in
- What they should see

Use a deploy preview URL (e.g. Vercel) in those testing instruction callsites if available.

Avoid long environment setup unless the PR cannot be reviewed without it.

## Commits

Only commit when the user asks. Never update git config, never skip hooks, never force-push to main or master, never amend a commit you did not just create in this conversation, never commit secrets.

Pass the commit message through a HEREDOC:

```sh
git commit -m "$(cat <<'EOF'
update x

EOF
)"
```

## Stacked work

If the change should be more than one PR, follow the `stacked-prs` skill. Do not split a PR just to make the diff smaller.
