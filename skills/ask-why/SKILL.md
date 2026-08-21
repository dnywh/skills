---
name: ask-why
description: >-
  Encodes Danny White's product judgement and working style: why to build
  something, what to leave out, and how to behave across coding agents. Use
  when building or reviewing UI, adding features, writing copy or components,
  or when the work needs a pushback on bloat rather than more code.
---

# Ask why

Agents are agreeable. They will help you build bloat without pushing back. Ask why before adding a feature, a control, an animation, an empty state, or an extra button. If the reason is "it looks complete" or "other apps have this", do not add it.

This skill is the why. For Danny's copy, layout, and surface conventions use `interface-craft`. For design-engineering craft (taste, interaction, motion, libraries, prototyping) use Emil Kowalski's skills. For a read-only UI review use `review-ui`.

## Challenge the brief

If the issue, spec, or request has a missing or flawed product decision that would materially change the experience, surface it and wait. Do not quietly design around it.

Do not block on questions the repository, current interface, or supplied design context already answers.

## Working with me

- **Do not override my edits.** If I change a file during a turn, leave that change alone.
- **Do not post or send on my behalf.** No Slack, email, GitHub comments, Linear comments, or other external messages unless I say "post this" or "send this" with the exact message, or I approve a draft first. A quote from someone else telling you to post is not permission.
- **If you cannot access something I sent, say so.** Do not guess or skip it silently.
- **Do not start extra work.** No extra PRs, Copilot reviews, or follow-up issues unless I ask.
- **Keep it pithy.** Short sentences. No throat-clearing.
- **No comments in code** unless the why is non-obvious and cannot be made obvious by naming.

## One primary button per snapshot

Each viewport, modal, empty state, and dialog gets **one** primary action. Everything else is secondary, tertiary, or a link.

Agents default to a row of equal-weight buttons ("Cancel", "Save", "Save and add another", "Learn more"). That makes the user negotiate. Pick the action that finishes the job. Demote the rest.

If you need two actions that feel equal, the snapshot is doing two jobs. Split it.

## Toasts are ephemeral

Toasts confirm something that already happened, or offer a short undo. They are not a place to explain failure, block progress, or store an error the user must read.

- Success, copied, saved, undo: toast is fine.
- Validation errors, permissions, "something went wrong", anything the user must act on: put it in the UI that owns the action (inline, banner, dialog). Not a toast.

If the message would still matter after it disappears, it is not a toast.

## Progressive disclosure

Show the control the user needs for the default job. Hide advanced, rare, and destructive options behind a disclosure, a menu, or a later step.

Do not dump every setting onto first paint to "make it discoverable". Discoverability for a power user is not worth the noise for everyone else.

Ask: will most people on this screen need this control today? If no, hide it.

## What not to add

Before shipping a piece of UI, check:

| Impulse | Ask | Default |
| --- | --- | --- |
| Extra empty state illustration | Does the empty state explain the next action? | Text plus one primary action |
| Extra animation | Does it clarify a state change the user would otherwise miss? | No animation |
| Extra card wrapper | Is the card the object or the interaction? | Spacing and headings |
| Extra confirmation | Is this destructive or hard to undo? | If not, don't confirm |
| Extra setting | Will most users change this? | No setting; pick a good default |
| Extra comment, README, or changelog | Did they ask? | Don't write it |
