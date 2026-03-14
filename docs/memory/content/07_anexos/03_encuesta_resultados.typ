#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart

== Resultados completos de la encuesta de público objetivo <anexo:encuesta-resultados>

Este anexo recoge las visualizaciones de todas las preguntas cerradas del cuestionario, organizadas por bloques temáticos, junto con los resúmenes categorizados de las preguntas de texto libre. Los datos corresponden a la muestra válida de N = 40 respuestas, tras descartar las 3 respuestas en las que el participante no otorgó consentimiento al tratamiento de datos (P1 = "No").

=== Bloque sociodemográfico (P2–P4)

#{
  let edad = (
    ("24-30 años", 11),
    ("31-35 años", 8),
    ("46-55 años", 8),
    ("Más de 55 años", 7),
    ("36-45 años", 5),
    ("18-23 años", 1),
  )
  let genero = (
    ("Masculino", 21),
    ("Femenino", 17),
    ("Masc. sin género", 1),
    ("No binario", 1),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Tramo de edad],
            edad,
          )
        })
      },
      caption: [Distribución por tramo de edad (P2). N = 40.],
    ) <fig:anexo-edad>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#2980b9"),
              rgb("#e74c3c"),
              rgb("#27ae60"),
              rgb("#f39c12"),
            ),
            label-key: 0,
            value-key: 1,
            genero,
          )
        })
      },
      caption: [Distribución por género (P4). N = 40.],
    ) <fig:anexo-genero>
  ]
}

=== Bloque O1: Conocimiento y percepción de la crisis (P5–P9)

#{
  let fuentes = (
    ("Prensa digital", 30),
    ("Redes sociales", 22),
    ("Entorno cercano", 19),
    ("Televisión", 18),
    ("YouTube/Podcasts", 16),
    ("Experiencia propia", 14),
    ("Radio", 9),
    ("Foros online", 7),
    ("Organismos públicos", 5),
    ("Sindicatos inquilinos", 4),
    ("Prensa en papel", 2),
    ("Entorno laboral", 1),
  )
  let estimacion = (
    ("Sí, aproximadamente", 28),
    ("Tengo una idea vaga", 8),
    ("No tengo ni idea", 4),
  )
  let conocimiento = (
    ("Sí, las tengo claras", 21),
    ("Conozco algunas", 18),
    ("No sabría explicarlas", 1),
  )
  let causas = (
    ("Falta vivienda pública", 31),
    ("Pisos turísticos", 30),
    ("Especulación", 27),
    ("Leg. insuficiente", 19),
    ("Fondos de inversión", 16),
    ("Salarios bajos", 15),
    ("Demanda > oferta", 15),
    ("Exceso regulación", 10),
    ("Inmigración", 6),
    ("Okupación", 6),
  )
  let afirmaciones = (
    ("Más vivienda pública alquiler", 34),
    ("Vivienda = derecho", 29),
    ("Limitar fondos inversión", 27),
    ("Burocracia para construir", 13),
    ("Ayudas suben precios", 11),
    ("Vivienda = inversión legítima", 10),
    ("Regular reduce oferta", 8),
    ("Mercado se regula solo", 6),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Fuente],
            fuentes,
          )
        })
      },
      caption: [Fuentes de información sobre la crisis de vivienda (P5). Selección múltiple; N = 40.],
    ) <fig:anexo-fuentes>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            estimacion,
          )
        })
      },
      caption: [Capacidad de estimar la subida del alquiler en su zona (P6). N = 40.],
    ) <fig:anexo-estimacion>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            conocimiento,
          )
        })
      },
      caption: [Conocimiento de las causas de la crisis de vivienda (P7). N = 40.],
    ) <fig:anexo-conocimiento-causas>

    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Causa],
            causas,
          )
        })
      },
      caption: [Principales causas percibidas de la crisis de vivienda (P8). Selección múltiple; N = 40.],
    ) <fig:anexo-causas>

    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Afirmación],
            afirmaciones,
          )
        })
      },
      caption: [Afirmaciones sobre la crisis de vivienda con las que los encuestados están de acuerdo (P9). Selección múltiple; N = 40.],
    ) <fig:anexo-afirmaciones>
  ]
}

*P15 — ¿Qué le gustaría entender mejor sobre la crisis de la vivienda? (abierta)*

