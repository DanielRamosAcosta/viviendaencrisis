---
id: VC-0065
title: >-
  docs(memoria): reestructurar sección 1.5 Planificación del trabajo con tabla
  detallada de fases
status: In Review
assignee: []
created_date: '2026-03-28 13:49'
updated_date: '2026-03-28 13:50'
labels:
  - refined
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
El profesor indica que la información de la sección 1.5 está demasiado concentrada en bloques de texto. Se solicita reestructurar con una presentación más esquemática y con mayor detalle en los hitos.\n\nCambios a realizar:\n1. Reemplazar los dos párrafos de prosa iniciales por una frase introductoria breve + tabla detallada de fases (con hitos como bullet points y entregables en negrita)\n2. Eliminar la subsección \"Estimación del esfuerzo\" (su contenido queda absorbido por la nueva tabla)\n3. Mantener sin cambios: include del Gantt, Recursos necesarios, Priorización y dependencias, Análisis de riesgos
<!-- SECTION:DESCRIPTION:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Reestructurada la sección 1.5 del fichero `docs/memory/content/01_introduccion/05_planificacion_del_trabajo.typ`:\n\n- Reemplazados los dos párrafos de prosa inicial por una frase introductoria breve + tabla `<tabla:fases-planificacion>` con 4 columnas (Fase, Periodo, Horas, Hitos y entregables). Los hitos se presentan como listas `#list(...)` dentro de las celdas y los entregables en negrita.\n- Eliminada completamente la subsección `=== Estimación del esfuerzo` y su tabla `<tabla:estimacion-esfuerzo>`.\n- Mantenidas sin cambios: Recursos necesarios, Priorización y dependencias, Análisis de riesgos, e include del Gantt.\n- Compilación verificada sin errores con `npm run build:docs`.
<!-- SECTION:FINAL_SUMMARY:END -->
