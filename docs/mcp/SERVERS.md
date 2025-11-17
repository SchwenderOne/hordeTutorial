# MCP Servers — Audit Reference (2025-10-25)

> Verified on 2025-10-25 using Windsurf (Cascade) in the `/Users/schwenderone/agent-game` Godot 4.5.1 test project. Capture configuration, capabilities, limits, and failure modes per server.

## Scope
Servers covered:
- Context7 MCP
- Brave Search MCP
- Sequential Thinking MCP
- Godot MCP (Server A — `mcp0_*` namespace)
- Godot MCP (Server B — `mcp4_*`/`godot-one` namespace)

## For each server, captured:
- **Verified configuration**: client(s), enablement notes, config blobs when available
- **Capabilities**: tools exercised, required parameters, representative outputs
- **Limits & Safety**: rate limits, scope boundaries, sandbox behaviour
- **Common failure modes**: reproduced errors and mitigations
- **Test battery**: reproducible calls with observed responses

---

### Context7 MCP
**Config (verified):**
- Client(s): Windsurf (Cascade)
- Enablement steps: Preconfigured via `.codeium/windsurf/mcp_config.json` (read-only to agents). No additional auth prompts.
- Config snippet(s): _Not captured_ (permissions block reading the local config file). Use default `@modelcontextprotocol/server-context7` installation.

**Capabilities:**
- `mcp3_resolve-library-id` — Resolves human-readable names to Context7 IDs. Example: "godot" → `/godotengine/godot` with metadata and version list.
- `mcp3_get-library-docs` — Fetches documentation chunks. Parameters: `context7CompatibleLibraryID` (required), `tokens` (optional, default 500), `topic` (optional filter). Supports large token requests (tested up to 8000) but responses truncate when upstream source is huge.

**Limits & Safety:**
- Network-only access to Context7; no filesystem or project mutation.
- Large `tokens` values increase latency (~2–3 s at 8000 tokens). Small requests return within ~1 s.
- Topics outside the library scope return empty snippets rather than errors.

**Common failures:**
- Invalid library ID → `"The library you are trying to access does not exist."`
- Excessive topic/token combinations may return truncated data; rerun with narrower topic.

**Test battery:**
- Resolve library: `mcp3_resolve-library-id(libraryName="godot")`
- Fetch docs: `mcp3_get-library-docs(context7CompatibleLibraryID="/godotengine/godot", tokens=500, topic="SceneTreeTimer")`
- High-volume fetch: `mcp3_get-library-docs(..., tokens=8000, topic="InputMap")`
- Failure case: `mcp3_get-library-docs(context7CompatibleLibraryID="/nonexistent/library")`

### Brave Search MCP
**Config (verified):**
- Client(s): Windsurf (Cascade)
- Enablement steps: Provided by workspace MCP configuration (uses Brave API key with the free plan). No local overrides.
- Config snippet(s):
```json
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "${input:brave_api_key}"
      }
    }
  }
}
```

**Capabilities:**
- `mcp2_brave_web_search` — Web search with `query`, optional `count` (≤20), `offset`, and `freshness` (`pd`, `pw`, `pm`, `py`, or `YYYY-MM-DDtoYYYY-MM-DD`). Returned structured results with title/description/link.
- `mcp2_brave_local_search` — Local POI search (`query`, optional `count` ≤20). Requires Brave Pro plan for true local data; otherwise automatically falls back to web search.

**Limits & Safety:**
- Free-plan rate limit: 1 request/second, 2000 monthly quota (error code `RATE_LIMITED`).
- Local search with free key returns HTTP 429 ("Request rate limit exceeded for plan") before fallback triggers.
- Network-only; no filesystem access.

**Common failures:**
- Rapid consecutive calls → 429 rate limit with metadata describing quota.
- Local search on free plan → same 429; retrying after cooldown still fails without Pro subscription.

