== Definición de las personas usuarias y sus necesidades <sec:personas-usuarias>

La fase _Definir_ del proceso de Design Thinking tiene como propósito sintetizar los hallazgos de la investigación exploratoria en representaciones concretas y accionables que orienten las decisiones de diseño @brown_change_2019[p.~65]. Los tres arquetipos identificados en el estudio del público objetivo (@sec:publico-objetivo) —la ciudadana afectada, el activista de datos y el usuario técnico o especializado— proporcionan una base empírica suficiente para construir personas usuarias: perfiles semifictícios que encarnan los objetivos, motivaciones, frustraciones y comportamientos de cada segmento en un individuo concreto y reconocible.

A partir de esos tres arquetipos validados por la encuesta (N = 40), se han construido tres personas principales. Se añaden dos perfiles secundarios correspondientes a segmentos cuya presencia en la muestra no fue suficiente para una validación directa, pero que tampoco quedaron refutados: el de la periodista de datos y el del jubilado propietario. Estos dos perfiles amplían el espectro de necesidades que la plataforma puede atender y garantizan que las decisiones de diseño no los excluyan involuntariamente. La @fig:user-personae ofrece una vista de conjunto de las cinco personas elaboradas en el tablero colaborativo de FigJam.

#figure(
  image("/images/user-personae.png", width: 100%),
  caption: [Tablero de personas usuarias elaborado en FigJam. Se presentan las tres personas principales (Marina, Alejandro y Pablo) y las dos secundarias (Elena y Antonio), con sus datos demográficos, motivaciones, frustraciones y nivel de competencia técnica. Cada persona tiene correspondencia directa con un arquetipo identificado en el estudio del público objetivo (@sec:publico-objetivo).],
) <fig:user-personae>

Cada persona fue verificada individualmente contra los datos de la encuesta, contrastando que los atributos asignados —esfuerzo económico en vivienda, fuentes de información, disposición a reportar, demanda de funcionalidades— fueran coherentes con los hallazgos cuantitativos y cualitativos documentados en la sección anterior. A continuación se describe cada perfil de forma sintética, destacando los aspectos más relevantes para las decisiones de diseño.

=== Personas principales

==== Marina Delgado — La ciudadana afectada

Marina tiene 29 años, vive de alquiler en un piso compartido en Santa Cruz de Tenerife y trabaja como diseñadora UX/UI. Destina entre el 30 y el 40 % de sus ingresos a vivienda, lo que la sitúa en el umbral de sobrecarga de costes habitacionales definido por organismos internacionales @eurostat_housing_expenditure. Corresponde al _arquetipo 1_ identificado en el estudio del público objetivo.

Su motivación principal es saber si el precio que paga por su habitación es razonable comparado con la media de su zona y anticipar posibles subidas mediante la consulta de la evolución histórica de precios. Ha tenido experiencias negativas con una inmobiliaria —comisiones abusivas— pero no las denunció por miedo a represalias, un patrón que el estudio de la encuesta identifica como mayoritario entre quienes han sufrido problemas similares (42,5 % no sabía cómo actuar; 22,5 % no actuó por miedo). Su nivel de competencia técnica es alto en todos los ámbitos evaluados, lo que la convierte en una usuaria cómoda con interfaces digitales complejas siempre que estas no requieran conocimientos especializados.

Para este perfil, la plataforma debe ofrecer comparativas de precio inmediatamente accesibles desde la página principal, sin registro previo, con una indicación visible de la fuente y la fecha de actualización de cada dato. El módulo de reportes debe presentar las garantías de anonimato de forma prominente, antes del formulario, dado que la experiencia previa con represalias condiciona directamente la disposición a participar.

==== Alejandro Ruiz — El activista de datos

Alejandro tiene 38 años, vive en propiedad con hipoteca en Las Palmas de Gran Canaria y trabaja como analista de datos en una ONG de derechos sociales. Participa activamente en un sindicato de inquilinas y prepara informes mensuales sobre la situación del mercado residencial en su ciudad. Corresponde al _arquetipo 2_.

Su motivación central no es informarse, sino argumentar: necesita datos desagregados geográficamente —a nivel de municipio y, en la medida de lo posible, de barrio— para respaldar campañas de presión ante instituciones y medios de comunicación. Su frustración principal reside en que los datos del MIVAU se distribuyen en boletines PDF de difícil procesamiento y en que las fuentes institucionales rara vez ofrecen series en formatos reutilizables. La disposición a reportar pisos turísticos ilegales y a dejar reseñas de agentes inmobiliarios es, en este caso, máxima: se trata de funcionalidades que se alinean directamente con su actividad profesional y militante.

El valor diferencial de la plataforma para este arquetipo reside en la posibilidad de descargar los datos subyacentes en CSV o JSON, en la documentación explícita de las fuentes y la metodología, y en la disponibilidad de series temporales comparables entre municipios. La transparencia metodológica no es un complemento opcional para este perfil: es el criterio que determina si los datos pueden emplearse en un informe de denuncia o no.

==== Pablo Navarro — El usuario técnico

Pablo tiene 32 años, vive de alquiler en Las Palmas de Gran Canaria y trabaja como programador backend. Destina también entre el 30 y el 40 % de sus ingresos al alquiler y está evaluando si le compensa comprar o continuar en régimen de arrendamiento. Corresponde al _arquetipo 3_.

