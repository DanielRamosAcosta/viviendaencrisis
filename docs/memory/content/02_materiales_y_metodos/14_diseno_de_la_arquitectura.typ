== Diseño de la arquitectura <sec:arquitectura>

=== Visión general del sistema

La plataforma Vivienda en Crisis se organiza como un monorepo que agrupa tres capas técnicas diferenciadas: el frontend, el backend y la base de datos. Esta separación refleja un diseño orientado a la independencia de responsabilidades: cada capa expone una interfaz bien definida hacia las capas adyacentes y puede evolucionar de forma autónoma sin afectar al resto del sistema. El monorepo facilita la gestión unificada de dependencias, la coherencia de los tipos de TypeScript compartidos entre frontend y backend, y la ejecución coordinada de la pipeline de integración continua descrita en la sección @sec:metodologia_desarrollo.

El flujo de datos sigue una dirección unidireccional. El frontend (Next.js) se comunica con el backend mediante llamadas HTTP sobre una API REST. El backend (Hono sobre Node.js) gestiona la lógica de negocio, la autenticación y el acceso a los datos, y actúa como única capa autorizada para leer y escribir en la base de datos (MongoDB). Las fuentes de datos externas —Ministerio de Vivienda (MIVAU/SERPAVI), INE y Catastro— no se consumen directamente desde el frontend: se ingresan en MongoDB mediante un proceso de extracción, transformación y carga (ETL) que corre en el backend, de modo que los datos siempre se sirven en una forma normalizada y validada. La @fig:tech-stack ilustra esta arquitectura de capas.

#figure(
  image("/images/tech-stack.png", width: 85%),
  caption: [Diagrama del conjunto tecnológico de la plataforma: capas de presentación, servidor, datos y fuentes externas.],
) <fig:tech-stack>

=== Capa de presentación: Next.js

El frontend está construido con Next.js, el marco de trabajo de React que combina renderizado en el servidor (_server-side rendering_, SSR) y generación estática (_static site generation_, SSG) con la capacidad de producir rutas completamente interactivas en el cliente. La elección de Next.js frente a una aplicación de página única (_single-page application_, SPA) pura responde a cuatro criterios principales.

En primer lugar, el rendimiento en primera carga: las páginas que contienen visualizaciones de datos o mapas pueden ser pesadas en términos de JavaScript; el renderizado en servidor permite enviar al navegador HTML prerenderizado, lo que reduce el tiempo hasta el primer contenido visible (_First Contentful Paint_) para los perfiles de usuario con conexiones más lentas, entre ellos el arquetipo de ciudadana afectada (@sec:publico-objetivo). En segundo lugar, la indexabilidad: al tratarse de una plataforma de datos públicos cuya misión es la transparencia y la difusión, la correcta indexación por motores de búsqueda es un requisito funcional relevante que el SSR facilita de forma nativa. En tercer lugar, la arquitectura de _App Router_ de Next.js permite colocar la lógica de fetching de datos en componentes de servidor, reduciendo la superficie de código que se envía al cliente. En cuarto lugar, TypeScript es un ciudadano de primera clase en el ecosistema Next.js, lo que facilita la coherencia de tipos entre las capas del monorepo.

Como alternativa principal se evaluó una SPA construida con React y Vite. Esta opción ofrece una configuración más sencilla y un ciclo de desarrollo más rápido en las primeras etapas, pero renuncia al SSR y al SSG, lo que penaliza tanto el rendimiento percibido como la indexabilidad. Para un proyecto con vocación de plataforma pública y con contenido potencialmente estático —páginas de zona, comparativas históricas—, las ventajas del renderizado híbrido de Next.js son determinantes.

