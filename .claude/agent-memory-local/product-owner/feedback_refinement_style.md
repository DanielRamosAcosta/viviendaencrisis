---
name: Refinement style and task structure preferences
description: How the user prefers tasks to be refined, including subagent orchestration and Teams usage
type: feedback
---

The user prefers detailed task descriptions that include:
1. **TLDR** as first line of description
2. **Criterios funcionales** numbered and bolded
3. **Orquestacion con Teams** section when a task is complex enough to warrant multiple agents — specify team name, agent names/types/roles, and internal task flow with dependencies and parallelism
4. **Notas tecnicas** with relevant file paths, data formats, and gotchas

**Why:** The user works heavily with Claude Code agents and wants tasks to be self-contained blueprints that an executing agent can follow without ambiguity.

**How to apply:** During refinement, if the task involves analysis + writing or multiple distinct workstreams, proactively suggest a Teams orchestration plan with named agents and a task dependency graph.
