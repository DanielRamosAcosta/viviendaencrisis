== Casos de uso <sec:casos-de-uso>

Los casos de uso constituyen la especificación funcional del comportamiento observable del sistema desde la perspectiva de sus actores externos. Su elaboración en esta fase se fundamenta en dos artefactos previos: los diagramas de flujo de usuario (@sec:diagrama-flujo), que describen los recorridos paso a paso para cada tarea principal, y la arquitectura de la información (@sec:arquitectura-informacion), que establece las secciones y páginas entre las que se articula la navegación. El paso de los flujos a los casos de uso implica un cambio de nivel de abstracción: mientras los flujos capturan la secuencia de pantallas y decisiones, los casos de uso enuncian qué objetivo alcanza el actor y bajo qué condiciones previas y posteriores.

El sistema distingue tres actores con distintos niveles de privilegio de acceso. El diseño de estos actores es coherente con las decisiones de arquitectura de la información (@sec:arquitectura-informacion): el contenido público es accesible sin registro, la participación activa requiere cuenta verificada y la administración queda reservada al rol con privilegios máximos.

La presente especificación cubre el alcance del producto mínimo viable (MVP). Los casos de uso correspondientes a las funcionalidades de ampliación futura —el sistema de reportes ciudadanos y el sistema de reseñas— se identifican explícitamente y se describen de forma resumida en la sección final del capítulo (@sec:casos-uso-futuros). Esta distinción permite delimitar con claridad el compromiso de entrega del proyecto sin descartar el valor de las funcionalidades diferidas.

=== Actores del sistema <sec:actores>

Se identifican tres actores en el sistema, organizados mediante una jerarquía de generalización en la que cada actor hereda los casos de uso del nivel inferior:

*Visitante anónimo.* Usuario no autenticado. Accede a la totalidad de las funcionalidades de consulta y visualización públicas sin necesidad de registro. Puede explorar la evolución de precios, comparar zonas, consultar el precio por metro cuadrado, interactuar con los mapas coropléticos y descargar datos en formatos abiertos. También puede iniciar el proceso de registro. Este actor representa al arquetipo de ciudadano afectado (Arquetipo 1 — Marina Delgado) y al activista de datos (Arquetipo 2 — Alejandro Ruiz) cuando operan sin sesión activa.

*Usuario registrado.* Dispone de una cuenta verificada en el sistema. Hereda todos los casos del visitante anónimo y añade la capacidad de gestionar su propia cuenta —modificar datos de perfil, consultar el historial de actividad— y, en el ámbito de la ampliación futura, de crear reportes ciudadanos y escribir reseñas de agentes inmobiliarios.

*Administrador.* Actor con privilegios máximos. Hereda todos los casos del usuario registrado y añade el acceso al panel de administración, la gestión de usuarios y roles, y la moderación de contenidos generados por la comunidad. En el diagrama de casos de uso se representa mediante una relación de generalización entre el actor Administrador y el actor Usuario registrado, de modo que los casos de uso comunes no se duplican.

=== Diagrama de casos de uso <sec:diagrama-casos-de-uso>

La @fig:casos-de-uso presenta el diagrama de casos de uso de la plataforma. El diagrama se organiza en dos bloques diferenciados: el bloque del MVP, delimitado por una línea continua, que recoge los dieciséis casos identificados para la versión inicial, y el bloque de ampliación futura, delimitado por una línea discontinua, que agrupa los casos correspondientes al sistema de reportes (CU11–CU13) y al sistema de reseñas (CU14–CU16).

#figure(
  image("/images/use-cases.png", width: 95%),
  caption: [Diagrama de casos de uso de la plataforma Vivienda en Crisis. Los casos del bloque de ampliación futura (línea discontinua) quedan fuera del alcance del MVP.],
) <fig:casos-de-uso>

Las relaciones «include» del diagrama reflejan dependencias obligatorias entre casos de uso. Los casos CU09 (acceder al panel de administración) y CU11 (crear reporte ciudadano) incluyen CU07 (iniciar sesión), puesto que su ejecución requiere necesariamente que el actor esté autenticado. La generalización entre actores, visible en el extremo derecho del diagrama, muestra que el Administrador hereda el conjunto completo de casos del Usuario registrado, y este a su vez hereda los del Visitante anónimo, eliminando la necesidad de replicar los casos de consulta pública en los niveles superiores.

=== Catálogo de casos de uso <sec:catalogo-casos-de-uso>

La @tbl:catalogo-cu recoge el catálogo completo de casos de uso, con su identificador, nombre, actor principal y ámbito de entrega.