**Test battery:**
- `mcp2_brave_web_search(query="Godot 4.3 tilemap navigation region tutorial", count=3)`
- `mcp2_brave_web_search(query="Brave MCP local search API usage example", count=5)`
- `mcp2_brave_local_search(query="pizza near Alexanderplatz Berlin", count=1)` → 429 (free plan)
- `mcp2_brave_local_search(query="museum near Potsdamer Platz Berlin", count=1)` → 429 (free plan)

### Sequential Thinking MCP
**Config (verified):**
- Client(s): Windsurf (Cascade)
- Enablement steps: Included in default toolset; no extra configuration.

**Capabilities:**
- `mcp8_sequentialthinking` — Generates structured chains of thought. Required fields: `thoughtNumber` (int ≥1), `totalThoughts` (int ≥1), `thought` (string), `nextThoughtNeeded` (bool). Optional: `branchFromThought`, `branchId`, `isRevision`, `revisesThought`, `needsMoreThoughts`.
- Supports branching (distinct `branchId`) and revisions (set `isRevision=true`, `revisesThought=<n>`). Server responds with running history metadata (thought count, active branches).

**Limits & Safety:**
- No project/file access; purely returns structured reflections.
- Requires strict numeric fields; non-integer values or missing fields trigger validation errors.

**Common failures:**
- Omitting `thoughtNumber` → `"Invalid thoughtNumber: must be a number"`.
- Setting `nextThoughtNeeded=false` prematurely ends the chain and future calls should increment `thoughtNumber` accordingly.

**Test battery:**
- Linear chain: thoughts 1–2 covering hypothesis and capture notes.
- Branch test: `branchFromThought=1`, `branchId="A"` and `"B"` to verify independent branches.
- Revision test: `isRevision=true`, `revisesThought=1`.
- Error case: missing `thoughtNumber` (captured validation failure message).

### Godot MCP (Server A — mcp0 namespace)
**Config (verified):**
- Client(s): Windsurf (Cascade)
- Server location: `/Users/schwenderone/mcp-server-godot`
- Notes: Patched `src/index.ts` to trim and resolve incoming `projectPath` arguments and rebuilt via `npm run build`; logging added for diagnostics.

**Capabilities (tested 2025-10-26):**
| Tool | Status | Notes |
| --- | --- | --- |
| `analyze_scene` | ✅ | Parses `.tscn`; exercised with `scenes/ToolTest.tscn` and `scenes/AuditTest.tscn`. |
| `list_scenes` | ✅ | Returns 596 scenes across indexed Godot projects (historical workspaces included). |
| `analyze_script` | ✅ | Reads GDScript structure (`scripts/Simple.gd`). |
| `list_scripts` | ✅ | Enumerates 778 scripts; large output but consistent. |
| `generate_script_template` | ✅ | Produced `GeneratedPlayer` stub extending `CharacterBody2D`. |
| `generate_ui_component` | ✅ | Generated `AuditMenu` Control scene + script. |
| `generate_network_system` | ✅ | Returned multiplayer client/server/shared stubs. |
| `analyze_game_architecture` | ✅ | Outputs canned architecture summary (no project coupling). |
| `optimize_game_performance` | ✅ | Provides generic optimisation checklist. |
| `analyze_error_log` | ✅ | Needs log content to return non-empty analysis. |
| `analyze_crash_dump` | ✅ | Processes supplied crash text; returns generic causes. |
| `diagnose_project` | ✅ | Emits high-level recommendations. |
| `suggest_fix` | ✅ | Requires `errorMessage`; returns templated guidance. |
| `start_debug_session` / `get_debug_session` / `stop_debug_session` | ✅ | Session lifecycle verified (IDs returned, no errors/warnings captured). |
| `get_project_info` | ❌ | Still reports `project.godot file not found`; diagnostics log resolved path & existence flags for follow-up. |

**Limits & Safety:**
- Read-only operations; generation tools emit text artifacts but do not write to disk automatically.
- Outputs include historical project paths; filter results when targeting a specific workspace.
- `get_project_info` remains sensitive to path validation despite normalisation patch—monitor server logs before retrying.

**Common failures & mitigations:**
- Missing log/crash payloads produce empty analyses → always pass representative content.
- `get_project_info` failure despite existing `project.godot`; capture debug output (now enabled) and consider relaxing `validatePath` if absolute paths are rejected.

