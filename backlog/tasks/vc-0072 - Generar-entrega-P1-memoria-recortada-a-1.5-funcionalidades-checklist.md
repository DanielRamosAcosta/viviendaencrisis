---
id: VC-0072
title: Generar entrega P1 (memoria recortada a 1.5 + funcionalidades + checklist)
status: In Progress
assignee: []
created_date: '2026-10-04 16:00'
labels:
  - refined
milestone: m-0
dependencies: []
priority: high
ordinal: 40000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Producir los PDF de la entrega P1 del nuevo semestre reutilizando la memoria ya escrita. La memoria se recorta para dejar contenido solo hasta la sección 1.5 (incluida) y el resto de apartados (1.6 en adelante y capítulos 2-7 + anexos) quedan como títulos sin cuerpo, de modo que el índice siga completo. Se compila en una rama desechable (p1-entrega) y main queda intacto para restaurar luego.

Entregables P1:
1. Memoria PDF (secciones 0, 1.1-1.5 + índice completo) -> PEC1_mem_Ramos_Acosta_Daniel.pdf
2. Documento de funcionalidades PDF (docs/features) -> PAC1_rec_Ramos_Acosta_Daniel_funcionalidades.pdf
3. Checklist (docs/checklist_es.md) validado por el tutor
4. ZIP PEC1_Ramos_Acosta_Daniel.zip
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 La memoria compila sin errores con contenido solo hasta 1.5 y el resto como títulos vacíos
- [ ] #2 El índice (outline) sigue mostrando todos los apartados planificados
- [ ] #3 Referencias cruzadas rotas hacia secciones vaciadas neutralizadas
- [ ] #4 Memoria y funcionalidades compiladas a PDF con nomenclatura del enunciado
- [ ] #5 ZIP de entrega generado
- [ ] #6 main queda intacto (trabajo en rama p1-entrega)
<!-- AC:END -->
