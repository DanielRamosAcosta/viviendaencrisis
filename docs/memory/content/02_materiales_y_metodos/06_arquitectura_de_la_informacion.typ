== Definición de la arquitectura de la información <sec:arquitectura-informacion>

=== Card sorting

Con el objeto de fundamentar empíricamente la estructura de navegación de la plataforma, se llevó a cabo un ejercicio de card sorting híbrido en la herramienta FigJam. La técnica del card sorting consiste en pedir a los participantes que agrupen un conjunto de tarjetas —cada una representando un contenido o funcionalidad— en categorías con sentido para ellos, lo que permite inferir el modelo mental que los usuarios proyectan sobre un sistema antes de que este sea diseñado. En su variante híbrida, el investigador propone un conjunto inicial de categorías que los participantes pueden usar, modificar o ampliar con etiquetas propias.

Se prepararon treinta tarjetas que representaban otras tantas funcionalidades o contenidos de la plataforma, formuladas en lenguaje no técnico y accesible para todos los perfiles. Las tarjetas abarcaban desde las visualizaciones de precios y los mapas hasta la gestión de la cuenta personal, los reportes ciudadanos y el acceso a información de apoyo. Se propusieron seis categorías sugeridas: _Precios y comparativas_, _Mapas_, _Reportes y reseñas_, _Datos abiertos_, _Mi cuenta_ e _Información y ayuda_. En el tablero se indicaba de forma visible que los participantes podían crear nuevas categorías si ninguna de las existentes les resultaba adecuada. Se asignó un tablero independiente a cada participante para garantizar que las agrupaciones de cada uno no estuvieran influenciadas por las de los demás.

==== Participantes

El estudio contó con tres participantes seleccionados para cubrir perfiles distintos en cuanto a competencia digital y relación con el mercado de la vivienda. Dos de ellos se alinean directamente con las personas usuarias definidas en @sec:personas-usuarias:

- *Ileana* es periodista de investigación con alta competencia digital. Su perfil se corresponde con el de la persona secundaria Elena Marín, la periodista investigadora que demanda datos trazables y exportables para respaldar sus reportajes.
- *Cristina* es una joven trabajadora que vive de alquiler fuera de las Islas Canarias precisamente por el coste de los alquileres en el archipiélago. Su alta competencia digital y su situación habitacional la sitúan en el mismo espacio que la persona principal Marina Delgado, la ciudadana afectada.
- *Alexander* es propietario, autónomo en Canarias y de mayor edad. Su baja competencia digital lo aproxima al perfil de Antonio García, la persona secundaria que actúa como restricción de accesibilidad en el proceso de diseño.

La diversidad intencional de perfiles permite detectar no solo los consensos entre participantes, sino también las divergencias que reflejan distintos modelos mentales según el nivel de familiaridad con herramientas digitales y con el dominio de la vivienda.

==== Resultados de las agrupaciones

#figure(
  image("/images/Card Sorting_ Ileana.png", width: 100%),
  caption: [Tablero de card sorting de Ileana (periodista de investigación). Las tarjetas se organizan con separación clara entre las categorías orientadas al análisis de datos (_Precios y comparativas_, _Datos abiertos_) y las de gestión personal (_Mi cuenta_).],
) <fig:card-sorting-ileana>

#figure(
  image("/images/Card Sorting_ Alex.png", width: 100%),
  caption: [Tablero de card sorting de Alexander (propietario, competencia digital baja). La categoría _Precios y comparativas_ concentra diez tarjetas y _Datos abiertos_ aparece completamente vacía, lo que refleja un modelo mental centrado en el precio como eje principal y una baja familiaridad con el concepto de datos exportables.],
) <fig:card-sorting-alexander>

#figure(
  image("/images/Card Sorting_ Cristina.png", width: 100%),
  caption: [Tablero de card sorting de Cristina (joven inquilina). La categoría _Mapas_ recibe tarjetas de exploración activa —guardar zonas favoritas, ranking de zonas— lo que revela un modelo mental orientado a la búsqueda geográfica como eje de navegación.],
) <fig:card-sorting-cristina>

Del análisis de los tres tableros emergen patrones de acuerdo y de discrepancia que se sintetizan a continuación. Catorce tarjetas alcanzaron consenso total entre los tres participantes: las cuatro correspondientes al núcleo de _Precios y comparativas_ (evolución del alquiler, comparar barrios, relación precio-salario y comparar datos oficiales con portales inmobiliarios), las tres de _Reportes y reseñas_ (reportar piso turístico, escribir reseña y consultar reseñas), cuatro de _Mi cuenta_ (crear cuenta, iniciar sesión, estado de reporte y alertas de precios) y tres de _Información y ayuda_ (qué es Vivienda en Crisis, preguntas frecuentes e información legal sobre derechos del inquilino).

