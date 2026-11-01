== Modelo de datos <sec:modelo-datos>

=== Diseño general y colecciones del núcleo

El modelo de datos de la plataforma se articula en torno a cinco colecciones MongoDB, de las cuales tres forman el núcleo del sistema —`users`, `geodata` y `price_series`— y dos constituyen una ampliación futura opcional que no forma parte del MVP: `reports` y `reviews`. Esta distinción, que se desarrolla en las subsecciones siguientes, responde a las decisiones de alcance descritas en la @sec:enfoque.

La decisión de modelar las relaciones entre colecciones mediante referencias (patrón _reference_) en lugar de incrustar documentos (patrón _embed_) se fundamenta en el volumen esperado de los datos. La colección `price_series` puede llegar a contener centenares de miles de registros trimestrales: incrustar las series directamente dentro del documento de `geodata` produciría documentos de tamaño ilimitado que MongoDB no gestiona de forma eficiente y que dificultarían las consultas analíticas sobre rangos temporales o indicadores concretos. Con el patrón de referencias, cada documento de `price_series` almacena únicamente el código de la zona (`geoCode`) como clave foránea hacia `geodata.code`, lo que permite consultas directas sobre la colección de series sin necesidad de cargar el documento geoespacial completo.

La @fig:data-model recoge el diagrama entidad-relación de las cinco colecciones, con indicación de los campos, sus tipos, las claves primarias y foráneas, y los índices relevantes.

#figure(
  image("/images/data-model.png", width: 95%),
  caption: [Diagrama entidad-relación del modelo de datos de MongoDB. Las colecciones del núcleo (MVP) se indican en la zona superior del diagrama; las colecciones de ampliación futura opcional (_reports_ y _reviews_) se sitúan en la zona inferior. Las líneas de relación expresan cardinalidad; los campos marcados como FK son referencias entre colecciones, no claves foráneas en sentido relacional estricto.],
) <fig:data-model>

=== Colecciones del núcleo (MVP)

==== Usuarios: `users`

La colección `users` almacena las cuentas de acceso a la plataforma. Cada documento contiene el identificador único generado por MongoDB (`_id`), el correo electrónico del usuario con índice de unicidad, el hash de la contraseña, el rol (`user` o `admin`, con índice para filtrado rápido), un alias público opcional, una marca de verificación del correo y las marcas temporales de creación y última modificación.

El campo `role` con índice permite al middleware de autenticación del backend verificar los permisos de acceso de forma eficiente sin necesidad de consultas adicionales. La plataforma contempla dos roles: el usuario registrado tiene acceso a funcionalidades personales —guardar zonas, gestionar sus propias aportaciones en los módulos opcionales— mientras que el administrador puede moderar contenido y acceder al panel de gestión. El acceso a los datos de precios y geodatos no requiere autenticación en ninguno de los dos roles; es completamente público, en coherencia con el principio de transparencia que fundamenta la plataforma (@sec:contexto).

==== Zonas territoriales: `geodata`

La colección `geodata` centraliza toda la información territorial de la plataforma. Cada documento representa una unidad geográfica —comunidad autónoma, provincia o municipio— e incluye el código oficial (INE/Catastro) como identificador único, el nivel territorial (`ccaa`, `provincia` o `municipio`), el nombre de la zona, el código de la zona superior como referencia jerárquica (`parentCode`), la geometría en formato GeoJSON Polygon o MultiPolygon, y un campo de propiedades para metadatos adicionales como la población o la superficie.

El campo `geometry` está indexado con un índice geoespacial de tipo `2dsphere`, que es el índice de MongoDB optimizado para datos geográficos sobre una esfera terrestre. Este índice permite ejecutar consultas de intersección y proximidad que son necesarias para los mapas coropléticos: cuando el usuario hace clic sobre un municipio en el mapa, la API puede localizar el documento `geodata` correspondiente mediante una consulta `$geoIntersects` en lugar de recorrer todos los documentos de la colección. El índice `2dsphere` requiere que la geometría cumpla la especificación GeoJSON RFC 7946, lo que impone una restricción de calidad sobre los datos geográficos que se ingestan.

