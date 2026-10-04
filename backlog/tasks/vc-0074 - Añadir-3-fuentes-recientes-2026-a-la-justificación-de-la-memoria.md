---
id: VC-0074
title: Añadir 3 fuentes recientes (2026) a la justificación de la memoria
status: In Review
assignee: []
created_date: '2026-10-04 16:43'
updated_date: '2026-10-04 16:56'
labels:
  - refined
  - docs
  - memoria
dependencies: []
modified_files:
  - docs/memory/refs/references.bib
  - >-
    docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ
priority: medium
type: docs
ordinal: 42000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Incorporar a la justificación/contexto de la memoria del TFM (docs/memory/) tres fuentes recientes de 2026 que refuerzan la tesis del trabajo y no estaban citadas:

1. **Banco de España — Informe Anual 2025** (publicado jun. 2026): actualiza el diagnóstico de accesibilidad; precios reales de compra, alquiler en máximos e inelasticidad de la oferta como causa principal.
2. **OCDE — Tackling the affordability gap through increased supply of affordable and social housing** (2026): nuevo organismo internacional; déficit de vivienda social en España (<2% vs ~7% media OCDE) y crítica a las políticas actuales.
3. **SERPAVI (MIVAU) + Registro Único de Arrendamientos (RD 1312/2024)**: muy relevante para el objeto del TFM (transparencia y datos abiertos de vivienda); sirve de apoyo y de referente institucional frente al que posicionar la aportación diferencial del proyecto.

Cada cifra debe verificarse contra la fuente original con el agente source-verifier antes de citarse, y la redacción debe hacerse con el agente tfm-memory-writer. Añadir las entradas BibTeX correspondientes a references.bib.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Las 3 fuentes están citadas en la sección de justificación/contexto de la memoria con sus cifras clave
- [ ] #2 Cada cifra citada ha sido verificada contra la fuente original (source-verifier) y marcada como verificada
- [ ] #3 Las entradas BibTeX de las 3 fuentes están añadidas a references.bib con metadatos correctos
- [ ] #4 La redacción integra las fuentes en la narrativa existente sin duplicar datos ya citados, manteniendo el estilo académico de la memoria
<!-- AC:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Se añaden 5 entradas BibTeX a `references.bib` (bde_informe_anual_2025, oecd_affordability_gap_2026, mivau_serpavi, rd_1312_2024, resolucion_serpavi_2026) y se integran en 4 puntos del archivo `01_contexto_y_justificacion_del_trabajo.typ`: (1) párrafo de precios de compra con datos de BdE 2025 (+9,7% real, +12,7% nominal, elasticidad oferta 0,45); (2) párrafo de vivienda social con OCDE (~1% vs 7% media OCDE, 1,5M unidades necesarias); (3) sustitución del déficit de 600.000 (doc. 2432) por el dato actualizado de 750.000 viviendas (BdE Informe Anual 2025, 2021-2025); (4) nuevo párrafo sobre avances institucionales (SERPAVI 2026, RD 1312/2024, Resolución 2026) posicionado como apoyo a la justificación del proyecto. La compilación con `typst compile docs/memory/main.typ` termina sin errores.
<!-- SECTION:FINAL_SUMMARY:END -->
