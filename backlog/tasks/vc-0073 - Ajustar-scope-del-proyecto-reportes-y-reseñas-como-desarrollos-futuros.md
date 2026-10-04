---
id: VC-0073
title: 'Ajustar scope del proyecto: reportes y reseñas como desarrollos futuros'
status: In Review
assignee: []
created_date: '2026-10-04 16:17'
updated_date: '2026-10-04 16:21'
labels:
  - refined
dependencies: []
modified_files:
  - docs/memory/content/01_introduccion/02_objetivos_del_trabajo.typ
  - docs/memory/content/01_introduccion/05_planificacion_del_trabajo.typ
  - docs/memory/content/04_conclusiones/02_lineas_de_trabajo_futuro.typ
priority: high
ordinal: 41000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Realinear la documentación del proyecto con el feedback del consultor sobre la P1: el núcleo funcional (MVP) es la evolución de precios de vivienda, la gestión de usuarios y la administración de la aplicación. Los reportes ciudadanos y las reseñas inmobiliarias pasan a desarrollos futuros/opcionales (se implementarán si hay tiempo), siendo reportes el principal candidato a posponer por su coste.

Cambios:
- docs/features/content.typ: reestructurar en Núcleo (imprescindible) vs Desarrollos futuros (opcionales).
- Memoria 1.2 Objetivos: reenfocar objetivo general y degradar el objetivo de reportes a opcional/ampliación.
- Memoria 1.5 Planificación: tabla de fases y priorización (jerarquía de descarte: reportes > reseñas > indicadores). Gantt del curso solo núcleo.
- Memoria 4.2 Líneas de trabajo futuro: sembrar reportes/reseñas como trabajo futuro.
- Gantt (yaml): eliminar subtareas de reportes y reseñas del calendario del curso.
- CLAUDE.md: ajustar lista de funcionalidades core.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Documento de funcionalidades separa Núcleo vs Desarrollos futuros, con reportes y reseñas en futuros
- [ ] #2 Objetivo general y específicos de 1.2 no presentan reportes/reseñas como núcleo
- [ ] #3 Planificación 1.5 y Gantt del curso solo incluyen el núcleo; jerarquía de descarte actualizada
- [ ] #4 Líneas de trabajo futuro (4.2) documentan reportes y reseñas
- [ ] #5 Memoria compila sin errores tras los cambios
<!-- AC:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Se han editado tres ficheros de la memoria para alinear el alcance del proyecto con el feedback del consultor (P1): reportes ciudadanos y reseñas quedan fuera del núcleo comprometido y se documentan como desarrollos futuros.\n\n**02_objetivos_del_trabajo.typ**: El objetivo general se reenfocó para incluir explícitamente la gestión de usuarios/administración como parte del núcleo, y se añadió una cláusula de carácter opcional para la participación ciudadana. Se añadió un objetivo específico de núcleo nuevo (gestión de usuarios y administración con JWT + roles + panel admin). El objetivo de reportes ciudadanos se reubicó en un nuevo bloque «Objetivos opcionales (supeditados a la disponibilidad de tiempo)» junto con las reseñas inmobiliarias.\n\n**05_planificacion_del_trabajo.typ**: Tabla de fases: P3 elimina «Sistema de reportes ciudadanos» y ajusta el entregable; P4 añade «Panel de administración y gestión de usuarios», «Revisión de seguridad (OWASP Top 10)» y «Pulido de UI/UX». Sección «Priorización y dependencias» reescrita para definir el MVP comprometido (precios + usuarios + administración) y declarar reportes/reseñas fuera del alcance del curso. Jerarquía de descarte actualizada: reportes > reseñas > indicadores derivados > visualizaciones complementarias. Tabla de riesgos: última fila actualizada con la misma jerarquía.\n\n**02_lineas_de_trabajo_futuro.typ**: Placeholder reemplazado con cinco líneas de trabajo futuro: sistema de reportes ciudadanos (con nota sobre su coste y la decisión de posposición), sistema de reseñas inmobiliarias, indicadores estadísticos derivados, ampliación de fuentes de datos, e internacionalización lingüística.
<!-- SECTION:FINAL_SUMMARY:END -->
