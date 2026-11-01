#align(center)[
  #text(size: 14pt, weight: "bold")[FICHA DEL TRABAJO FINAL]
]

#v(1em)

#let value-fill = luma(230)

#table(
  columns: (1fr, 1fr),
  align: (right, left),
  stroke: 0.5pt,
  table.hline(stroke: 1.5pt),
  table.vline(stroke: 1.5pt, x: 0),
  table.vline(stroke: 1.5pt, x: 2),
  [*Título del trabajo:*], table.cell(fill: value-fill)[Vivienda en Crisis: Diseño y desarrollo de una plataforma web de datos abiertos para la transparencia del mercado de la vivienda en España],
  [*Nombre del autor:*], table.cell(fill: value-fill)[Daniel Ramos Acosta],
  [*Nombre del consultor/a:*], table.cell(fill: value-fill)[Jordi Ustrell Garrigos],
  [*Nombre del PRA:*], table.cell(fill: value-fill)[César Pablo Córcoles Briongos],
  [*Fecha de entrega (mm/aaaa):*], table.cell(fill: value-fill)[01/2027],
  [*Titulación o programa:*], table.cell(fill: value-fill)[Máster Universitario en Desarrollo de Sitios y Aplicaciones Web],
  [*Área del Trabajo Final:*], table.cell(fill: value-fill)[Desarrollo de aplicaciones web],
  [*Idioma del trabajo:*], table.cell(fill: value-fill)[Castellano],
  [*Palabras clave*], table.cell(fill: value-fill)[_vivienda, datos abiertos, transparencia_],
  table.cell(colspan: 2, align: left)[*Resumen del Trabajo*],
  table.cell(colspan: 2, align: left, fill: value-fill)[La opacidad del mercado de la vivienda en España constituye un obstáculo estructural para el ejercicio del derecho reconocido en el artículo~47 de la Constitución Española. Los datos sobre precios de alquiler y compraventa existen, pero se encuentran dispersos entre fuentes heterogéneas con formatos, periodicidades y granularidades incompatibles, lo que genera una asimetría informativa que beneficia a los actores con mayor capacidad de procesamiento (fondos de inversión, grandes propietarios, plataformas inmobiliarias) en detrimento de la ciudadanía, las organizaciones sociales y las administraciones locales.

Este trabajo diseña y desarrolla "Vivienda en Crisis", una plataforma web de acceso público que funciona como observatorio de datos abiertos del mercado residencial español. La metodología combina el Diseño Centrado en el Usuario (DCU) con un proceso de desarrollo iterativo e incremental articulado en torno a las entregas de evaluación continua del máster. Las fuentes de datos son exclusivamente públicas y oficiales: el Ministerio de Vivienda y Agenda Urbana (MIVAU/SERPAVI), el Instituto Nacional de Estadística (INE) y el Catastro.

El núcleo funcional del producto mínimo viable comprende: visualización de la evolución temporal de precios de alquiler y compraventa, comparativas entre zonas geográficas y precio por metro cuadrado, mapas coropléticos a escala de comunidad autónoma y municipio, contraste con indicadores salariales, y autenticación con roles diferenciados (usuario registrado y administrador). Como ampliación futura opcional, se contempla la incorporación de un sistema de reportes ciudadanos y un módulo de reseñas inmobiliarias, condicionados a la disponibilidad de tiempo tras completar el núcleo obligatorio.

La plataforma pretende reducir la brecha informativa entre actores del mercado, fortalecer la capacidad de incidencia de la ciudadanía y contribuir a la transparencia en la aplicación de las políticas públicas de vivienda.],
  table.cell(colspan: 2, align: left)[*Abstract*],
  table.cell(colspan: 2, align: left, fill: value-fill)[The opacity of the housing market in Spain represents a structural barrier to the exercise of the right enshrined in Article~47 of the Spanish Constitution. Data on rental and purchase prices exist but are scattered across heterogeneous sources with incompatible formats, periodicities and spatial granularities, generating an information asymmetry that benefits actors with greater data-processing capacity (investment funds, large property owners, real-estate platforms) at the expense of citizens, civil society organisations and local administrations.

This work designs and develops "Vivienda en Crisis" (Housing in Crisis), a publicly accessible web platform that operates as an open-data observatory for the Spanish residential market. The methodology combines User-Centred Design (UCD) with an iterative and incremental development process aligned with the master's continuous assessment deliverables. Data sources are exclusively public and official: the Ministry of Housing and Urban Agenda (MIVAU/SERPAVI), the National Statistics Institute (INE) and the Cadastre.

The functional core of the minimum viable product comprises: visualisation of the temporal evolution of rental and purchase prices, cross-zone comparisons and price per square metre, choropleth maps at the level of autonomous community and municipality, contrast with wage indicators, and role-based authentication (registered user and administrator). As an optional future extension, the incorporation of a citizen-reporting system and a property-agency review module is envisaged, contingent on the availability of time after completing the mandatory core.

The platform aims to reduce the information gap between market participants, strengthen citizens' capacity for civic engagement, and contribute to transparency in the enforcement of public housing policies.],
  table.hline(stroke: 1.5pt),
)
