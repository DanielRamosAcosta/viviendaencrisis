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

// TODO

=== Elaboración y distribución de la encuesta

// TODO

=== Análisis de los resultados

// TODO

=== Conclusiones del estudio

// TODO
