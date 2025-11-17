# Engine & Environment Setup

> Pin exact versions and settings here so any machine/agent can reproduce the build.

## 1) Versions & Tooling
- **Godot:** 4.x — *pin exact minor* (e.g., 4.3.0.stable)
- **Export templates:** install for all target platforms
- **OS/SDKs:** macOS/Windows/Linux, Xcode/Android SDK as needed
- **CLIs:** `gdformat`, `pre-commit`, `git-lfs` (for large binaries)

## 2) Project Settings (must match across Playground/Main)
- **Physics:** FPS = 60, common tolerances
- **Layers & Masks:** document assignments (player, enemy, projectiles, interactables)
- **Rendering:** backend, VSync, quality presets
- **Input Map:** canonical actions (W,A,S,D, attack, block, dash, interact) — copy `[input]` block or stamp via script
- **Autoloads (Singletons):** list names, paths, responsibilities

## 3) Editor & Import Settings
- **Text import:** UTF‑8, EOL normalization
- **Texture import:** filtering, repeat, compression, 2D pixel vs. 3D
- **Sprite sheets/atlases:** slicing assumptions (frame size, layout)
- **Default FPS for new animations:** e.g., 12/24

## 4) Debugger & Log Hygiene
- **Debugger filters:** enable only relevant categories during routine runs
- **Max messages:** keep excerpts ≤40 lines in logs; link full artifacts
- **Error policy:** no unhandled errors; warnings reviewed per milestone
- **Artifacts:** store full logs under `/docs/logs/artifacts/` with date/scene; paste short excerpts in `SESSION_LOG.md`

## 5) Build & Export
- **Targets:** Web, Windows, macOS, Linux, iOS, Android — mark which are active
- **Export presets:** file names, output directories, compression, HTML shell (for Web)
- **Versioning:** semantic build numbers; commit hash in build metadata

## 6) Quality Gates
- **Run before commit:** active scene/project; zero new errors
- **Linters/formatters:** `gdformat` and language‑specific linters
- **Optional CI:** headless run of smoke scene; artifact logs attached to build

---

**Changelog**
- YYYY‑MM‑DD: Initial stub created
