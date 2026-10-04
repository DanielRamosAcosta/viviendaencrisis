---
id: VC-0074
title: Añadir 3 fuentes recientes (2026) a la justificación de la memoria
status: In Progress
assignee: []
created_date: '2026-10-04 16:43'
labels:
  - refined
  - docs
  - memoria
dependencies: []
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
