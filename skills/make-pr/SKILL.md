---
name: make-pr
description: >-
  Drafts a GitHub pull request in Danny White's format. Use when the user says
  make a PR, draft a PR, get ready for review, or invokes /make-pr. Does not
  open a pull request unless the user explicitly asked.
---

# Make a PR

Only create a pull request when the user explicitly asks (for example `/make-pr`, "make a PR", "draft a PR", or "get ready for review"). Do not open a PR as a side effect of other work. Make this a draft PR unless told otherwise.

Use `gh` for GitHub (issues, PRs, checks, releases). Do not add Copilot or other reviewers unless asked. Do not rename a branch that already has an open PR as GitHub closes the PR.

## Titles

- **Commit title:** lowercase, like `update x`. No trailing period. Focus on why, not what. Proper nouns keep their usual casing.
- **PR title:** conventional commits with a scope, like `feat(studio): fixes thing`. No trailing period.

## Writing the PR description

Follow `.github/pull_request_template.md` when it exists. Skip any purely optional sections or gates. Also skip any checklists if their contents are irrelevant. Keep the overall description succinct and use bullet points where possible. No em dashes. Write headings in sentence case. Unless a similar section already exists in the template, add a `## Review instructions` section.

If the repo has no `.github/pull_request_template.md`, make a minimal description following a standard "problem" and "solution" format. Still add `## Review instructions` or similar, when relevant.

## Review instructions

Write callsites a busy reviewer can click without setup. Prefer:

- A route or page they can open
- The control to click, in the state it should already be in
- What they should see

Use a deploy preview URL (e.g. Vercel) in those callsites if available. Skip or keep brief when there is nothing to click.

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
