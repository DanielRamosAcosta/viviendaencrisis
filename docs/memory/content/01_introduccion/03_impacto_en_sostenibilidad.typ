== Impacto en sostenibilidad, ético-social y de diversidad <sec:impacto_sostenibilidad>

La Competencia de Compromiso Ético y Global (CCEG) de la UOC exige que todo Trabajo Final de Máster identifique y evalúe de forma explícita los impactos positivos y negativos del proyecto en tres dimensiones interrelacionadas: la sostenibilidad medioambiental, el comportamiento ético y la responsabilidad social, y la diversidad y los derechos humanos. Esta exigencia no es meramente formal. En un proyecto cuyo objeto es la transparencia del mercado de la vivienda, estas tres dimensiones no son periféricas al problema central, sino constitutivas de él: la crisis habitacional española es, simultáneamente, un problema ecológico —por el modelo urbanístico que la generó—, un problema ético —por la vulneración sistemática del derecho a una vivienda digna y las condiciones de exclusión social que genera— y un problema de derechos humanos —por los colectivos que la sufren con mayor intensidad—. Las secciones siguientes desarrollan cada una de estas dimensiones, identifican los impactos que el proyecto "Vivienda en Crisis" tiene sobre ellas, y establecen los compromisos de mitigación y mejora que guiarán su desarrollo.

La alineación con los Objetivos de Desarrollo Sostenible (ODS) de la Agenda 2030 de Naciones Unidas vertebra este análisis. Los ODS constituyen un marco de referencia reconocido internacionalmente que permite situar los impactos de un proyecto de tecnología cívica en el contexto más amplio de la transformación social. En particular, los ODS 10 (Reducción de las desigualdades), 11 (Ciudades y comunidades sostenibles) y 16 (Paz, justicia e instituciones sólidas) son los más directamente pertinentes para este trabajo, aunque su impacto alcanza también, de forma secundaria, al ODS 5 (Igualdad de género) y al ODS 1 (Fin de la pobreza).

=== Sostenibilidad medioambiental

==== Huella directa y estrategia de mitigación

El impacto ambiental directo de una plataforma web de datos es, por naturaleza, limitado. A diferencia de proyectos de ingeniería con componentes físicos, el desarrollo de software no genera residuos materiales, no consume materias primas no renovables en su fase de explotación, y no produce emisiones directas de gases de efecto invernadero. No obstante, la huella digital de la infraestructura tecnológica no es nula: los centros de procesamiento de datos (CPD) que alojan aplicaciones web consumen energía eléctrica de forma continua, y en España la proporción de energías renovables en el mix eléctrico, aunque creciente, no garantiza la neutralidad de carbono de la infraestructura digital. En consecuencia, toda aplicación en producción tiene una huella de carbono operacional que conviene reconocer y minimizar.

Para mitigar este impacto, el proyecto adopta una estrategia de despliegue eficiente basada en tres principios:

+ *Infraestructura con credenciales ambientales verificables.* Se priorizarán proveedores como Scaleway (grupo iliad), que alimenta sus centros de datos con energía 100% renovable de origen eólico o hidroeléctrico, mantiene un PUE medio de 1,37 —frente al 1,55 de la media del sector— y obtuvo la medalla de oro de EcoVadis en 2024, situándose en el 5% de empresas más sostenibles evaluadas @scaleway_environment_2025.

+ *Arquitectura _serverless_ para el backend.* Según la revisión sistemática de Akour y Alenezi, este paradigma reduce el consumo energético respecto a los despliegues tradicionales al mitigar la sobreaprovisión de recursos y escalar la computación estrictamente en función de la demanda @akour_serverless_2025.

+ *Ingesta periódica de datos frente a consultas en tiempo real.* La arquitectura de datos se diseñará con procesos de carga programada, lo que reduce la carga computacional sostenida en servidores.

Estas decisiones de arquitectura no tienen únicamente una motivación de rendimiento técnico, sino también una dimensión ambiental explícita.

==== Huella ambiental del uso de inteligencia artificial generativa