#figure(
  table(
    columns: (auto, 1fr, auto, auto),
    align: (left, left, left, center),
    table.header(
      [*ID*], [*Nombre*], [*Actor principal*], [*Ámbito*],
    ),
    [CU01], [Visualizar evolución de precios],     [Visitante anónimo],   [MVP],
    [CU02], [Comparar zonas],                       [Visitante anónimo],   [MVP],
    [CU03], [Consultar precio por m²],              [Visitante anónimo],   [MVP],
    [CU04], [Explorar mapas coropléticos],          [Visitante anónimo],   [MVP],
    [CU05], [Descargar datos abiertos],             [Visitante anónimo],   [MVP],
    [CU06], [Registrarse],                          [Visitante anónimo],   [MVP],
    [CU07], [Iniciar / cerrar sesión (JWT)],        [Usuario registrado],  [MVP],
    [CU08], [Gestionar cuenta propia],              [Usuario registrado],  [MVP],
    [CU09], [Acceder al panel de administración],   [Administrador],       [MVP],
    [CU10], [Gestionar usuarios y roles],           [Administrador],       [MVP],
    [CU11], [Crear reporte ciudadano],              [Usuario registrado],  [Ampliación futura],
    [CU12], [Consultar reportes],                   [Visitante anónimo],   [Ampliación futura],
    [CU13], [Moderar reportes],                     [Administrador],       [Ampliación futura],
    [CU14], [Escribir reseña],                      [Usuario registrado],  [Ampliación futura],
    [CU15], [Consultar reseñas y rankings],         [Visitante anónimo],   [Ampliación futura],
    [CU16], [Moderar reseñas],                      [Administrador],       [Ampliación futura],
  ),
  caption: [Catálogo de casos de uso de la plataforma Vivienda en Crisis.],
) <tbl:catalogo-cu>

=== Fichas de casos de uso principales <sec:fichas-casos-de-uso>

Se detallan a continuación los cuatro casos de uso más representativos del MVP. La selección recoge el principal caso de consulta pública (CU01), el principal caso de análisis comparativo (CU02), el caso transversal de autenticación (CU07) y el caso de gestión administrativa de mayor impacto en la seguridad del sistema (CU10).

==== CU01 — Visualizar evolución de precios

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    [*Identificador*],     [CU01],
    [*Nombre*],            [Visualizar evolución de precios],
    [*Actor principal*],   [Visitante anónimo],
    [*Precondiciones*],    [Ninguna. El acceso es público y no requiere registro.],
    [*Flujo principal*],   [
      1. El visitante accede a la sección _Precios y comparativas_ desde la navegación principal o mediante el buscador por zona de la página de inicio. \
      2. Selecciona el tipo de operación (alquiler, compraventa o ambas) y la unidad territorial (comunidad autónoma o municipio). \
      3. El sistema recupera los datos del índice de precios correspondientes a los filtros activos. \
      4. Se renderiza el gráfico de evolución temporal con estilo de líneas. \
      5. El visitante puede ajustar el rango de fechas, cambiar de zona o alternar a la vista de mapa mediante el _toggle_ integrado.
    ],
    [*Flujos alternativos / excepciones*], [
      - Si la zona introducida no se reconoce → el sistema muestra sugerencias de corrección y el flujo retoma desde el paso 2. \
      - Si no existen datos para la selección realizada → se muestra un mensaje informativo con enlace a la fuente original (MIVAU / INE). \
      - Si los datos son parciales para algún trimestre → se muestra un aviso no bloqueante y la visualización continúa con los periodos disponibles. \
      - Si el servicio de datos no está disponible → se muestra un mensaje de error con opción de reintentar.
    ],
    [*Postcondiciones*],   [El gráfico se muestra con los datos más recientes disponibles para la zona y el periodo seleccionados.],
  ),
  caption: [Ficha del caso de uso CU01 — Visualizar evolución de precios.],
)

==== CU02 — Comparar zonas

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    [*Identificador*],     [CU02],
    [*Nombre*],            [Comparar zonas],
    [*Actor principal*],   [Visitante anónimo],
    [*Precondiciones*],    [Ninguna. El acceso es público y no requiere registro.],
    [*Flujo principal*],   [
      1. El visitante accede a la sección _Precios y comparativas > Comparar zonas_ desde la navegación principal o desde el buscador del _Home_. \
      2. Selecciona una primera zona de referencia mediante el campo de búsqueda. \
      3. Añade sucesivamente zonas adicionales para la comparación, hasta un máximo de cuatro simultáneas. \
      4. Selecciona la métrica de comparación: precio por metro cuadrado, variación anual u otra disponible. \
      5. El sistema genera el gráfico de barras o la tabla comparativa con los datos correspondientes. \
      6. El visitante puede descargar la comparativa en formato CSV o JSON sin necesidad de registro.
    ],
    [*Flujos alternativos / excepciones*], [
      - Si se selecciona una sola zona → el sistema muestra una indicación de que se requieren al menos dos zonas para activar la comparativa. \
      - Si alguna de las zonas comparadas no tiene datos para el periodo activo → se muestra una advertencia contextual junto al dato faltante, pero la visualización continúa con las zonas que sí tienen datos. \
      - Si la búsqueda de una zona no arroja resultados → el sistema ofrece sugerencias alternativas.
    ],
    [*Postcondiciones*],   [La comparativa se muestra en pantalla y puede descargarse en formato abierto.],
  ),
  caption: [Ficha del caso de uso CU02 — Comparar zonas.],
)

