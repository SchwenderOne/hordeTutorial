# Playground → Main Game Transfer Guide

> Use this guide whenever moving a feature from the **Playground** project into the **Main Game** project. Keep diffs small and auditable.

## 0) Preconditions
- Both projects on the **same Godot minor version** (e.g., 4.3.x). Pin and record in `/docs/tech/ENGINE_SETUP.md`.
- Confirm matching **Project Settings**: Physics FPS, Rendering backend, Layers/Masks, **Input Map**.
- Consistent **naming** for assets and nodes; see AGENTS.md §5.1.

## 1) Export from Playground
- Identify scenes/resources to transfer. Prefer a **single root scene** per feature with clear dependencies.
- In the FileSystem, export/copy assets (include `.import` metadata when safe).
- Ensure textures, fonts, `.tres`/`.res`, animations, and scripts are included.

## 2) Import into Main Game
- Paste into the intended folder structure (match conventions).
- Open each imported scene; resolve **broken paths** and script class names.
- Check **Import** dock for textures/atlases; verify filtering, repeat, and compression settings.

## 3) Rebuild derived data
- **TileMaps/Nav:** re‑bake navigation polygons; prefer `NavigationRegion2D` region‑bake when deriving nav from TileMaps.
- **Animation libraries:** verify clip names/FPS; re‑link to `AnimationPlayer`/`AnimatedSprite2D`.
- **Physics:** confirm collision shapes and layers/masks.

## 4) Wire up project integrations
- **Autoloads/Singletons:** ensure required singletons exist and are configured.
- **Input Map:** copy the `[input]` block from `project.godot` or stamp via script using `ProjectSettings.set_setting('input/<action>', ...)` then `ProjectSettings.save()`; restart editor if needed to refresh UI.
- **Signals:** reconnect scene‑level signals to consumers.

## 5) Verification
- Create a **temporary test scene** in Main that instantiates the imported root.
- Run the scene headless; inspect console/debugger for errors; store log artifacts.
- Exercise core interactions (movement, actions, timers). Record a short GIF if helpful.

## 6) Commit & Document
- Commit with a conventional message, e.g., `feat(playground-transfer): import WaveSpawner feature`.
- Update `/docs/logs/SESSION_LOG.md` with links to diffs and notes.
- If the transfer impacts architecture, file an ADR and link it.

## 7) CLI Quick Start (artifact evidence)
- Run project (debug, headless): `godot -d --headless`
- Run scene (debug, headless): `godot -d --headless path/to/scene.tscn`
- Redirect output to dated logs, e.g., `> ./docs/logs/artifacts/$(date +%F)-scene.log`

## 8) Known pitfalls
- Import settings silently differ → visual or physics inconsistencies.
- Script class name collisions across projects.
- Divergent Project Settings (physics FPS, layers) cause subtle bugs.
- Missing Autoloads or mismatched Input Map prevents actions from firing.
