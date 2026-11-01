== Despliegue e infraestructura <sec:despliegue>

=== Arquitectura de despliegue en Scaleway

La plataforma se despliega sobre Scaleway, un proveedor de infraestructura en la nube del grupo iliad con centros de datos ubicados en Europa. La elección de Scaleway frente a proveedores de mayor tamaño como AWS o Google Cloud responde a dos criterios: su compromiso documentado con el uso de energía renovable en sus instalaciones @scaleway_environment_2025, coherente con los objetivos de sostenibilidad descritos en la sección 1.3 del trabajo, y su modelo de precios ajustado a proyectos de escala reducida. Scaleway ofrece además un nivel gratuito suficiente para los entornos de desarrollo y _staging_, lo que elimina el coste operativo durante las fases de construcción y evaluación.

La arquitectura de despliegue separa los tres componentes del sistema en servicios independientes de Scaleway. El frontend —aplicación Next.js— se despliega como un _Serverless Container_: un contenedor Docker que Scaleway ejecuta bajo demanda, escala automáticamente en función del tráfico y detiene cuando no hay peticiones activas. El backend —API Hono sobre Node.js— se despliega como una _Serverless Function_, el modelo de ejecución sin servidor de granularidad más fina que factura por invocación en lugar de por tiempo de servidor activo. La base de datos MongoDB se gestiona como servicio mediante _Managed Database for MongoDB_, que delega en Scaleway la gestión de actualizaciones, copias de seguridad y disponibilidad. La @fig:infrastructure ilustra las relaciones entre estos tres componentes y la pipeline de CI/CD que los despliega.

#figure(
  image("/images/infrastructure.png", width: 90%),
  caption: [Diagrama de infraestructura de despliegue: integración continua, hospedaje y persistencia.],
) <fig:infrastructure>

=== Contenerización con Docker

El frontend Next.js y el backend Hono se empacan como imágenes Docker antes de su despliegue. La contenerización garantiza la reproducibilidad del entorno de ejecución: la imagen construida en la pipeline de CI es exactamente la misma que se despliega en _staging_ y en producción, eliminando las discrepancias entre entornos debidas a diferencias en versiones de dependencias o configuración del sistema operativo.

Las imágenes Docker siguen el patrón de _multistage build_ para minimizar el tamaño del artefacto final. En una primera etapa (_build stage_), se instalan todas las dependencias de desarrollo y se compila la aplicación TypeScript. En una segunda etapa (_runtime stage_), partiendo de una imagen base mínima de Node.js Alpine, se copian únicamente los artefactos compilados y las dependencias de producción, descartando el código fuente, los módulos de desarrollo y las herramientas de compilación. Este enfoque reduce el tamaño de la imagen de producción y la superficie de ataque potencial.

Las imágenes se construyen con etiquetas que incluyen el SHA del _commit_ de Git que las originó, lo que garantiza la trazabilidad entre cualquier versión desplegada y el código fuente exacto que la generó. El registro de imágenes utilizado es el _Container Registry_ de Scaleway, privado y dentro de la misma red de la infraestructura de despliegue.

=== Pipeline de CI/CD con GitHub Actions

La pipeline de integración continua y entrega continua (CI/CD) se implementa con GitHub Actions. Su funcionamiento se integra con el flujo de trabajo descrito en @sec:metodologia_desarrollo: los _checks_ de calidad (tipos, linter, tests) se ejecutan en cada _push_ y _pull request_; el despliegue, en cambio, se ejecuta únicamente cuando se integra código en la rama principal mediante _pull request_ aprobado.

El flujo de despliegue sigue estos pasos. Una vez que todos los _checks_ de calidad han pasado y el _pull request_ se fusiona en `main`, se lanza automáticamente el _workflow_ de despliegue. Este _workflow_ construye las imágenes Docker del frontend y del backend, las empuja al registro de Scaleway y actualiza las definiciones de los servicios _serverless_ para que utilicen la nueva imagen. Scaleway gestiona el despliegue sin interrupción (_zero-downtime deployment_) mediante la sustitución progresiva de instancias.

Las variables de entorno y los secretos necesarios para la compilación y el despliegue —credenciales del registro, clave de firma JWT, URI de conexión a la base de datos— se almacenan en el almacén de secretos de GitHub Actions y en Scaleway Secrets Manager, sin que queden registrados en el repositorio ni en los _logs_ de la pipeline.

=== Entornos: desarrollo, _staging_ y producción

Se definen tres entornos de ejecución con propósitos y configuraciones diferenciados.

*Desarrollo* (`dev`) es el entorno local de cada sesión de trabajo. El frontend se ejecuta con el servidor de desarrollo de Next.js, que ofrece recarga en caliente (_hot reload_) y mensajes de error detallados. El backend Hono se ejecuta con el modo de observación (`--watch`) de Node.js. La base de datos puede ser una instancia local de MongoDB o una instancia de desarrollo en Scaleway. Las variables de entorno se gestionan mediante ficheros `.env.local` excluidos del repositorio.

*_Staging_* es un entorno de preproducción alojado en Scaleway con una configuración equivalente a la de producción, pero con datos de prueba. Los tests E2E (@sec:testing) se ejecutan contra este entorno como paso previo a cualquier despliegue en producción. El entorno de _staging_ permite verificar el comportamiento de la aplicación compilada y contenerizada en condiciones de red y latencia reales, lo que no es posible en el entorno de desarrollo local.

*Producción* (`prod`) es el entorno accesible públicamente. Comparte la misma imagen Docker que _staging_ —lo que garantiza que lo que se prueba en preproducción es exactamente lo que llega a los usuarios finales—, pero apunta a la base de datos de producción con datos reales y a los secretos de producción. Los despliegues en producción solo se realizan desde la rama `main` y tras la validación completa en _staging_.

=== Sostenibilidad energética del despliegue

Scaleway opera sus centros de datos con un coeficiente de efectividad energética (PUE, _Power Usage Effectiveness_) inferior a 1,5, por debajo de la media del sector, y se abastece de energía procedente de fuentes renovables certificadas @scaleway_environment_2025. Esta característica es coherente con el análisis del impacto en sostenibilidad realizado en la sección 1.3 del trabajo, donde se documenta que la elección de infraestructura con compromiso de energía renovable reduce la huella de carbono operativa de la plataforma.

El modelo _serverless_ contribuye adicionalmente a la eficiencia energética: los recursos de cómputo se asignan únicamente durante la ejecución de las peticiones y se liberan inmediatamente después, en contraste con el modelo de servidor permanente que consume energía incluso en ausencia de tráfico @akour_serverless_2025. Para una plataforma de datos públicos con patrones de uso discontinuos —concentrados en horario diurno laboral y con picos en momentos de difusión mediática—, el modelo _serverless_ ofrece tanto ventajas económicas como ventajas medioambientales respecto a la provisión de capacidad estática.
