== Definición del diagrama de flujo de la aplicación <sec:diagrama-flujo>

El sitemap v1.2 (@sec:arquitectura-informacion) establece la estructura de la información y los destinos de navegación de la plataforma, pero no describe la lógica de interacción que un usuario sigue para completar una tarea concreta. Los diagramas de flujo de usuario cubren ese nivel de detalle: modelan los recorridos paso a paso, las decisiones que el sistema plantea al usuario, los estados intermedios y las bifurcaciones hacia situaciones de error o de recuperación. Su elaboración en esta fase, con anterioridad al prototipado, permite identificar y resolver inconsistencias de diseño antes de que se materialicen en pantallas concretas, reduciendo el coste de las correcciones posteriores.

Los nueve diagramas elaborados parten directamente de las cinco personas usuarias definidas en @sec:personas-usuarias. Cada flujo se construye respondiendo a la pregunta de qué recorrido seguiría una persona concreta para satisfacer una necesidad identificada en su perfil. De este modo, los flujos no son abstracciones genéricas, sino representaciones de uso situadas en un contexto real: Marina Delgado consultando si el precio de su alquiler es razonable, Alejandro Ruiz descargando una serie de datos para un informe de denuncia, o Antonio García tratando de entender cómo ha evolucionado el precio en su barrio sin necesidad de formación técnica previa. Se distinguen dos categorías: flujos principales, que cubren las tareas centrales de la plataforma, y flujos secundarios o transversales, que dan soporte a los anteriores. Todos los diagramas contemplan tanto el recorrido exitoso (_happy path_) como los estados de error, las validaciones de formulario y los caminos de recuperación (_unhappy paths_), en coherencia con la indicación metodológica recibida de la profesora responsable de la asignatura.

#figure(
  table(
    columns: (1fr, auto, auto, 1fr),
    align: (left, center, center, left),
    table.header(
      [*Flujo*],
      [*Tipo*],
      [*Autenticación*],
      [*Personas principales*],
    ),
    [1. Exploración de precios],        [Principal],    [No],       [Marina Delgado, Pablo Navarro, Antonio García],
    [2. Comparativa entre zonas],        [Principal],    [No],       [Pablo Navarro, Marina Delgado],
    [3. Reporte de irregularidad],       [Principal],    [Sí],       [Marina Delgado, Alejandro Ruiz],
    [4. Reseña de agente inmobiliario],  [Principal],    [Sí],       [Marina Delgado, Alejandro Ruiz],
    [5. Consultar reportes y mapa],      [Principal],    [No],       [Antonio García, Marina Delgado, Alejandro Ruiz],
    [6. Consultar reseñas de agentes],   [Principal],    [No],       [Marina Delgado, Antonio García],
    [7. Descarga de datos abiertos],     [Secundario],   [No],       [Alejandro Ruiz, Elena Marín, Pablo Navarro],
    [8. Autenticación],                  [Transversal],  [—],        [Todos los perfiles],
    [9. Gestión de cuenta],              [Secundario],   [Sí],       [Marina Delgado, Alejandro Ruiz],
  ),
  caption: [Resumen de los nueve diagramas de flujo de usuario de la plataforma Vivienda en Crisis. La columna «Autenticación» indica si el flujo requiere sesión activa («Sí»), si es accesible sin registro («No») o si actúa como mecanismo de soporte para otros flujos («—»).],
) <tbl:flujos-usuario>

=== Descripción de los flujos

*Flujo 1 — Exploración de precios.* El punto de entrada es el panel de inicio (_Home_), que integra un buscador por zona como acceso directo a cualquier sección. El usuario introduce una zona de interés, accede a la vista de evolución temporal de precios —con posibilidad de alternar entre gráfico y mapa mediante un _toggle_ integrado, en coherencia con la decisión del sitemap v1.2 de no mantener _Mapas_ como sección independiente— y aplica filtros de periodo y tipo de vivienda. Desde esta vista se accede también a los indicadores de asequibilidad y a la variante de comparación entre datos oficiales y portales inmobiliarios. Los _unhappy paths_ contemplados son: zona no reconocida por el buscador, con sugerencias de corrección; zona sin datos para el periodo seleccionado, con enlace a la fuente original; datos parciales para algunos trimestres, con aviso no bloqueante; y filtros sin resultados, con orientación para reformular la consulta.

*Flujo 2 — Comparativa entre zonas.* La entrada se produce desde el _Home_ o directamente desde la sección _Precios y comparativas_. El usuario selecciona una primera zona de referencia y añade sucesivamente zonas adicionales para la comparación, hasta un máximo de cuatro simultáneas. La vista resultante ofrece el precio por metro cuadrado, la evolución temporal superpuesta y el ranking de zonas. La descarga de los datos comparativos no requiere registro. Los _unhappy paths_ incluyen: búsqueda sin resultados, zona sin datos para el periodo activo, y situación en la que una de las zonas comparadas tiene datos pero otra no —en este último caso, la visualización continúa mostrando los datos disponibles con un aviso contextual.

