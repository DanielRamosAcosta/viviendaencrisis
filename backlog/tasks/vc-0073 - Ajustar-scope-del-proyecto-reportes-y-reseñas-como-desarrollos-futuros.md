---
id: VC-0073
title: 'Ajustar scope del proyecto: reportes y reseñas como desarrollos futuros'
status: In Progress
assignee: []
created_date: '2026-10-04 16:17'
labels:
  - refined
dependencies: []
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
