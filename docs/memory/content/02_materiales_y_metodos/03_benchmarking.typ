== Benchmarking <sec:benchmarking>

El benchmarking, en el marco del proceso de Design Thinking, forma parte de la fase de _Empatizar_: antes de proponer cualquier solución, se realiza un análisis comparativo de las plataformas existentes con el objetivo de comprender el panorama actual, identificar patrones de diseño consolidados y detectar carencias que justifiquen el desarrollo de una nueva herramienta. Como señala #cite(<brown_change_2019>, form: "prose"), la búsqueda de _insights_ constituye una fuente esencial del pensamiento de diseño, y rara vez surge de datos cuantitativos que miden lo que ya conocemos, sino de observar las experiencias reales de las personas y los productos que ya utilizan @brown_change_2019[p.~49]. En este caso, el análisis se ha centrado en plataformas que, desde perspectivas distintas ---comercial, institucional, periodística y activista---, tratan datos sobre el mercado de la vivienda en España o en contextos internacionales comparables.

=== Plataformas analizadas

Se han analizado siete plataformas seleccionadas por su relevancia en el ámbito de la vivienda y por la diversidad de enfoques que representan.

*Idealista* es el mayor portal inmobiliario de España, con una oferta de anuncios de compraventa y alquiler de ámbito nacional. Se trata de una plataforma estrictamente comercial: los datos son propietarios, los precios que publica corresponden a precios de oferta ---no a transacciones reales--- y el acceso a su API es de pago. Dispone de funcionalidades avanzadas de búsqueda y de mapas de cobertura nacional, con un diseño adaptado a dispositivos móviles.

*Fotocasa* es el segundo portal inmobiliario por volumen de audiencia en España y ofrece funcionalidades similares a las de Idealista. Se diferencia por incorporar contenido editorial adicional ---como un índice de precios propio y guías de barrios--- que complementa la oferta de anuncios. Al igual que Idealista, opera con un modelo de datos propietario y comercial, y su API no está disponible de forma abierta.

*Observatorio de Vivienda y Suelo (MIVAU)* es la plataforma estadística oficial del Ministerio de Vivienda y Agenda Urbana. Publica boletines trimestrales con datos de precios de transacción ---no de oferta--- procedentes de fuentes registrales y notariales, lo que los convierte en la referencia oficial más fiable para el seguimiento del mercado. Sin embargo, la plataforma presenta una navegación institucional poco intuitiva, una experiencia de usuario limitada y escasa adaptación a dispositivos móviles.

*Inside Airbnb* es un proyecto activista independiente que extrae y publica datos sobre los alojamientos de Airbnb en numerosas ciudades del mundo, con el objetivo de analizar el impacto de los pisos turísticos en el mercado residencial. Sus datos son de descarga libre y sus mapas interactivos constituyen un referente en cuanto a accesibilidad y claridad visual. Su alcance está circunscrito, no obstante, al alquiler turístico de corta duración.

*DataHippo* era una plataforma de datos abiertos sobre el alquiler turístico, con una perspectiva cívica y activista similar a la de Inside Airbnb. Ofrecía datos descargables y algunas visualizaciones, aunque con menor profundidad funcional y cobertura geográfica más limitada. En la actualidad el proyecto se encuentra inactivo y su dominio está a la venta, por lo que su análisis se ha realizado a partir de versiones archivadas consultadas a través de Wayback Machine.

*Datadista* es un medio de periodismo de datos que publica investigaciones sobre vivienda, medio ambiente y transparencia institucional en España. Sus piezas combinan datos abiertos, reportajes de investigación y visualizaciones interactivas de alta calidad. Adopta un enfoque editorial riguroso y abierto, aunque su estructura es la de un medio de comunicación, no la de una plataforma de consulta de datos.

*Sindicato de Inquilinas de Madrid* es una organización sindical de inquilinos con presencia digital orientada a la movilización y la asesoría jurídica. Ofrece contenido de denuncia y organización ciudadana, pero carece de herramientas de datos o visualizaciones. Representa el enfoque más explícitamente activista del conjunto analizado.

=== Análisis de navegación e interfaz

El análisis de los árboles de navegación revela diferencias significativas en función del tipo de plataforma. Los portales comerciales ---Idealista y Fotocasa--- presentan las jerarquías de navegación más complejas, organizadas en torno a los tipos de inmueble (pisos, casas, locales, oficinas) y las modalidades de transacción (compra, alquiler, obra nueva), con filtros de múltiples niveles orientados a facilitar la búsqueda de propiedades concretas. El Observatorio del MIVAU muestra una navegación de corte institucional y burocrático, con accesos organizados por categorías temáticas amplias que dificultan la localización rápida de datos específicos. Las plataformas de datos y periodismo ---Datadista, Inside Airbnb y DataHippo--- optan por estructuras más planas y orientadas al contenido, con menos niveles de profundidad y una mayor prominencia de las visualizaciones como elemento central de la experiencia. La web del Sindicato de Inquilinas articula su navegación en torno a ejes de movilización: asesoría, campañas, participación y noticias.

En lo que respecta a la adaptación móvil, todas las plataformas analizadas presentan un diseño responsive, con la notable excepción del Observatorio del MIVAU, cuya interfaz muestra problemas de maquetación evidentes en pantallas de tamaño reducido. Esta carencia resulta especialmente significativa dado el perfil de audiencia institucional al que se dirige y el carácter oficial de los datos que alberga.

