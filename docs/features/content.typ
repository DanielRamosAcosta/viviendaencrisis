= Funcionalidades deseadas

Este documento recoge las funcionalidades que la plataforma _Vivienda en Crisis_ deberá satisfacer, organizadas por módulo funcional. Sirve como referencia de alcance para el desarrollo y la planificación del proyecto.

== Visualización de datos del mercado de la vivienda

=== Evolución temporal de precios

- Gráficos de líneas y barras con evolución histórica de precios de alquiler y compraventa.
- Filtros por periodo temporal y zona geográfica (comunidad autónoma, provincia, municipio).
- Implementado con D3.js, Recharts o Nivo según el tipo de gráfico.

=== Comparativas entre zonas

- Comparación simultánea de múltiples territorios en un mismo panel.
- Visualización de precio por metro cuadrado y evolución relativa entre zonas.
- Tablas comparativas descargables con los datos mostrados.

=== Mapas coropléticos

- Mapas interactivos a nivel de comunidad autónoma y municipio.
- Integración con Leaflet o Mapbox y datos geoespaciales en formato GeoJSON.
- Leyenda cromática, tooltips informativos y zoom interactivo.
- Componente de mayor complejidad visual del dashboard.

=== Indicadores socioeconómicos

- Ratio salario medio/precio de vivienda por zona geográfica.
- Índice de esfuerzo económico para el acceso a la vivienda.
- Cruce de datos demográficos (INE) con precios inmobiliarios.

== Sistema de reportes ciudadanos

=== Formulario de denuncia

- Formulario para documentar irregularidades del mercado (p.ej. alquileres turísticos ilegales, precios abusivos).
- Selección de ubicación mediante mapa interactivo con soporte de geolocalización del dispositivo.
- Subida de fotografías como evidencia adjunta al reporte.
- Validación de datos en cliente y servidor; requiere registro previo.

=== Listado público y mapa de reportes

- Vista pública de todos los reportes aprobados, accesible sin registro.
- Visualización en mapa con marcadores geolocalizados por reporte.
- Sistema de estados: _pendiente_, _verificado_ y _resuelto_.
- Filtros por estado y zona geográfica.

=== Moderación administrativa

- Panel exclusivo para administradores con cola de reportes pendientes.
- Gestión de transiciones de estado con campo de comentario interno.
- Notificación al denunciante cuando su reporte cambia de estado.
- Acciones en lote para moderar varios reportes simultáneamente.

== Sistema de reseñas inmobiliarias

=== Reseñas de agencias

- Sistema de puntuación por estrellas (1–5) y texto libre.
- Operaciones CRUD completas para el usuario registrado sobre sus propias reseñas.
- Listado de reseñas asociadas a cada agencia inmobiliaria.

=== Rankings y páginas públicas

- Ranking de agencias ordenado por puntuación media.
- Secciones _Hall of Fame_ (mejores valoradas) y _Hall of Shame_ (peores valoradas).
- Página de detalle por agencia con todas sus reseñas y estadísticas.
- Filtrado por zona geográfica.

== Autenticación y gestión de roles

- Registro de usuarios y login mediante autenticación JWT con refresh tokens.
- Dos roles diferenciados:
  - *Usuario registrado*: puede crear reportes y escribir reseñas.
  - *Administrador*: accede a moderación, gestión de usuarios y panel de administración.
- Middleware de autorización en el backend que protege los endpoints según rol.

== Panel de administración

- Gestión de usuarios: listado, cambio de rol y desactivación de cuentas.
- Dashboard con métricas clave: reportes pendientes, reseñas recientes, usuarios activos.
- Herramientas generales de gestión de contenido de la plataforma.
- Acceso restringido al rol de administrador.

== Interfaz pública

=== Landing page

- Sección _hero_ con el mensaje principal del observatorio y llamada a la acción.
- Presentación de la propuesta de valor y los módulos disponibles.
- Navegación principal hacia el dashboard y el resto de módulos funcionales.
- Diseño responsive adaptado a móvil, tablet y escritorio.

=== Acceso abierto a datos

- Todas las visualizaciones y datos del dashboard son accesibles sin registro.
- Solo las funcionalidades de participación ciudadana (reportes y reseñas) requieren autenticación.

== Integración de datos abiertos

Pipeline ETL (Extract, Transform, Load) para la ingestión automatizada de datos oficiales:

- *Ministerio de Vivienda y Agenda Urbana*: índices de precios de alquiler y compraventa trimestrales.
- *INE (Instituto Nacional de Estadística)*: censo de vivienda e indicadores demográficos.
- *Catastro*: datos abiertos de uso y superficie de inmuebles.

El proceso de transformación normaliza fuentes heterogéneas a un formato homogéneo, y el pipeline es reproducible y auditable.

== Requisitos no funcionales

=== Diseño responsive

- Adaptación completa a móvil, tablet y escritorio.
- Estados de carga, estados vacíos y transiciones fluidas en todas las vistas.

=== Accesibilidad

- Cumplimiento de las directrices WCAG 2.1 nivel AA.
- Navegación por teclado, contraste de color suficiente, textos alternativos en imágenes y roles ARIA correctos.

=== Seguridad

- Aplicación de las medidas del OWASP Top 10.
- Rate limiting en la API, sanitización de entradas y Content Security Policy (CSP).
- Validación de tipo y tamaño en archivos subidos por usuarios.

=== Despliegue

- Contenerización de todos los servicios con Docker.
- Despliegue en servidor público (VPS o Vercel para el frontend).
- Dominio propio con HTTPS.
- Pipeline de CI/CD con GitHub Actions.
