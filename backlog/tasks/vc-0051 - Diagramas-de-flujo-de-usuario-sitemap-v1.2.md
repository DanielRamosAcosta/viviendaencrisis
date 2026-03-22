---
id: VC-0051
title: Diagramas de flujo de usuario (sitemap v1.2)
status: In Review
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-22 14:39'
labels:
  - ux/ui
  - refined
milestone: m-1
dependencies: []
references:
  - >-
    docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ
  - docs/memory/content/02_materiales_y_metodos/05_personas_usuarias.typ
documentation:
  - docs/diagrams/user-flows/flow-01-exploracion-precios.mmd
priority: high
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
## 📌 TLDR
Diseñar los diagramas de flujo de usuario para los 9 recorridos principales y secundarios de la plataforma, basados en el sitemap v1.2 y las personas usuarias.

## 📝 Descripción
Tras el card sorting y el diseño del sitemap v1.2, la plataforma tiene 5 secciones de primer nivel con mayor profundidad funcional. Los diagramas deben cubrir los recorridos reales de las personas usuarias (Marina, Alejandro, Pablo, Elena, Antonio) a través de la estructura definitiva.

Se distinguen dos niveles de flujos:

**Flujos principales (core):**
1. **Exploración de precios** — Home (panel resumen + buscador por zona) > buscar zona > evolución temporal (con toggle mapa) > cambiar filtros > ver indicadores de asequibilidad > comparar oficial vs portales (variante)
2. **Comparativa entre zonas** — Home o sección > seleccionar zona A > añadir zona B > ver comparación lado a lado > precio/m², ranking
3. **Reporte de irregularidad** — Acceder a Reportes > crear reporte (requiere auth) > formulario > envío > moderación > notificación de estado
4. **Reseña de agente inmobiliario** — Consultar reseñas > escribir reseña (requiere auth) > formulario > publicación
5. **Consultar reportes y mapa de reportes** — Acceder a Reportes > explorar mapa de reportes > filtrar por zona/tipo > ver detalle de un reporte (flujo de solo lectura)
6. **Consultar reseñas de agentes** — Acceder a Reseñas > buscar agente > leer reseñas > valorar utilidad (flujo de solo lectura)

**Flujos secundarios:**
7. **Descarga de datos abiertos** — Entrada dual: desde visualización (botón contextual) o desde sección Datos abiertos > seleccionar municipio > filtrar > descargar CSV/JSON
8. **Autenticación** — Registro / login (modal o página) > verificación > redirección al flujo original
9. **Gestión de cuenta** — Mi perfil > ver reportes propios / zonas favoritas / configurar alertas

## 🧩 Contexto funcional
- El Home funciona como panel de resumen con buscador por zona: es el punto de entrada modelado como paso inicial de los flujos 1 y 2
- Los flujos deben reflejar las decisiones del sitemap v1.2: mapas integrados como vista (no sección), datos abiertos con entrada dual, reportes y reseñas en sección unificada
- El flujo de autenticación es transversal: se invoca desde los flujos 3, 4 y 9 cuando el usuario no está autenticado
- Los flujos deben contemplar las necesidades de las 5 personas usuarias, especialmente la progresividad para Antonio García (baja competencia digital)
- Comparar oficial vs portales (T27) se integra como variante del flujo 1, no como flujo independiente

## ⚠️ Unhappy paths a contemplar

**Exploración y comparativa:**
- Búsqueda de zona sin resultados (municipio no encontrado)
- Zona existe pero no tiene datos para el periodo seleccionado
- Datos parciales (algunos trimestres sin información)

**Reportes y reseñas:**
- Usuario no autenticado intenta crear → subflujo de autenticación
- Validación del formulario: campos obligatorios vacíos, texto demasiado corto
- Reporte rechazado en moderación → notificación con motivo
- Reporte duplicado (misma dirección ya reportada)

**Autenticación:**
- Credenciales incorrectas
- Email no verificado
- Recuperación de contraseña
- Sesión expirada a mitad de un flujo (ej: rellenando un reporte)

**Descarga de datos:**
- No hay datos para los filtros seleccionados

**Gestión de cuenta:**
- Eliminar cuenta con reportes activos en moderación