Un aspecto específico que conviene reconocer es el uso de inteligencia artificial generativa como herramienta de asistencia durante el desarrollo de este trabajo —revisión de textos, consulta técnica y asistencia en la escritura de código—. El modelo utilizado es Claude, de Anthropic, cuya inferencia se ejecuta mayoritariamente sobre la infraestructura de AWS (proyecto Rainier: aproximadamente un millón de procesadores Trainium 2 distribuidos en tres estados de EE.UU., con un consumo estimado de 1 GW) @semafor_rainier_2025, siendo Google Cloud su segundo proveedor de infraestructura @anthropic_gcp_2025. Aunque tanto AWS como Google Cloud publican compromisos de neutralidad de carbono y uso de energías renovables, la evidencia disponible cuestiona la solidez de estas declaraciones. O'Rourke —quien trabajó como _senior principal scientist_ en Amazon entre 2016 y 2022— señala que la descarbonización corporativa de la compañía se ha basado fundamentalmente en innovaciones incrementales insuficientes para alcanzar sus propios objetivos climáticos @orourke_amazon_2025. Carbone 4, consultora francesa especializada en contabilidad de carbono, ha documentado que los tres grandes hiperescalares (AWS, Google Cloud y Microsoft Azure) emplean una contabilidad _market-based_ —basada en la compra de certificados de energía renovable— que no refleja las emisiones físicas reales de sus centros de datos @carbone4_cloud_2022. Su informe de 2024 constató que, lejos de reducirse, las emisiones _location-based_ de los tres proveedores aumentaron en 2023 (Google: +12%, Microsoft: +22%, Amazon: +2%), a un ritmo diez veces inferior al necesario para cumplir los compromisos del Acuerdo de París @carbone4_cloud_2024. Este impacto es inherente al uso de herramientas de IA generativa en cualquier proyecto contemporáneo y, si bien no es eliminable, conviene hacerlo explícito como parte de la huella ambiental total del trabajo.

No obstante, la elección del modelo no es indiferente desde el punto de vista ambiental. El _benchmark_ de eco-eficiencia de Jegham et al. —que combina el rendimiento en razonamiento con el coste energético, hídrico y de carbono de la inferencia— sitúa a Claude 3.7 Sonnet en el tercer puesto del ranking de eco-eficiencia (0,825 sobre 1), solo por detrás de o3-mini (0,884) y o1-mini (0,836), mientras que DeepSeek-R1 alcanza los 29 Wh por prompt largo, unas 65 veces el consumo del modelo más eficiente evaluado @jegham_hungry_ai_2025. En términos de perspectiva comparada, Ren et al. demuestran que, para una misma producción textual, el impacto ambiental de un LLM típico es entre 40 y 150 veces inferior al del trabajo humano equivalente en Estados Unidos —ratio que se amplía hasta 1.200--4.400 veces para modelos ligeros— considerando energía, emisiones de carbono y consumo de agua @ren_reconciling_2024. Estos datos no anulan la huella ecológica del uso de IA, pero la contextualizan: la asistencia de un LLM eficiente durante el desarrollo de un TFM tiene un impacto ambiental sustancialmente menor que el de las alternativas humanas equivalentes para las mismas tareas de consulta, revisión y generación de código.

==== Impacto positivo indirecto

El impacto positivo indirecto del proyecto en materia de sostenibilidad es, en cambio, potencialmente más significativo. La transparencia en los datos de vivienda contribuye a decisiones urbanas más informadas, tanto por parte de la ciudadanía como de las administraciones locales. El modelo urbanístico expansivo que caracterizó la España de la "década prodigiosa" (1997-2006) —con la producción masiva de viviendas en la periferia urbana y el uso intensivo del suelo como recurso especulativo— es uno de los factores estructurales que generaron la burbuja inmobiliaria y que dejaron un legado de insostenibilidad urbana @burriel_2008. Una plataforma que visibilice la evolución territorial de los precios puede contribuir, indirectamente, a identificar patrones de presión en mercados específicos y a fundamentar políticas de contención que reduzcan la expansión hacia nuevas superficies urbanizables.

Asimismo, la dimensión energética de la crisis habitacional merece una atención específica. El Proyecto ReHousin de la ICTA-UAB señala que hasta el 28% de los hogares españoles se encuentran en situación de pobreza energética @matheney_rehous_2025, entendida como la incapacidad de mantener el hogar a una temperatura adecuada o de acceder a servicios energéticos básicos por razones económicas. La pobreza energética está estrechamente vinculada a la calidad del parque residencial y a la capacidad adquisitiva de los hogares, que a su vez depende de la carga que supone el pago de la vivienda. Al hacer visibles estos datos y al permitir el contraste entre precios de vivienda y capacidad económica de los hogares, "Vivienda en Crisis" puede contribuir a identificar territorios con mayor vulnerabilidad energética. Este impacto positivo se alinea con el ODS 11 (ciudades y comunidades sostenibles) y con el ODS 7 (energía asequible y no contaminante).

