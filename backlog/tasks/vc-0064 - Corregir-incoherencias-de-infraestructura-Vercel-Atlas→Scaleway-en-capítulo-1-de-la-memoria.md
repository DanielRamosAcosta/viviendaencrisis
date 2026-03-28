---
id: VC-0064
title: >-
  Corregir incoherencias de infraestructura (Vercel/Atlas→Scaleway) en capítulo
  1 de la memoria
status: In Review
assignee: []
created_date: '2026-03-28 13:37'
updated_date: '2026-03-28 13:38'
labels:
  - refined
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Corregir todas las menciones erróneas de infraestructura en los ficheros del capítulo 1 de la memoria (docs/memory/content/01_introduccion/).\n\nIncoherencias encontradas:\n1. `05_planificacion_del_trabajo.typ` línea 58: "Vercel" → "Scaleway"\n2. `05_planificacion_del_trabajo.typ` línea 42: "MongoDB Atlas" → "MongoDB (Scaleway)"\n3. `04_enfoque_y_metodo_seguido.typ` línea 81: "MongoDB Atlas" → "MongoDB (Scaleway Managed Database)"\n4. `02_objetivos_del_trabajo.typ` línea 5: menciona "Vercel" en la descripción del stack\n\nStack correcto:\n- Frontend: Scaleway Serverless Containers (Next.js)\n- Backend: Scaleway Serverless Functions (Hono)\n- BD: MongoDB (Scaleway Managed Database)\n- CI/CD: GitHub Actions\n- Vercel fue descartado por razones de sostenibilidad (usa AWS por debajo)
<!-- SECTION:DESCRIPTION:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Se corrigieron cuatro incoherencias de infraestructura en el capítulo 1 de la memoria:\n\n1. `05_planificacion_del_trabajo.typ` línea 42: `[MongoDB Atlas]` → `[MongoDB (Scaleway)]` en la tabla de recursos necesarios.\n2. `05_planificacion_del_trabajo.typ` línea 58-59: `[Vercel]` + "Despliegue del frontend con soporte nativo para Next.js." → `[Scaleway]` + "Hospedaje _serverless_ del frontend y la API con energía 100% renovable."\n3. `04_enfoque_y_metodo_seguido.typ` línea 81: "MongoDB Atlas" → "MongoDB sobre la infraestructura gestionada de Scaleway (_Scaleway Managed Database_)", añadiendo referencia explícita a los compromisos de sostenibilidad de la sección 1.3.\n4. `02_objetivos_del_trabajo.typ` línea 5: "Docker, GitHub Actions y Vercel" → "Docker, GitHub Actions y Scaleway".\n\nNota: la mención de "Cloudflare Workers" en `04_enfoque_y_metodo_seguido.typ` se ha conservado porque describe los entornos de ejecución compatibles con el framework Hono (información técnica del framework), no el stack de despliegue del proyecto.\n\nCompilación verificada sin errores (`npm run build:docs`).
<!-- SECTION:FINAL_SUMMARY:END -->
