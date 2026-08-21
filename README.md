# Danny's Skills

[![skills.sh](https://skills.sh/b/dnywh/skills)](https://skills.sh/dnywh/skills)

For designers and engineers who need an agent to push back, not just to build more UI. Based on what I have picked up over the years, including at Supabase.

Inspired by [emilkowalski/skills](https://github.com/emilkowalski/skills). His skills are a design-engineering baseline (taste, interaction, motion, libraries, prototyping). Mine are additive: product judgement, interface conventions, and PR workflow. LLMs are very agreeable. They help you build bloat without pushing back. Use these to build holistically and for the right reasons.

## Install

Use `-g` to install globally:

```bash
npx skills@latest add dnywh/skills
```

Pair with Emil's design-engineering skills:

```bash
npx skills@latest add emilkowalski/skills -g
```

In Agent chat, type `/danny` to filter skills that mention Danny White in the description.

## Companion MCPs

Skills are judgement. They do not see the rendered page.

For UI review (`review-ui`), connect a browser MCP so the agent can screenshot, resize the viewport, and read the DOM. I use Apple's [Safari MCP server](https://webkit.org/blog/18136/introducing-the-safari-mcp-server-for-web-developers/). Setup lives in that post (Safari 27 beta or Technology Preview, then `safaridriver --mcp`).

## Reference

- **[ask-why](./skills/ask-why/SKILL.md)**: Product judgement. Why to add something, what to leave out, and how to behave across agents.
- **[interface-craft](./skills/interface-craft/SKILL.md)**: Copy, typography, layout, surfaces, motion restraint, and responsive behaviour.
- **[review-ui](./skills/review-ui/SKILL.md)**: Read-only design review. Invoke by name (`design review`, `/design-review`), not as a side effect of building. Findings only.
- **[make-pr](./skills/make-pr/SKILL.md)**: Draft a PR in the right shape, with a short "To test" section. Invoke with `/make-pr`.
- **[address-pr-comments](./skills/address-pr-comments/SKILL.md)**: Address PR comments. Fix the obvious ones silently, bring the rest back to chat. Invoke with `/address-pr-comments`.
- **[stacked-prs](./skills/stacked-prs/SKILL.md)**: Split work into stacked PRs that are each mergeable on their own.

## House styles

These are highly-opinionated and likely fight with other people's defaults. Hence why they are listed here and not in any of the skill files. I keep them in each editor's user rules (Cursor, Codex, Claude, and so on).

- Use Australian English in chat and PRs but US English code
- ASD-STE100 (simplified technical English) in chat
- Never send messages, emails, or comments on my behalf unless given explicit go-ahead
- Stop and ask if you cannot access a file or link you are asked about
