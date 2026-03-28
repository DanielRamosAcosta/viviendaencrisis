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

El cuestionario se diseñó y distribuyó mediante Google Forms, una herramienta de encuestación en línea que permite recoger respuestas de forma asíncrona y exportar los datos en formato CSV para su análisis posterior. El instrumento final consta de 29 preguntas organizadas en bloques temáticos, cada uno de los cuales corresponde a uno o varios de los seis objetivos de investigación definidos en la sección anterior. Los tipos de pregunta empleados combinan ítems de opción única, ítems de selección múltiple, escalas de Likert de cinco puntos —donde 1 indica total desacuerdo y 5 total acuerdo— y preguntas abiertas de texto libre. Esta variedad de formatos permite capturar tanto valoraciones cuantificables como percepciones cualitativas que enriquecen la interpretación de los datos.

La distribución del cuestionario se realizó entre el 4 y el 6 de marzo de 2026, según se desprende de las marcas temporales registradas en las respuestas. Se siguió un procedimiento de muestreo por conveniencia con efecto bola de nieve: el enlace se difundió a través de redes personales —grupos familiares y de amistad—, contactos profesionales del ámbito tecnológico, foros y comunidades de periodismo de datos, y grupos en línea relacionados con la vivienda y los derechos de la ciudadanía. En total se recibieron 43 respuestas. Tras aplicar el criterio de exclusión definido en la pregunta de consentimiento (P1), se descartaron 3 respuestas cuyos participantes no otorgaron su conformidad al tratamiento de datos, por lo que la muestra válida queda compuesta por 40 respuestas.

Conviene señalar explícitamente las limitaciones de esta muestra antes de interpretar cualquier resultado. En primer lugar, el 85 % de los encuestados reside en Canarias, una comunidad autónoma con una problemática habitacional especialmente aguda derivada de la presión turística, lo que introduce un sesgo geográfico que limita la generalización de los hallazgos al conjunto del territorio español. En segundo lugar, el procedimiento de muestreo por redes personales tiende a sobrerrepresentar perfiles con mayor conciencia política y proximidad a posiciones críticas con el mercado inmobiliario, por lo que los resultados pueden no reflejar la distribución real de opiniones en la población general. En tercer lugar, un tamaño muestral de N = 40 no permite extraer inferencias estadísticas con márgenes de error controlados. Estas limitaciones no invalidan el estudio: el propósito de la encuesta no es el de un análisis sociológico representativo, sino el de una fase de validación exploratoria en el marco del proceso de Design Thinking que orienta el desarrollo de la plataforma. Los resultados se emplean para contrastar hipótesis de diseño y priorizar funcionalidades, y deben leerse en ese contexto.

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

Los resultados se presentan agrupados por objetivos de investigación. Para cada objetivo se exponen los hallazgos cuantitativos más relevantes, apoyados en visualizaciones generadas directamente a partir del CSV limpio, y se complementan con la interpretación de las respuestas abiertas cuando estas aportan matices que los datos cerrados no recogen.

==== O1 — Conocimiento y percepción ciudadana de la crisis

El nivel de información declarado por los encuestados es elevado: el 70 % afirma poder estimar aproximadamente la subida del alquiler en su zona, el 20 % tiene una idea vaga y solo el 10 % reconoce no saber nada. En cuanto al conocimiento de las causas, el 52,5 % dice tenerlas claras y el 45 % conoce algunas, con apenas un encuestado (2,5 %) que admite no poder explicarlas. Este perfil sugiere una muestra con un nivel de conciencia sobre la crisis habitacional superior a la media ciudadana, resultado coherente con el sesgo de selección por redes de afinidad descrito en la sección anterior.

#include "../99_charts/form-results/p05-fuentes-pct.typ"

En cuanto a las fuentes, la prensa digital lidera con el 75 % de los encuestados, seguida de las redes sociales (55 %) y el entorno cercano (47,5 %). Los organismos públicos y las asociaciones de inquilinos apenas alcanzan el 12,5 % y el 10 % respectivamente, lo que apunta a que la ciudadanía no recurre habitualmente a fuentes institucionales para informarse sobre vivienda. Las respuestas abiertas de P15 refuerzan esta interpretación: la demanda más frecuente no es entender las causas de la crisis —que la mayoría conoce— sino comprender por qué no se actúa políticamente, con referencias explícitas a modelos internacionales como el de Viena o los Países Bajos. Una plataforma que centralice datos oficiales y verificables cubriría, por tanto, una laguna informativa real respecto a los canales que los encuestados utilizan habitualmente.