=== Comportamiento ético y responsabilidad social

El impacto más directo del proyecto en la dimensión ético-social reside en su contribución a reducir la asimetría informativa del mercado de la vivienda, documentada académicamente y reconocida por las instituciones como un problema estructural. Como se ha expuesto en la @sec:contexto, el informe del IDRA señaló en 2024 que superar la opacidad del mercado del alquiler es una condición necesaria para garantizar los derechos de la ciudadanía inquilina @idra_2024, y la investigación de Civio identificó que el 10% de los alquileres formalizados en España está controlado por apenas 737 megatenedores, una concentración que no es rastreable mediante fuentes públicas @civio_megatenedores_2024. La democratización del acceso a esta información es, por tanto, un acto de responsabilidad social con implicaciones concretas para el ejercicio de derechos.

La transparencia de datos como bien público tiene un fundamento normativo reforzado. El artículo 47 de la Constitución Española establece el derecho a una vivienda digna y adecuada como mandato a los poderes públicos. La Ley 12/2023, de 24 de mayo, por el derecho a la vivienda, reconoció expresamente la necesidad de mejorar la transparencia del mercado como condición para el ejercicio efectivo de este derecho @ley_vivienda_2023. El Relator Especial de Naciones Unidas sobre vivienda adecuada ha denunciado reiteradamente la financiarización del sector como un obstáculo sistémico para la justicia habitacional @rajagopal_2021. En este contexto, una plataforma que integre datos oficiales dispersos en un formato accesible e interactivo tiene una función análoga a la de otros instrumentos de transparencia pública: contribuye al ODS 16 (paz, justicia e instituciones sólidas) al fortalecer la capacidad de la ciudadanía de controlar el cumplimiento de las políticas públicas en materia de vivienda.

El sistema de reportes ciudadanos incorpora, no obstante, riesgos éticos que deben ser gestionados con rigor. El principal riesgo es la exposición no consentida de datos personales o identificativos a través de los reportes enviados por la ciudadanía. Para mitigarlo, el diseño del módulo de reportes incluye las siguientes salvaguardas: los reportes no publicarán datos identificativos de personas físicas (propietarios, inquilinos o administradores de fincas) sin su consentimiento expreso; los reportes tendrán un flujo obligatorio de moderación antes de su publicación, gestionado por el perfil administrador de la plataforma; y el sistema se diseñará en cumplimiento del Reglamento General de Protección de Datos (RGPD) y de la Ley Orgánica 3/2018, de Protección de Datos Personales y garantía de los derechos digitales. Un segundo riesgo ético es la posibilidad de que los datos de la plataforma sean utilizados por actores con intereses especulativos para identificar zonas con menor presión de precios y anticipar procesos de gentrificación. Este riesgo es inherente a cualquier herramienta de datos abiertos y difícilmente eliminable, pero puede mitigarse mediante una comunicación transparente sobre los usos previstos y las limitaciones metodológicas de los datos publicados.

La plataforma no está diseñada para reemplazar la investigación académica ni el periodismo especializado, sino para empoderar a tres tipos de actores que actualmente carecen de acceso sistemático a datos integrados: la ciudadanía en general, que puede consultar la evolución de precios en su zona sin necesidad de formación técnica; las organizaciones de la sociedad civil y los sindicatos de inquilinos, que pueden fundamentar sus demandas con evidencia cuantitativa; y los representantes locales de pequeños municipios, que carecen de los recursos para contratar servicios de análisis de datos inmobiliarios. Este foco en la equidad informativa es coherente con la concepción de los datos abiertos como instrumento de justicia, documentada en la literatura de tecnología cívica @navalkha_2021 @maharawal_mcelroy_2018.

=== Diversidad y derechos humanos

La crisis de la vivienda no afecta de forma homogénea a toda la población. Su impacto se distribuye de manera profundamente desigual en función del género, la edad, el origen étnico y nacional, y la situación socioeconómica. El reconocimiento de esta dimensión diferencial no es accesorio respecto al diseño técnico del proyecto, sino que debe orientarlo: una plataforma que ignora estas desigualdades reproduce, aunque de forma involuntaria, las invisibilizaciones estructurales que caracterizan la producción de datos sobre vivienda.

