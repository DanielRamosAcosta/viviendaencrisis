== Planificación del Trabajo <sec:planificacion>

El desarrollo del proyecto se estructura en cinco fases alineadas con las Pruebas de Evaluación Continua (PEC) del máster. La @tabla:fases-planificacion detalla el alcance, los hitos y los entregables de cada fase, y la @fig:gantt-planificacion ofrece la vista temporal del calendario.

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (0.55fr, 0.9fr, 0.4fr, 2.5fr),
    align: (left, center, center, left),
    stroke: 0.5pt + luma(180),
    fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
    table.header(
      [*Fase*], [*Periodo*], [*Horas*], [*Hitos y entregables*],
    ),
      [*P1* --- Plan de trabajo],
      [02/02 -- 01/03],
      [32],
      [
        #list(
          [Definición de objetivos y alcance],
          [Análisis del estado del arte],
          [Elección del conjunto tecnológico],
          [Planificación temporal y estimación de esfuerzo],
        )
        *Entregables:* Memoria parcial (plan de trabajo y estado del arte).
      ],

      [*P2* --- Diseño],
      [07/03 -- 29/03],
      [70],
      [
        #list(
          [Investigación de fuentes de datos oficiales],
          [Diseño de la arquitectura del sistema],
          [DCU: investigación con usuarios y encuesta],
          [Benchmarking de plataformas existentes],
          [Definición de personas usuarias],
          [Arquitectura de la información y diagramas de flujo],
          [Prototipado de baja y alta fidelidad (móvil y escritorio)],
          [Propuesta gráfica y guía de estilo],
        )
        *Entregables:* Prototipos validados, arquitectura documentada, memoria parcial con diseño completo.
      ],

      [*P3* --- Desarrollo e integración],
      [04/04 -- 26/04],
      [72],
      [
        #list(
          [Scaffolding del monorepo y CI/CD],
          [Proceso ETL (_Extract, Transform, Load_)],
          [Sistema de autenticación (JWT + roles)],
          [Dashboard: evolución de precios y comparativas],
          [Mapas coropléticos interactivos],
          [Sistema de reportes ciudadanos],
          [Despliegue público de la beta],
        )
        *Entregables:* Versión beta pública con funcionalidades principales operativas.
      ],

      [*P4* --- Versión final],
      [02/05 -- 31/05],
      [90],
      [
        #list(
          [Versión final de la plataforma],
          [Pruebas con usuarios reales],
          [Evaluación de accesibilidad (WCAG 2.1 AA)],
          [Redacción completa de la memoria],
        )
        *Entregables:* Plataforma final, informe de pruebas, memoria completa.
      ],

      [*DV* --- Defensa virtual],
      [06/06 -- 14/06],
      [36],
      [
        #list(
          [Preparación de la presentación],
          [Grabación de la defensa virtual],
        )
        *Entregables:* Vídeo de defensa y presentación de soporte.
      ],

      table.cell(colspan: 2, align: right, [*Total*]),
      [*300*],
      [],
    ),
  caption: [Fases del proyecto: alcance, hitos y entregables por periodo.],
) <tabla:fases-planificacion>

#include "../99_charts/gantt-planificacion-resumen.typ"

=== Recursos necesarios

La @tabla:recursos-necesarios resume los recursos técnicos y herramientas previstos para el desarrollo del proyecto, organizados por categoría funcional.