#include "../99_charts/form-results/p08-causas-pct.typ"

Las causas más señaladas son la falta de vivienda pública (77,5 %) y los pisos turísticos (75 %), seguidas de la especulación (67,5 %). Estas tres opciones remiten a un diagnóstico en el que la responsabilidad recae en la estructura del mercado y en la insuficiencia de la oferta pública. Por el contrario, las causas de carácter liberal —exceso de regulación (25 %), inmigración (15 %) u ocupación (15 %)— obtienen respaldo minoritario, lo que, dado el sesgo de la muestra, no puede interpretarse como representativo de la opinión general. Entre las afirmaciones de acuerdo (P9), el 85 % de los encuestados respalda la necesidad de más vivienda pública de alquiler y el 72,5 % considera la vivienda un derecho, no un producto de mercado.

==== O2 — Demanda de herramientas de visualización de datos

La utilidad percibida de los gráficos interactivos de precios es muy elevada: el 75 % de los encuestados la califica de "muy útil" y el 17,5 % de "algo útil", lo que suma una aceptación del 92,5 %. Solo 3 encuestados (7,5 %) la consideran poco o nada útil. Este resultado valida la premisa central del proyecto: existe una demanda real de herramientas de visualización accesibles para el público general.

#include "../99_charts/form-results/p11-comparativas-pct.typ"

En cuanto al tipo de comparativas preferidas, la evolución temporal lidera con el 67,5 %, seguida del precio por m² entre barrios (60 %) y la relación precio-salario (50 %). Estos tres tipos de visualización corresponden exactamente a las funcionalidades core previstas para la plataforma, lo que refuerza las decisiones de diseño adoptadas en la fase de empatía. El análisis de las respuestas abiertas de P29 confirma este patrón: los datos históricos de precios y las comparativas geográficas son las funcionalidades más frecuentemente mencionadas (33,3 % de las respuestas válidas), acompañadas de una demanda explícita de fiabilidad y transparencia en los datos (24,2 %).

==== O3 — Situación habitacional y esfuerzo económico

El 35 % de los encuestados vive en régimen de alquiler y el 27,5 % en propiedad con hipoteca. Estos dos grupos, que concentran a más del 60 % de la muestra, son precisamente los perfiles con mayor exposición a las tensiones del mercado residencial. En cuanto al esfuerzo económico destinado a vivienda, el 27,5 % destina entre el 20 y el 30 % de sus ingresos y otro 27,5 % entre el 30 y el 40 %; un 7,5 % supera el umbral del 40 %, porcentaje considerado por organismos internacionales como indicador de sobrecarga de costes habitacionales @eurostat_housing_expenditure. El 20 % de la muestra no aplica este indicador por residir con familiares.

El cruce entre situación de vivienda y utilidad percibida de los gráficos muestra que la valoración positiva es consistente en todos los segmentos: tanto los encuestados en alquiler como los propietarios con hipoteca y quienes viven con familiares coinciden en valorarla como "muy útil" de forma mayoritaria. La plataforma resulta relevante independientemente del régimen de tenencia, lo que amplía su potencial público objetivo.

==== O4 — Impacto percibido de los pisos turísticos y disposición a reportar

El 60 % de los encuestados declara tener al menos un piso turístico en su edificio o calle (35 % "alguno", 25 % "varios"), un porcentaje que refleja la elevada concentración de la muestra en Canarias. Los efectos más señalados son la subida del alquiler (55 %) y la reducción de la oferta de vivienda (47,5 %), seguidos de gentrificación del barrio (25 %) y encarecimiento del comercio local (20 %). La escala de percepción de contribución a la crisis (P18) presenta una distribución polarizada, con el 25 % en el nivel máximo (5) y el 25 % en el mínimo (1), lo que resulta en una media de 3,15 sobre 5 y una mediana de 3.

#include "../99_charts/form-results/p19-reportar-pct.typ"

La disposición a reportar pisos turísticos ilegales es positiva en el 82,5 % de los casos: el 62,5 % respondería que sí de forma directa y el 20 % condicionaría su participación a garantías suficientes. Solo el 17,5 % descarta participar. Este resultado valida la funcionalidad de reportes ciudadanos como componente viable de la plataforma, con la condición de que el sistema ofrezca garantías claras de anonimato y protección al informante. Las respuestas abiertas de P21 documentan una experiencia predominantemente negativa con los pisos turísticos: proliferación en zonas residenciales, efecto de desplazamiento geográfico y ausencia de control de licencias, con Canarias como escenario central de los testimonios más detallados.