Desde la perspectiva de género, los datos disponibles revelan una vulnerabilidad específica de los hogares encabezados por mujeres. El informe de Provivienda sobre el derecho a la vivienda de las mujeres (2023) documentó que el 33% de los hogares con mujer sustentadora principal cae en situación de pobreza relativa tras el pago de los gastos de vivienda —proporción que se eleva hasta el 59% entre quienes pagan alquiler a precio de mercado—, frente al 25% en los hogares encabezados por hombres @provivienda_genero_2023. Según datos del INE (ECV 2024), el 80,7% de las familias monoparentales está encabezado por mujeres @provivienda_observatorio_monoparentales_2024, lo que convierte la intersección entre monoparentalidad y precariedad habitacional en una de las formas más severas de vulnerabilidad residencial en España. Esta interseccionalidad —género, estructura familiar, situación en el mercado laboral— es constitutiva del problema habitacional y debe estar presente en la forma en que se diseñan las visualizaciones y los indicadores de la plataforma. El ODS 5 (igualdad de género) y el ODS 10 (reducción de las desigualdades) establecen el marco normativo internacional pertinente.

La situación de las personas jóvenes, descrita ya en la @sec:contexto, presenta un carácter estructural que va más allá de la dificultad temporal de acceso. La tasa de emancipación del 15,2% en el segundo semestre de 2024 @cje_emancipacion_2024 no refleja únicamente una situación de mercado, sino el resultado acumulado de condiciones laborales precarias, ausencia de parque público de vivienda asequible y una estructura de propiedad concentrada que ha excluido progresivamente a las generaciones más jóvenes de la posibilidad de acceder a la vivienda en condiciones dignas. La plataforma puede contribuir a visibilizar esta realidad mediante el contraste explícito entre los precios de mercado y los indicadores salariales de los grupos de edad más vulnerables al sobreesfuerzo habitacional.

La discriminación en el acceso a la vivienda por razones de origen étnico o nacional constituye uno de los impactos más graves de la crisis habitacional desde la perspectiva de los derechos humanos. El informe "¿Se alquila? (2)" de Provivienda (2025) documentó que el 99% de las inmobiliarias participantes en el estudio aceptaron sin objeción la solicitud de excluir a personas de determinados orígenes étnicos o nacionales de los procesos de arrendamiento @provivienda_discriminacion_2025. Esta práctica, que vulnera de forma flagrante el principio de no discriminación consagrado en el artículo 14 de la Constitución Española y en la normativa europea de igualdad de trato, revela hasta qué punto la asimetría informativa opera como un instrumento de exclusión selectiva: quienes carecen de redes informales de acceso al mercado de la vivienda y dependen de intermediarios inmobiliarios son especialmente vulnerables a la discriminación estructural. El sistema de reportes ciudadanos de "Vivienda en Crisis" puede constituir un canal de documentación de este tipo de situaciones, contribuyendo a la visibilidad de prácticas que habitualmente no dejan rastro administrativo.

El Relator Especial sobre la pobreza extrema de Naciones Unidas, en su informe sobre su visita a España en 2020, señaló que la crisis habitacional afecta de forma desproporcionada a las personas en situación de mayor vulnerabilidad económica y social, e instó al Estado español a adoptar medidas urgentes para dar sustancia al derecho a la vivienda como derecho humano @alston_spain_2020. Esta dimensión de derechos humanos no es ajena a un proyecto de tecnología cívica: la accesibilidad de la información sobre el mercado de la vivienda es una condición necesaria —aunque no suficiente— para que los colectivos más vulnerables puedan conocer y exigir sus derechos.

El compromiso de accesibilidad web de la plataforma tiene una dimensión directamente vinculada a esta dimensión de diversidad funcional. Como se ha establecido en la @sec:objetivos, el proyecto asume el compromiso de implementar las Pautas de Accesibilidad al Contenido Web (WCAG 2.1) en su nivel AA, garantizando que la plataforma resulte usable por personas con diversidad funcional: visual, auditiva, motora o cognitiva. Este compromiso no es únicamente técnico, sino ético: una plataforma que facilita el ejercicio del derecho a la vivienda pero que es inaccesible para personas con diversidad funcional reproduce, en su propia arquitectura, la exclusión que pretende combatir en el mercado inmobiliario. El cumplimiento de este requisito será verificado en las fases de desarrollo correspondientes.

Finalmente, el propio diseño de la interfaz y la comunicación de los datos incorporará principios de diseño inclusivo: lenguaje accesible para personas sin formación técnica o estadística, visualizaciones con alternativas textuales para lectores de pantalla, paletas de colores compatibles con distintos tipos de daltonismo, y una navegación coherente con los estándares de accesibilidad. Asimismo, la redacción de los contenidos de la plataforma utilizará formas de lenguaje inclusivo que no invisibilicen a ningún género ni grupo social, de acuerdo con las recomendaciones de la UOC para el tratamiento de la diversidad en materiales académicos y digitales.

