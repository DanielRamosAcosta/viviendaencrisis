== Objetivos del Trabajo <sec:objetivos>

El propósito central de este trabajo consiste en diseñar y desarrollar una plataforma web de datos abiertos que facilite la transparencia del mercado de la vivienda en España, poniendo a disposición de la ciudadanía herramientas de visualización y participación que reduzcan la asimetría informativa documentada en las secciones precedentes. Este objetivo general se articula a su vez en un conjunto de objetivos específicos que delimitan el alcance funcional, técnico y de despliegue del proyecto, y que servirán como criterio de evaluación en las conclusiones finales del trabajo.

Para su implementación, la plataforma se apoya en un conjunto de tecnologías web de código abierto ampliamente adoptadas en el sector profesional. La capa de presentación se desarrolla con Next.js sobre React y TypeScript, mientras que la lógica de servidor se implementa mediante Hono sobre Node.js y los datos se persisten en MongoDB. La visualización de datos se construye con las bibliotecas D3.js, Recharts, Nivo y Leaflet, y el despliegue se automatiza a través de Docker, GitHub Actions y Scaleway.

=== Objetivo general

Diseñar y desarrollar una plataforma web de datos abiertos, accesible públicamente, que permita visualizar la evolución del mercado de la vivienda en España —precios de alquiler y compraventa, comparativas territoriales y contraste con indicadores salariales— y disponga de un sistema completo de gestión de usuarios y administración de la plataforma. Con carácter opcional y supeditado a la disponibilidad de tiempo, se contempla incorporar funcionalidades de participación ciudadana para la documentación de irregularidades en el sector inmobiliario, cuyo desarrollo queda recogido como línea de trabajo futuro.

=== Objetivos específicos

+ *Integrar y normalizar fuentes de datos oficiales sobre vivienda.* Construir una canalización de datos reproducible y auditable que integre los índices de precios del Ministerio de Vivienda y Agenda Urbana (MIVAU/SERPAVI), los datos del Instituto Nacional de Estadística (INE) y la información del Catastro, transformándolos en un formato homogéneo apto para su consulta y visualización.

+ *Aplicar un proceso de diseño centrado en el usuario.* Llevar a cabo un ciclo completo de diseño UX que comprenda la investigación con personas usuarias, la definición de perfiles y escenarios de uso, la elaboración de la arquitectura de la información y el diseño de prototipos de baja y alta fidelidad, de modo que las decisiones de interfaz queden fundamentadas en evidencia empírica y no únicamente en criterios técnicos.

+ *Desarrollar un módulo de visualización interactiva de precios.* Implementar gráficos de evolución temporal (series de precios de alquiler y compraventa), comparativas entre zonas geográficas y análisis de precio por metro cuadrado, mediante bibliotecas de visualización de datos integradas en la capa de presentación.

+ *Implementar mapas coropléticos de cobertura territorial.* Desarrollar una capa cartográfica interactiva que represente los datos de vivienda a escala de comunidad autónoma y municipio, permitiendo la exploración geográfica de la distribución de precios y su evolución en el tiempo.

+ *Implementar la gestión de usuarios y la administración de la plataforma.* Desarrollar el sistema de autenticación con soporte para dos roles diferenciados —usuario registrado y administrador—, incluyendo el registro, inicio de sesión, recuperación de contraseña y el panel de administración para la gestión de cuentas y el control operativo de la plataforma.

+ *Garantizar la accesibilidad web de la plataforma conforme a los estándares WCAG 2.1.* El proyecto asume el compromiso de implementar las pautas de accesibilidad al contenido web en su nivel AA, de forma que la plataforma resulte usable por personas con diversidad funcional.
+ *Desplegar la aplicación en un servidor público accesible en Internet.* El proyecto asume el compromiso de poner en producción la plataforma desarrollada en una infraestructura pública accesible mediante URL pública, de modo que tanto el tribunal evaluador como la ciudadanía en general puedan acceder a la aplicación y verificar su funcionamiento. Este despliegue constituye un requisito evaluable del proyecto.

+ *Garantizar la calidad técnica y la seguridad de la aplicación.* Implementar prácticas de desarrollo seguro —gestión de autenticación, control de acceso por roles, validación de entradas y protección frente a vulnerabilidades comunes— y verificar la corrección del código mediante revisión de buenas prácticas en HTML, CSS y las capas de lógica de negocio.

=== Objetivos opcionales (supeditados a la disponibilidad de tiempo)

Los siguientes objetivos quedan fuera del alcance comprometido del curso. Se abordarán únicamente si la ejecución del núcleo funcional concluye con margen suficiente antes de las fechas de entrega. En caso contrario, quedan documentados como líneas de trabajo futuro en la sección 4.2 de este trabajo.

+ *Desarrollar un sistema de reportes ciudadanos con moderación.* Implementar un módulo que permita a las personas usuarias registradas documentar y comunicar situaciones de abuso o irregularidad en el mercado inmobiliario, con un flujo de moderación gestionado por el perfil administrador de la plataforma. Este objetivo constituye el de mayor coste estimado de implementación y es, por tanto, el principal candidato a posponer.

+ *Incorporar un sistema de reseñas inmobiliarias con valoraciones.* Desarrollar un módulo que permita a las personas usuarias registradas publicar reseñas sobre inmuebles o zonas geográficas, con un mecanismo de agregación de valoraciones y un proceso de moderación básico. Este objetivo comparte infraestructura con el módulo de reportes ciudadanos y depende funcionalmente del sistema de autenticación.
