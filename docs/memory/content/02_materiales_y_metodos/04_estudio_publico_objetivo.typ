== Estudio del público objetivo <sec:publico-objetivo>

=== Definición del público objetivo

La definición del público objetivo constituye el primer paso operativo de la fase _Empatizar_ del proceso de Design Thinking aplicado en este proyecto. Antes de proponer cualquier solución, resulta necesario comprender quiénes son las personas que podrían beneficiarse de la plataforma, qué necesidades tienen, qué obstáculos encuentran y qué contextos condicionan su relación con los datos sobre vivienda. Como herramienta para sistematizar esta comprensión, se han empleado mapas de empatía, una técnica que permite organizar de forma estructurada lo que un perfil de usuario piensa, ve, dice, hace, siente y escucha en relación con un problema concreto @brown_change_2019[p.~49]. Los seis perfiles elaborados no representan usuarios reales identificados, sino hipótesis de partida fundamentadas en el análisis del contexto y en el conocimiento del dominio; su validez se contrasta en la fase siguiente mediante una encuesta dirigida a usuarios potenciales (@sec:publico-objetivo).

El proceso de elaboración de los mapas de empatía se llevó a cabo en un tablero colaborativo de FigJam, donde se construyeron seis perfiles diferenciados. Cada perfil recoge las dimensiones canónicas del mapa de empatía: _piensa_, _ve_, _dice_, _hace_, _siente_ y _escucha_. La @fig:empathy-map ofrece una vista de conjunto del tablero; el @anexo:empathy-map recoge la imagen a tamaño completo para facilitar su lectura.

#figure(
  image("/images/empathy-map.png", width: 100%),
  caption: [Tablero de mapas de empatía elaborado en FigJam con los seis perfiles de usuario identificados. Cada tarjeta agrupa las dimensiones _piensa_, _ve_, _dice_, _hace_, _siente_ y _escucha_ de un perfil diferenciado. Véase el @anexo:empathy-map para la imagen a tamaño completo.],
) <fig:empathy-map>

*Periodista de datos.* Este perfil agrupa a profesionales del periodismo que trabajan con datos públicos como materia prima de sus investigaciones. Su principal dificultad radica en la fragmentación de las fuentes: los datos del MIVAU se distribuyen en boletines PDF, los del INE requieren cruce manual con otras series y los portales privados publican únicamente precios de oferta, que no son equiparables a los datos de transacciones reales. La urgencia editorial y la necesidad de producir visualizaciones comprensibles para una audiencia amplia generan una tensión permanente entre el rigor de las fuentes y los plazos de publicación. La plataforma puede aportarle datos consolidados, ya procesados y visualizables, que reduzcan significativamente el tiempo de preparación de una pieza.

*Inquilina que busca informarse.* Este perfil representa a la ciudadanía directamente afectada por el mercado de alquiler: personas que necesitan entender si el precio que pagan es razonable, si su zona está declarada como área de mercado residencial tensionado o si una subida propuesta por su arrendador es legal. Su relación con los datos es emocional y práctica a la vez: no busca análisis estadísticos elaborados, sino respuestas concretas a preguntas concretas. La ausencia de fuentes de referencia claras y accesibles la obliga a recurrir a grupos informales de mensajería o a comparativas de portales comerciales que mezclan precios de oferta con precios de mercado.

*Activista y sindicalista de vivienda.* Las personas que trabajan en organizaciones de defensa del derecho a la vivienda ---sindicatos de inquilinas, plataformas de afectados, colectivos vecinales--- necesitan datos sólidos para respaldar sus reivindicaciones ante instituciones y medios de comunicación. Utilizan los datos tanto para elaborar informes de denuncia como para mostrar a las personas afectadas que su situación no es individual sino estructural. Su demanda central es la disponibilidad de datos desagregados geográficamente ---a nivel de barrio o municipio--- y la posibilidad de combinarlos con otra información, como el número de desahucios o la concentración de grandes tenedores.

*Joven que quiere emanciparse.* Este perfil recoge la experiencia de las personas jóvenes que se enfrentan a su primera búsqueda de vivienda independiente. Su desorientación no es solo económica ---no saber si pueden permitirse una emancipación--- sino también informativa: desconocen qué precio es razonable en su zona, qué ayudas públicas existen y con qué requisitos reales, o qué barrios ofrecen una relación precio-accesibilidad más adecuada a su situación. La brecha entre las expectativas generadas por la experiencia de generaciones anteriores y la realidad actual del mercado produce una frustración que combina lo personal y lo generacional.