Su demanda es técnicamente más exigente que la de Marina: busca gráficos interactivos con capacidad de filtrado por zona, tipo de vivienda y periodo, comparativas de precio por m² entre barrios y datos sobre la relación precio-salario en su zona. Se informa a través de YouTube, podcasts de economía y foros especializados, y echa en falta datos oficiales bien presentados y centralizados. Su competencia técnica es muy alta en todos los ámbitos evaluados.

Para este perfil, la plataforma debe ofrecer visualizaciones con drill-down, acceso a los datos en formatos abiertos y documentación de las fuentes con rigor suficiente para que puedan emplearse como base de análisis propios. La ausencia de cualquiera de estos elementos reduciría la plataforma, a los ojos de este arquetipo, a un tablero informativo sin valor analítico añadido.

=== Personas secundarias

Los dos perfiles siguientes no cuentan con validación directa en la encuesta, dado que la muestra no permite identificar su presencia de forma estadísticamente significativa. No obstante, ninguno de los dos fue refutado, y su exclusión del proceso de diseño podría generar decisiones que los penalicen de forma involuntaria. Se mantienen como hipótesis de diseño a contrastar en fases posteriores de investigación con usuarios.

==== Elena Marín — La periodista investigadora

Elena tiene 36 años, vive de alquiler en Madrid y trabaja como periodista de investigación en un medio digital especializado en datos. Su motivación principal es producir reportajes verificables sobre la crisis de vivienda con datos trazables que pueda integrar directamente en sus piezas. La urgencia editorial y la necesidad de verificar fuentes bajo presión de plazos definen su relación con cualquier herramienta de datos: si la fuente no es inmediatamente verificable o los datos no son exportables en un formato estándar, la herramienta no resulta útil para este perfil.

Su presencia en el diseño justifica que cada visualización incluya un enlace directo a la fuente original, que las imágenes sean descargables en alta resolución y que la metodología de cálculo de los índices presentados sea accesible sin necesidad de navegar a una sección auxiliar. La demanda de fiabilidad y verificabilidad documentada en las respuestas abiertas de la encuesta (24,2 % de las respuestas válidas de P29) es coherente con las necesidades de este perfil, aunque no puede atribuirse exclusivamente a él.

==== Antonio García — El jubilado propietario

Antonio tiene 67 años, vive en propiedad sin hipoteca en Santa Cruz de Tenerife y está jubilado. Su motivación no es económica en sentido estricto: quiere comprender cómo ha cambiado su barrio en los últimos años y disponer de datos concretos —número de pisos turísticos, proporción con licencia, evolución de precios— que le permitan fundamentar sus preocupaciones ante la comunidad de vecinos. Su nivel de competencia técnica es bajo en todos los ámbitos evaluados, lo que lo convierte en el perfil con mayor riesgo de exclusión si la plataforma prioriza la densidad de información sobre la legibilidad.

Su presencia en el diseño actúa como restricción de accesibilidad: cualquier funcionalidad que no resulte comprensible para este perfil sin formación técnica previa requiere una revisión en su forma de presentación. Esto no implica simplificar los datos subyacentes, sino cuidar la jerarquía visual, los textos explicativos asociados a cada gráfico y la progresividad en la exposición de la información.

=== Síntesis y conexión con las recomendaciones de diseño

Las cinco personas usuarias, consideradas en conjunto, permiten concretar las recomendaciones formuladas al término del estudio del público objetivo. La @tbl:personas-funcionalidades cruza cada persona con las funcionalidades de la plataforma que resultan prioritarias para su perfil, con el fin de orientar las decisiones de priorización durante la fase de implementación.

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (left, left, left),
    table.header(
      [*Persona*],
      [*Arquetipo*],
      [*Funcionalidades prioritarias*],
    ),
    [Marina Delgado], [Ciudadana afectada],
      [Comparativas de precio sin registro; módulo de reportes con anonimato prominente; reseñas de agentes inmobiliarios],
    [Alejandro Ruiz], [Activista de datos],
      [Descarga en CSV/JSON; series temporales por municipio; documentación de fuentes y metodología],
    [Pablo Navarro], [Usuario técnico],
      [Visualizaciones interactivas con filtrado; precio/m² entre barrios; relación precio-salario; datos en formatos abiertos],
    [Elena Marín], [Secundario — periodista],
      [Fuentes verificables por visualización; exportación de imágenes; metodología accesible directamente],
    [Antonio García], [Secundario — propietario],
      [Jerarquía visual clara; textos explicativos en cada gráfico; progresividad en la exposición de la información],
  ),
  caption: [Correspondencia entre personas usuarias y funcionalidades prioritarias de la plataforma. Los perfiles secundarios actúan como restricciones de diseño complementarias a los tres arquetipos principales.],
) <tbl:personas-funcionalidades>

Esta correspondencia no implica que cada funcionalidad esté pensada exclusivamente para un perfil. Las comparativas de precio que Marina necesita para verificar su alquiler son exactamente las mismas que Pablo emplea para su análisis de compra-venta, y la exigencia de fuentes verificables de Elena refuerza la demanda de transparencia metodológica que Alejandro también requiere. La diversidad de perfiles confluye, en definitiva, en un conjunto coherente de principios de diseño: accesibilidad sin sacrificar rigor, transparencia de fuentes en cada visualización, participación ciudadana con garantías de anonimato y datos exportables en formatos abiertos.