La capa de visualización de datos dentro del frontend se articula en torno a tres bibliotecas complementarias. D3.js proporciona el nivel de control más bajo y se emplea para visualizaciones que requieren un comportamiento interactivo a medida —escalas personalizadas, transiciones complejas—. Recharts y Nivo ofrecen componentes de gráfico declarativos y accesibles que aceleran la implementación de las visualizaciones más habituales, como las series temporales y las comparativas por zona. La selección entre Recharts y Nivo para cada caso se basa en el grado de personalización requerido: Recharts resulta más adecuado para configuraciones estándar con integración directa en el sistema de componentes de React, mientras que Nivo ofrece mayor variedad tipológica y opciones de tematización. Para los mapas coropléticos se emplea Leaflet, una biblioteca de cartografía web ligera y de código abierto que soporta capas GeoJSON de forma nativa. Se evaluó Mapbox como alternativa a Leaflet, pero su modelo de licencias basado en peticiones de teselas supone un coste operativo difícil de estimar en una plataforma con tráfico abierto y sin registro, mientras que Leaflet combinado con teselas OpenStreetMap ofrece una solución de coste cero y sin dependencias de proveedor.

=== Capa de lógica de negocio: Hono

El backend se implementa con Hono, un marco de trabajo ligero para Node.js diseñado con un énfasis explícito en el rendimiento y en la compatibilidad con los estándares web modernos (Web APIs). La elección de Hono frente a las alternativas más establecidas —Express y Fastify— responde a un criterio técnico y a un criterio de coherencia con los objetivos de sostenibilidad del proyecto.

Desde el punto de vista técnico, Hono expone una API basada en las primitivas estándar `Request` y `Response` del navegador, lo que permite escribir código de servidor que es portable entre entornos de ejecución —Node.js, Deno, Bun, entornos serverless— sin modificaciones. Esta portabilidad reduce la dependencia del entorno de despliegue concreto y facilita la migración futura si el proveedor de infraestructura cambia. Express, la alternativa más madura, usa primitivas propias (`req`, `res`) que no se alinean con los estándares web actuales y presenta un rendimiento notablemente inferior en benchmarks de latencia @akour_serverless_2025[p.~4]. Fastify mejora el rendimiento respecto a Express pero mantiene una API propia que no es portable entre runtimes.

Desde el punto de vista del consumo de recursos, los marcos de trabajo ligeros reducen la huella de memoria y el tiempo de arranque de los procesos del backend, lo que resulta relevante en un despliegue sobre contenedores de baja asignación de RAM como los que ofrece Scaleway. La coherencia con la dimensión de sostenibilidad tecnológica del proyecto (sección 1.3) refuerza esta decisión.

El backend expone una API REST con rutas organizadas por recurso: `/api/geo`, `/api/prices`, `/api/users`, `/api/auth`, y —como módulos de ampliación futura opcional— `/api/reports` y `/api/reviews`. La autenticación se gestiona mediante JSON Web Tokens (JWT), con lógica de middleware compartida entre todas las rutas protegidas. La separación entre rutas públicas (consulta de precios y geodatos sin registro) y rutas autenticadas (gestión de perfil, creación de reportes y reseñas en los módulos opcionales) se aplica a nivel de middleware, de modo que el acceso a datos no requiere identificación del usuario y la plataforma es utilizable sin registro, en coherencia con el principio de transparencia que la justifica.

=== Capa de datos: MongoDB

La base de datos utilizada es MongoDB en su modalidad de base de datos gestionada. La elección de un sistema documental orientado a documentos frente a una base de datos relacional clásica responde a tres características del dominio de datos de esta plataforma.

La primera es la naturaleza heterogénea de los datos geoespaciales. Las geometrías de comunidades autónomas, provincias y municipios se representan en formato GeoJSON, que es un estándar JSON para la codificación de geometrías geográficas. MongoDB ofrece soporte nativo para GeoJSON mediante índices geoespaciales de tipo `2dsphere`, que permiten consultas de intersección, proximidad y contenido geográfico sin necesidad de extensiones adicionales. Una base de datos relacional requeriría el uso de extensiones geoespaciales —PostGIS sobre PostgreSQL— y un mayor esfuerzo de configuración para obtener un nivel de soporte equivalente.

