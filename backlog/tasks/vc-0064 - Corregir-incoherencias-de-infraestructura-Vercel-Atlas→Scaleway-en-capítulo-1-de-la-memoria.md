---
id: VC-0064
title: >-
  Corregir incoherencias de infraestructura (Vercel/Atlas→Scaleway) en capítulo
  1 de la memoria
status: In Progress
assignee: []
created_date: '2026-03-28 13:37'
labels:
  - refined
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Corregir todas las menciones erróneas de infraestructura en los ficheros del capítulo 1 de la memoria (docs/memory/content/01_introduccion/).\n\nIncoherencias encontradas:\n1. `05_planificacion_del_trabajo.typ` línea 58: "Vercel" → "Scaleway"\n2. `05_planificacion_del_trabajo.typ` línea 42: "MongoDB Atlas" → "MongoDB (Scaleway)"\n3. `04_enfoque_y_metodo_seguido.typ` línea 81: "MongoDB Atlas" → "MongoDB (Scaleway Managed Database)"\n4. `02_objetivos_del_trabajo.typ` línea 5: menciona "Vercel" en la descripción del stack\n\nStack correcto:\n- Frontend: Scaleway Serverless Containers (Next.js)\n- Backend: Scaleway Serverless Functions (Hono)\n- BD: MongoDB (Scaleway Managed Database)\n- CI/CD: GitHub Actions\n- Vercel fue descartado por razones de sostenibilidad (usa AWS por debajo)
<!-- SECTION:DESCRIPTION:END -->
