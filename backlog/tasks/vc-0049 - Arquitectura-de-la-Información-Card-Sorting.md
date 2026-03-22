---
id: VC-0049
title: Arquitectura de la Información (Card Sorting)
status: In Review
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-22 11:10'
labels:
  - ux/ui
  - refined
milestone: m-1
dependencies:
  - VC-0048
priority: high
ordinal: 2812.5
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**TLDR:** Ejercicio de card sorting híbrido en FigJam con 3 participantes para definir la estructura de navegación de la plataforma.

## Descripción

Realizar un ejercicio de card sorting híbrido para descubrir cómo los usuarios potenciales de Vivienda en Crisis agrupan mentalmente las funcionalidades y contenidos de la plataforma. Los resultados alimentarán directamente la sección de Arquitectura de la Información de la memoria del TFM (actualmente vacía) y la propuesta de sitemap v1.

Se utilizarán 30 tarjetas que representan acciones/contenidos concretos del usuario, y 6 categorías sugeridas que los participantes pueden usar, modificar o complementar con categorías propias. El ejercicio se realizará en FigJam, con un tablero independiente por participante.

## Tarjetas (30)

1. Ver evolución de precios de alquiler en el tiempo
2. Ver evolución de precios de compraventa en el tiempo
3. Comparar precios entre barrios o municipios
4. Ver precio por metro cuadrado
5. Ver relación precio-salario por zona
6. Consultar datos de un municipio concreto
7. Ver mapa de precios por comunidad autónoma / municipio
8. Descargar datos en CSV o JSON
9. Consultar fuentes y metodología de los datos
10. Ver índice de esfuerzo económico (% de renta destinada a vivienda)
11. Reportar un piso turístico ilegal
12. Ver mapa de reportes ciudadanos en mi zona
13. Escribir una reseña sobre un agente inmobiliario
14. Consultar reseñas de agentes inmobiliarios
15. Crear una cuenta
16. Iniciar sesión
17. Ver mi perfil y mis reportes
18. Guardar zonas favoritas para seguimiento
19. Qué es Vivienda en Crisis (información del proyecto)
20. Preguntas frecuentes / Ayuda
21. Noticias o alertas sobre cambios significativos en precios
22. Ver ranking de zonas más caras y más baratas
23. Filtrar datos por tipo de vivienda (piso, casa, estudio)
24. Ver el estado de un reporte que envié
25. Consultar información legal sobre derechos del inquilino
26. Ver la fecha de última actualización de los datos
27. Comparar datos oficiales con precios de portales inmobiliarios
28. Ver un glosario de términos (IPC, índice de referencia, VUT...)
29. Recibir alertas cuando cambien los precios en mi zona
30. Cambiar el idioma de la plataforma

Las tarjetas 25, 27, 29 y 30 son deliberadamente ambiguas en su categorización: el objetivo es observar dónde las colocan los participantes para descubrir tensiones en el modelo mental.

## Categorías sugeridas (6)

- Precios y comparativas
- Mapas
- Reportes y reseñas
- Datos abiertos
- Mi cuenta
- Información y ayuda

En FigJam, las categorías irán como sticky notes en azul y las tarjetas en amarillo. Se incluirá una nota visible: "Puedes crear nuevas categorías si ninguna de estas te encaja. Simplemente crea un nuevo sticky azul con el nombre que quieras."

## Participantes (3) — Perfiles objetivo

- **Perfil Marina (ciudadana afectada):** Persona de 25-35 años, inquilina, que destine >30% de ingresos a vivienda. Competencia digital alta. Interés en saber si su precio de alquiler es razonable.
- **Perfil Pablo (usuario técnico):** Persona de 28-40 años con formación técnica (programación, datos, ingeniería). Inquilino o propietario con hipoteca. Competencia digital muy alta. Interesado en análisis de datos y visualizaciones interactivas.
- **Perfil Antonio (jubilado propietario):** Persona mayor de 55 años, propietaria, con competencia digital baja. Interesada en entender los cambios de su barrio. Este perfil actúa como restricción de accesibilidad: si la nomenclatura de las tarjetas y la dinámica le funcionan, funcionará para todos.

