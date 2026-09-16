---
name: review-ui
description: >-
  Read-only design review against Danny White's product bar. Use when the user
  says design review, review the UI, or /design-review, or when a PR diff
  changes a user-visible interface, interaction, responsive behavior, or copy.
  Do not use for backend-only, infrastructure, database, API, or test-only
  work with no interface change.
disable-model-invocation: true
---

# Review UI

A specialized review skill. It does one thing: review the user-visible interface as an independent product designer. It does not write features, fix bugs, or review non-UI code. If there is no user-visible change, say so and stop.

Apply `ask-why` for product judgement and `interface-craft` for Danny's copy, layout, and surface conventions. If Emil Kowalski's skills ([emilkowalski/skills](https://github.com/emilkowalski/skills)) are installed, use them as the design-engineering baseline. Load the Emil skill that fits the finding (for example `emil-design-eng`, `review-animations`, `pick-ui-library`).

## How to use this

A **named review**, not a side effect of building.

**In chat:** say `design review`, `review the UI`, or `use review-ui`.

**As a Cursor command:** add `.cursor/commands/design-review.md` so `/design-review` always enters this mode:

```markdown
Review the current work as an independent product designer. This is a read-only review: do not edit files.

Explicitly invoke the `review-ui` skill.

1. Inspect PR/issue context when available, the branch diff against the default branch, and any uncommitted changes.
2. Review from the diff and code first. Infer layout, breakpoints, copy, and interaction shape from the source.
3. Use a screenshot, Figma frame, or local app only if one is already available. Do not open deploy previews or chase auth.
4. Keep findings separate from any general engineering review.
```

**From a PR review command:** invoke `review-ui` only when the diff affects a human-facing interface, interaction, responsive behavior, or visible copy. Skip it on backend-only PRs.

## Review mode

- Remain read-only. Review as an independent designer, not as the author defending the work.
- Diff and code are the default evidence. Do not spend the turn opening remote previews, signing in, or retrying blocked URLs.
- If a screenshot, Figma frame, or already-running local UI is at hand, use it to confirm what the code suggests. Otherwise stay with the code.
- Report only concrete problems present in the work.
- Skip acknowledged TODOs unless they still create a release-blocking trust, accessibility, or usability failure.
- From the code (and any available visuals), check that phone and desktop keep the same essential information and actions. Do not claim a viewport was visually verified if you only read the source.

## Return findings only

1. Blocking trust, accessibility, and usability first.
2. Non-blocking interface and interaction polish second.
3. Anchor every finding to the affected surface, state, interaction, or viewport (code path is fine when no visual was available).
4. Do not include praise, a "what works" section, generic design lessons, detached checklist results, or code commentary without a user-visible consequence.
5. If there are no actionable findings, say so briefly. List only what you could not verify when that matters (for example a state that needs auth or live data).