## 📦 Entregables
- 9 diagramas de flujo en FigJam (6 principales + 3 secundarios)
- Cada diagrama debe incluir: estados, decisiones/bifurcaciones, puntos de autenticación, estados de error y unhappy paths
- Nomenclatura consistente con el sitemap v1.2
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Los 6 flujos principales (exploración de precios, comparativa, reporte de irregularidad, reseña de agente, consultar reportes/mapa, consultar reseñas) están diagramados en FigJam con estados, decisiones y bifurcaciones
- [ ] #2 Los 3 flujos secundarios (descarga de datos, autenticación, gestión de cuenta) están diagramados en FigJam
- [ ] #3 El flujo de exploración de precios parte del Home (buscador por zona), incluye toggle mapa, indicadores de asequibilidad y variante de oficial vs portales
- [ ] #4 Los flujos de consulta de reportes y de reseñas modelan el recorrido de solo lectura (explorar, filtrar, ver detalle)
- [ ] #5 El flujo de descarga de datos refleja la entrada dual: desde visualización y desde la sección Datos abiertos
- [ ] #6 El flujo de autenticación se referencia como subflujo en los diagramas de reporte, reseña y gestión de cuenta
- [ ] #7 Los flujos de reporte y reseña incluyen el punto de decisión de autenticación (usuario logueado vs no logueado)
- [ ] #8 El flujo de reporte incluye los estados de moderación y notificación de estado al usuario
- [ ] #9 La nomenclatura de secciones y páginas en los diagramas es consistente con el sitemap v1.2
- [ ] #10 Cada diagrama incluye los unhappy paths documentados: zona sin datos, formulario inválido, credenciales incorrectas, reporte rechazado/duplicado, sesión expirada, sin datos para filtros
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
1. Revisar el sitemap v1.2 y las personas usuarias como referencia
2. Diseñar los 6 flujos principales en FigJam:
   - Flujo 1: Exploración de precios (Home como entrada, toggle mapa, filtros, indicadores, variante oficial vs portales)
   - Flujo 2: Comparativa entre zonas (Home como entrada, selección A/B, lado a lado, ranking)
   - Flujo 3: Reporte de irregularidad (bifurcación auth, formulario con validación, moderación, notificaciones, duplicado)
   - Flujo 4: Reseña de agente inmobiliario (bifurcación auth, formulario, publicación)
   - Flujo 5: Consultar reportes y mapa de reportes (solo lectura: explorar, filtrar, ver detalle)
   - Flujo 6: Consultar reseñas de agentes (solo lectura: buscar, leer, valorar utilidad)
3. Diseñar los 3 flujos secundarios:
   - Flujo 7: Descarga de datos abiertos (entrada dual, sin datos para filtros)
   - Flujo 8: Autenticación (registro/login, verificación, credenciales incorrectas, email no verificado, recuperación contraseña, sesión expirada, redirección)
   - Flujo 9: Gestión de cuenta (perfil, reportes propios, favoritos, alertas, eliminar cuenta con reportes activos)
4. Verificar consistencia de nomenclatura con sitemap v1.2
5. Verificar que los flujos cubren las necesidades de las 5 personas usuarias
6. Revisión final: todos los unhappy paths documentados están representados en los diagramas
<!-- SECTION:PLAN:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
**Indicación de la profesora (reformulada para este proyecto):**

Este diagrama os ayudará a aseguraros de que el usuario puede realizar las acciones necesarias en cada pantalla y no se quedará bloqueado en ninguna. Os puede ayudar ir imaginando los clics que realiza el usuario desde que llega a la plataforma hasta que, por ejemplo, consulta la evolución del alquiler en su zona, compara dos municipios, o envía un reporte de irregularidad. En el diagrama es importante contemplar todas las acciones que pueden ser negativas o reportar errores y qué elecciones debe tomar el usuario. Por ejemplo: ¿una búsqueda de zona siempre devuelve resultados? ¿Qué pasa si no hay datos para ese municipio? ¿Qué ocurre si el usuario intenta reportar una irregularidad sin estar autenticado? ¿Cómo le informamos de que su reporte ha sido rechazado en la moderación?

Flujo 4 (Reseña de agente inmobiliario) generado en docs/diagrams/user-flows/flow-04-resena-agente.mmd
<!-- SECTION:NOTES:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
**Flujo 1 — Exploración de precios**

Generado el diagrama de flujo en `docs/diagrams/user-flows/flow-01-exploracion-precios.mmd`.

**Decisiones de diseño aplicadas (con trazabilidad):**
- Home como punto de entrada con buscador por zona, coherente con sitemap v1.2 (panel de resumen)
- Vista mapa de precios integrada como toggle, no como sección (decisión IA v1.2 basada en card sorting: Mapas recibió pocas tarjetas, se percibe como modo de visualización)
- T26 (fecha de última actualización) expuesta como componente persistente en todas las vistas
- T27 (Comparar oficial vs portales) modelada como variante accesible desde la vista principal y desde Indicadores de asequibilidad
- T23 (filtros) modelado como panel transversal con estado de error propio
- Aviso metodológico en la variante oficial vs portales (trazabilidad para Elena Marín)
- Textos explicativos señalados en nodos de Indicadores y visualización (progresividad para Antonio García)
- Enlace a fuente original en estado 'zona sin datos' y en metadato persistente (verificabilidad para Elena Marín)

**Unhappy paths implementados:**
1. Zona no reconocida → sugerencias + retry al buscador
2. Zona sin datos → aviso + enlace a fuente original + retorno a Home
3. Datos parciales → aviso inline no bloqueante, visualización continúa
4. Filtros sin resultados → mensaje orientativo + retry al panel de filtros

**Personas cubiertas:** Marina (sin registro), Pablo (filtros, precio/m²), Antonio (textos explicativos, progresividad), Elena (fuentes verificables, enlace a origen).
<!-- SECTION:FINAL_SUMMARY:END -->