La segunda es el esquema variable de las series de precios según la fuente. Los datos del MIVAU, el INE y el Catastro presentan estructuras y periodicidades distintas; el modelo documental de MongoDB permite almacenarlos bajo un esquema común sin imponer una normalización prematura que pudiera dificultar la incorporación de nuevas fuentes. Las decisiones de esquema de datos se desarrollan con mayor detalle en la sección siguiente (@sec:modelo-datos).

La tercera es la coherencia con el ecosistema JavaScript/TypeScript del resto del proyecto. MongoDB y su cliente oficial para Node.js (Mongoose o el driver nativo) se integran de forma natural en un backend escrito en TypeScript, sin necesidad de capas de traducción como las que requieren los ORMs relacionales para mapear esquemas SQL a objetos JavaScript.

Como alternativa relacional se evaluó PostgreSQL con la extensión PostGIS. PostgreSQL ofrece un modelo de integridad referencial más estricto y es una opción madura para datos estructurados; sin embargo, en este proyecto la ventaja de la integridad referencial se ve relativizada por el hecho de que la mayor parte de los datos son de solo lectura —se ingestan desde fuentes externas y no se modifican por acción de los usuarios— y porque el esquema documental de MongoDB permite representar la jerarquía territorial (comunidad autónoma › provincia › municipio) y los metadatos GeoJSON de forma más directa.

=== Tabla resumen del stack tecnológico

La @tbl:stack-tecnologico recoge los componentes principales del stack, la función que desempeña cada uno y la principal alternativa descartada.

#figure(
  table(
    columns: (auto, 1fr, auto, 1fr),
    align: (left, left, left, left),
    table.header(
      [*Componente*],
      [*Función*],
      [*Alternativa*],
      [*Criterio de decisión*],
    ),
    [Next.js (React + TS)], [Frontend: renderizado híbrido (SSR/SSG), enrutamiento, componentes de servidor], [React + Vite (SPA)], [SSR para indexabilidad y rendimiento en primera carga],
    [D3.js / Recharts / Nivo], [Visualización de series temporales y comparativas], [Chart.js], [Control sobre SVG (D3), componentes declarativos (Recharts/Nivo), mayor flexibilidad],
    [Leaflet + OpenStreetMap], [Mapas coropléticos por zona territorial], [Mapbox], [Coste cero, sin dependencia de API key, código abierto],
    [Hono (Node.js + TS)], [Backend: API REST, autenticación JWT, ingesta ETL], [Express, Fastify], [Web APIs estándar, portabilidad entre runtimes, menor huella de memoria @akour_serverless_2025],
    [MongoDB (gestionado)], [Base de datos documental: geodatos GeoJSON, series de precios, usuarios], [PostgreSQL + PostGIS], [Soporte nativo GeoJSON y 2dsphere, esquema flexible para series heterogéneas],
    [GitHub Actions], [Pipeline CI/CD: tipado, linting, tests, despliegue], [GitLab CI], [Integración nativa con el repositorio en GitHub],
    [Scaleway], [Infraestructura cloud: contenedores, MongoDB gestionado], [Fly.io, Railway], [Localización en Europa (RGPD), compromiso de sostenibilidad @scaleway_environment_2025],
  ),
  caption: [Stack tecnológico de Vivienda en Crisis: componentes principales, función, alternativa evaluada y criterio de decisión.],
) <tbl:stack-tecnologico>

=== Despliegue e infraestructura

La plataforma se despliega sobre Scaleway, proveedor europeo de computación en la nube con instalaciones en París. La elección de un proveedor europeo responde tanto a requisitos normativos —la residencia de datos en territorio de la Unión Europea simplifica el cumplimiento del Reglamento General de Protección de Datos— como al criterio de sostenibilidad medioambiental señalado en la sección 1.3: Scaleway opera sus centros de datos con energía renovable certificada @scaleway_environment_2025. La descripción detallada de la configuración de contenedores, la gestión de entornos de desarrollo, staging y producción, y la integración con la pipeline de CI/CD se desarrolla en la sección @sec:despliegue.
