---
id: doc-0001
title: 'Decisión: Ciclo de vida de tareas (Done → Complete → Archive)'
type: other
created_date: '2026-03-14 20:41'
---
## Decisión de gestión del backlog (2026-03-14)

### Contexto
Al acumular tareas en estado "Done" en el backlog activo, se genera ruido visual que dificulta la priorización del trabajo pendiente.

### Decisión
Se establece la siguiente convención para el ciclo de vida de las tareas:

1. **Done** → La tarea está completada pero permanece visible en el backlog activo. Útil para referencia reciente y trazabilidad dentro del milestone en curso.
2. **Complete** (`task_complete`) → Al cerrar un milestone (entregar una PEC), todas las tareas Done de ese milestone se mueven a `backlog/completed/`. Salen del backlog activo pero conservan toda su información.
3. **Archive** (`task_archive`) → Para tareas que se cancelan, descartan o quedan obsoletas sin haberse completado. Se mueven a `backlog/archive/tasks/`.

### Regla práctica
> **Al entregar una PEC, completar todas las tareas Done del milestone correspondiente.**

### Primera aplicación
- Milestone **m-0 (P1)**: 13 tareas movidas a `completed/` el 2026-03-14.
  - VC-0001 a VC-0012 + VC-0004.03