=== Tabla comparativa de funcionalidades

La @tabla:benchmarking resume las principales funcionalidades observadas en cada plataforma analizada durante el proceso de benchmarking.

#figure(
  block(
    width: 100%,
    inset: 1em,
    table(
      columns: (2.2fr, 0.7fr, 0.7fr, 0.7fr, 0.9fr, 0.8fr, 0.9fr, 0.9fr),
      align: (left, center, center, center, center, center, center, center),
      stroke: 0.5pt + luma(180),
      fill: (x, y) => if y == 0 { rgb("#2c3e50").lighten(80%) } else if calc.odd(y) { luma(245) } else { white },
      table.header(
        [*Funcionalidad*], [*Id.*], [*Fc.*], [*iAb.*], [*MIVAU*], [*DH.*], [*Ddata.*], [*SI.*],
      ),
      [Datos abiertos], [✗], [✗], [✓], [✓], [✓], [✓], [✗],
      [Perspectiva activista/ciudadana], [✗], [✗], [✓], [✗], [✓], [✓], [✓],
      [Denuncias de abusos inmobiliarios], [✗], [✗], [✗], [✗], [✗], [✓], [✓],
      [Visualizaciones interactivas], [✓], [✓], [✓], [✓], [◐], [✓], [✗],
      [Mapas], [✓], [✓], [✓], [✓], [◐], [✓], [✗],
      [Descarga CSV/XLSX], [✗], [✗], [✓], [✓], [✓], [✓], [✗],
      [Datos de alquiler residencial], [✓], [✓], [✗], [✓], [✗], [◐], [✗],
      [Datos de compraventa], [✓], [✓], [✗], [✓], [✗], [◐], [✗],
      [Datos de alquiler turístico], [✗], [✗], [✓], [✗], [✓], [✓], [✗],
      [Granularidad barrio/calle], [✓], [◐], [✓], [✓], [✓], [✓], [✗],
      [Cobertura nacional], [✓], [✓], [◐], [✓], [◐], [✓], [✗],
      [Serie histórica >10 años], [✓], [✓], [✗], [✓], [✗], [✗], [✗],
      [API disponible], [€], [€], [✗], [✗], [✗], [✗], [✗],
    ),
  ),
  caption: [Comparativa de funcionalidades entre las plataformas analizadas. Id.\u{a0}=\u{a0}Idealista; Fc.\u{a0}=\u{a0}Fotocasa; iAb.\u{a0}=\u{a0}Inside Airbnb; MIVAU\u{a0}=\u{a0}Observatorio de Vivienda y Suelo; DH.\u{a0}=\u{a0}DataHippo; Ddata.\u{a0}=\u{a0}Datadista; SI.\u{a0}=\u{a0}Sindicato de Inquilinas. ✓\u{a0}=\u{a0}sí; ✗\u{a0}=\u{a0}no; ◐\u{a0}=\u{a0}parcial; €\u{a0}=\u{a0}solo en modalidad de pago.],
) <tabla:benchmarking>

#figure(
  image("../../images/benchmarking.webp", width: 100%),
  caption: [Tablero de benchmarking con capturas de pantalla y notas sobre las plataformas analizadas.],
) <fig:benchmarking>

=== Conclusiones del análisis comparativo

El análisis comparativo permite identificar con claridad el espacio que "Vivienda en Crisis" aspira a ocupar. Los portales comerciales ---Idealista y Fotocasa--- ofrecen la mejor experiencia de usuario del conjunto analizado y disponen de la mayor cantidad de datos, pero esos datos son propietarios, se basan en precios de oferta ---no en transacciones reales--- y responden a una motivación comercial que condiciona su presentación y acceso. Las fuentes institucionales ---en particular el MIVAU--- publican datos de mayor calidad estadística, dado que proceden de registros oficiales de compraventa y arrendamiento, pero lo hacen exclusivamente mediante boletines en formato PDF que el usuario debe descargar y consultar manualmente, sin visualizaciones interactivas, con actualizaciones lentas y sin ningún mecanismo de participación ciudadana. Las plataformas de datos abiertos y periodismo de datos ---Datadista, Inside Airbnb y DataHippo--- adoptan una perspectiva cívica y trabajan con datos abiertos, pero su alcance es parcial: cada una se especializa en una dimensión concreta del problema ---el alquiler turístico o la investigación periodística--- sin ofrecer una visión integrada del mercado residencial en su conjunto. El Sindicato de Inquilinas aporta la perspectiva ciudadana más explícita y un sistema de denuncia de abusos, pero carece de cualquier herramienta de datos o visualización.

Ninguna de las plataformas analizadas combina simultáneamente todos los elementos que definen el enfoque de "Vivienda en Crisis": datos abiertos y de calidad estadística contrastada, visualizaciones interactivas accesibles para una audiencia no especializada, cobertura tanto del mercado de alquiler como del de compraventa, granularidad territorial a nivel de municipio y comunidad autónoma, y un sistema integrado de reportes ciudadanos para la denuncia de abusos inmobiliarios. Este vacío constituye la justificación funcional del proyecto y orienta las decisiones de diseño y desarrollo desarrolladas en las secciones siguientes.
