---
id: VC-0063
title: >-
  Corregir incoherencias de infraestructura (Vercel→Scaleway) en capítulos 2+ de
  la memoria
status: In Progress
assignee: []
created_date: '2026-03-28 13:37'
labels:
  - unrefined
  - docs
  - memoria
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
El stack de despliegue correcto del proyecto es Scaleway (Serverless Containers para el frontend Next.js, Serverless Functions para el backend Hono, Managed Database para MongoDB). Vercel fue descartado por razones de sostenibilidad (usa AWS por debajo). Sin embargo, existen menciones incorrectas a Vercel, AWS, Cloudflare Workers u otras tecnologías de despliegue en los ficheros de la memoria a partir del capítulo 2.\n\nSe debe buscar y corregir cualquier referencia errónea en:\n- docs/memory/content/02_materiales_y_metodos/\n- docs/memory/content/03_resultados/\n- docs/memory/content/04_conclusiones/\n- docs/memory/content/05_glosario/\n- docs/memory/content/00_inicio/\n- Otros directorios relevantes
<!-- SECTION:DESCRIPTION:END -->
