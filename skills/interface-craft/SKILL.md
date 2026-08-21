---
name: interface-craft
description: >-
  Danny White's interface conventions for copy, typography, layout, surfaces,
  motion restraint, and responsive behavior. Use when writing UI copy, composing
  screens, choosing a surface, or polishing human-facing interfaces. For broader
  design-engineering craft use Emil Kowalski's skills; for whether to build at
  all use ask-why.
---

# Interface craft

The how of Danny's human-facing UI: copy, composition, and interaction shape. Broader design-engineering craft (taste, motion detail, library choice, prototyping) lives in Emil Kowalski's skills. Whether the feature should exist lives in `ask-why`.

Skill markdown in this repo stays ASCII. Curly punctuation is for **user-facing** copy the agent writes into the product, chat, or PR prose.

## Language and typography

- **Sentence case** for headings, buttons, labels, and navigation. Not title case. Exception: the document H1 may use title case when it is a brand or product name (e.g. README `# Danny's Skills`). Proper nouns keep their usual casing.
- **Typographic punctuation in UI.** Prefer curly apostrophes and quotes in user-facing strings:

  | Use | Example |
  | --- | --- |
  | Apostrophe | `You’re all set` |
  | Quotes | `Say “Continue” to proceed` |

  Keep straight `' "` in code, paths, shell, JSON, and exact literals the user types (trigger phrases, template section names).
- **No em dashes**, except a matching pair that wraps an aside in the middle of a sentence: `to split up—wow, did you see that?—like this`.
- **Keep copy scannable.** Short sentences. Say who acts next. Avoid vague "processing" when a clearer actor and action are known.

## Pick the right surface

Use the smallest surface that can finish the job. Agents default to a dialog.

| Surface | Use for | Avoid when |
| --- | --- | --- |
| Inline | Information required for the current choice | The content is long or independently navigable |
| Dialog | Short, focused, reversible task | The task is multi-step, resumable, or high stakes |
| Sheet | Browsing, comparing, filters, or secondary detail | Losing the current page context would be clearer |
| Page | Payment, agreements, long forms, multi-step or resumable work | The task is a single small confirmation |
| Checklist | Independent asynchronous tasks | The tasks have a strict order and need a guided flow |

Dialogs and sheets are for ephemeral or contextual work. Keep complex or resumable forms inline or on a dedicated page.

## Cards are not a layout

Use a card when it is the object or the interaction (an item, an invoice, a selectable plan). Do not wrap a page in cards to make it look designed.

Prefer spacing, headings, dividers, and alignment over nested containers.

## Default motion to little

Add motion only when it clarifies a state change, a spatial relationship, a system response, or direct press feedback. Product motion stays restrained, quick, and interruptible.

Do not add bouncy, theatrical, staggered, or decorative transitions to routine flows. Do not celebrate a pending or in-review state. For curves, duration, performance, and deeper motion craft, use Emil's skills.

## Same essential actions across viewports

Narrow and wide must keep the same essential information and actions. Do not hide the primary action or the current status on small screens, or invent a second hierarchy for desktop.

Check the changed journey at a phone width and a desktop width. Report what you could not verify (auth, data, no preview) instead of claiming an unperformed check passed.