==== O5 — Experiencia con agentes inmobiliarios y demanda de reseñas verificadas

El 37,5 % de los encuestados declara haber tenido problemas con una inmobiliaria o propietario. Los tipos de problema más frecuentes son la falta de mantenimiento (20 %), las comisiones abusivas (17,5 %) y la no devolución de la fianza (12,5 %). Ante estos problemas, la mayoría no emprendió acciones: el 42,5 % declara que no sabía cómo actuar, el 25 % lo intentó pero desistió y el 22,5 % no actuó por miedo a represalias. Solo el 10 % llegó a interponer una denuncia formal. Esta pauta de inacción, coherente con los hallazgos del IDRA sobre las barreras a la reclamación en el mercado del alquiler @idra_2024, subraya la necesidad de mecanismos de denuncia accesibles y con garantías de anonimato.

La demanda de un sistema de reseñas de inmobiliarias es alta: el 70 % lo considera "muy útil" y el 22,5 % "algo útil", suma que alcanza el 92,5 %. El 92,5 % de los encuestados estaría dispuesto a dejar reseñas (52,5 % de forma anónima, 40 % con su nombre). Entre los factores de confianza en dicho sistema, el más valorado es que otros usuarios confirmen la experiencia (67,5 %), seguido de la verificación mediante contrato (57,5 %) y el anonimato (30 %). Los testimonios de P28 ilustran la dimensión humana de estos datos: las experiencias relatadas son universalmente negativas e incluyen casos de discriminación en el proceso de selección de inquilinos, presión para abandonar el piso y situaciones de extrema vulnerabilidad.

==== O6 — Necesidades funcionales desde la perspectiva del usuario

El análisis de las respuestas abiertas de P29 (33/40 respuestas válidas, 82,5 %) revela cinco categorías de demanda funcional. La más frecuente es el acceso a datos históricos de precios y su evolución temporal (33,3 % de las respuestas), que valida directamente la funcionalidad de visualización de series históricas. La segunda es la fiabilidad y verificabilidad de los datos (24,2 %), con menciones explícitas a fuentes oficiales y estadísticos de carrera, lo que subraya que el rigor metodológico en las fuentes de datos es un factor diferenciador. El sistema de reseñas de propietarios e inmobiliarias ocupa el tercer lugar (15,2 %), y la información legal y sobre ayudas al alquiler (9,1 %) emerge como una funcionalidad no prevista inicialmente en el alcance del proyecto que podría considerarse en versiones futuras. Los mapas de calor y la visualización de la proporción de pisos turísticos por zona (6,1 %) refuerzan la inclusión de los mapas coropléticos como componente central de la interfaz.

#figure(
  table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    table.header(
      [*Objetivo*],
      [*Hallazgo principal*],
      [*Dato clave*],
      [*Validación*],
    ),
    [O1], [Conocimiento medio-alto; demanda de datos independientes], [70 % estima subida de alquiler], [Sí],
    [O2], [Alta utilidad percibida; prioridad: evolución temporal y precio/m²], [92,5 % valora los gráficos útiles], [Sí],
    [O3], [60 % en alquiler o hipoteca; 35 % destina >30 % de ingresos], [27,5 % en rango 30-40 %], [Contextual],
    [O4], [60 % convive con pisos turísticos; 82,5 % dispuesto a reportar], [62,5 % reportaría directamente], [Sí],
    [O5], [37,5 % ha tenido problemas; 90 % no denunció; 92,5 % quiere reseñas], [42,5 % no sabía cómo actuar], [Sí],
    [O6], [Prioridades: datos históricos > fiabilidad > reseñas > información legal], [33,3 % pide datos históricos], [Sí],
  ),
  caption: [Síntesis de hallazgos por objetivo de investigación y validación de hipótesis de diseño.],
) <tbl:sintesis-hallazgos>

=== Conclusiones del estudio

El estudio del público objetivo, articulado en tres fases —mapas de empatía, definición de objetivos y encuesta de validación—, permite extraer un conjunto de conclusiones que orientan directamente las decisiones de diseño y desarrollo de la plataforma. Los resultados de la encuesta (N = 40) permiten pasar de las hipótesis de partida a un perfil empíricamente fundamentado, aunque con las limitaciones de muestra descritas en la sección anterior.

