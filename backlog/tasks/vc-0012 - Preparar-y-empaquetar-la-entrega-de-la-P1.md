---
id: VC-0012
title: Preparar y empaquetar la entrega de la P1
status: In Progress
assignee: []
created_date: '2026-02-27 18:45'
updated_date: '2026-03-01 19:46'
labels: []
milestone: m-0
dependencies:
  - VC-0004
  - VC-0005
  - VC-0006
  - VC-0007
  - VC-0008
  - VC-0009
  - VC-0010
  - VC-0011
priority: high
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Compilar los documentos a PDF, renombrarlos según la nomenclatura del enunciado y empaquetarlos en un ZIP para la entrega.

**Pasos:**

1. Compilar la memoria (`docs/main.typ`) a PDF
2. Compilar el documento de funcionalidades a PDF
3. Renombrar los ficheros según nomenclatura del enunciado:
   - Memoria → `PEC1_mem_Apellidos_Nombre.pdf`
   - Documento de funcionalidades → `PAC1_rec_Apellidos_Nombre.pdf`
   - Checklist → `PAC1_rec_Apellidos_Nombre` (el de la checklist, con nombre distinto o sufijo)
   - Apuntes para evaluar → `PAC1_rec_Apellidos_Nombre` (idem)
4. Comprimir todo en un ZIP: `PEC1_Apellidos_Nombre.zip` con dos directorios (documentación y proyecto)

**Ficheros a incluir en el ZIP:**
- `PEC1_mem_Apellidos_Nombre.pdf` — Memoria compilada
- `PAC1_rec_Apellidos_Nombre_funcionalidades.pdf` — Documento de funcionalidades
- `PAC1_rec_Apellidos_Nombre_checklist.md` — Checklist con todo marcado (`docs/checklist_es.md`)
- `PAC1_rec_Apellidos_Nombre_apuntes.md` — Notas para evaluar (`docs/APUNTES_PARA_EVALUAR.md`)

**Nomenclatura (del enunciado P1):**
- Memoria: `PEC1_mem_Apellidos_Nombre` (PDF)
- Otros documentos/materiales: `PAC1_rec_Apellidos_Nombre`
- ZIP: `PEC1_Apellidos_Nombre` con contenidos en dos directorios: documentación y proyecto
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Memoria compilada a PDF sin errores
- [ ] #2 Documento de funcionalidades compilado a PDF sin errores
- [ ] #3 Todos los ficheros renombrados según nomenclatura del enunciado P1
- [ ] #4 ZIP generado con los 4 ficheros: memoria PDF, funcionalidades PDF, checklist MD, apuntes MD
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->
