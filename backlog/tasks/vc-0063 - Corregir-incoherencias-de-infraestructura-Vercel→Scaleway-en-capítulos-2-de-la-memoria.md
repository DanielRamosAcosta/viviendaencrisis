---
id: VC-0063
title: >-
  Corregir incoherencias de infraestructura (Vercel→Scaleway) en capítulos 2+ de
  la memoria
status: In Review
assignee: []
created_date: '2026-03-28 13:37'
updated_date: '2026-03-28 13:38'
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

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Se revisaron todos los ficheros .typ en docs/memory/content/ en busca de menciones erróneas a Vercel, AWS y Cloudflare Workers como tecnologías de despliegue del proyecto.

Correcciones aplicadas:
- `02_materiales_y_metodos/19_despliegue_e_infraestructura.typ`: comentario TODO actualizado de "despliegue del frontend en Vercel" a "Scaleway Serverless Containers (Next.js) y Scaleway Serverless Functions (Hono) y Scaleway Managed Database (MongoDB)".
- `01_introduccion/05_planificacion_del_trabajo.typ`: fila de la tabla de recursos corregida de [Vercel] / "soporte nativo para Next.js" a [Scaleway Serverless Containers] con descripción correcta del stack serverless y credenciales ambientales. (Ya había sido corregida previamente en una sesión anterior.)
- `01_introduccion/02_objetivos_del_trabajo.typ`: referencia a "Docker, GitHub Actions y Vercel" corregida a "Docker, GitHub Actions y Scaleway". (Ya había sido corregida previamente en una sesión anterior.)

Menciones de AWS y Cloudflare Workers encontradas y CONSERVADAS intencionalmente:
- `03_impacto_en_sostenibilidad.typ`: AWS como infraestructura de Anthropic/Claude (huella de IA generativa) — contexto correcto.
- `04_enfoque_y_metodo_seguido.typ`: Cloudflare Workers como ejemplo de entorno de ejecución compatible con Hono (hecho técnico, no afirmación sobre el stack elegido) — contexto correcto.

Compilación: `npm run build:docs` — sin errores.
<!-- SECTION:FINAL_SUMMARY:END -->