24 de 40 encuestados ofrecieron respuestas válidas (60 %). Las 16 no-respuestas fueron descartadas ("No", "Nada en particular", "No sabría decir", "-", etc.). Las categorías identificadas se recogen en la tabla siguiente.

#figure(
  table(
    columns: (1fr, auto, auto),
    align: (left, center, center),
    table.header(
      [*Categoría temática*],
      [*Respuestas*],
      [*% sobre válidas*],
    ),
    [Inacción política y falta de intervención gubernamental], [8], [33,3 %],
    [Marco legislativo y regulación], [5], [20,8 %],
    [Construcción y oferta de vivienda pública], [4], [16,7 %],
    [Dinámicas económicas del mercado], [4], [16,7 %],
    [Impacto del turismo], [2], [8,3 %],
    [Necesidad de investigación objetiva], [1], [4,2 %],
  ),
  caption: [Categorías temáticas de las respuestas a P15 (N válidas = 24).],
) <tbl:anexo-p15>

=== Bloque O2: Utilidad de herramientas de visualización (P10–P11)

#{
  let utilidad = (
    ("Muy útil", 30),
    ("Algo útil", 7),
    ("Poco útil", 2),
    ("Nada útil", 1),
  )
  let comparativas = (
    ("Evolución temporal", 27),
    ("Precio/m² barrios", 24),
    ("Relación precio-salario", 20),
    ("Mi municipio vs nacional", 19),
    ("Alquiler vs compra", 18),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#2ecc71"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            utilidad,
          )
        })
      },
      caption: [Utilidad percibida de gráficos interactivos de precios de vivienda (P10). N = 40.],
    ) <fig:anexo-utilidad>

    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Tipo de comparativa],
            y-label: [Número de respuestas],
            comparativas,
          )
        })
      },
      caption: [Tipos de comparativas de mayor interés (P11). Selección múltiple; N = 40.],
    ) <fig:anexo-comparativas>
  ]
}

=== Bloque O3: Situación habitacional y esfuerzo económico (P12–P14)

#{
  let situacion = (
    ("Alquiler", 14),
    ("Prop. con hipoteca", 12),
    ("Prop. sin hipoteca", 8),
    ("Vivo con familia", 5),
    ("Otra situación", 1),
  )
  let ingresos = (
    ("30-40 %", 11),
    ("20-30 %", 11),
    ("No aplica", 8),
    ("Menos del 20 %", 7),
    ("40-50 %", 2),
    ("Más del 50 %", 1),
  )
  let ccaa = (
    ("Canarias", 34),
    ("Otras CCAA", 6),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#e74c3c"),
              rgb("#e67e22"),
              rgb("#27ae60"),
              rgb("#2980b9"),
              rgb("#95a5a6"),
            ),
            label-key: 0,
            value-key: 1,
            situacion,
          )
        })
      },
      caption: [Situación de vivienda actual de los encuestados (P12). N = 40. La categoría "Prop. con hipoteca" agrupa las dos respuestas con ese régimen.],
    ) <fig:anexo-situacion>

    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Tramo de esfuerzo],
            ingresos,
          )
        })
      },
      caption: [Porcentaje de ingresos destinado a vivienda (P14). N = 40.],
    ) <fig:anexo-ingresos>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#f39c12"),
              rgb("#2980b9"),
            ),
            label-key: 0,
            value-key: 1,
            ccaa,
          )
        })
      },
      caption: [Distribución por comunidad autónoma de residencia (P13). N = 40. "Otras CCAA" agrupa Andalucía, Castilla-La Mancha, Madrid, Catalunya, País Vasco e Illes Balears (1 respuesta cada una).],
    ) <fig:anexo-ccaa>
  ]
}

=== Bloque O4: Pisos turísticos y disposición a reportar (P16–P21)

