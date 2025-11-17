# /docs/logs/SESSION_LOG.md — Append‑Only Log

> Use this single file for lightweight, chronological logging. One entry per workday.
> Keep links to diffs, scenes, builds, screenshots, and ADRs.

---

## FINAL TEMPLATE (use this)

```yaml
## YYYY-MM-DD
Focus:
  - One sentence describing the main objective.
Context:
  - Links: task ticket, systems page, ADRs.
Actions:
  - Tool calls + key results (with links)
  - Code/scene changes
  - Tests run (scene/project)
Debugger:
  run: <scene|project>
  excerpt: |
    <≤40 lines, showing the relevant error/warning or proof of clean run>
  artifact: ./docs/logs/artifacts/<YYYY-MM-DD>-<scene-or-task>.log
  notes: <why this is OK / what remains>
Performance (optional):
  profiler: <screenshot or CSV export link>
  monitors:
    fps: <value>
    draw_calls: <value>
    memory_mb: <value>
Decisions:
  - Architecture changes? If yes, ADR filed? (link)
Issues:
  - Blockers, bugs, questions
Next_session:
  - The very next action an agent should take
```

---

## EXAMPLE (remove later)

```yaml
## 2025-10-25
Focus:
  - Prototype wave spawner and verify timing against 60 FPS physics.
Context:
  - Ticket #12; Systems: ./systems/WAVES.md; No active ADRs
Actions:
  - Queried docs for SceneTreeTimer vs process; citations noted
  - Added WaveSpawner.tscn + WaveSpawner.gd; committed small diffs
  - Ran active scene via CLI; attached debugger excerpt
Debugger:
  run: res://scenes/WaveSpawner.tscn
  excerpt: |
    [Info] Ready: WaveSpawner
    [Debug] Spawn cycle=1, enemies=5
    [Debug] Spawn cycle=2, enemies=8
    ... (clean run, no errors)
  artifact: ./docs/logs/artifacts/2025-10-25-wave-spawner.log
  notes: Proof of clean run; jitter to re-check under 30 FPS
Performance (optional):
  profiler: ./docs/logs/artifacts/2025-10-25-wave-profiler.csv
  monitors:
    fps: 60
    draw_calls: 280
    memory_mb: 220
Decisions:
  - Use SceneTreeTimer; no ADR
Issues:
  - Spawn jitter at low FPS — investigate fixed_delta
Next_session:
  - Add minimal repro scene for jitter and retest
```

---

## 2025-11-17
Focus:
  - Integrate Soldier/Orc sprite sheets, resize characters/UI, and ship a fullscreen pause menu with HUD relocation.
Context:
  - Systems: ./systems/COMBAT.md (updated)
  - Scenes: player.tscn, mob.tscn, survivors_game.tscn
Actions:
  - Converted Soldier/Orc scenes to atlas-sliced AnimatedSprite2D nodes, removed ground shadows, scaled visuals to 3×, and aligned sprite offsets for true centering.
  - Moved player HealthBar into /root/Game/HUD CanvasLayer (top-left), rewired player.gd to update it, and adjusted Camera2D/Gun positioning so the player sits in the screen center with weapon nearby.
  - Built a fullscreen pause menu (ColorRect backdrop + responsive panel) with working Resume/Settings/Exit buttons and updated COMBAT documentation.
Tests:
  - `godot4 --path . --run res://survivors_game.tscn`
Debugger:
  run: res://survivors_game.tscn
  excerpt: |
    Godot Engine v4.5.1.stable.official.f62fdbde1
    WARNING: The signal "died" is declared but never explicitly used in the class. (mob.gd:3)
  notes: Gameplay runs with centered player, HUD in HUD layer, and pause menu toggled via M; only existing warning remains.
Next_session:
  - Define weapon fire cadence + projectile damage tuning, populate docs/systems/LOOT.md, and start on wave pacing specs.
