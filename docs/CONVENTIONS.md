# Documentation Conventions & Export Map

> Canonical filenames to use when exporting to your repo. Use these exact names and casing to keep links stable.

## Canonical filenames
- `AGENTS.md`
- `docs/INDEX.md`
- `docs/logs/SESSION_LOG.md`
- `docs/adr/ADR-TEMPLATE.md`
- `docs/mcp/SERVERS.md`
- `docs/mcp/CLIENTS.md`
- `docs/prompts/INDEX.md`
- `docs/tech/ENGINE_SETUP.md`
- `docs/tech/PLAYGROUND_TRANSFER.md`
- `docs/tech/RUN_DEBUG_GATE.md`
- `docs/tech/TESTING.md`
- `docs/project/VISION.md`
- `docs/project/PILLARS.md`
- `docs/project/ROADMAP.md`

## Formatting & Linting (gdtoolkit)
- Use **gdtoolkit** (`gdformat`, `gdlint`) for GDScript formatting and linting.
- Suggested pre‑commit hook:
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/Scony/gdtoolkit
    rev: v4.3.0  # pin a compatible release
    hooks:
      - id: gdformat
        additional_dependencies: []
      - id: gdlint
        additional_dependencies: []
```

## Versioning (SemVer)
- Use **Semantic Versioning**: `MAJOR.MINOR.PATCH`.
- Inject the **git tag/commit** into build metadata (autoload script or export preset) so builds are traceable.
- Tag releases in Git (`v1.2.0`) and keep a CHANGELOG.

## Export checklist
- [ ] Save each canvas document with its **canonical path/name**
- [ ] Verify all intra‑doc links resolve locally
- [ ] Run a quick grep for `PLACEHOLDER` and fill/track remaining items