==== CU07 — Iniciar sesión

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    [*Identificador*],     [CU07],
    [*Nombre*],            [Iniciar / cerrar sesión (JWT)],
    [*Actor principal*],   [Usuario registrado],
    [*Precondiciones*],    [El usuario dispone de una cuenta registrada y verificada mediante correo electrónico.],
    [*Flujo principal*],   [
      1. El usuario accede al formulario de inicio de sesión desde la navegación global o desde el modal de autenticación invocado por un flujo que requiere sesión activa. \
      2. Introduce su correo electrónico y su contraseña. \
      3. El sistema valida las credenciales contra la base de datos. \
      4. Si son correctas, emite un token JWT y lo almacena en una _cookie_ HttpOnly de acceso restringido al servidor. \
      5. El usuario es redirigido a la página o acción que motivó el inicio de sesión.
    ],
    [*Flujos alternativos / excepciones*], [
      - Si las credenciales son incorrectas → se muestra un mensaje de error genérico que no revela si el correo existe en el sistema. \
      - Si la cuenta no está verificada → se muestra un aviso específico con opción de reenviar el correo de verificación. \
      - Si se alcanzan tres intentos fallidos consecutivos → se aplica un bloqueo temporal con orientación hacia el flujo de recuperación de contraseña. \
      - Si la sesión expira durante un flujo activo → se muestra un aviso no intrusivo que permite retomar la sesión desde el punto en que se interrumpió.
    ],
    [*Postcondiciones*],   [El usuario está autenticado. Las rutas protegidas del sistema son accesibles hasta que el token expire o el usuario cierre la sesión explícitamente.],
  ),
  caption: [Ficha del caso de uso CU07 — Iniciar / cerrar sesión.],
)

==== CU10 — Gestionar usuarios y roles

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    [*Identificador*],     [CU10],
    [*Nombre*],            [Gestionar usuarios y roles],
    [*Actor principal*],   [Administrador],
    [*Precondiciones*],    [El actor es Administrador y ha iniciado sesión correctamente (incluye CU07).],
    [*Flujo principal*],   [
      1. El administrador accede al panel de administración desde la navegación global de la cuenta. \
      2. Navega al módulo de gestión de usuarios. \
      3. Consulta el listado paginado de cuentas registradas en el sistema. \
      4. Selecciona el registro de un usuario concreto. \
      5. Modifica su rol (usuario registrado → administrador, o a la inversa) o desactiva la cuenta. \
      6. El sistema persiste el cambio y registra la acción en el _log_ de auditoría.
    ],
    [*Flujos alternativos / excepciones*], [
      - Si el administrador intenta modificar su propio rol → la acción se deniega con un mensaje explicativo que indica que esta operación no está permitida. \
      - Si el usuario buscado no se encuentra en el sistema → se devuelve un error 404 con orientación para reformular la búsqueda.
    ],
    [*Postcondiciones*],   [El rol o el estado de la cuenta del usuario queda actualizado en la base de datos. El cambio entra en vigor en el siguiente inicio de sesión del usuario afectado.],
  ),
  caption: [Ficha del caso de uso CU10 — Gestionar usuarios y roles.],
)

=== Casos de uso de ampliación futura <sec:casos-uso-futuros>

Los casos de uso CU11 a CU16 quedan explícitamente fuera del alcance del MVP. Se contemplan como desarrollos opcionales a implementar en función de la disponibilidad de tiempo y de la viabilidad técnica estimada en la planificación del proyecto (@sec:planificacion). Su identificación en el catálogo (@tbl:catalogo-cu) y en el diagrama (@fig:casos-de-uso) no implica ningún compromiso de entrega, sino la voluntad de preservar la coherencia del modelo de casos de uso para las iteraciones futuras.

El bloque de reportes ciudadanos (CU11–CU13) contempla tres casos interdependientes. CU11 permite al usuario registrado crear un reporte de irregularidad —inicialmente orientado a la denuncia de alojamientos turísticos sin licencia—, incluyendo la descripción del caso, la geolocalización y la aportación de evidencias documentales. CU12 expone los reportes aprobados al acceso público sin registro, con filtros por zona y tipo de irregularidad y vistas de lista y mapa. CU13 habilita al administrador para moderar los reportes recibidos, con tres posibles resoluciones: aprobación y publicación, rechazo con motivo visible y solicitud de información adicional. El flujo de moderación contempla notificaciones al autor del reporte en cada transición de estado.

El bloque de reseñas (CU14–CU16) sigue una estructura análoga. CU14 permite al usuario registrado escribir una valoración sobre un agente inmobiliario o propietario, con puntuación numérica y texto libre. CU15 expone las reseñas y el _ranking_ resultante al acceso público, con posibilidad de filtrar por zona, puntuación y periodo. CU16 habilita al administrador para moderar las reseñas publicadas. A diferencia del módulo de reportes, el sistema de reseñas presenta un mayor coste de implementación debido a los requisitos de verificación de identidad y de prevención de valoraciones duplicadas, lo que lo convierte en el candidato principal a diferir en caso de restricción de tiempo.
