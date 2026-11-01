== Seguridad y autenticación <sec:seguridad>

=== Modelo de roles y autenticación con JWT

La plataforma define dos roles de usuario: usuario registrado y administrador. Los datos de visualización pública —precios, mapas, comparativas— son accesibles sin registro para cualquier visitante, en coherencia con el principio de apertura de datos que orienta el proyecto. El registro aporta funcionalidades adicionales: guardado de zonas favoritas, configuración de alertas de precio y, en las ampliaciones futuras opcionales, la gestión de reportes ciudadanos propios. El rol de administrador habilita el acceso al panel de gestión de usuarios, la moderación de contenido y la administración de los datos de referencia.

El mecanismo de autenticación previsto se basa en JSON Web Tokens (JWT) @rfc_7519_jwt. Tras un inicio de sesión exitoso, la API (Hono) emite un par de tokens: un _access token_ de corta duración (15 minutos) y un _refresh token_ de larga duración (7 días). El _access token_ se incluye en el encabezado `Authorization: Bearer <token>` de cada petición autenticada; el _refresh token_ se almacena en una _cookie_ `HttpOnly` con los atributos `Secure` y `SameSite=Strict` para reducir la superficie de ataque frente a scripts maliciosos en el cliente. La separación entre ambos tokens permite revocar el acceso de forma granular: invalidar el _refresh token_ en servidor obliga a volver a autenticarse sin necesidad de que el _access token_ haya expirado.

La elección de JWT frente a sesiones basadas en servidor responde al modelo de despliegue previsto: las funciones serverless de Scaleway no mantienen estado entre invocaciones, lo que hace inviable el uso de sesiones en memoria sin una capa de caché compartida. JWT permite verificar la autenticidad e integridad de cada petición de forma independiente, sin consultar el almacén de sesiones, lo que es compatible con el escalado horizontal sin estado de las funciones serverless.

=== Protección de endpoints y autorización

La capa de autorización se implementa como _middleware_ en Hono. Cada petición a un endpoint protegido pasa por el middleware de autenticación, que extrae el token del encabezado `Authorization`, verifica su firma y comprueba su vigencia. Si la verificación falla —token ausente, malformado, expirado o firmado con una clave incorrecta—, el middleware responde con un código 401 (no autorizado) sin procesar el cuerpo de la petición.

Para los endpoints que requieren el rol de administrador, un segundo middleware de autorización comprueba la reclamación (_claim_) de rol incluida en el _payload_ del token. Si el rol no corresponde al esperado, la respuesta es 403 (prohibido). Esta separación entre autenticación (¿eres quien dices ser?) y autorización (¿tienes permiso para hacer esto?) facilita la auditoría y la extensión futura del modelo de roles sin modificar el flujo de autenticación.

Los endpoints de lectura pública no pasan por el middleware de autenticación, lo que reduce la latencia y evita que errores en el flujo de autenticación afecten a la funcionalidad principal de la plataforma para usuarios no registrados. Esta decisión implica que los datos expuestos por estos endpoints no deben contener información personal ni sensible, requisito que se satisface por diseño dado que las fuentes de datos son todas de carácter público.

=== Consideraciones OWASP Top 10

El diseño de la seguridad de la plataforma toma como referencia el OWASP Top 10 @owasp_top10_2021, la lista de las diez vulnerabilidades web más críticas publicada por el _Open Web Application Security Project_ (edición 2021). A continuación se describen las medidas previstas para las categorías de mayor relevancia en el contexto de este proyecto.

*Inyección (A03).* Los datos proporcionados por el usuario —filtros de búsqueda, identificadores, parámetros de paginación— nunca se interpolan directamente en consultas a MongoDB. Se utilizan exclusivamente las APIs de consulta del cliente oficial de MongoDB para Node.js, que parametrizan las consultas y previenen la inyección de operadores BSON maliciosos. Los esquemas de validación de entrada (Zod o Valibot) rechazan valores que no coincidan con el tipo, el formato y el rango esperados antes de que alcancen la capa de persistencia.

*Autenticación comprometida (A07).* Las contraseñas se almacenan en la base de datos exclusivamente como _hash_ bcrypt con un factor de coste de al menos 12. No se almacenan contraseñas en texto plano ni con algoritmos de hashing no diseñados para contraseñas (MD5, SHA-1). El endpoint de inicio de sesión implementa limitación de tasa (_rate limiting_) para dificultar los ataques de fuerza bruta: tras cinco intentos fallidos consecutivos desde la misma dirección IP, el endpoint devuelve 429 (demasiadas peticiones) durante un período de bloqueo progresivo.

*Exposición de datos sensibles (A02).* Las respuestas de la API no incluyen campos internos de los documentos MongoDB (`__v`, `password`, `refreshTokenHash`) que no son necesarios para el cliente. Los esquemas de respuesta se definen explícitamente mediante transformaciones de tipo (Zod `.strip()`) que excluyen cualquier campo no declarado, evitando la filtración accidental de campos añadidos en el futuro.

*Falsificación de petición en sitios cruzados — CSRF (A01 parcial).* La plataforma no utiliza _cookies_ de sesión para proteger las peticiones mutantes de la API; la autenticación se basa en el encabezado `Authorization`, que los ataques CSRF no pueden incluir desde un origen externo. El _refresh token_, almacenado en una _cookie_ `SameSite=Strict`, no es utilizable directamente para operaciones de escritura sin el _access token_ correspondiente. Esta arquitectura elimina la necesidad de tokens CSRF adicionales.

*Scripting en sitios cruzados — XSS (A03 parcial).* Next.js escapa automáticamente el contenido dinámico renderizado mediante JSX, lo que previene la inyección de HTML por defecto. Los datos provenientes de la API que se muestran en el cliente no se insertan mediante `dangerouslySetInnerHTML`. La política de seguridad de contenido (Content Security Policy, CSP) se configura como encabezado de respuesta HTTP para restringir las fuentes de scripts, estilos e imágenes a los dominios propios de la aplicación.

=== Gestión de secretos y configuración de entornos

Ningún secreto —claves de firma JWT, credenciales de la base de datos, claves de API externas— se almacena en el repositorio de código. La gestión de secretos se realiza mediante variables de entorno, inyectadas en tiempo de ejecución por la plataforma de despliegue (Scaleway Secrets Manager) o, en el entorno de desarrollo local, mediante un fichero `.env.local` excluido del control de versiones a través de `.gitignore`. El repositorio incluye un fichero `.env.example` que documenta las variables necesarias con valores de ejemplo, sin revelar valores reales.

La rotación de claves de firma JWT se gestiona mediante un mecanismo de doble clave: la plataforma acepta tokens firmados con la clave activa y con la clave anterior durante un período de transición, lo que permite rotar las claves sin invalidar sesiones activas. Esta práctica reduce el impacto operativo de las rotaciones periódicas de secretos.

La comunicación entre el cliente y la API, y entre la API y la base de datos, se realiza exclusivamente mediante HTTPS. En el entorno de producción, los certificados TLS son gestionados por Scaleway; en el entorno de desarrollo local, se utiliza un certificado autofirmado para el servidor de desarrollo o se trabaja directamente sobre HTTP sin cifrado en el contexto de la red local del desarrollador.