**Test battery (2025-10-26):**
- `mcp0_analyze_scene(scenePath="/Users/schwenderone/agent-game/scenes/ToolTest.tscn")`
- `mcp0_list_scenes(includeDetails=false)`
- `mcp0_generate_script_template(scriptPath="/Users/schwenderone/agent-game/scripts/generated_player.gd", templateType="player", className="GeneratedPlayer", extendsClass="CharacterBody2D")`
- `mcp0_start_debug_session(sessionId="audit-session")` → `mcp0_get_debug_session` → `mcp0_stop_debug_session`
- Negative: `mcp0_get_project_info(project_path="/Users/schwenderone/agent-game")` → failure with diagnostics, pending patch

### Godot MCP (Server B — godot-one / mcp4 namespace)
**Config (verified):**
- Client(s): Windsurf (Cascade)
- Server command: `@modelcontextprotocol/server-godot` bundle under `/Users/schwenderone/mcp-server-godot`
- Project under test: `/Users/schwenderone/agent-game` (main scene set to `scenes/MainScene.tscn`)

**Capabilities (tested 2025-10-26):**
| Tool | Status | Notes |
| --- | --- | --- |
| `launch_editor` | ✅ | Spawns Godot editor with supplied project. |
| `run_project` | ✅ | Runs with debug output; requires configured main scene. |
| `get_debug_output` | ✅ | Retrieved logs from prior `run_project`. |
| `stop_project` | ✅ | Cleanly terminates running instance. |
| `get_godot_version` | ✅ | Reports installed version (4.5.1). |
| `list_projects` | ✅ | Detects Godot projects in given directory. |
| `get_project_info` | ✅ | Returns project name, version, asset counts. |
| `create_scene` | ✅ | Created `scenes/ToolTest.tscn` (Node2D root). |
| `add_node` | ✅ | Added Sprite2D child to tool test scene. |
| `load_sprite` | ✅ | Loads textures (handles `res://` and absolute fallbacks after earlier patch). |
| `export_mesh_library` | ✅ | Exported MeshLibrary from `scenes/MeshScene.tscn`. |
| `save_scene` | ✅ | Saved modified scene (supports optional `newPath`). |
| `get_uid` | ✅ | Returns resource UID (requires Godot ≥4.4). |
| `update_project_uids` | ✅ | Re-saves resources to refresh UIDs. |

**Limits & Safety:**
- Requires installed Godot executable discoverable via PATH or `GODOT_PATH`.
- Write operations mutate project files; ensure changes are tracked/committed.
- Running scenes without main scene configuration surfaces expected Godot error in debug output but does not crash the tool.

**Common failures & mitigations:**
- Missing main scene → `run_project` succeeds but debug output shows launch failure; set `run/main_scene` before automation.
- Texture resolution in `load_sprite` previously failed for relative paths; patched `godot_operations.gd` ensures absolute fallback.

**Test battery (2025-10-26):**
- `mcp4_create_scene(projectPath="/Users/schwenderone/agent-game", scenePath="scenes/ToolTest.tscn", rootNodeType="Node2D")`
- `mcp4_add_node(..., nodeType="Sprite2D", nodeName="Marker")`
- `mcp4_load_sprite(nodePath="root/Marker", texturePath="icon.svg")`
- `mcp4_run_project` → `mcp4_get_debug_output` → `mcp4_stop_project`
- `mcp4_export_mesh_library(scenePath="scenes/MeshScene.tscn", outputPath="res://MeshScene.res")`

---

## Template (for future servers)

### <Server Name>
**Config (verified):**
- Client(s): <Cursor/Claude/Windsurf>
- Enablement steps: <exact>
- Config snippet(s):
```json
{
  "mcpServers": {
    "<id>": {
      "command": "<cmd>",
      "args": ["<args>"]
    }
  }
}
```

**Capabilities:** <tools + params + sample calls>

**Limits & Safety:** <rate, scopes, sandbox>

**Common failures:** <symptom → fix>

**Test battery:** <N calls with expected outputs>
