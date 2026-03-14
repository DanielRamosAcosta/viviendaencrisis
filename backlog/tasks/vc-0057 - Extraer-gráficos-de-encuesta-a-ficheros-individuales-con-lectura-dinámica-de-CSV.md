---
id: VC-0057
title: >-
  Extraer gráficos de encuesta a ficheros individuales con lectura dinámica de
  CSV
status: In Progress
assignee: []
created_date: '2026-03-14 19:40'
labels:
  - docs
  - refactor
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Refactorizar los 24 gráficos de encuesta (actualmente hardcoded en 03_encuesta_resultados.typ y 04_estudio_publico_objetivo.typ) a ficheros individuales bajo `docs/memory/content/99_charts/form-results/` que lean dinámicamente del CSV `formulario-limpio.csv`. Incluye crear `_helpers.typ` con funciones compartidas de conteo.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 24 ficheros de gráficos individuales en 99_charts/form-results/
- [ ] #2 _helpers.typ con funciones load-rows, count-single, count-multi, shorten-labels
- [ ] #3 03_encuesta_resultados.typ usa #include en lugar de charts inline
- [ ] #4 04_estudio_publico_objetivo.typ lee del CSV para P5, P8, P11, P19
- [ ] #5 typst compile sin errores
- [ ] #6 Datos visualmente consistentes con la versión anterior
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->
