== Enfoque y método seguido <sec:enfoque>

=== Estrategias consideradas y descartadas

Antes de definir el enfoque de desarrollo adoptado, se realizó un análisis sistemático de proyectos de código abierto existentes que pudieran servir como base o punto de partida para la plataforma. El criterio de búsqueda priorizó iniciativas con componentes de visualización de datos de vivienda, acceso público sin registro y algún tipo de participación ciudadana. Ninguno de los proyectos identificados resultó viable como solución directa, aunque el análisis resultó útil para delimitar con mayor precisión el alcance del desarrollo original.

El primer proyecto evaluado fue el _International Housing Observatory Dashboard_ (iDash), desarrollado en R/Shiny. Se trata de una herramienta orientada a investigadores y economistas especializados, que trabaja con datos macroeconómicos internacionales comparados ---índices de precios reales, ratios precio-renta y otras métricas de ciclo inmobiliario--- sin adaptación al contexto español ni integración con las fuentes oficiales nacionales (MIVAU, INE, Catastro). Su interfaz, concebida para un perfil técnico experto, no satisface el enfoque divulgativo que este proyecto requiere, y carece por completo de componente de participación ciudadana. El _San Francisco Housing Data Hub_ (DataSF), desarrollado sobre Jekyll, presentó un problema diferente: el abandono. El repositorio lleva aproximadamente seis años sin mantenimiento activo y su arquitectura de datos está acoplada de forma estrecha a las APIs propietarias de la plataforma Socrata/CKAN del municipio de San Francisco, sin posibilidad razonable de reutilización para fuentes españolas. Tampoco incorpora autenticación, roles de usuario ni sistema de reportes.

El _BC Housing Data Visualization Project_, desarrollado en R, se descartó igualmente por tratarse de un conjunto de scripts de análisis estadístico, no de una plataforma web desplegable; el repositorio lleva archivado cerca de una década y los datos son específicos de la Columbia Británica. _PreLease Community Data Reports_, basado en Jupyter Notebooks, genera informes estáticos en formato PDF o HTML: no constituye una aplicación web interactiva, carece de interfaz de usuario desplegable, de base de datos, de API y de mapas coropléticos dinámicos. Finalmente, se evaluó con especial atención Gobierto ---plataforma española de código abierto para la transparencia pública, desarrollada en Ruby on Rails---, dado su alineamiento cultural y su orientación hacia la ciudadanía. Sin embargo, tres factores determinaron su descarte: en primer lugar, el conjunto tecnológico es completamente ajeno al definido para este TFM (Next.js, Hono, MongoDB); en segundo lugar, no existe ningún módulo de vivienda en Gobierto, lo que implicaría construirlo desde cero de todas formas; y en tercer lugar, la curva de aprendizaje de un marco de trabajo desconocido anularía la ventaja de partir de una base existente.

#figure(
  block(
    width: 100%,
    inset: 1em,
    table(
      columns: (1.4fr, 0.8fr, 2fr),
      align: (left, center, left),
      stroke: 0.5pt + luma(180),
      fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
      table.header(
        [*Proyecto*], [*Tecnología*], [*Motivo de descarte*],
      ),
      [International Housing Observatory Dashboard (iDash)],
      [R / Shiny],
      [Orientado a investigadores; datos internacionales no adaptados al contexto español (CCAA, municipios, INE/Catastro/MIVAU); sin participación ciudadana.],

      [San Francisco Housing Data Hub (DataSF)],
      [Jekyll],
      [Abandonado (~6 años); acoplado a APIs Socrata/CKAN de San Francisco; sin autenticación, roles ni sistema de reportes.],

      [BC Housing Data Visualization Project],
      [R],
      [Repositorio archivado (~10 años); conjunto de scripts de análisis, no plataforma web desplegable; datos específicos de Columbia Británica.],

      [PreLease Community Data Reports],
      [Jupyter Notebooks],
      [Genera informes estáticos; sin interfaz de usuario, API, base de datos ni mapas coropléticos interactivos.],

      [Gobierto],
      [Ruby on Rails],
      [Conjunto tecnológico incompatible con el definido para el TFM; sin módulo de vivienda; curva de aprendizaje que anularía la ventaja de la base existente.],
    ),
  ),
  caption: [Proyectos de código abierto evaluados como alternativas al desarrollo propio y motivos de descarte.],
) <tabla:alternativas-descartadas>

