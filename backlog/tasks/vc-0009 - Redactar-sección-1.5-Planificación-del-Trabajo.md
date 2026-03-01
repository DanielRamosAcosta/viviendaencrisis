---
id: VC-0009
title: 'Redactar sección 1.5: Planificación del Trabajo'
status: In Progress
assignee: []
created_date: '2026-02-26 21:26'
updated_date: '2026-03-01 18:54'
labels: []
milestone: m-0
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Elaborar la planificación detallada del TFM incluyendo:\n- Desglose de tareas por PEC (P1 a P4 + Defensa)\n- Diagrama de Gantt con temporización\n- Identificación de hitos principales\n- Análisis de riesgos y alternativas\n- Priorización vertical de tareas\n\nFechas clave: P1 (01/03), P2 (29/03), P3 (26/04), P4 (entrega final), Defensa (08-19/06/2026). Dedicación estimada: P1=28h, P2=70h, P3=70h, P4+Defensa=40h.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Párrafos introductorios describen las 5 fases (P1-P5) con fechas y propósito
- [ ] #2 Hitos y entregables de cada PEC identificados explícitamente
- [ ] #3 Diagrama de Gantt resumen incluido (ya existente)
- [ ] #4 Subsección === Recursos necesarios con tabla categorizada (frontend, backend, infra, datos, dev tools)
- [ ] #5 Subsección === Estimación del esfuerzo con tabla (Fase, Periodo, Horas, Entregables)
- [ ] #6 Subsección === Priorización y dependencias con criterio MVP-first y referencia a @anexo:gantt-detallado
- [ ] #7 Subsección === Análisis de riesgos con tabla (Riesgo, Probabilidad, Impacto, Plan de contingencia) — mín. 5 riesgos
- [ ] #8 Estilo de tablas consistente con 04_enfoque_y_metodo_seguido.typ (stroke, fill, figure+caption)
- [ ] #9 Prosa formal impersonal en español académico
- [ ] #10 Compila sin errores con npm run build:docs
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
## Estructura del fichero final

```
== Planificación del Trabajo <sec:planificacion>

[Párrafo 1: 5 fases/PECs con fechas y propósito]
[Párrafo 2: Hitos y entregables]

#include "../99_charts/gantt-planificacion-resumen.typ"

=== Recursos necesarios
[Tabla ~14 filas: frontend, backend, infra, datos, dev tools]

=== Estimación del esfuerzo
[Tabla: P1=28h, P2=70h, P3=70h, P4+P5=40h → ~208h]

=== Priorización y dependencias
[~3 frases: MVP-first, dependencias bloqueantes, jerarquía de descarte]

=== Análisis de riesgos y planes de contingencia
[Tabla 5 filas: fuentes datos, complejidad, disponibilidad, libs, alcance]
```

## Fichero a modificar
`docs/memory/content/01_introduccion/05_planificacion_del_trabajo.typ`

## Estilo
- Referencia: `04_enfoque_y_metodo_seguido.typ`
- Tablas con stroke, fill alternado, figure+caption+label
- Prosa formal impersonal

## Verificación
1. `npm run build:docs` sin errores
2. Revisar PDF: tablas, cross-refs, cobertura de 9 requisitos
<!-- SECTION:PLAN:END -->