#{
  let presencia = (
    ("No que yo sepa", 14),
    ("Sí, alguno", 14),
    ("Sí, varios", 10),
    ("No estoy seguro", 2),
  )
  let efectos = (
    ("Subida de alquiler", 22),
    ("Menos oferta", 19),
    ("Ninguno", 11),
    ("Gentrificación", 10),
    ("Comercio local más caro", 8),
    ("Ruido y molestias", 7),
  )
  let contribucion = (
    ("1 (ninguna)", 10),
    ("2", 2),
    ("3", 10),
    ("4", 8),
    ("5 (máxima)", 10),
  )
  let reportar = (
    ("Sí", 25),
    ("Depende de garantías", 8),
    ("No", 7),
  )
  let info_deseada = (
    ("Proporción vs habitual", 28),
    ("Si tienen licencia", 25),
    ("Número de pisos", 24),
    ("Impacto en precios", 24),
    ("Evolución temporal", 19),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
              rgb("#95a5a6"),
            ),
            label-key: 0,
            value-key: 1,
            presencia,
          )
        })
      },
      caption: [Presencia de pisos turísticos en el edificio o calle del encuestado (P16). N = 40.],
    ) <fig:anexo-presencia-vut>

    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Efecto percibido],
            efectos,
          )
        })
      },
      caption: [Efectos percibidos de los pisos turísticos en el entorno (P17). Selección múltiple; N = 40.],
    ) <fig:anexo-efectos-vut>

    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Valor en escala 1-5],
            y-label: [Número de respuestas],
            contribucion,
          )
        })
      },
      caption: [Percepción de la contribución de los pisos turísticos a la crisis de vivienda, escala 1-5 (P18). Media = 3,15; mediana = 3. N = 40.],
    ) <fig:anexo-contribucion-vut>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            reportar,
          )
        })
      },
      caption: [Disposición a reportar pisos turísticos ilegales de forma anónima (P19). N = 40.],
    ) <fig:anexo-reportar>

    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Tipo de información],
            y-label: [Número de respuestas],
            info_deseada,
          )
        })
      },
      caption: [Información deseada sobre pisos turísticos en la plataforma (P20). Selección múltiple; N = 40.],
    ) <fig:anexo-info-vut>
  ]
}

*P21 — ¿Cuál es su experiencia personal con pisos turísticos? (abierta)*

20 de 40 encuestados ofrecieron respuestas válidas (50 %). Las 20 no-respuestas fueron descartadas.

#figure(
  table(
    columns: (1fr, auto, auto),
    align: (left, center, center),
    table.header(
      [*Categoría temática*],
      [*Respuestas*],
      [*% sobre válidas*],
    ),
    [Proliferación e invasión de zonas residenciales], [6], [30,0 %],
    [Efecto cascada: desplazamiento y subida de precios], [3], [15,0 %],
    [Otras observaciones (licencias, zonas sin pisos, etc.)], [3], [15,0 %],
    [Experiencia neutra / sin impacto], [3], [15,0 %],
    [Problemas de convivencia (ruido, molestias)], [2], [10,0 %],
    [Desplazamiento de inquilinos residenciales], [2], [10,0 %],
    [Experiencia como huésped (negativa)], [1], [5,0 %],
  ),
  caption: [Categorías temáticas de las respuestas a P21 (N válidas = 20).],
) <tbl:anexo-p21>

=== Bloque O5: Experiencia con inmobiliarias y reseñas (P22–P28)

#{
  let problemas = (
    ("No", 25),
    ("Sí", 15),
  )
  let tipo_problemas = (
    ("Ninguno", 25),
    ("Falta mantenimiento", 8),
    ("Comisiones abusivas", 7),
    ("No devolver fianza", 5),
    ("Subida injustificada", 4),
    ("Presión para abandonar", 4),
    ("Cláusulas ilegales", 3),
    ("Discriminación", 3),
  )
  let acciones = (
    ("No sabía cómo", 17),
    ("Lo intenté, desistí", 10),
    ("Por miedo a represalias", 9),
    ("Sí, denuncia formal", 4),
  )
  let valoracion_resenas = (
    ("Muy útil", 28),
    ("Algo útil", 9),
    ("Poco útil", 2),
    ("Nada útil", 1),
  )
  let disposicion_resenas = (
    ("Sí, anónimamente", 21),
    ("Sí, con mi nombre", 16),
    ("No", 3),
  )
  let factores_confianza = (
    ("Confirmación por pares", 27),
    ("Verificación contrato", 23),
    ("Anonimato", 12),
    ("Moderación", 9),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            problemas,
          )
        })
      },
      caption: [Proporción de encuestados que han tenido problemas con una inmobiliaria o propietario (P22). N = 40.],
    ) <fig:anexo-problemas>

    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Tipo de problema],
            tipo_problemas,
          )
        })
      },
      caption: [Tipo de problemas experimentados con inmobiliaria o propietario (P23). Selección múltiple; N = 40. La categoría "Ninguno" corresponde a los encuestados que respondieron "No" en P22.],
    ) <fig:anexo-tipo-problemas>

    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Acción emprendida],
            y-label: [Número de respuestas],
            acciones,
          )
        })
      },
      caption: [Acciones emprendidas ante problemas con inmobiliaria o propietario (P24). N = 40.],
    ) <fig:anexo-acciones>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#27ae60"),
              rgb("#2ecc71"),
              rgb("#f39c12"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            valoracion_resenas,
          )
        })
      },
      caption: [Valoración de un sistema de reseñas de inmobiliarias en la plataforma (P25). N = 40.],
    ) <fig:anexo-valoracion-resenas>

    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: (
              rgb("#2980b9"),
              rgb("#27ae60"),
              rgb("#e74c3c"),
            ),
            label-key: 0,
            value-key: 1,
            disposicion_resenas,
          )
        })
      },
      caption: [Disposición a dejar reseñas sobre inmobiliarias o propietarios (P26). N = 40.],
    ) <fig:anexo-disposicion-resenas>

    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Factor de confianza],
            y-label: [Número de respuestas],
            factores_confianza,
          )
        })
      },
      caption: [Factores de confianza en un sistema de reseñas verificadas (P27). Selección múltiple; N = 40.],
    ) <fig:anexo-factores-confianza>
  ]
}