El análisis evidencia un patrón común a todos los casos: ninguno integra simultáneamente visualización interactiva de datos, mapas coropléticos, sistema de reportes ciudadanos y autenticación con roles. La combinación de stack tecnológico incompatible, abandono o archivado del repositorio, alcance funcional insuficiente y dependencia de fuentes de datos no españolas hace inviable la adaptación. No obstante, el análisis también permite identificar una oportunidad de reutilización parcial: la capa de ingesta y normalización de datos oficiales puede apoyarse en bibliotecas y herramientas de código abierto especializadas para el procesamiento de fuentes públicas (parsers de ficheros del INE, adaptadores de la API del Catastro, etc.), sin necesidad de desarrollarlas desde cero. Esta posibilidad permanece abierta para su evaluación durante la fase de implementación.

=== Estrategia elegida: desarrollo propio con enfoque divulgativo

La ausencia de una solución existente que combine la integración de fuentes oficiales españolas, el enfoque divulgativo orientado a la ciudadanía general, la accesibilidad web y la participación ciudadana determina la elección de una estrategia de desarrollo original. Esta decisión no es únicamente instrumental ---responde a la inexistencia de alternativas viables---, sino que constituye la contribución propia del TFM: el diseño y la implementación de extremo a extremo de una plataforma que no existe en el ámbito público español.

El rasgo diferencial más relevante del enfoque adoptado es la prioridad otorgada al diseño divulgativo de las visualizaciones. A diferencia de las herramientas orientadas a investigadores ---donde se asume un perfil de usuario con formación estadística y familiaridad con indicadores económicos---, "Vivienda en Crisis" se dirige a una ciudadanía heterogénea en nivel educativo y experiencia técnica. Ello implica decisiones de diseño específicas: lenguaje no técnico en los títulos y descripciones de los gráficos, visualizaciones autoexplicativas con información contextual integrada, navegación guiada que facilite la interpretación de los datos sin conocimientos previos, y una interfaz que aproxime la información al usuario en lugar de requerir que el usuario se adapte a la herramienta. Este enfoque es coherente con los principios del diseño centrado en el usuario desarrollados en la @sec:objetivos y con los compromisos de accesibilidad establecidos en la misma sección.

=== Metodología de diseño y desarrollo

El proceso de diseño y desarrollo del proyecto se articula en torno a cuatro ejes metodológicos complementarios, cuyo detalle se desarrolla en la @sec:metodologia_desarrollo.

El primero es el _Diseño Centrado en el Usuario_ (DCU), que estructura la fase de definición del producto. Se llevaron a cabo actividades de investigación con usuarios ---entrevistas y análisis de necesidades--- que fundamentaron la arquitectura de la información, la definición de perfiles de uso y el diseño de prototipos de baja y alta fidelidad. Estas actividades siguen las prácticas del _Design Thinking_, que organiza el proceso creativo en torno a la comprensión empática del problema antes de proponer soluciones técnicas.

El segundo eje es el desarrollo iterativo. Las funcionalidades de la plataforma se descomponen en bloques de trabajo priorizados que se ejecutan a lo largo de las sucesivas PEC del máster, siguiendo un esquema de entrega incremental que permite ajustar el alcance en función del avance real y de la retroalimentación recibida durante el proceso de evaluación continua.

El tercer eje es la adopción de _Extreme Programming_ (XP) como principio guía del proceso de desarrollo. En un proyecto unipersonal, los elementos más relevantes de XP son los ciclos de retroalimentación cortos, la integración continua del código y el énfasis en la calidad técnica como condición de mantenibilidad. Estos principios guían la práctica de desarrollo cotidiana sin imponer la ceremonia de los marcos de trabajo ágiles diseñados para equipos.

