---
name: Backlog.md MCP capabilities
description: Available MCP tools including native ordinal ordering support
type: project
---

**Available tools:**
- Tasks: create, edit, list, search, view, archive, complete
- Milestones: add, list, rename, remove, archive
- Documents: create, list, view, update, search
- DoD defaults: get, upsert
- Guides: workflow overview, task creation/execution/finalization guides

**Native ordering:** The `ordinal` field is supported in `task_create` and `task_edit`. `task_list` returns tasks sorted by ordinal. Convention: use spaced integers (1000, 2000, 3000) to leave room for inserts.

**Why:** Knowing the tool boundaries prevents wasted effort trying unsupported operations.

**How to apply:** Use `ordinal` for fine-grained task ordering. No external scripts needed — ordering is fully native in the MCP.