*Técnico o técnica de administración local.* Los servicios municipales de urbanismo, vivienda o planificación territorial necesitan datos actualizados y desagregados para fundamentar decisiones de política pública: desde la declaración de zonas tensionadas hasta la justificación de partidas presupuestarias o la elaboración de planes locales de vivienda. Trabajan bajo presión institucional y con recursos limitados, y dedican una parte significativa de su tiempo a tareas de recopilación y transformación de datos que, en ausencia de una herramienta especializada, realizan manualmente en hojas de cálculo. Una plataforma que ofrezca series históricas comparables entre municipios y visualizaciones exportables representaría un ahorro de tiempo relevante para este perfil.

*Investigador o investigadora académica.* Las personas que investigan la crisis habitacional desde perspectivas económicas, geográficas o sociológicas tienen exigencias metodológicas estrictas: necesitan datos abiertos, con documentación metodológica accesible, reproducibles y descargables en formatos procesables ---CSV, JSON--- que puedan integrar en sus flujos de análisis con R o Python. Valoran especialmente la disponibilidad de series temporales largas y la posibilidad de cruzar datos de precios con variables sociodemográficas. Para este perfil, la plataforma actúa como una puerta de entrada a los datos oficiales, reduciendo la fricción del acceso sin sustituir el rigor del análisis propio.

La diversidad de estos seis perfiles no es accidental: refleja la multiplicidad de relaciones que distintos actores sociales mantienen con el problema de la vivienda en España. Todos comparten una necesidad común ---acceder a datos fiables, actualizados y comprensibles sobre el mercado residencial--- pero difieren en su nivel de competencia técnica, en sus objetivos concretos y en el uso que harían de la información. Esta heterogeneidad orienta las decisiones de diseño hacia una plataforma que sea simultáneamente rigurosa en sus datos y accesible en su presentación, capaz de atender tanto a la ciudadanía general como a perfiles técnicos o especializados sin sacrificar ninguno de los dos extremos.

=== Definición de los objetivos

El diseño de la encuesta responde a un conjunto de objetivos específicos, derivados tanto de los seis perfiles de empatía descritos en la sección anterior como de las funcionalidades previstas para la plataforma. Cada objetivo delimita un área de conocimiento que los mapas de empatía han identificado como relevante pero que no puede validarse sin datos empíricos procedentes de usuarios reales o potenciales. La articulación explícita de estos objetivos antes de la distribución del cuestionario permite verificar, una vez obtenidas las respuestas, en qué medida las hipótesis de diseño están fundamentadas.

Se definen seis objetivos de investigación para la encuesta:

*O1 — Conocimiento y percepción ciudadana de la crisis.* Se pretende medir el nivel de información que tienen los encuestados sobre la crisis de vivienda: sus fuentes habituales de información, su capacidad para estimar la evolución reciente de los precios y su percepción sobre las causas del problema. Este objetivo permite contrastar si la brecha informativa identificada en los perfiles —especialmente en el de la inquilina que busca informarse y en el del joven que quiere emanciparse— tiene correlato empírico en la muestra, y en qué medida una plataforma de datos abiertos podría cubrir esa necesidad.

*O2 — Demanda de herramientas de visualización de datos.* Se busca evaluar si los encuestados perciben como útil una plataforma de visualización interactiva de precios de vivienda y qué tipos de comparativas priorizarían. La utilidad percibida constituye un indicador previo a la adopción de cualquier herramienta digital @navalkha_2021[p.~23], y su medición orienta las decisiones sobre qué funcionalidades de visualización deben estar disponibles en la versión inicial de la plataforma —evolución temporal, comparativas por zona, mapas coropléticos— frente a las que pueden diferirse a iteraciones posteriores.

*O3 — Situación habitacional y esfuerzo económico.* Se recoge información sobre el régimen de tenencia, la comunidad autónoma de residencia y la proporción de ingresos que los encuestados destinan a vivienda. Este objetivo no persigue un fin descriptivo en sí mismo, sino contextualizar las respuestas al resto del cuestionario: se espera que la percepción de utilidad de la plataforma, la exposición a pisos turísticos y la disposición a participar en un sistema de reportes varíen significativamente en función de la situación habitacional del encuestado.

