---
name: review-pr-comments
description: >-
  Reviews and addresses pull request comments (RPRC). Use when the user says
  RPRC, review PR comments, address review comments, or handle Copilot or
  CodeRabbit feedback on a PR.
---

# Review PR comments

When the user says **RPRC** (Review Pull Request Comments):

> Review all the PR comments. They might be from agents (Copilot, CodeRabbit) or humans. Address any that are obvious improvements, and resolve those conversations without an additional comment. Hold off on any you disagree. Play-back here in chat anything in between for us to discuss.

## How to load comments

Prefer the full thread, not a truncated GitHub UI summary:

```sh
gh pr-review review view -R <owner>/<repo> --pr <number>
```

Fall back to `gh api` / `gh pr view` only if `gh pr-review` is unavailable.

## What to do

1. **Obvious improvements:** make the change, resolve the conversation, **no extra comment**.
2. **Disagree or unsure:** do not resolve, do not argue on GitHub. Bring it back here.
3. **In between** (partly right, needs a call, or would change scope): play it back in this chat. Do not guess.

Do not post replies, review summaries, or Slack messages unless the user says "post this" or "send this" with the exact text. Resolving a thread after a silent fix is allowed. Adding a "done" comment is not.

Do not request Copilot or other reviewers. Do not open a new PR to address comments.

## Playback format

For anything held back, list in chat:

- Comment author and a short quote
- Why it is not an obvious yes
- The decision you need (fix, skip, or later)
