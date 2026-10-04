---
id: VC-0073
title: 'Ajustar scope del proyecto: reportes y reseñas como desarrollos futuros'
status: Done
assignee: []
created_date: '2026-10-04 16:17'
updated_date: '2026-10-04 17:14'
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
- [x] #1 Documento de funcionalidades separa Núcleo vs Desarrollos futuros, con reportes y reseñas en futuros
- [x] #2 Objetivo general y específicos de 1.2 no presentan reportes/reseñas como núcleo
- [x] #3 Planificación 1.5 y Gantt del curso solo incluyen el núcleo; jerarquía de descarte actualizada
- [x] #4 Líneas de trabajo futuro (4.2) documentan reportes y reseñas
- [x] #5 Memoria compila sin errores tras los cambios
<!-- AC:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Scope realineado con el feedback del consultor (núcleo = precios + usuarios + administración; reportes y reseñas a desarrollos futuros). Cambios en main (sin commitear):

- docs/features/content.typ: reestructurado en "Núcleo funcional (MVP)" vs "Desarrollos futuros (opcionales)"; reportes marcado como el de mayor coste; corregidas incoherencias de rol usuario registrado, acceso a datos y métricas del panel admin.
- Memoria 1.2 (02_objetivos): objetivo general reenfocado (usuarios+admin en el núcleo, participación ciudadana opcional); nuevo objetivo específico de núcleo para gestión de usuarios/admin; nuevo bloque "Objetivos opcionales" con reportes (mayor coste) y reseñas.
- Memoria 1.5 (05_planificacion): tabla de fases P3/P4 sin reportes/reseñas; priorización reescrita (MVP comprometido); jerarquía de descarte reportes > reseñas > indicadores > visualizaciones; riesgo de alcance actualizado.
- Memoria 4.2 (02_lineas_de_trabajo_futuro): documentadas 5 líneas futuras (reportes con moderación, reseñas, indicadores, ampliación de datos, i18n).
- Gantt (gantt-planificacion.yaml): eliminadas 5 subtareas de reportes/reseñas del calendario del curso.
- CLAUDE.md: funcionalidades en núcleo vs desarrollos futuros.
- Backlog: VC-0025/0026/0031/0032/0033 etiquetadas opcional/futuro (LOW), sin borrar.

La memoria y el documento de funcionalidades compilan sin errores.
<!-- SECTION:FINAL_SUMMARY:END -->