Entre las tarjetas diseñadas como deliberadamente ambiguas —información legal para inquilinos (T25), comparación de datos oficiales con portales (T27), alertas de precios (T29) y cambio de idioma (T30)— tres de las cuatro obtuvieron consenso unánime, lo que indica que las categorías propuestas resultaban más intuitivas de lo previsto para esos casos. Solo el cambio de idioma generó una discrepancia menor: Ileana y Cristina lo situaron en _Mi cuenta_ mientras que Alexander lo ubicó en _Información y ayuda_.

Las tarjetas con mayor dispersión fueron la descarga de datos en CSV o JSON, el índice de esfuerzo económico (porcentaje de renta destinada a vivienda), el ranking de zonas más caras y más baratas, el glosario de términos y la opción de guardar zonas favoritas. En todos estos casos, la colocación de Alexander divergía de la de los otros dos participantes. La descarga de datos fue clasificada por Ileana como _Datos abiertos_ y por Cristina y Alexander como _Información y ayuda_; el glosario fue asignado por Alexander a _Precios y comparativas_ y por los demás a _Información y ayuda_. Estas discrepancias reflejan, en buena medida, la baja familiaridad de Alexander con los conceptos de datos abiertos y de transparencia metodológica, lo que es coherente con su perfil de baja competencia digital.

Ninguno de los tres participantes creó categorías nuevas, lo que valida las seis categorías sugeridas como marco mental adecuado para la audiencia potencial de la plataforma.

==== Implicaciones para la arquitectura de la información

Los resultados del card sorting permiten extraer cinco decisiones de diseño estructural. En primer lugar, las seis categorías sugeridas se consolidan como la base del sistema de navegación principal, dado que ningún participante las rechazó ni propuso alternativas. En segundo lugar, la categoría _Datos abiertos_ como sección independiente presenta riesgo de invisibilidad para perfiles de baja competencia digital —Alexander la dejó completamente vacía—, aunque constituye una categoría con sentido para los perfiles técnicos que sí son su público natural; la solución de diseño debe equilibrar ambas necesidades, por ejemplo integrando puntos de entrada a las descargas también desde las visualizaciones. En tercer lugar, _Mapas_ recibió en todos los tableros un número reducido de tarjetas (entre uno y cuatro), lo que sugiere que los participantes lo perciben más como un modo de visualización que como una sección de contenido autónoma; esta observación apoya su integración como vista alternativa dentro de otras secciones en lugar de como entrada de primer nivel en la navegación. En cuarto lugar, las funcionalidades de personalización —alertas, favoritos y gestión de reportes propios— se asocian con claridad al espacio personal, confirmando que deben agruparse bajo _Mi cuenta_. En quinto lugar, el núcleo de _Reportes y reseñas_ es compacto y bien definido, con tres tarjetas de consenso unánime, lo que facilita su delimitación funcional.

La conexión con las personas usuarias definidas en @sec:personas-usuarias es directa: la separación que realiza Ileana entre visualizaciones temporales (_Precios y comparativas_) y datos exportables (_Datos abiertos_) es coherente con la demanda de transparencia metodológica y descarga de ficheros que caracteriza tanto a su perfil como al de Alejandro Ruiz, el activista de datos. La orientación geográfica de Cristina, que asocia los mapas con la exploración activa, se alinea con las necesidades de Marina Delgado de acceder a comparativas de forma inmediata y visual. Las colocaciones atípicas de Alexander, por su parte, confirman que Antonio García requiere una presentación progresiva de la información y textos explicativos en cada funcionalidad para no verse excluido de contenidos que, en términos de relevancia, sí le conciernen —como la evolución de precios en su barrio o los reportes de pisos turísticos en su comunidad de vecinos.

=== Sitemap

El sitemap de la plataforma se derivó directamente de los resultados del card sorting documentado en la sección anterior. El proceso siguió tres iteraciones sucesivas —v1, v1.1 y v1.2— en las que las agrupaciones de los participantes se contrastaron con las necesidades funcionales de la plataforma y con los modelos mentales descritos en los perfiles de las personas usuarias (@sec:personas-usuarias). El resultado es una propuesta de arquitectura de la información que equilibra la lógica de navegación observada empíricamente con los requerimientos funcionales del sistema.

