# Design & Delivery Pillars

> Pillars guide decisions when trade‑offs appear. Keep them short and actionable.

1) **Godot‑native first**  
Prefer nodes, scenes, signals, and editor workflows where they shine. Use code where complexity warrants it. Avoid over‑engineering.

2) **Small diffs, strong evidence**  
Make changes in tiny, auditable steps. Every “done” state includes a run + debugger check with a short log excerpt.

3) **Research‑first, fit‑check always**  
Consult docs/MCP before building. Then explicitly assess fit to *this* project before applying a pattern.

4) **Playground → Main parity**  
Two projects are OK, surprise is not. Keep versions/settings aligned and use the transfer checklist to prevent drift.

5) **Performance & UX as features**  
60 FPS, responsive input, readable UI, and clear feedback are deliverables—budget for them.

6) **One fact, one home**  
Documentation is a system: SSOT index, ADRs for decisions, append‑only session logs, and minimal duplication.

---

**Changelog**
- YYYY‑MM‑DD: Initial stub created