=== Síntesis de impactos

#figure(
  table(
    columns: (1fr, 1.5fr, 1.5fr, 1.5fr),
    align: (left, left, left, left),
    stroke: 0.5pt + luma(180),
    fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
    table.header(
      [*Dimensión*], [*Impacto positivo*], [*Impacto negativo / Riesgo*], [*Medidas de mitigación*],
    ),
    [Sostenibilidad medioambiental],
    [Contribución indirecta a decisiones urbanas más sostenibles (ODS 11). Visibilidad de la pobreza energética (ODS 7).],
    [Huella de carbono operacional del alojamiento web. Huella ambiental del uso de IA generativa durante el desarrollo.],
    [Despliegue en proveedores con energía renovable verificable. Arquitectura _serverless_ para reducir sobreaprovisión. Ingesta periódica de datos frente a consultas en tiempo real. Elección de un modelo de IA con alto índice de eco-eficiencia.],

    [Comportamiento ético y RS],
    [Reducción de la asimetría informativa del mercado (ODS 16). Empoderamiento de ciudadanía, organizaciones sociales y administraciones locales. Transparencia sobre concentración de propiedad.],
    [Posible uso especulativo de los datos publicados. Riesgo de exposición de datos personales en reportes ciudadanos.],
    [Moderación de reportes antes de publicación. Diseño conforme al RGPD. Comunicación explícita de limitaciones metodológicas de los datos.],

    [Diversidad y derechos humanos],
    [Visibilidad de las desigualdades habitacionales por género, edad y origen (ODS 5, ODS 10). Canal de documentación de la discriminación en el acceso a la vivienda. Accesibilidad para personas con diversidad funcional.],
    [La plataforma no elimina las desigualdades estructurales, solo las visibiliza. Riesgo de infrarepresentación de colectivos con menor acceso digital.],
    [Diseño inclusivo y accesibilidad WCAG 2.1 AA. Lenguaje inclusivo. Datos desagregados por colectivos vulnerables siempre que las fuentes lo permitan.],
  ),
  caption: [Síntesis de impactos del proyecto en las tres dimensiones de la Competencia de Compromiso Ético y Global (CCEG) de la UOC.],
) <tabla:impactos-cceg>

=== Alineación con los Objetivos de Desarrollo Sostenible

#figure(
  table(
    columns: (1.8fr, 2.5fr, 1fr),
    align: (left, left, center),
    stroke: 0.5pt + luma(180),
    fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
    table.header(
      [*Funcionalidad del proyecto*], [*Contribución*], [*ODS*],
    ),
    [Visualización de evolución temporal de precios de alquiler y compraventa],
    [Informa a la ciudadanía sobre la evolución del mercado. Permite identificar tendencias de tensión territorial.],
    [ODS 10, ODS 11],

    [Comparativas entre zonas y precio por m²],
    [Visibiliza las desigualdades geográficas en el acceso a la vivienda. Apoya políticas de equilibrio territorial.],
    [ODS 10, ODS 11],

    [Contraste de precios con indicadores salariales],
    [Evidencia la brecha entre evolución de precios y capacidad adquisitiva. Fundamenta demandas de regulación.],
    [ODS 1, ODS 8, ODS 10],

    [Mapas coropléticos por comunidad autónoma y municipio],
    [Facilita la identificación de zonas con mayor vulnerabilidad habitacional. Apoya la declaración de zonas tensionadas.],
    [ODS 11, ODS 16],

    [Sistema de reportes ciudadanos con moderación],
    [Documenta situaciones de abuso e irregularidad. Empodera a colectivos con menor acceso a asesoramiento jurídico.],
    [ODS 16, ODS 10],

    [Acceso público sin registro a datos y visualizaciones],
    [Elimina barreras de acceso a la información. Garantiza que los colectivos con menor alfabetización digital puedan acceder.],
    [ODS 10, ODS 16],

    [Accesibilidad web WCAG 2.1 nivel AA],
    [Garantiza el uso por personas con diversidad funcional. Cumple el mandato de no discriminación digital.],
    [ODS 10],
  ),
  caption: [Alineación de las funcionalidades de "Vivienda en Crisis" con los Objetivos de Desarrollo Sostenible de la Agenda 2030.],
) <tabla:ods-funcionalidades>