==== Decisiones de diseño

La traducción de los datos del card sorting al sitemap implicó una serie de decisiones de diseño que se describen a continuación, ordenadas por relevancia para la estructura final.

La primera decisión fue mantener las cinco categorías de navegación de primer nivel observadas en los tableros, eliminando _Mapas_ como sección independiente. Ninguno de los participantes creó categorías nuevas, lo que valida el conjunto de categorías sugeridas como marco navegacional adecuado. Sin embargo, la categoría _Mapas_ recibió en todos los tableros un número reducido de tarjetas —entre una y cuatro—, y Cristina asoció esa categoría con funcionalidades de exploración activa como guardar zonas favoritas y consultar el ranking de zonas, lo que revela que el mapa se percibe como un modo de visualización, no como un destino de navegación con contenido propio. En consecuencia, las vistas de mapa se integran como vistas alternativas dentro de las secciones funcionales correspondientes —_Precios y comparativas_ y _Reportes y reseñas_— en lugar de constituir una entrada de primer nivel.

La segunda decisión fue mantener _Datos abiertos_ como sección de primer nivel y complementarla con puntos de entrada secundarios desde cada visualización. Alexander dejó esta categoría completamente vacía, lo que evidencia el riesgo de invisibilidad para perfiles de baja competencia digital. No obstante, Ileana —cuyo perfil se corresponde con el de la persona secundaria Elena Marín y con el de Alejandro Ruiz— la clasificó correctamente y le asignó seis tarjetas, lo que confirma su pertinencia para los perfiles técnicos. La solución adoptada consiste en una entrada dual: la sección propia para quienes la buscan de forma explícita, y un enlace de descarga integrado en cada visualización para quienes no reconocen la etiqueta pero sí necesitan los datos.

La tercera decisión fue mantener _Reportes y reseñas_ como sección única. Los tres participantes agruparon las tarjetas de reportes ciudadanos y de reseñas de agentes inmobiliarios bajo la misma categoría, con consenso total en las tres tarjetas que forman el núcleo funcional de esa sección. Separar los dos conceptos en secciones de primer nivel distintas habría contradicho los datos del card sorting y habría generado una navegación que no se corresponde con el modelo mental predominante. La distinción entre denuncia y opinión se gestiona mediante la organización interna de la sección.

La cuarta decisión fue reincorporar al sitemap dos tarjetas con consenso total que la primera iteración (v1) había omitido inadvertidamente: la relación precio-salario (T5) y la comparación de datos oficiales con portales inmobiliarios (T27). Ambas se incorporaron como subpáginas de _Precios y comparativas_. Asimismo, se añadió _Indicadores de asequibilidad_ como subsección que agrupa tanto la relación precio-salario (T5) como el índice de esfuerzo económico (T10), respondiendo a la coherencia temática entre ambos contenidos.

La quinta decisión fue tratar el registro y el inicio de sesión como flujos de autenticación, no como páginas del sitemap. Su presencia en las agrupaciones del card sorting —varios participantes los situaron bajo _Mi cuenta_— refleja la asociación mental con el espacio personal, pero no implica que deban constituir entradas de navegación en la arquitectura de la información.

Por último, se identificaron cuatro tarjetas que no corresponden a páginas del sitemap sino a patrones de interacción o a metadatos de interfaz: el filtrado por tipo de vivienda (T23), que se implementa como faceta disponible en _Precios y comparativas_ y en _Datos abiertos_; la fecha de última actualización (T26), que se expone como metadato contextual en todas las visualizaciones; el cambio de idioma (T30), que se implementa como componente global en la cabecera; y el registro e inicio de sesión (T15, T16), que se gestionan como flujos de autenticación.

==== Estructura resultante

La @fig:sitemap ilustra la arquitectura de la información en su versión definitiva (v1.2). La plataforma se articula en torno a cinco secciones de primer nivel accesibles desde la navegación principal. La página de inicio funciona como panel de resumen con acceso directo a las visualizaciones más consultadas y un buscador por zona que permite llegar a cualquier sección sin necesidad de navegar por los menús.

