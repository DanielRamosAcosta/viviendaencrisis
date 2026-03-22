---
id: VC-0051
title: Diagramas de flujo de usuario (sitemap v1.2)
status: In Review
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-22 14:40'
labels:
  - ux/ui
  - refined
milestone: m-1
dependencies: []
references:
  - >-
    docs/memory/content/02_materiales_y_metodos/06_arquitectura_de_la_informacion.typ
  - docs/memory/content/02_materiales_y_metodos/05_personas_usuarias.typ
  - docs/diagrams/user-flows/flow-03-reporte-irregularidad.mmd
  - docs/diagrams/user-flows/flow-02-comparativa-zonas.mmd
  - docs/diagrams/user-flows/flow-07-descarga-datos.mmd
  - docs/diagrams/user-flows/flow-08-autenticacion.mmd
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
- [x] #4 Los flujos de consulta de reportes y de reseñas modelan el recorrido de solo lectura (explorar, filtrar, ver detalle)
- [x] #5 El flujo de descarga de datos refleja la entrada dual: desde visualización y desde la sección Datos abiertos
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

Flujo 5 (Consultar reportes y mapa de reportes) generado en docs/diagrams/user-flows/flow-05-consultar-reportes.mmd. Cubre: dos vistas (lista y mapa como toggle integrado coherente con sitemap v1.2), filtros por zona/tipo en ambas vistas, popup contextual en mapa, detalle de reporte, unhappy paths de sin resultados con opciones de recuperación, y acción de compartir enlace.

Flujo 3 (Reporte de irregularidad) completado. Diagrama Mermaid generado en docs/diagrams/user-flows/flow-03-reporte-irregularidad.mmd. Cubre: punto de entrada desde Reportes y reseñas, decisión de autenticación con referencia al Flujo 8, aviso de anonimato prominente antes del formulario (requerimiento de Marina Delgado), formulario progresivo en 3 pasos (Antonio García), detección de reporte duplicado, validación inline (campos vacíos y descripción corta), cola de moderación con estados pendiente/aprobado/rechazado/más información, notificaciones al usuario, visibilidad del estado en Mi cuenta > Mi perfil > Estado de reporte, y opción de apelación tras rechazo.

Flujo 2 (Comparativa entre zonas) generado en docs/diagrams/user-flows/flow-02-comparativa-zonas.mmd. Flowchart TD en Mermaid con entrada dual (Home/buscador y sección directa), selección secuencial A→B, vistas precio/m²·evolución temporal·ranking, soporte hasta 4 zonas simultáneas, descarga de datos sin registro y 3 unhappy paths completos: búsqueda sin resultados, zona sin datos para el periodo, datos parciales (A tiene datos, B no).

Flujo 8 — Autenticación generado en docs/diagrams/user-flows/flow-08-autenticacion.mmd. Cubre: login, registro con verificación por email, recuperación de contraseña completa, sesión expirada a mitad de flujo, credenciales incorrectas con bloqueo por intentos, email no verificado con reenvío, email ya en uso con bifurcación, cancelación controlada del modal. Redirección al flujo original que invocó la autenticación en todos los happy paths.
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

**Flujo 6 — Consultar reseñas de agentes** (`docs/diagrams/user-flows/flow-06-consultar-resenas.mmd`)

Diagrama Mermaid flowchart TD generado con los siguientes nodos y decisiones:

**Happy path:** Inicio → Reportes y reseñas → Consultar reseñas → búsqueda por nombre o zona → listado de agentes → perfil del agente → listado de reseñas (con filtro opcional por puntuación/periodo) → detalle de reseña → valorar utilidad (¿Fue útil? Sí/No) → confirmación.

**Unhappy paths cubiertos:**
- Búsqueda sin resultados: mensaje + opción de refinar o abandonar
- Agente sin reseñas: mensaje + invitación a escribir la primera + vuelta al listado
- Valoración duplicada (usuario autenticado que ya valoró esa reseña): aviso informativo

**Decisión de diseño sobre autenticación para valorar:** Se modelaron dos ramas — anónima (sin auth, acción permitida) y autenticada (persiste vinculada al usuario, con detección de valoración duplicada). Esta bifurcación refleja que la consulta y valoración de utilidad son funcionalidades de solo lectura y participación ligera que no deben requerir registro obligatorio (principio de acceso sin barreras validado en el card sorting y en las necesidades de Marina y Antonio).

**Personas cubiertas:**
- Marina Delgado: flujo directo desde navegación hasta lectura de reseñas de una inmobiliaria concreta
- Antonio García: cada nodo tiene etiqueta descriptiva sin tecnicismos; progresividad clara sin saltos abruptos

**Nomenclatura:** consistente con sitemap v1.2 — sección 'Reportes y reseñas › Consultar reseñas'

Flujo 7 (Descarga de datos abiertos) completado. Diagrama en docs/diagrams/user-flows/flow-07-descarga-datos.mmd. Entrada dual (Entrada A: botón contextual desde visualizaciones; Entrada B: Datos abiertos > Explorador por municipio) convergiendo en nodo de filtros. Unhappy path de sin datos con ciclo de reajuste de filtros y salida limpia. Acceso lateral a Fuentes y metodología al final del flujo. Sin autenticación requerida en ningún paso.
<!-- SECTION:FINAL_SUMMARY:END -->