==== Perfil del público objetivo

La síntesis de los datos demográficos y de comportamiento dibuja un público objetivo predominantemente joven-adulto —cerca de la mitad de la muestra tiene entre 24 y 35 años—, con residencia mayoritaria en Canarias y con una exposición directa a las tensiones del mercado residencial: más del 60 % vive en alquiler o en propiedad con hipoteca, y más de un tercio destina más del 30 % de sus ingresos a vivienda. Se trata de personas con un nivel de conciencia sobre la crisis habitacional superior a la media —el 70 % puede estimar la evolución de los precios en su entorno—, que se informan principalmente a través de medios digitales y redes sociales antes que de fuentes institucionales. Su demanda no es meramente informativa: los testimonios cualitativos revelan una necesidad de datos independientes que respalden una posición crítica ante la inacción política y la falta de oferta pública.

==== Validación de los perfiles de empatía

Los seis perfiles elaborados en la fase de empatía @brown_change_2019[p.~49] se contrastan a continuación con los hallazgos de la encuesta.

*Periodista de datos.* La encuesta no permite validar ni refutar directamente este perfil, dado que ninguna pregunta recoge la ocupación de forma desagregada a ese nivel. No obstante, la demanda explícita de fiabilidad en los datos y de fuentes verificables (O6, 24,2 % de las respuestas abiertas de P29) es coherente con las necesidades de este perfil. Se considera _no refutado_ y se mantiene como público secundario de la plataforma.

*Inquilina que busca informarse.* Este perfil queda _ampliamente validado_. El 35 % de los encuestados vive en alquiler, el esfuerzo económico supera el 30 % de los ingresos en más de un tercio de la muestra, y la utilidad percibida de los gráficos interactivos es unánimemente alta (92,5 %). Las respuestas abiertas confirman además que la búsqueda de referencias de precio y el desconocimiento de los mecanismos legales son las principales fuentes de inseguridad de este segmento.

*Activista y sindicalista de vivienda.* _Validado_. La demanda de datos desagregados, la identificación de causas estructurales como la falta de vivienda pública (77,5 %) y la especulación (67,5 %), y el interés por herramientas de presión colectiva son consistentes con las necesidades de este perfil. La disposición a reportar pisos turísticos ilegales (82,5 %) y a dejar reseñas de agentes (92,5 %) apunta hacia un público predispuesto a la participación activa en la producción de datos, en línea con lo documentado por @maharawal_mcelroy_2018[p.~384].

*Joven que quiere emanciparse.* _Validado con matices_. La franja de 24-35 años (47,5 %) y la proporción de encuestados que viven con familia (12,5 %) son indicadores indirectos de la presencia de este perfil. La demanda de comparativas precio-salario (50 %) y de información sobre ayudas al alquiler (P29) encaja con la desorientación informativa descrita en el mapa de empatía. Sin embargo, la muestra no permite caracterizar con precisión la experiencia de quienes aún no se han emancipado.

*Técnico o técnica de administración local.* _No validado ni refutado_. La encuesta no incluye preguntas que permitan identificar a este perfil entre los encuestados. Su presencia en el público potencial de la plataforma sigue siendo una hipótesis razonable —dado el tipo de datos que se ofrece y la demanda de series históricas descargables—, pero queda pendiente de contraste en una fase posterior de investigación con usuarios.

*Investigador o investigadora académica.* _No validado directamente_. Al igual que el perfil técnico, la encuesta no permite identificar su presencia en la muestra. La demanda de fiabilidad metodológica y la preferencia por fuentes oficiales son coherentes con sus necesidades @navalkha_2021[p.~23], pero la encuesta está orientada al público general y no recoge las necesidades específicas de datos en formatos procesables (CSV, JSON) que caracterizan a este perfil.

==== Arquetipos de usuario

A partir de la validación anterior, los seis perfiles de partida se sintetizan en tres arquetipos que representan los segmentos con mayor presencia empírica en la muestra y mayor relevancia para las decisiones de diseño de la versión inicial de la plataforma.

*Arquetipo 1 — La ciudadana afectada.* Mujer o hombre de entre 24 y 45 años, residente en una zona con fuerte presión turística o tensión de mercado, que vive en alquiler y destina más del 30 % de sus ingresos a vivienda. Su nivel de información sobre la crisis es alto, pero accede a ella principalmente a través de medios digitales y redes sociales. Necesita referencias de precio comparables, información sobre sus derechos como inquilina y un canal accesible para denunciar abusos. Integra los perfiles _inquilina que busca informarse_ y _joven que quiere emanciparse_, que comparten las mismas herramientas de visualización y el mismo módulo de reseñas como funcionalidades prioritarias. Su relación con la plataforma es de consulta frecuente y participación ocasional.