_Precios y comparativas_ centraliza las funcionalidades de análisis de mercado: la evolución temporal de precios —con vista de mapa integrada—, la comparativa entre zonas, el precio por metro cuadrado, el ranking de zonas, los indicadores de asequibilidad y la comparación entre datos oficiales y portales inmobiliarios. _Reportes y reseñas_ agrupa las funcionalidades de participación ciudadana: el formulario de reporte de irregularidades —generalización de la tarjeta original de pisos turísticos—, el mapa de reportes, la consulta de reportes existentes, las reseñas de agentes inmobiliarios y el formulario de valoración. _Datos abiertos_ ofrece un explorador por municipio, la descarga de datos en CSV y JSON, y la documentación de fuentes y metodología. _Mi cuenta_ agrupa el perfil personal —con los reportes y reseñas propias y las zonas guardadas como favoritas— y la configuración de alertas. _Información y ayuda_ recoge los contenidos estáticos de carácter orientativo: la presentación de la plataforma, las preguntas frecuentes, los derechos del inquilino y el glosario de términos.

#figure(
  image("/images/sitemap.png", width: 100%),
  caption: [Sitemap v1.2 de la plataforma Vivienda en Crisis, derivado de los resultados del card sorting. La estructura refleja cinco secciones de primer nivel accesibles desde la navegación principal. Los mapas se integran como vistas dentro de las secciones funcionales correspondientes (_Precios y comparativas_, _Reportes y reseñas_) en lugar de constituir una sección independiente.],
) <fig:sitemap>

==== Trazabilidad de las treinta tarjetas

La @tbl:tarjetas-sitemap recoge la correspondencia entre las treinta tarjetas del card sorting y su destino en el sitemap v1.2. Las tarjetas que no generan páginas propias se documentan como funcionalidades transversales o flujos de autenticación.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, left),
    table.header(
      [*Tarjeta*],
      [*Destino en el sitemap*],
      [*Tipo*],
    ),
    [T1, T2], [Precios y comparativas › Evolución temporal de precios], [Página],
    [T3], [Precios y comparativas › Comparar zonas], [Página],
    [T4], [Precios y comparativas › Precio por metro cuadrado], [Página],
    [T5, T10], [Precios y comparativas › Indicadores de asequibilidad], [Página],
    [T6], [Datos abiertos › Explorador por municipio], [Página],
    [T7], [Precios y comparativas › Vista mapa de precios], [Vista],
    [T8], [Datos abiertos › Descargar CSV / JSON], [Página],
    [T9], [Datos abiertos › Fuentes y metodología], [Página],
    [T11], [Reportes y reseñas › Reportar una irregularidad], [Página],
    [T12], [Reportes y reseñas › Mapa de reportes], [Página],
    [T13], [Reportes y reseñas › Escribir una reseña], [Página],
    [T14], [Reportes y reseñas › Consultar reseñas], [Página],
    [T15, T16], [Flujo de autenticación (modal / página dedicada)], [Flujo],
    [T17], [Mi cuenta › Mi perfil], [Página],
    [T18], [Mi cuenta › Mi perfil › Zonas favoritas], [Subsección],
    [T19], [Información y ayuda › Qué es Vivienda en Crisis], [Página],
    [T20], [Información y ayuda › Preguntas frecuentes], [Página],
    [T21, T29], [Mi cuenta › Alertas y configuración], [Página],
    [T22], [Precios y comparativas › Ranking de zonas], [Página],
    [T23], [Filtro transversal en Precios y Datos abiertos], [Funcionalidad],
    [T24], [Mi cuenta › Mi perfil › Estado de reporte], [Subsección],
    [T25], [Información y ayuda › Derechos del inquilino], [Página],
    [T26], [Metadato contextual en todas las visualizaciones], [Funcionalidad],
    [T27], [Precios y comparativas › Comparar oficial vs portales], [Página],
    [T28], [Información y ayuda › Glosario de términos], [Página],
    [T30], [Componente global de interfaz (cabecera)], [Funcionalidad],
  ),
  caption: [Trazabilidad de las treinta tarjetas del card sorting al sitemap v1.2. Las tarjetas clasificadas como _Flujo_ o _Funcionalidad_ no generan páginas de navegación propias.],
) <tbl:tarjetas-sitemap>

El sitemap v1.2 establece la base sobre la que se construyen las fases siguientes del proceso de diseño. Los diagramas de flujo (@sec:diagrama-flujo) detallan los recorridos de usuario para las tareas principales de cada sección, incorporando la lógica de autenticación y los estados intermedios que el sitemap no representa. A partir de esos flujos, los prototipos de baja fidelidad —wireframes— materializan las decisiones de arquitectura de la información en pantallas concretas (@sec:wireframes).