## Criterios funcionales

1. Crear un template de FigJam con las 30 tarjetas (stickies amarillos) y las 6 categorías sugeridas (stickies azules), con instrucciones claras para el participante
2. Duplicar el template en 3 tableros independientes (uno por participante)
3. Reclutar 3 participantes que se alineen con los perfiles descritos
4. Compartir cada tablero con su participante y dejar que agrupe las tarjetas de forma autónoma
5. Revisar los 3 tableros completados y capturar pantallazos de los resultados
6. Analizar los patrones: agrupaciones dominantes, tarjetas huérfanas o conflictivas, categorías nuevas creadas, diferencias entre perfiles
7. Pasar los resultados y capturas al agente tfm-memory-writer para redactar la sección "Card Sorting" dentro de Arquitectura de la Información en la memoria del TFM

## Notas técnicas

- Herramienta: FigJam (Figma). Un fichero por participante.
- La redacción de la sección de la memoria se delegará al agente `tfm-memory-writer`. El fichero destino es `docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ`.
- Las capturas de los tableros se guardarán en `docs/memory/images/`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Template de FigJam creado con las 30 tarjetas (amarillo) y 6 categorías sugeridas (azul), con instrucciones claras para el participante
- [ ] #2 Las tarjetas usan lenguaje no técnico comprensible para todos los perfiles, incluido Antonio (baja competencia digital)
- [ ] #3 3 tableros independientes creados (uno por participante)
- [ ] #4 3 participantes reclutados, cubriendo los 3 perfiles objetivo (ciudadana afectada, técnico, jubilado)
- [ ] #5 Los 3 participantes completan el ejercicio de forma autónoma
- [ ] #6 Capturas de pantalla de los 3 tableros completados guardadas en docs/memory/images/
- [ ] #7 Análisis documentado con: patrones de agrupación dominantes, tarjetas huérfanas o conflictivas, categorías nuevas creadas, y diferencias entre perfiles
- [ ] #8 Sección Card Sorting de la Arquitectura de la Información redactada en la memoria del TFM (vía agente tfm-memory-writer)
- [ ] #9 Propuesta de sitemap v1 derivada de los resultados del card sorting
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
## Flujo de trabajo

1. **Diseñar el template en FigJam** — Crear un tablero con las 30 tarjetas (stickies amarillos), las 6 categorías sugeridas (stickies azules) y las instrucciones visibles para el participante
2. **Pilotar con 1 persona** — Validar que las tarjetas se entienden, que las instrucciones son claras y que la dinámica funciona antes del estudio real. Ajustar nomenclatura si es necesario
3. **Duplicar en 3 tableros** — Crear un fichero FigJam independiente por participante a partir del template validado
4. **Reclutar 3 participantes** — Buscar personas que se alineen con los perfiles objetivo (ciudadana afectada, técnico, jubilado). Priorizar diversidad de competencia digital
5. **Compartir tableros y esperar resultados** — Enviar a cada participante su tablero con las instrucciones. Dejar que agrupen las tarjetas de forma autónoma, sin intervención
6. **Revisar, capturar y analizar** — Revisar los 3 tableros completados. Capturar pantallazos y guardarlos en `docs/memory/images/`. Documentar: patrones de agrupación dominantes, tarjetas huérfanas, categorías nuevas creadas, diferencias entre perfiles
7. **Redactar sección de la memoria** — Pasar los resultados, capturas y análisis al agente `tfm-memory-writer` para redactar la sección "Card Sorting" en `docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ`
8. **Derivar sitemap v1** — A partir de los patrones de agrupación, proponer la estructura de navegación de la plataforma
<!-- SECTION:PLAN:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
El fichero `docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ` actualmente tiene un placeholder `// TODO` en la subsección "Card sorting". Al redactar la sección con el agente `tfm-memory-writer`, se debe reemplazar ese TODO por el contenido real (metodología, capturas, hallazgos y conclusiones).
<!-- SECTION:NOTES:END -->