La jerarquía territorial ccaa › provincia › municipio se modela como una relación autorreferencial dentro de la misma colección mediante el campo `parentCode`: un municipio apunta al código de su provincia, y una provincia apunta al código de su comunidad autónoma. Este diseño evita la necesidad de colecciones separadas por nivel territorial y simplifica las consultas de agregación por nivel.

La normalización de los códigos territoriales es una decisión de diseño con consecuencias transversales: todos los registros de `price_series` y de las colecciones opcionales que referencian una zona lo hacen mediante el código INE/Catastro almacenado en `geodata.code`. Esta normalización garantiza la coherencia de las consultas cruzadas entre fuentes de datos con distintas procedencias.

==== Series de precios: `price_series`

La colección `price_series` almacena los valores de los indicadores de mercado de forma desagregada por zona, indicador, periodicidad y fuente. Cada documento representa una observación: el código de la zona (`geoCode`, referencia a `geodata.code`), el indicador (`alquiler` o `compraventa`), la unidad de medida (`eur_mes` para el alquiler mensual, `eur_m2` para el precio por metro cuadrado), el año, el periodo trimestral (1–4), el valor numérico y la fuente de procedencia (`MIVAU`, `INE` o `Catastro`).

Los campos `geoCode` y `year` están indexados de forma independiente, lo que permite componer consultas analíticas eficientes: series históricas de una zona concreta (filtro por `geoCode`), comparativas de un año entre múltiples zonas (filtro por `year`), o combinaciones de ambos. El campo `indicator` permite separar los datos de alquiler de los de compraventa, que tienen series temporales y metodologías de cálculo distintas según la fuente.

Esta granularidad de almacenamiento —un documento por observación— facilita la agregación por periodos y la comparación entre zonas con una sola consulta de tipo `$group` en el pipeline de agregación de MongoDB, sin necesidad de transformaciones en el backend más allá de la serialización de los resultados.

=== Colecciones de ampliación futura (opcional)

Las dos colecciones descritas en esta subsección corresponden a funcionalidades identificadas en el estudio del público objetivo (@sec:publico-objetivo) como de alta demanda —el 82,5 % de los encuestados declaró disposición a reportar, y el 92,5 % valoró útil un sistema de reseñas—, pero que quedan fuera del alcance del MVP por su mayor coste de implementación y moderación. Su inclusión en el modelo de datos responde a una decisión de planificación prospectiva: definir el esquema desde esta fase evita migraciones disruptivas si se decide incorporar estas funcionalidades en iteraciones posteriores.

==== Reportes ciudadanos: `reports`

La colección `reports` almacenaría las denuncias de irregularidades en el mercado de la vivienda enviadas por usuarios registrados. Cada documento incluye la referencia al usuario que lo redacta (`authorId`, FK hacia `users._id`), el código de la zona territorial (`geoCode`, FK hacia `geodata.code`), la categoría de la irregularidad, el texto descriptivo, una geometría de tipo GeoJSON Point con índice `2dsphere` para la ubicación precisa del inmueble denunciado, el estado de moderación (`pending`, `approved` o `rejected`, con índice para facilitar el filtrado en el panel de administración) y la marca temporal de envío.

La presencia de un campo de geometría puntual (`location`) independiente del campo `geoCode` permite representar la localización exacta del inmueble dentro de la zona administrativa, lo que resulta útil para los mapas de densidad de reportes previstos como funcionalidad de la sección _Reportes y reseñas_ del sitemap (@sec:arquitectura-informacion).

==== Reseñas de agentes inmobiliarios: `reviews`

La colección `reviews` almacenaría las valoraciones de usuarios sobre agencias inmobiliarias. Cada documento incluye la referencia al usuario autor (`authorId`, FK hacia `users._id`), el nombre de la agencia reseñada con índice para búsquedas por nombre, la valoración numérica en escala 1–5, el texto de la reseña, el estado de moderación y la marca temporal de envío. A diferencia de los reportes, las reseñas no tienen componente geoespacial: el campo de búsqueda principal es el nombre de la agencia, que actúa como identificador de facto en ausencia de un registro oficial de agentes inmobiliarios en España.

