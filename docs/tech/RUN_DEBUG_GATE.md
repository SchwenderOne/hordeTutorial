# Run & Debug Gate — Policy

> This policy closes the development loop: **always run, always check, always show evidence** — without bloating logs.

## 1) What “Done” means
- The relevant **scene/project was run** after changes (prefer headless for automation/CI).
- The **Debugger** was checked. No unhandled errors; warnings are either addressed or explicitly accepted.
- A **concise log excerpt** (≤ ~40 lines) is added to `/docs/logs/SESSION_LOG.md` with context, and the **full log** is saved as an artifact and linked.

## 2) CLI Quick Start
- Run project (debug, headless): `godot -d --headless`
- Run a specific scene: `godot -d --headless path/to/scene.tscn`
- Tip: redirect output to dated artifacts: `... > ./docs/logs/artifacts/$(date +%F)-scene.log`

## 3) Log hygiene standard
- Include **error signature** and **5–10 lines of context** before/after; remove repetitive spam.
- Prefer **links** to full artifacts stored under `/docs/logs/artifacts/`.
- If the debugger is noisy, narrow categories/filters and re‑run.

## 4) Enforcement points
- **AGENTS.md → Operating Principles:** *Run & Debug before you answer.*
- **End‑of‑Session Checklist:** E0 gate + log excerpt requirement.
- **MCP Playbooks:** re‑run after changes and answer with evidence.
- **ENGINE_SETUP.md:** debugger filters, artifact routine.

---

**Changelog**
- YYYY‑MM‑DD: Initial policy created
