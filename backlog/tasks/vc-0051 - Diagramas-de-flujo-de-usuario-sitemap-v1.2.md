---
id: VC-0051
title: Diagramas de flujo de usuario (sitemap v1.2)
status: In Progress
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-22 14:25'
labels:
  - ux/ui
  - refined
milestone: m-1
dependencies: []
references:
  - >-
    docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ
  - docs/memory/content/02_materiales_y_metodos/05_personas_usuarias.typ
priority: high
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
## 📌 TLDR
Diseñar los diagramas de flujo de usuario para los 7 recorridos principales y secundarios de la plataforma, basados en el sitemap v1.2 y las personas usuarias.

## 📝 Descripción
La tarea original contemplaba 3 flujos genéricos que ya no reflejan la arquitectura de la información actual. Tras el card sorting y el diseño del sitemap v1.2, la plataforma tiene 5 secciones de primer nivel con mayor profundidad funcional. Los diagramas deben actualizarse para cubrir los recorridos reales de las personas usuarias (Marina, Alejandro, Pablo, Elena, Antonio) a través de la estructura definitiva.

Se distinguen dos niveles de flujos:

**Flujos principales (core):**
1. **Exploración de precios** — Home > buscar zona > evolución temporal (con toggle mapa) > cambiar filtros > ver indicadores de asequibilidad
2. **Comparativa entre zonas** — Seleccionar zona A > añadir zona B > ver comparación lado a lado > precio/m2, ranking
3. **Reporte de irregularidad** — Acceder a Reportes > crear reporte (requiere auth) > formulario > envío > moderación > notificación de estado
4. **Reseña de agente inmobiliario** — Consultar reseñas > escribir reseña (requiere auth) > formulario > publicación

**Flujos secundarios:**
5. **Descarga de datos abiertos** — Entrada dual: desde visualización o desde sección Datos abiertos > seleccionar municipio > filtrar > descargar CSV/JSON
6. **Autenticación** — Registro / login (modal o página) > verificación > redirección al flujo original
7. **Gestión de cuenta** — Mi perfil > ver reportes propios / zonas favoritas / configurar alertas

## 🧩 Contexto funcional
- Los flujos deben reflejar las decisiones de diseño del sitemap v1.2: Mapas integrados como vista (no sección), Datos abiertos con entrada dual, Reportes y reseñas en sección unificada
- El flujo de autenticación es transversal: se invoca desde los flujos 3, 4 y 7 cuando el usuario no está autenticado
- Los flujos deben contemplar las necesidades de las 5 personas usuarias, especialmente la progresividad para Antonio García (baja competencia digital)
- La descarga de datos tiene entrada dual: desde cada visualización (botón contextual) y desde la sección dedicada de Datos abiertos

## 📦 Entregables
- 7 diagramas de flujo en FigJam (4 principales + 3 secundarios)
- Cada diagrama debe incluir: estados, decisiones/bifurcaciones, puntos de autenticación y estados de error
- Nomenclatura consistente con el sitemap v1.2
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Los 4 flujos principales (exploración de precios, comparativa, reporte de irregularidad, reseña de agente) están diagramados en FigJam con estados, decisiones y bifurcaciones
- [ ] #2 Los 3 flujos secundarios (descarga de datos, autenticación, gestión de cuenta) están diagramados en FigJam
- [ ] #3 El flujo de exploración de precios incluye el toggle de vista mapa y el acceso a indicadores de asequibilidad
- [ ] #4 El flujo de descarga de datos refleja la entrada dual: desde visualización y desde la sección Datos abiertos
- [ ] #5 El flujo de autenticación se referencia como subflujo en los diagramas de reporte, reseña y gestión de cuenta
- [ ] #6 Los flujos de reporte y reseña incluyen el punto de decisión de autenticación (usuario logueado vs no logueado)
- [ ] #7 El flujo de reporte incluye los estados de moderación y notificación de estado al usuario
- [ ] #8 La nomenclatura de secciones y páginas en los diagramas es consistente con el sitemap v1.2
- [ ] #9 Cada diagrama incluye estados de error o casos excepcionales relevantes (ej: zona sin datos, formulario incompleto)
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
1. Revisar el sitemap v1.2 y las personas usuarias como referencia
2. Diseñar los 4 flujos principales en FigJam:
   - Flujo 1: Exploración de precios (incluir toggle mapa, filtros, indicadores de asequibilidad)
   - Flujo 2: Comparativa entre zonas (selección A/B, lado a lado, ranking)
   - Flujo 3: Reporte de irregularidad (con bifurcación de auth, moderación, notificaciones)
   - Flujo 4: Reseña de agente inmobiliario (con bifurcación de auth, publicación)
3. Diseñar los 3 flujos secundarios:
   - Flujo 5: Descarga de datos abiertos (entrada dual)
   - Flujo 6: Autenticación (registro/login, verificación, redirección)
   - Flujo 7: Gestión de cuenta (perfil, reportes propios, favoritos, alertas)
4. Verificar consistencia de nomenclatura con sitemap v1.2
5. Verificar que los flujos cubren las necesidades de las 5 personas usuarias
6. Revisión final de estados de error y casos excepcionales
<!-- SECTION:PLAN:END -->