=== Tabla resumen de colecciones

La @tbl:colecciones-mongodb sintetiza las cinco colecciones, su pertenencia al núcleo o a la ampliación futura, los campos más relevantes y los índices.

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    align: (left, center, left, left),
    table.header(
      [*Colección*],
      [*Alcance*],
      [*Campos principales*],
      [*Índices*],
    ),
    [`users`], [MVP], [`email` (UK), `passwordHash`, `role`, `displayName`, `emailVerified`, `createdAt`], [`email` único; `role`],
    [`geodata`], [MVP], [`code` (UK), `level`, `name`, `parentCode` (FK), `geometry` (GeoJSON), `properties`], [`code` único; `level`; `geometry` (2dsphere)],
    [`price_series`], [MVP], [`geoCode` (FK), `indicator`, `unit`, `year`, `period`, `value`, `source`], [`geoCode`; `year`],
    [`reports`], [Opcional], [`authorId` (FK), `geoCode` (FK), `category`, `description`, `location` (GeoJSON Point), `status`, `createdAt`], [`status`; `location` (2dsphere)],
    [`reviews`], [Opcional], [`authorId` (FK), `agencyName`, `rating`, `comment`, `status`, `createdAt`], [`agencyName`; `status`],
  ),
  caption: [Resumen de las cinco colecciones MongoDB de la plataforma. Las colecciones de ampliación futura (_reports_ y _reviews_) están fuera del MVP y se incluyen en el modelo con carácter prospectivo.],
) <tbl:colecciones-mongodb>

=== Pipeline de ingesta de datos (ETL)

Los datos que alimentan la colección `price_series` y la colección `geodata` no son introducidos manualmente: proceden de fuentes de datos abiertas de la Administración española y se incorporan mediante un proceso de extracción, transformación y carga (ETL) que corre en el backend.

Las fuentes principales son tres. El Ministerio de Vivienda y Agenda Urbana (MIVAU) publica el Sistema Estatal de Referencia del Precio del Alquiler de la Vivienda (SERPAVI) con índices trimestrales de precios de alquiler desagregados por municipio, así como estadísticas de transacciones de compraventa @mivau_serpavi. El Instituto Nacional de Estadística (INE) proporciona datos censales, indicadores demográficos y series de indicadores de mercado de vivienda. El Catastro publica datos abiertos sobre usos del suelo y superficie de inmuebles. Como fuente complementaria de contraste se contempla la consulta puntual de portales inmobiliarios mediante acceso a sus páginas públicas, únicamente dentro del marco legal vigente: exclusivamente sobre contenido accesible sin autenticación, sin evadir medidas técnicas de control de acceso ni mecanismos de limitación de frecuencia de peticiones.

El proceso ETL se estructura en tres fases. En la fase de extracción se obtienen los ficheros en los formatos que distribuye cada fuente: CSV y Excel para SERPAVI e INE, y GeoJSON para las geometrías territoriales del IGN. En la fase de transformación se aplican las siguientes operaciones: normalización de los códigos territoriales al estándar INE de cinco dígitos para municipios; validación de la integridad de las geometrías GeoJSON conforme a la especificación RFC 7946 antes de su inserción en MongoDB; conversión de unidades monetarias a formato decimal normalizado; y eliminación de duplicados por la clave compuesta (`geoCode`, `indicator`, `unit`, `year`, `period`, `source`). En la fase de carga se insertan los documentos normalizados en MongoDB, utilizando operaciones de tipo _upsert_ para garantizar la idempotencia del proceso: si un registro ya existe con la misma clave compuesta, se actualiza su valor en lugar de crear un duplicado.

La idempotencia del proceso ETL es una propiedad de diseño deliberada: permite ejecutar el proceso periódicamente para incorporar nuevas publicaciones de datos sin riesgo de duplicar registros, y simplifica la recuperación ante fallos parciales en mitad de una carga.
