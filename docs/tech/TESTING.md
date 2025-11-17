# Testing & CI (Godot 4.x)

> Lightweight unit tests + headless scene runs to catch regressions early and provide evidence.

## 1) Unit tests with GUT
- **Framework:** GUT supports Godot 4.x and runs in editor or via CLI.
- **Install:** add GUT addon to `res://addons/` and enable in Project Settings.
- **Structure:** place tests under `res://test/` or `res://addons/gut/tests/`.

### Minimal example
```gdscript
# res://test/test_math.gd
extends GutTest

func test_add():
    assert_eq(1 + 1, 2)
```

### Run tests (editor)
- Project → Tools → GUT → Run tests

### Run tests (CLI)
```
godot -d --headless --script res://addons/gut/gut_cmdln.gd -s
```

## 2) Headless scene runs (smoke tests)
- Use the Run & Debug Gate commands to execute a **smoke scene** in CI.
```
godot -d --headless res://scenes/SmokeTest.tscn > ./docs/logs/artifacts/$(date +%F)-smoke.log
```
- Treat a **clean run** (no errors) as a required quality gate.

## 3) CI skeleton (GitHub Actions)
```yaml
name: godot-ci
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Godot 4.x
        uses: chickensoft-games/setup-godot@v1
        with:
          version: '4.3.0' # pin your version
          include-templates: true
      - name: Unit tests (GUT)
        run: godot -d --headless --script res://addons/gut/gut_cmdln.gd -s
      - name: Smoke scene
        run: godot -d --headless res://scenes/SmokeTest.tscn
```

## 4) Evidence in session logs
- For failing tests or smoke scenes, include a **≤40-line excerpt** and link the full artifact in `SESSION_LOG.md`.

---

**Changelog**
- YYYY‑MM‑DD: Initial testing & CI guide added
