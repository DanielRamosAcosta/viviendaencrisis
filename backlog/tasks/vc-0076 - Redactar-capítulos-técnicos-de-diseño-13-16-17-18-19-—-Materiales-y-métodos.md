---
id: VC-0076
title: >-
  Redactar capítulos técnicos de diseño (13, 16, 17, 18, 19) — Materiales y
  métodos
status: In Progress
assignee: []
created_date: '2026-11-01 14:52'
labels:
  - unrefined
  - memoria
  - P2
dependencies: []
modified_files:
  - docs/memory/content/02_materiales_y_metodos/13_metodologia_xp.typ
  - docs/memory/content/02_materiales_y_metodos/16_accesibilidad_tecnica.typ
  - docs/memory/content/02_materiales_y_metodos/17_estrategia_de_testing.typ
  - docs/memory/content/02_materiales_y_metodos/18_seguridad_y_autenticacion.typ
  - >-
    docs/memory/content/02_materiales_y_metodos/19_despliegue_e_infraestructura.typ
priority: high
type: docs
ordinal: 44000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Redactar los cinco capítulos técnicos del bloque "Materiales y métodos" de la memoria del TFM a nivel de diseño (decisiones previstas, no implementación). Incluye: metodología XP/ágil (13), accesibilidad técnica WCAG 2.1 AA (16), estrategia de testing con pirámide de tests (17), seguridad y autenticación JWT/OWASP (18), y despliegue e infraestructura en Scaleway (19).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Los cinco ficheros .typ están redactados en prosa académica en español, sin placeholders // TODO
- [ ] #2 Compilación `typst compile docs/memory/main.typ` sin errores
- [ ] #3 Todas las citas usan claves existentes del .bib o están marcadas como pendientes en el informe final
- [ ] #4 Los labels <sec:...> existentes en los placeholders se preservan
- [ ] #5 La figura infrastructure.png está referenciada correctamente con <fig:infrastructure>
<!-- AC:END -->
