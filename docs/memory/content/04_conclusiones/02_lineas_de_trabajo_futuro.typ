== Líneas de trabajo futuro

El desarrollo de este trabajo ha estado condicionado por el alcance acordado con el consultor durante la fase de planificación (P1): el núcleo funcional comprometido abarca la visualización interactiva de la evolución de precios de la vivienda, la gestión de usuarios con autenticación y roles diferenciados, y el panel de administración de la plataforma. Las funcionalidades que quedan fuera de ese alcance no representan carencias del proyecto, sino decisiones deliberadas de priorización orientadas a garantizar la calidad y la completitud del núcleo. A continuación se recogen las principales líneas de trabajo que se contemplan para versiones posteriores de la plataforma.

=== Sistema de reportes ciudadanos con moderación

La incorporación de un módulo de participación ciudadana para la documentación de irregularidades en el mercado inmobiliario constituye la línea de trabajo futuro de mayor relevancia estratégica y, al mismo tiempo, la de mayor coste de implementación estimado. Este módulo permitiría a las personas usuarias registradas comunicar situaciones de abuso —cláusulas abusivas, precios desproporcionados, condiciones insalubres— asociándolas a una localización geográfica y a un inmueble concreto. El flujo de moderación, gestionado por el perfil administrador, garantizaría la veracidad mínima de los reportes antes de su publicación. La complejidad técnica de este módulo —validación de contenido, geocodificación, interfaz de moderación, gestión del estado de los reportes— fue el motivo principal por el que el consultor recomendó su posposición, y esa recomendación se ha seguido en la planificación del curso. Su implementación futura convertiría la plataforma en un observatorio ciudadano activo, complementando los datos oficiales con evidencia directa de la realidad del mercado.

=== Sistema de reseñas inmobiliarias con valoraciones

Vinculado funcionalmente al módulo de reportes, se contempla el desarrollo de un sistema de reseñas que permita a las personas usuarias registradas publicar valoraciones sobre inmuebles o zonas geográficas. Este módulo incluiría un mecanismo de agregación de puntuaciones, filtros por tipología de inmueble y período temporal, y un proceso de moderación básico compartido con la infraestructura del módulo de reportes. La implementación de este sistema aportaría una dimensión cualitativa a los datos cuantitativos de precios ya disponibles en la plataforma, enriqueciendo el valor informativo del observatorio.

=== Indicadores estadísticos derivados y análisis avanzado

La plataforma, en su versión núcleo, presenta los datos de precios tal como se obtienen de las fuentes oficiales, con las transformaciones necesarias para su normalización y visualización. Una línea de trabajo futura de interés consiste en incorporar indicadores derivados —esfuerzo de acceso a la vivienda en relación con los salarios medios por zona, ratio precio-alquiler, índices de asequibilidad— que permitan una lectura más directa del impacto de los precios sobre la población. Estos indicadores requerirían cruzar las fuentes de datos del Ministerio de Vivienda con los datos salariales del INE y la Agencia Tributaria, y añadir una capa de cálculo en el proceso ETL.

=== Ampliación de la cobertura de datos y fuentes complementarias

El proceso ETL desarrollado en este trabajo se apoya en las fuentes oficiales del Ministerio de Vivienda y Agenda Urbana (MIVAU/SERPAVI), el INE y el Catastro. Una extensión natural consiste en incorporar datos complementarios procedentes de portales inmobiliarios —de forma puntual y dentro del marco legal, operando únicamente sobre datos de acceso público— para obtener una imagen más actualizada y granular de los precios de mercado, que en ocasiones divergen de los índices oficiales por el desfase inherente a su periodicidad trimestral.

=== Internacionalización y accesibilidad lingüística

La plataforma se ha desarrollado íntegramente en español. Una versión futura podría incorporar soporte para el catalán, el euskera y el gallego, lenguas cooficiales en los territorios con mayor presión del mercado inmobiliario, así como una versión en inglés orientada a la ciudadanía extranjera residente en España. Esta línea de trabajo implicaría la integración de un sistema de internacionalización (i18n) en la capa de presentación y la revisión de los textos de la interfaz.