*Flujo 3 — Reporte de irregularidad.* La entrada se produce desde la sección _Reportes y reseñas_. Si el usuario no está autenticado, el flujo invoca el Flujo 8 (autenticación) como subflujo; si la autenticación no se completa, el usuario puede abandonar sin penalización. Una vez autenticado, se presenta de forma prominente el aviso de garantías de anonimato, antes del formulario, como respuesta explícita a la necesidad identificada en el perfil de Marina Delgado (miedo a represalias). El formulario se estructura en tres pasos progresivos —tipo y ubicación, descripción y evidencias, confirmación— para reducir la carga cognitiva, en atención al perfil de Antonio García. El sistema detecta si ya existe un reporte para la misma dirección y ofrece al usuario la opción de contribuir al reporte existente o continuar con uno nuevo. Tras el envío, el reporte pasa a una cola de moderación con tres posibles resoluciones: aprobación y publicación en el mapa, rechazo con motivo visible y opción de apelación, o solicitud de información adicional con reapertura del formulario. El usuario recibe notificaciones por correo electrónico y mediante avisos en la plataforma en cada cambio de estado, y puede consultar el estado actualizado en _Mi cuenta > Mi perfil > Estado de reporte_.

*Flujo 4 — Reseña de agente inmobiliario.* La entrada se produce desde la consulta de reseñas de un agente concreto. Si el usuario no está autenticado, se invoca el Flujo 8. El formulario solicita una puntuación numérica y un texto valorativo; tras el envío, la reseña se publica directamente sin moderación intermedia.

*Flujo 5 — Consultar reportes y mapa de reportes.* Flujo de solo lectura, accesible sin registro. El usuario entra a la sección _Reportes y reseñas_, alterna entre la vista de lista y la vista de mapa —ambas integradas como _toggle_—, aplica filtros por zona y tipo de irregularidad, accede al detalle de un reporte individual y puede compartir el enlace. Los _unhappy paths_ contemplan la ausencia de resultados para los filtros activos, con opciones de reformulación.

*Flujo 6 — Consultar reseñas de agentes inmobiliarios.* Flujo de solo lectura, accesible sin registro. El usuario busca un agente por nombre o zona, consulta su perfil, lee las reseñas con posibilidad de filtrar por puntuación y periodo, y puede valorar la utilidad de una reseña (opción disponible tanto en modo anónimo como autenticado; en este último caso, el sistema detecta valoraciones duplicadas). Los _unhappy paths_ incluyen la búsqueda sin resultados y el agente sin reseñas, con invitación a escribir la primera valoración.

*Flujo 7 — Descarga de datos abiertos.* Implementa la entrada dual establecida en el sitemap v1.2: el usuario puede iniciar el flujo desde el botón contextual integrado en cualquier visualización, o bien desde la sección _Datos abiertos_ directamente. Ambas entradas convergen en un nodo de selección de municipio y filtros. Si no hay datos disponibles para los filtros seleccionados, el sistema ofrece un ciclo de reajuste antes de la salida. Al finalizar la descarga, se expone un acceso lateral a la página de fuentes y metodología. No se requiere autenticación en ningún paso.

*Flujo 8 — Autenticación (transversal).* Este flujo actúa como subflujo referenciado desde los Flujos 3, 4 y 9. Cubre: inicio de sesión con credenciales, registro con verificación por correo electrónico, recuperación de contraseña, bloqueo temporal tras intentos fallidos repetidos, reenvío de correo de verificación, detección de dirección de correo ya registrada con bifurcación hacia inicio de sesión, y sesión expirada a mitad de un flujo activo. En todos los _happy paths_, el flujo redirige al usuario de vuelta al flujo original que invocó la autenticación.

*Flujo 9 — Gestión de cuenta.* Accesible desde _Mi cuenta_. El usuario puede consultar sus reportes propios con su estado de moderación actualizado, gestionar sus zonas favoritas, configurar alertas de precios y modificar sus datos de perfil. El _unhappy path_ más relevante es la eliminación de cuenta cuando el usuario tiene reportes activos en cola de moderación, situación que requiere una confirmación explícita e informada antes de proceder.

=== Flujo de referencia: reporte de irregularidad

El Flujo 3 se selecciona como diagrama representativo de la sección por ser el más completo en términos de cobertura funcional y lógica de interacción. Concentra, en un único recorrido, cuatro elementos que no aparecen de forma simultánea en ningún otro flujo: una bifurcación de autenticación con invocación de subflujo, un formulario progresivo en tres pasos, un sistema de moderación con tres estados y sus correspondientes notificaciones, y múltiples _unhappy paths_ de distinta naturaleza (validación de formulario, reporte duplicado, error de envío, apelación tras rechazo). Esta complejidad lo convierte en un caso de uso que ejercita el conjunto de decisiones de diseño más relevantes para la plataforma.

#figure(
  image("/images/user-flows/flow-03-reporte-irregularidad.png", width: 30%),
  caption: [Diagrama de flujo del reporte de irregularidad (Flujo 3). El recorrido parte de la sección _Reportes y reseñas_, incluye la bifurcación de autenticación con referencia al Flujo 8, el aviso de garantías de anonimato previo al formulario, el formulario progresivo en tres pasos, la detección de reporte duplicado, la cola de moderación con estados pendiente, aprobado y rechazado, y las notificaciones al usuario en cada transición de estado.],
) <fig:flow-reporte-irregularidad>

El conjunto completo de los nueve diagramas de flujo se recoge en el @anexo:diagramas-flujo.
