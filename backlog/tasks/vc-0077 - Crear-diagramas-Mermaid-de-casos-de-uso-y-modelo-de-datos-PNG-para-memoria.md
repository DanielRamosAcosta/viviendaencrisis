---
id: VC-0077
title: Crear diagramas Mermaid de casos de uso y modelo de datos (PNG para memoria)
status: In Progress
assignee: []
created_date: '2026-11-01 14:53'
labels:
  - docs
  - refined
  - diagrams
milestone: m-1
dependencies: []
ordinal: 45000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Crear dos diagramas Mermaid nuevos y exportarlos a PNG para la memoria del TFM (PEC2):

1. docs/diagrams/use-cases/use-cases.mmd — diagrama UML de casos de uso (flowchart LR) con los 3 actores (Visitante anónimo, Usuario registrado, Administrador), casos del MVP/núcleo y casos de ampliación futura opcional (reportes y reseñas) en subgraphs separados. El administrador hereda casos del usuario registrado. Dependencia de login (<<include>>) donde aplique.

2. docs/diagrams/architecture/data-model.mmd — diagrama entidad-relación (erDiagram) de MongoDB. Colecciones: users (role user/admin), geodata (geoespacial), price_series; reports y reviews marcadas como ampliación futura opcional. Atributos clave, PK/FK, índices (geoespacial 2dsphere), relaciones con cardinalidad. Basado en VC-0016.

3. Exportar ambos a PNG siguiendo convención del repo (escala alta, ~1568px ancho) con mmdc.
4. Copiar los PNG a docs/memory/images/ como use-cases.png y data-model.png.

No editar ficheros .typ ni .bib.
<!-- SECTION:DESCRIPTION:END -->