*O4 — Impacto percibido de los pisos turísticos y disposición a reportar.* Se explora la percepción de los encuestados sobre los efectos de los alojamientos turísticos de corta duración en su entorno inmediato y su predisposición a utilizar un sistema de reportes ciudadanos para denunciar establecimientos ilegales o sin licencia. La literatura sobre cartografía colaborativa y activismo de datos sugiere que la participación ciudadana en la producción de datos es más alta cuando los usuarios perciben una relación directa entre su experiencia personal y el problema que se denuncia @maharawal_mcelroy_2018[p.~384].

*O5 — Experiencia con agentes inmobiliarios y demanda de reseñas verificadas.* Se investigan los problemas que los encuestados han experimentado con inmobiliarias o propietarios, las acciones emprendidas al respecto y la disposición a consultar y dejar reseñas verificadas de agentes inmobiliarios. El informe del IDRA sobre el impacto de las inmobiliarias en el mercado del alquiler @idra_2024 documenta prácticas de discriminación y abuso que los mecanismos de mercado actuales no corrigen; la encuesta permite valorar si existe demanda suficiente para que un sistema de reseñas ciudadanas sea una funcionalidad viable en la plataforma.

*O6 — Necesidades funcionales desde la perspectiva del usuario.* Mediante preguntas abiertas y de selección múltiple, se recogen las funcionalidades que los encuestados esperarían de una plataforma como Vivienda en Crisis. Este objetivo actúa como contrapunto cualitativo al resto del cuestionario: permite detectar demandas no anticipadas en la fase de empatía y priorizar el desarrollo en función de las expectativas reales de los usuarios, en coherencia con los principios del diseño centrado en el usuario que orientan la metodología del proyecto (@sec:enfoque).

=== Elaboración y distribución de la encuesta

// TODO

La @tbl:objetivos-preguntas recoge la correspondencia entre cada bloque de preguntas del cuestionario y los objetivos a los que contribuye. Las preguntas de consentimiento (P1) no se asignan a ningún objetivo de investigación, dado que su función es exclusivamente legal.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    table.header(
      [*Pregunta(s)*],
      [*Enunciado resumido*],
      [*Objetivo(s)*],
    ),
    [P1], [Consentimiento al tratamiento de datos], [—],
    [P2–P4], [Edad, ocupación y género], [O3],
    [P5], [Fuentes de información sobre la crisis de vivienda], [O1],
    [P6], [Estimación de la subida del alquiler en su zona], [O1],
    [P7–P8], [Conocimiento y percepción de las causas de la crisis], [O1],
    [P9], [Grado de acuerdo con afirmaciones sobre la crisis], [O1],
    [P10], [Utilidad percibida de gráficos interactivos de precios], [O2],
    [P11], [Tipos de comparativas de interés], [O2],
    [P12], [Situación de vivienda actual (régimen de tenencia)], [O3],
    [P13], [Comunidad autónoma de residencia], [O3],
    [P14], [Porcentaje de ingresos destinado a vivienda], [O3],
    [P15], [Qué le gustaría entender mejor sobre la crisis], [O1, O6],
    [P16], [Presencia de pisos turísticos en el edificio o calle], [O4],
    [P17], [Efectos observados de los pisos turísticos en su zona], [O4],
    [P18], [Percepción sobre la contribución de pisos turísticos a la crisis], [O4],
    [P19], [Disposición a reportar pisos turísticos ilegales de forma anónima], [O4],
    [P20], [Información deseada sobre pisos turísticos], [O4],
    [P21], [Experiencia personal con pisos turísticos (abierta)], [O4],
    [P22], [Problemas con inmobiliaria o propietario], [O5],
    [P23], [Tipo de problemas experimentados], [O5],
    [P24], [Acciones emprendidas ante los problemas], [O5],
    [P25], [Valoración de un sistema de reseñas de inmobiliarias], [O5],
    [P26], [Disposición a dejar reseñas sobre inmobiliarias], [O5],
    [P27], [Factores de confianza en un sistema de reseñas], [O5],
    [P28], [Experiencia con inmobiliaria o propietario (abierta)], [O5],
    [P29], [Funcionalidades esperadas en la plataforma], [O6],
  ),
  caption: [Correspondencia entre las preguntas del cuestionario y los objetivos de la encuesta. Las preguntas de consentimiento (P1) quedan fuera de la asignación a objetivos de investigación.],
) <tbl:objetivos-preguntas>

=== Análisis de los resultados

// TODO

=== Conclusiones del estudio

// TODO