El cuarto eje es la validación con usuarios reales al cierre del desarrollo. Una vez alcanzado el alcance del producto mínimo viable (MVP), se realizó una evaluación con personas usuarias de prueba para verificar la usabilidad de la interfaz y la comprensibilidad de las visualizaciones, cuyos resultados se incorporan como evidencia de validación en las conclusiones del trabajo.

=== Estrategia de datos

La integración de fuentes de datos oficiales constituye el punto de mayor riesgo técnico del proyecto, razón por la cual se aborda como una fase de investigación previa a cualquier decisión de implementación. Las fuentes primarias identificadas ---el Ministerio de Vivienda y Agenda Urbana (MIVAU/SERPAVI), el Instituto Nacional de Estadística (INE) y el Catastro--- ofrecen datos públicos y abiertos, pero con formatos, periodicidades y mecanismos de acceso heterogéneos que requieren un análisis detallado antes de poder diseñar una canalización de datos reproducible y auditable.

Esta investigación preliminar, cuyo resultado se documenta en el @cap:materiales, determinó qué formatos de distribución ofrece cada fuente (ficheros CSV, JSON, APIs REST, servicios WFS/WMS), qué granularidad territorial y temporal está disponible en cada caso, y qué volumen de datos es necesario procesar para el alcance funcional del MVP. Este análisis permitió tomar decisiones fundadas sobre la arquitectura del proceso de ingesta, la frecuencia de actualización de los datos en la plataforma y el modelo de almacenamiento más adecuado. Se contempló asimismo la posibilidad de incorporar, como dato de contraste complementario, indicadores de portales inmobiliarios privados obtenidos mediante extracción puntual de datos públicos, siempre dentro del marco legal aplicable y sin evadir medidas técnicas de protección.

=== Conjunto tecnológico

La elección del conjunto tecnológico responde a criterios de adecuación funcional, madurez del ecosistema y coherencia con los compromisos de sostenibilidad establecidos en la @sec:impacto_sostenibilidad. El detalle de las decisiones de arquitectura se desarrolla en la @sec:arquitectura.

Para la capa de presentación se ha elegido Next.js, el principal marco de trabajo (_framework_) del ecosistema React ---que es, a su vez, la biblioteca de interfaz de usuario con mayor adopción en el mercado---. Esta combinación garantiza la disponibilidad de recursos de aprendizaje, bibliotecas de componentes y soporte comunitario durante el desarrollo. Su modelo de renderizado híbrido ---que combina generación estática, renderizado en servidor y renderizado en cliente--- permite optimizar el rendimiento y la accesibilidad de cada tipo de página en función de sus requisitos específicos.

Para el backend y la API se ha elegido Hono, una biblioteca ligera de enrutamiento para entornos JavaScript y TypeScript con soporte nativo para despliegues sin servidor (_serverless_). Esta característica es especialmente pertinente en relación con los compromisos de sostenibilidad ambiental establecidos en la @sec:impacto_sostenibilidad, dado que la arquitectura _serverless_ reduce el consumo energético al escalar la computación estrictamente en función de la demanda real, evitando la sobreaprovisión de recursos @akour_serverless_2025. Hono es además compatible con múltiples entornos de ejecución (Node.js, Bun, Cloudflare Workers, Docker), lo que proporciona flexibilidad en las opciones de despliegue. Frente a alternativas como PHP, el entorno Node.js sobre el que opera Hono ofrece ventajas significativas en rendimiento: en pruebas de referencia, una petición API simple se resuelve en Node.js aproximadamente tres veces más rápido que en PHP 7.4 @patel_nodejs_php_2024.

Para la base de datos se ha elegido MongoDB Atlas, cuyo modelo de documentos orientado a JSON es especialmente adecuado para datos heterogéneos que requieren normalización previa a su almacenamiento ---como los procedentes de las distintas fuentes oficiales identificadas, con estructuras y granularidades distintas---. MongoDB Atlas ofrece, además, alto rendimiento en operaciones de lectura, lo que es relevante para una plataforma cuyo patrón de uso principal es la consulta y visualización de datos por parte de un número potencialmente elevado de usuarios concurrentes.
