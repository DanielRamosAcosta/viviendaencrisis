== Diagramas de flujo de usuario <anexo:diagramas-flujo>

A continuación se recogen los nueve diagramas de flujo de usuario diseñados a partir del sitemap v1.2 (@fig:sitemap) y de las personas usuarias definidas en @sec:personas-usuarias. Cada diagrama modela un recorrido completo —happy path y unhappy paths— e incluye los estados, decisiones, bifurcaciones y puntos de autenticación pertinentes. La descripción metodológica y la tabla resumen se encuentran en @sec:diagrama-flujo.

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-01-exploracion-precios.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 1 — Exploración de precios. El usuario accede desde el Home (buscador por zona), consulta la evolución temporal de precios con toggle de vista mapa, aplica filtros (tipo de vivienda, periodo), accede a los indicadores de asequibilidad y, opcionalmente, compara datos oficiales con portales inmobiliarios. Contempla los unhappy paths de zona no encontrada, zona sin datos y datos parciales.],
  ) <fig:flow-exploracion-precios>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-02-comparativa-zonas.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 2 — Comparativa entre zonas. Entrada dual desde el Home o desde _Precios y comparativas_. El usuario selecciona zona A, añade zona B y accede a la comparación lado a lado (precio/m², evolución temporal, ranking). Contempla los unhappy paths de zona sin resultados, zona sin datos para el periodo y datos parciales entre zonas.],
  ) <fig:flow-comparativa-zonas>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-03-reporte-irregularidad.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 3 — Reporte de irregularidad. El usuario accede a _Reportes y reseñas_, se verifica la autenticación (subflujo 8), se muestran las garantías de anonimato y se presenta un formulario progresivo en tres pasos. El reporte pasa a una cola de moderación con tres estados posibles (aprobado, rechazado, más información). Contempla los unhappy paths de usuario no autenticado, validación de formulario, reporte duplicado y reporte rechazado.],
  ) <fig:flow-reporte-irregularidad-anexo>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-04-resena-agente.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 4 — Reseña de agente inmobiliario. El usuario accede desde _Reportes y reseñas_, se verifica la autenticación (subflujo 8), busca al agente, cumplimenta el formulario de valoración y la reseña queda publicada. Contempla los unhappy paths de usuario no autenticado, agente no encontrado, validación de formulario y reseña duplicada.],
  ) <fig:flow-resena-agente>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-05-consultar-reportes.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 5 — Consultar reportes y mapa de reportes. Flujo de solo lectura sin autenticación. El usuario explora los reportes existentes en vista lista o mapa (toggle integrado), aplica filtros por zona y tipo de irregularidad, y accede al detalle de un reporte individual. Contempla el unhappy path de filtros sin resultados.],
  ) <fig:flow-consultar-reportes>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-06-consultar-resenas.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 6 — Consultar reseñas de agentes. Flujo de solo lectura. El usuario busca un agente por nombre o zona, consulta las reseñas disponibles con filtros opcionales y puede valorar la utilidad de cada reseña. Contempla los unhappy paths de agente no encontrado y agente sin reseñas.],
  ) <fig:flow-consultar-resenas>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-07-descarga-datos.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 7 — Descarga de datos abiertos. Entrada dual: desde un botón contextual en cualquier visualización o desde la sección _Datos abiertos_ (explorador por municipio). El usuario aplica filtros, previsualiza los datos disponibles, selecciona formato (CSV/JSON) y descarga. Contempla el unhappy path de filtros sin datos disponibles.],
  ) <fig:flow-descarga-datos>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-08-autenticacion.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 8 — Autenticación (subflujo transversal). Invocado desde los flujos 3, 4 y 9 cuando se requiere sesión activa. Contempla registro, inicio de sesión, verificación de email, recuperación de contraseña y sesión expirada. Los unhappy paths incluyen credenciales incorrectas, email no verificado, bloqueo por intentos y email ya registrado.],
  ) <fig:flow-autenticacion>
]

#page(flipped: true, header: none, footer: none, margin: 3cm)[
  #figure(
    image("/images/user-flows/flow-09-gestion-cuenta.png", width: 100%, height: 100%, fit: "contain"),
    caption: [Flujo 9 — Gestión de cuenta. Requiere autenticación (subflujo 8). Cubre cuatro bloques funcionales: estado de reportes propios, zonas favoritas, configuración de alertas y edición de perfil con eliminación de cuenta. Contempla el unhappy path de eliminación de cuenta con reportes activos en moderación.],
  ) <fig:flow-gestion-cuenta>
]