*P28 — ¿Podría compartir alguna experiencia con una inmobiliaria o propietario? (abierta)*

14 de 40 encuestados ofrecieron respuestas válidas (35 %). Las 26 no-respuestas fueron descartadas.

#figure(
  table(
    columns: (1fr, auto, auto),
    align: (left, center, center),
    table.header(
      [*Categoría temática*],
      [*Respuestas*],
      [*% sobre válidas*],
    ),
    [Abuso económico: fianzas, comisiones y subidas injustificadas], [4], [28,6 %],
    [Falta de mantenimiento y condiciones de la vivienda], [3], [21,4 %],
    [Discriminación y asimetría de poder], [2], [14,3 %],
    [Vulnerabilidad y desprotección del inquilino], [2], [14,3 %],
    [Inestabilidad contractual], [2], [14,3 %],
    [Estafa inmobiliaria], [1], [7,1 %],
  ),
  caption: [Categorías temáticas de las respuestas a P28 (N válidas = 14).],
) <tbl:anexo-p28>

=== Bloque O6: Funcionalidades esperadas (P29)

*P29 — ¿Qué funcionalidades le gustaría encontrar en la plataforma? (abierta)*

33 de 40 encuestados ofrecieron respuestas válidas (82,5 %). Las 7 no-respuestas fueron descartadas.

#{
  let funcionalidades = (
    ("Datos históricos y evolución", 11),
    ("Fiabilidad y datos verificados", 8),
    ("Reseñas propietarios/inmobiliarias", 5),
    ("Info legal y ayudas", 3),
    ("Búsqueda y comparativas", 3),
    ("Visualiz. pisos turísticos", 2),
    ("Sencillez y claridad UX", 2),
  )

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            size: (10, auto),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Categoría funcional],
            funcionalidades,
          )
        })
      },
      caption: [Categorías de funcionalidades esperadas en la plataforma según las respuestas abiertas a P29 (N válidas = 33).],
    ) <fig:anexo-funcionalidades>
  ]
}

#figure(
  table(
    columns: (1fr, auto, auto),
    align: (left, center, center),
    table.header(
      [*Categoría funcional*],
      [*Respuestas*],
      [*% sobre válidas*],
    ),
    [Datos históricos de precios y evolución temporal], [11], [33,3 %],
    [Fiabilidad, transparencia y datos verificados], [8], [24,2 %],
    [Reseñas y valoraciones de propietarios e inmobiliarias], [5], [15,2 %],
    [Información legal y sobre ayudas al alquiler], [3], [9,1 %],
    [Herramientas de búsqueda y comparativas con filtros], [3], [9,1 %],
    [Visualización de pisos turísticos vs vivienda habitual], [2], [6,1 %],
    [Claridad y sencillez de la interfaz], [2], [6,1 %],
  ),
  caption: [Categorías temáticas de las respuestas a P29 (N válidas = 33).],
) <tbl:anexo-p29>
