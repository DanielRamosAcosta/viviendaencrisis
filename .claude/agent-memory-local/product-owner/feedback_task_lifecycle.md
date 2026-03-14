---
name: Task lifecycle convention (Done → Complete → Archive) and refinement labels
description: Convention for task lifecycle, complete vs archive, and refinement via labels instead of status
type: feedback
---

## Refinement via labels (not status)

Tasks are born with label `unrefined`. When the PO finishes refining a task with the user, change the label to `refined`. There is NO "Refinement" status — refinement state is tracked via labels only.

- **unrefined** = task needs refinement (default label on creation)
- **refined** = task has been refined and approved by the user

## Lifecycle: Done → Complete → Archive

When closing a milestone (delivering a PEC), move all Done tasks from that milestone to `completed/` using `task_complete`.

- **Done** = tarea terminada, visible en backlog activo (referencia durante el milestone en curso)
- **Complete** (`task_complete`) = tarea terminada movida a `backlog/completed/` al cerrar el milestone
- **Archive** (`task_archive`) = tareas canceladas, descartadas u obsoletas que NO se completaron. Van a `backlog/archive/tasks/`

**Why:** Backlog.md distingue entre complete y archive. `task_archive` rechaza tareas en estado Done (hay que usar `task_complete`). Refinement as a status blocked the workflow — a task can be "To Do" and still be undergoing refinement. Labels decouple these concerns.

**How to apply:**
- Al crear tareas: siempre incluir label `unrefined`
- Al terminar refinamiento: cambiar label a `refined`
- Al entregar cada PEC: ejecutar `task_complete` para todas las tareas Done del milestone correspondiente
- Documentado en doc-0001 del backlog
