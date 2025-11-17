# Repository Guidelines

## Project Structure & Module Organization
This is a pure Godot 4.5 project. `survivors_game.tscn` is the entry point referenced by `project.godot`. Runtime scenes live at the repository root (`player.tscn`, `mob.tscn`, `gun.tscn`, `bullet_2d.tscn`); their scripts sit beside them for easy reference. Asset packs (e.g., `Tiny RPG Character Asset Pack v1.03 -Free Soldier&Orc`, `trees/`, `pistol/`, `smoke_explosion/`) remain unmodified and should be treated as third-party inputs. Plugins live under `addons/`, audio buses at `default_bus_layout.tres`, and temporary auto-import data should stay inside the hidden `.godot/` folder Godot generates.

## Build, Test, and Development Commands
- `godot4 --path .` launches the editor with this project, preserving scene import metadata.
- `godot4 --path . --run res://survivors_game.tscn` runs the game using the configured main scene; use while iterating on gameplay.
- `godot4 --headless --path . --run res://survivors_game.tscn --quit` provides a CI-friendly smoke test to ensure no resources are missing.
For ad hoc debugging, attach `--verbose` to surface script print statements in the terminal.

## Coding Style & Naming Conventions
Scripts are pure GDScript with tab indentation and `snake_case` identifiers (`take_damage`, `health_depleted`). Scene files use PascalCase node names (`Player`, `HappyBoo`) so they can be referenced through the `%Node` shorthand seen throughout the codebase. Cache node references with `@onready` where repeated lookups occur, keep exported constants at the top of the script, and preload scenes/resources near usage to avoid stale references.

## Testing Guidelines
There is no automated test suite; rely on deterministic manual runs. Validate each mechanic by spawning the relevant scene (e.g., run `player.tscn` independently to confirm animation states) before returning to `survivors_game.tscn`. When verifying combat or spawning, print diagnostic output and inspect it via `godot4 ... --run` to keep the repo visual-editor-agnostic.

## Commit & Pull Request Guidelines
The archive lacks Git history, so default to concise imperative commit titles (`feat: add mob knockback`, `fix: clamp player health`). Each PR should describe scene/script changes, list affected resources, and mention how the change was verified (command used, debug output inspected). Include screenshots or GIFs only when they convey layout changes; otherwise provide log snippets to keep reviews focused.

## Asset & Configuration Tips
Do not edit `project.godot` manually unless changing engine settings—prefer the editor to avoid corrupting config version 5. Keep third-party folders intact and document any import tweaks (`.import` metadata) inside the PR. When adding new art, mirror the existing pattern (`res://<category>/<asset_name>/...`) so collaborators can locate textures, meshes, and scenes quickly.
