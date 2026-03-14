---
name: Backlog.md MCP capabilities (v1.40.0)
description: Available MCP tools and known limitations of Backlog.md as of v1.40.0
type: project
---

**Version:** 1.40.0 (installed globally via fnm/Node, command: `backlog`)

**Available tools:**
- Tasks: create, edit, list, search, view, archive, complete
- Milestones: add, list, rename, remove, archive
- Documents: create, list, view, update, search (NEW in v1.40)
- DoD defaults: get, upsert (NEW in v1.40)
- Guides: workflow overview, task creation/execution/finalization guides

**Known limitations:**
- NO task reordering/sorting via MCP (feature requested: https://github.com/MrLesk/Backlog.md/issues/562 — maintainer confirmed ordering exists in web UI, needs MCP wiring)
- Priority field (high/medium/low) is the only ordering mechanism available via MCP

**Why:** Knowing the tool boundaries prevents wasted effort trying unsupported operations.

**How to apply:** For prioritization, use the `priority` field and milestone assignment. For fine-grained ordering, note the limitation and suggest workarounds (e.g., dependency chains, notes).
