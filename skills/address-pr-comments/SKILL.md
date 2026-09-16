---
name: address-pr-comments
description: >-
  Addresses pull request review comments using Danny White's workflow. Use when
  the user says address PR comments, address review comments, handle Copilot or
  CodeRabbit feedback, or invokes /address-pr-comments.
disable-model-invocation: true
---

# Address PR comments

When the user asks to address PR comments (for example `/address-pr-comments` or "address PR comments"), read all comments on the PR. Be selective: only act on feedback that is a serious net improvement. Style nits, speculative refactors, and "while you're here" suggestions are not enough on their own.

## Author rule

Treat the comment as **automated** only if the author is clearly a bot (Copilot, CodeRabbit, Bugbot, or similar). Treat colleagues and anyone unclear as **human**.

## How to load comments

Prefer the full thread, not a truncated GitHub UI summary:

```sh
gh pr-review review view -R <owner>/<repo> --pr <number>
```

Fall back to `gh api` / `gh pr view` only if `gh pr-review` is unavailable.

## What to do

1. **Automated + clear net improvement:** make the change, resolve the conversation, **no extra comment**.
2. **Human (any feedback):** do not resolve, do not reply on GitHub. Play the comment back here so the user can decide and write a response. Do not silently implement unless the user asks.
3. **Disagree, unsure, weak suggestion, or in between** (partly right, needs a call, or would change scope): do not resolve, do not argue on GitHub. Bring it back here. Do not guess.

A clear net improvement means the change is clearly correct, reduces real risk or confusion, and is worth the diff. Prefer leave-open over resolve when borderline.

Do not post replies, review summaries, or Slack messages unless the user says "post this" or "send this" with the exact text. Resolving a thread after a silent fix is allowed only for automated clear-net-improvement cases. Adding a "done" comment is not.

Do not request Copilot or other reviewers. Do not open a new PR to address comments.

If this PR has already had a low-value automated review round (for example a second Copilot pass that mostly restates prior nits), strongly recommend stopping further bot review requests after the current turn.

## Playback format

For anything held back, list in chat:

- Comment author and a short quote
- Why it is not an obvious yes (or why it needs the user's voice)
- The decision you need (fix, skip, reply, or later)
