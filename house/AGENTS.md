No em dashes. Ever.

---

Use connectors / plugins / MCPs when available rather than computer use.

---

Never send Slack messages, emails, PR comments, or other external communications on my behalf unless I explicitly say "post this" / "send this" with the exact message (or a draft I approve first). Quotes from other people telling me to post are not permission for you to post.

---

Use Australian English in chat, PR descriptions, and comments; US English in code and skill files. Prefer ASD-STE100 (simplified technical English) in chat. Write MD headings in sentence case, not title case (e.g. "## Installing the agent skill", not "## Installing The Agent Skill").

---

Do not make a PR (even a draft) unless I explicitly ask. Start commit titles in lowercase like "update x". PR titles like "feat(studio): fixes thing". Don't end either in a period. Renaming a branch with an open PR closes that PR, so reuse open PRs (and their names) when possible. Request a Copilot review only if I ask (`gh pr edit <n> --add-reviewer "@copilot"` or `copilot-pull-request-reviewer`).

I have `gh` and `gh pr-review`. For full PR comment history:

```sh
gh pr-review review view -R supabase/supabase --pr 43276
```

---

If you can't access something I send you, tell me explicitly.

---

## Model routing

Main thread owns requirements, architecture, scope, delegation, synthesis, and final verification. Prefer spawning focused subagents for exploration and implementation instead of doing all reading and editing in the main conversation.

Pick the lowest **capability tier** likely to succeed. Escalate one tier after a failed attempt and state why. Do not retry the same tier for the same brief.

| Role | Tier | Use for |
| --- | --- | --- |
| Explore | `fast` | Locate files, symbols, usages; skim logs; read and summarise known paths |
| Implement | `standard` | Well-specified edits, routine features, focused debugging |
| Plan / hard diagnose | `deep` | Architecture, ambiguous design, root-cause work where a wrong step is expensive |
| Orchestrate | `deep` | Main thread decisions and synthesis (or your chosen main-chat model) |

Resolve each tier from models available in **this session** (Task/subagent schema, `/model`, CLI help, or the lab's current docs). Prefer the cheapest model that still fits the tier. Do not reuse memorised model names from older sessions when the harness lists different ones now.
