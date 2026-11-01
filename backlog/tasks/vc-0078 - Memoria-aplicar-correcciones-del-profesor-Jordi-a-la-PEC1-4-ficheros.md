---
id: VC-0078
title: 'Memoria: aplicar correcciones del profesor Jordi a la PEC1 (4 ficheros)'
status: In Review
assignee: []
created_date: '2026-11-01 14:54'
updated_date: '2026-11-01 15:00'
labels:
  - refined
dependencies: []
modified_files:
  - docs/memory/content/00_inicio/01_ficha.typ
  - >-
    docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ
  - docs/memory/content/01_introduccion/03_impacto_en_sostenibilidad.typ
  - docs/memory/content/01_introduccion/04_enfoque_y_metodo_seguido.typ
  - docs/memory/content/02_materiales_y_metodos/14_diseno_de_la_arquitectura.typ
  - >-
    docs/memory/content/02_materiales_y_metodos/19_despliegue_e_infraestructura.typ
priority: high
type: docs
ordinal: 46000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Aplicar las 6 correcciones del profesor Jordi (PEC1_correcciones.md) a los 4 ficheros Typst de la introducción:\n1. 01_ficha.typ — redactar Resumen (≤250 palabras) y Abstract en inglés\n2. 01_contexto_y_justificacion_del_trabajo.typ — condensar alquiler turístico/financiarización; mover comparativa detallada de plataformas a @sec:benchmarking\n3. 03_impacto_en_sostenibilidad.typ — resumir sección IA ambiental; reportes ciudadanos → ampliación futura opcional\n4. 04_enfoque_y_metodo_seguido.typ — condensar explicaciones de tecnologías; reorientar justificación del desarrollo propio hacia núcleo MVP
<!-- SECTION:DESCRIPTION:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Se aplicaron las correcciones del profesor Jordi a los 4 ficheros indicados:\n\n1. **01_ficha.typ**: Redactados Resumen (español, ~248 palabras) y Abstract (inglés, ~212 palabras) en las celdas de la tabla. Ambos incluyen: finalidad, contexto, metodología, núcleo MVP y tratamiento de reportes/reseñas como ampliación futura opcional.\n\n2. **01_contexto_y_justificacion_del_trabajo.typ**: Sección de alquiler turístico condensada de 4 párrafos a 2 (con título renombrado para incluir la financiarización). Eliminada la comparativa detallada de plataformas existentes de la sección 'Vacío de herramientas'; sustituida por un párrafo breve con remisión a `@sec:benchmarking`. Párrafo de descripción del proyecto corregido: sistema de reportes marcado como ampliación futura opcional. Eliminada cita duplicada a `civio_megatenedores_2024` del párrafo de fragmentación.\n\n3. **03_impacto_en_sostenibilidad.typ**: Sección 'Huella ambiental del uso de IA' condensada de 2 párrafos extensos a 1 conciso. Bloque de riesgos éticos reestructurado para separar el riesgo del núcleo MVP (uso especulativo de datos) del riesgo específico de reportes (marcado explícitamente como ampliación futura). Párrafo sobre reportes y discriminación étnica ajustado. Tabla de impactos y tabla ODS actualizadas para reflejar carácter opcional de los reportes.\n\n4. **04_enfoque_y_metodo_seguido.typ**: Conclusión del análisis de alternativas corregida para no mencionar reportes como requisito nuclear. Justificación del desarrollo propio reorientada hacia el núcleo MVP (fuentes oficiales españolas + visualización interactiva + orientación ciudadana). Sección de stack condensada a 1 párrafo con remisión a `@sec:arquitectura`; figuras `<fig:tech-stack>` y `<fig:infrastructure>` movidas a los capítulos de arquitectura y despliegue respectivamente.\n\nFicheros adicionales editados (por necesidad técnica): `14_diseno_de_la_arquitectura.typ` y `19_despliegue_e_infraestructura.typ` (recepción de las figuras movidas). Documento compila sin errores.
<!-- SECTION:FINAL_SUMMARY:END -->