#figure(
  block(
    width: 100%,
    inset: 1em,
    table(
      columns: (1fr, 1.2fr, 2fr),
      align: (left, left, left),
      stroke: 0.5pt + luma(180),
      fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
      table.header(
        [*Categoría*], [*Recurso*], [*Función*],
      ),
      [Frontend],
      [Next.js + TypeScript],
      [_Framework_ para la capa de presentación con renderizado híbrido.],

      [Frontend],
      [Recharts / Nivo],
      [Bibliotecas de gráficos (líneas, barras, áreas) para visualización temporal.],

      [Frontend],
      [Leaflet / Mapbox GL],
      [Renderizado de mapas coropléticos interactivos.],

      [Backend],
      [Hono (Node.js)],
      [Biblioteca de enrutamiento para la API REST.],

      [Backend],
      [MongoDB (Scaleway)],
      [Base de datos documental para almacenamiento de datos y reportes.],

      [Backend],
      [JWT],
      [Mecanismo de autenticación y gestión de sesiones.],

      [Infraestructura],
      [Docker],
      [Contenedorización de servicios para desarrollo y despliegue.],

      [Infraestructura],
      [GitHub Actions],
      [Integración continua: linting, pruebas y despliegue automático.],

      [Infraestructura],
      [Scaleway],
      [Hospedaje _serverless_ del frontend y la API con energía 100% renovable.],

      [Datos],
      [MIVAU / SERPAVI],
      [Índices de precios de vivienda por comunidad autónoma y municipio.],

      [Datos],
      [INE],
      [Censo de vivienda, indicadores demográficos y series temporales.],

      [Datos],
      [Catastro],
      [Datos abiertos de uso, superficie y localización de inmuebles.],

      [Herramientas],
      [VS Code + Typst],
      [Entorno de desarrollo y composición de la memoria académica.],

      [Herramientas],
      [Git / GitHub],
      [Control de versiones y gestión del repositorio.],
    ),
  ),
  caption: [Recursos técnicos y herramientas previstos para el desarrollo del proyecto.],
) <tabla:recursos-necesarios>

=== Priorización y dependencias

La priorización de tareas sigue un criterio de producto mínimo viable (MVP): se implementan primero las funcionalidades que constituyen el núcleo de valor de la plataforma y que desbloquean el desarrollo de las restantes. En concreto, el proceso ETL de datos oficiales y el sistema de autenticación son dependencias bloqueantes que se abordan al inicio de P3, ya que sin datos normalizados no es posible construir visualizaciones, y sin autenticación no es posible implementar los reportes ciudadanos. Las visualizaciones temporales y los mapas coropléticos se priorizan sobre el sistema de reportes para validar la integración de datos antes de añadir funcionalidades de participación ciudadana. Las características secundarias ---panel de administración avanzado, moderación de reportes, indicadores derivados--- se planifican para P4, de modo que puedan descartarse o reducirse sin comprometer el núcleo funcional. En caso de desviación temporal, la jerarquía de descarte es: funcionalidades de moderación avanzada, indicadores estadísticos secundarios y, solo en último extremo, alguna de las visualizaciones complementarias. El desglose completo de tareas y sus dependencias puede consultarse en el @anexo:gantt-detallado.

=== Análisis de riesgos y planes de contingencia

La @tabla:riesgos identifica los principales riesgos del proyecto junto con su probabilidad estimada, su impacto potencial y las medidas de contingencia previstas.

#figure(
  block(
    width: 100%,
    inset: 1em,
    table(
      columns: (2fr, 0.8fr, 0.7fr, 2fr),
      align: (left, center, center, left),
      stroke: 0.5pt + luma(180),
      fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
      table.header(
        [*Riesgo*], [*Probabilidad*], [*Impacto*], [*Plan de contingencia*],
      ),
      [Cambio de formato o discontinuidad en las fuentes de datos oficiales (MIVAU, INE, Catastro).],
      [Media],
      [Alto],
      [Mantener una copia local de los datos ya descargados; diseñar el ETL con adaptadores intercambiables; reducir el alcance geográfico si una fuente deja de estar disponible.],

      [Subestimación de la complejidad técnica de alguna funcionalidad.],
      [Media],
      [Alto],
      [Reservar un colchón del 15--20~% del tiempo de cada fase; aplicar la jerarquía de descarte para preservar el MVP.],

      [Indisponibilidad personal por causas imprevistas.],
      [Baja],
      [Alto],
      [Planificar márgenes de 5--7 días antes de cada fecha de entrega; mantener entregables parciales funcionales al final de cada semana.],

      [Incompatibilidad entre versiones de bibliotecas o del entorno de ejecución.],
      [Media],
      [Medio],
      [Fijar versiones en el fichero de bloqueo desde el inicio; configurar integración continua desde la fase de scaffolding para detectar regresiones de forma temprana.],

      [Alcance excesivo que impida completar el MVP dentro del calendario.],
      [Media],
      [Alto],
      [Aplicar priorización estricta MVP-first; descartar funcionalidades secundarias antes de comprometer las entregas: moderación avanzada > indicadores derivados > núcleo funcional.],
    ),
  ),
  caption: [Principales riesgos del proyecto y planes de contingencia asociados.],
) <tabla:riesgos>
