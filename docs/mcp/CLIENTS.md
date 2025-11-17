# MCP Clients — Placeholder

> Track which client UIs are in use and how they’re configured. Fill exact versions and toggles.

## Clients
- **Cursor / Codex** — version; MCP enablement path; config file location
- **Claude Desktop / Claude Code** — version; local servers enablement; prompt/guardrail notes
- **Windsurf (Cascade)** — version; plugin path; mcp_config file location

## Common toggles & pitfalls
- **Rate limits & retries:** set sane defaults per client
- **FS scopes:** ensure read/write paths are limited to the repo
- **Tool visibility:** confirm that all intended servers are visible and callable from each client
- **Prompt wrapping:** some clients wrap user/system prompts — note any gotchas

## Verification checklist (per client)
- [ ] List servers → expected set visible
- [ ] Run Godot scene → debugger log captured
- [ ] File read/write → constrained to repo
- [ ] Search docs → citations pasted to log

> This page will be updated alongside the MCP audit.
