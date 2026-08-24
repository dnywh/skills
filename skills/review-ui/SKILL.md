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

A specialized review skill. It does one thing: review the rendered interface as an independent product designer. It does not write features, fix bugs, or review non-UI code. If there is no user-visible change, say so and stop.

Apply `ask-why` for product judgement and `interface-craft` for Danny's copy, layout, and surface conventions. If Emil Kowalski's skills ([emilkowalski/skills](https://github.com/emilkowalski/skills)) are installed, use them as the design-engineering baseline: taste, interaction polish, motion, library choice, and related craft. Load the Emil skill that fits the finding (for example `emil-design-eng` for general craft, `review-animations` for motion, `pick-ui-library` when a hand-rolled control should have been a library).

## How to use this

A **named review**, not a side effect of building.

**In chat:** say `design review`, `review the UI`, or `use review-ui`.

**As a Cursor command:** add `.cursor/commands/design-review.md` so `/design-review` always enters this mode:

```markdown
Review the current work as an independent product designer. This is a read-only review: do not edit files.

Explicitly invoke the `review-ui` skill.

1. Inspect the issue or PR context when available, the current branch diff against the default branch, and any uncommitted changes.
2. Review the rendered interface before the code when a local app, preview, screenshot, or Figma frame is available.
3. Review the relevant journey at a phone width and a desktop width. Exercise only the states and interactions relevant to the change.
4. If authentication, data, or tooling prevents inspection, state exactly what could not be verified.
5. Use code only to confirm or locate a user-visible issue.
```

**From a PR review command:** invoke `review-ui` only when the diff affects a human-facing interface, interaction, responsive behavior, or visible copy. Skip it on backend-only PRs. Do not fold this into a general engineering review; keep the findings separate.

## Review mode

- Remain read-only. Review as an independent designer, not as the author defending the work.
- Review the rendered experience before the code whenever a local app, preview, screenshot, or Figma frame is available.
- Report only concrete problems present in the work.
- Use code to confirm or locate a user-visible issue, not as the main subject.
- Skip acknowledged TODOs unless they still create a release-blocking trust, accessibility, or usability failure.
- Check phone and desktop: the same essential information and actions must survive both. Do not treat a missing preview as a pass.

## Return findings only

1. Blocking trust, accessibility, and usability first.
2. Non-blocking interface and interaction polish second.
3. Anchor every finding to the affected surface, state, interaction, screenshot, or viewport.
4. Do not include praise, a "what works" section, generic design lessons, detached checklist results, or code commentary without a user-visible consequence.
5. If there are no actionable findings, say so briefly and list exactly what could not be verified.
