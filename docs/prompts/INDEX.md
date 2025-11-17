# Prompts — Index

> Curate *stable* prompts and examples here. Keep long procedural playbooks elsewhere.

## Structure
- **/docs/prompts/recipes/** — short, single‑purpose prompts (≤ 200 tokens) with 1–2 example I/O pairs.
- **/docs/prompts/patterns/** — reusable prompt patterns (scaffolds) for coding, refactors, bug triage.
- **/docs/prompts/snippets/** — small code/text snippets referenced by prompts.

## Conventions
- One prompt per file; name by intent (e.g., `refactor-scene-tree.md`).
- Include a **Context** line that links to the canonical system/tech page.
- Include **Risks** (where it can go wrong) and **Verification** steps (what to check after use).

## To add next
- MCP audit prompts (docs queries, file ops, scene run) — *after* server audit completes.
- Sprite‑sheet ingestion prompts — *after* deep‑dive is finished.
