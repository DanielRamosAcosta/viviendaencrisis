== Planificación del Trabajo <sec:planificacion>

El desarrollo del proyecto se estructura en cinco fases alineadas con las Pruebas de Evaluación Continua (PEC) del máster. La primera fase (P1, del 2 de febrero al 1 de marzo de 2026) comprende la elaboración del plan de trabajo: definición de objetivos, análisis del estado del arte, elección del conjunto tecnológico, planificación temporal y estimación de esfuerzo. La segunda fase (P2, del 7 al 29 de marzo) abarca la investigación de fuentes de datos, el diseño de la arquitectura, el proceso de diseño centrado en el usuario (DCU) ---incluyendo prototipado de baja y alta fidelidad--- y el primer ciclo de desarrollo funcional: estructura del proyecto, proceso ETL (_Extract, Transform, Load_), autenticación y primeras visualizaciones. La tercera fase (P3, del 4 al 26 de abril) se centra en la implementación del grueso de funcionalidades: mapas coropléticos, comparativas entre zonas, sistema de reportes ciudadanos y panel de administración. La cuarta fase (P4, del 2 al 31 de mayo) contempla la versión final de la plataforma, la realización de pruebas con usuarios reales, la evaluación de accesibilidad y la redacción completa de la memoria. La quinta fase (Defensa Virtual, del 6 al 14 de junio) se dedica a la preparación y grabación de la defensa virtual del trabajo.

Cada fase culmina en un hito formal de entrega cuya fecha queda reflejada en la @fig:gantt-planificacion. Los entregables de la P1 son la memoria parcial con el plan de trabajo y el estado del arte; los de la P2, los prototipos validados, la arquitectura documentada y el primer incremento funcional desplegado; los de la P3, la versión beta pública con las funcionalidades principales operativas; los de la P4, la versión final de la plataforma, el informe de pruebas con usuarios y la memoria completa; y el de la Defensa Virtual, el vídeo de defensa y la presentación de soporte.

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
      [MongoDB Atlas],
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
      [Vercel],
      [Despliegue del frontend con soporte nativo para Next.js.],

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

=== Estimación del esfuerzo

La carga de trabajo total estimada es de aproximadamente 208 horas, distribuidas de forma no uniforme entre las cinco fases en función de su complejidad y volumen de entregables. La @tabla:estimacion-esfuerzo detalla la distribución temporal y los entregables principales de cada fase.

#figure(
  block(
    width: 100%,
    inset: 1em,
    table(
      columns: (0.6fr, 1.2fr, 0.5fr, 2fr),
      align: (center, left, center, left),
      stroke: 0.5pt + luma(180),
      fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
      table.header(
        [*Fase*], [*Periodo*], [*Horas*], [*Entregables principales*],
      ),
      [P1],
      [02/02 -- 01/03],
      [32],
      [Plan de trabajo, estado del arte, memoria parcial.],

      [P2],
      [07/03 -- 29/03],
      [70],
      [Prototipos DCU, arquitectura, ETL, autenticación, primeras visualizaciones.],

      [P3],
      [04/04 -- 26/04],
      [72],
      [Mapas coropléticos, comparativas, reportes ciudadanos, panel de administración.],

      [P4],
      [02/05 -- 31/05],
      [90],
      [Versión final, pruebas con usuarios, evaluación de accesibilidad, memoria completa.],

      [P5],
      [06/06 -- 14/06],
      [36],
      [Vídeo de defensa virtual y presentación de soporte.],

      table.cell(align: right, [*Total*]),
      [],
      [*300*],
      [],
    ),
  ),
  caption: [Estimación de esfuerzo por fase del proyecto.],
) <tabla:estimacion-esfuerzo>

=== Priorización y dependencias

La priorización de tareas sigue un criterio de producto mínimo viable (MVP): se implementan primero las funcionalidades que constituyen el núcleo de valor de la plataforma y que desbloquean el desarrollo de las restantes. En concreto, el proceso ETL de datos oficiales y el sistema de autenticación son dependencias bloqueantes que se abordan en P2, ya que sin datos normalizados no es posible construir visualizaciones, y sin autenticación no es posible implementar los reportes ciudadanos. Las visualizaciones temporales y los mapas coropléticos se priorizan sobre el sistema de reportes para validar la integración de datos antes de añadir funcionalidades de participación ciudadana. Las características secundarias ---panel de administración avanzado, moderación de reportes, indicadores derivados--- se planifican para P3 y P4, de modo que puedan descartarse o reducirse sin comprometer el núcleo funcional. En caso de desviación temporal, la jerarquía de descarte es: funcionalidades de moderación avanzada, indicadores estadísticos secundarios y, solo en último extremo, alguna de las visualizaciones complementarias. El desglose completo de tareas y sus dependencias puede consultarse en el @anexo:gantt-detallado.

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