*Arquetipo 2 — El activista de datos.* Persona de cualquier franja de edad, vinculada a organizaciones de defensa del derecho a la vivienda, sindicatos de inquilinas o colectivos vecinales. Su objetivo no es informarse sino argumentar: necesita datos desagregados geográficamente, series temporales comparables entre municipios y evidencia cuantitativa que respalde reivindicaciones ante medios e instituciones. Integra los perfiles _activista y sindicalista de vivienda_ y, en parte, _periodista de datos_. Su relación con la plataforma es instrumental: la utiliza como fuente de datos verificados para producir materiales de denuncia. Valora especialmente la transparencia metodológica y la posibilidad de exportar datos.

*Arquetipo 3 — El usuario técnico o especializado.* Perfil con formación técnica o académica —urbanismo, economía, geografía, periodismo de datos— que necesita acceder a los datos subyacentes de la plataforma en formatos procesables. Incluye a técnicos de administración local, investigadores académicos y periodistas especializados. La encuesta no aporta evidencia directa sobre este arquetipo, por lo que sus características se mantienen como hipótesis de diseño a contrastar en etapas posteriores. Su presencia justifica la decisión de exponer los datos en formatos abiertos y de documentar las fuentes con rigor metodológico.

==== Recomendaciones para el diseño

Los hallazgos del estudio, sintetizados en la @tbl:sintesis-hallazgos, permiten formular las siguientes recomendaciones concretas para el diseño de la plataforma:

+ *Priorizar la visualización de datos históricos y comparativas geográficas como funcionalidades de entrada.* La evolución temporal de precios (67,5 %) y el precio por m² entre barrios (60 %) son las comparativas más demandadas. Deben estar disponibles sin registro y ser accesibles desde la página principal, sin que el usuario deba navegar para encontrarlas.

+ *Hacer visibles y verificables las fuentes de datos en cada visualización.* La fiabilidad de los datos es el segundo factor diferenciador más mencionado en las respuestas abiertas (24,2 %). Cada gráfico debe indicar de forma explícita su fuente, fecha de actualización y metodología, como mecanismo de generación de confianza en el arquetipo ciudadano y en el usuario técnico.

+ *Diseñar el módulo de reportes con garantías de anonimato prominentes.* El 20 % de los encuestados que condicionó su disposición a reportar pisos turísticos a garantías suficientes representa un segmento recuperable con el diseño adecuado. El mensaje de anonimato debe preceder al formulario de reporte, no ser un texto auxiliar de ayuda.

+ *Incorporar un sistema de verificación por pares en las reseñas de agentes inmobiliarios.* El factor de confianza más valorado (67,5 %) es que otras personas confirmen la experiencia. El diseño del sistema de reseñas debe contemplar la validación cruzada como mecanismo central, antes que la verificación de identidad individual, para reducir la barrera de participación.

+ *Reservar un acceso a datos en formato abierto para el arquetipo técnico.* Aunque esta funcionalidad no es prioritaria para los arquetipos 1 y 2, su ausencia excluiría al arquetipo 3. Un endpoint de descarga en CSV o JSON por zona y periodo temporal, documentado con sus fuentes, cubre esta necesidad con un coste de implementación reducido y amplía significativamente el valor de la plataforma.

+ *Contemplar una sección de información legal y ayudas como extensión futura.* La demanda de información sobre derechos legales y ayudas al alquiler emerge de forma reiterada en P15 y P29 (9,1 % de las respuestas abiertas de P29), aunque queda fuera del alcance de la versión actual. Su inclusión en una versión posterior cubriría una necesidad real no atendida por las fuentes que los encuestados utilizan habitualmente.

En conjunto, los resultados confirman que las hipótesis de diseño formuladas durante la fase de empatía están fundamentadas en necesidades reales de los usuarios potenciales. Las limitaciones de la muestra —tamaño reducido, sesgo geográfico hacia Canarias y sobrerrepresentación de perfiles con conciencia política activa— no invalidan estas conclusiones para los fines del proyecto, que son de validación exploratoria en el marco de un proceso de Design Thinking @brown_change_2019, y no de inferencia estadística sobre la población general.
