#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 27)

  let data = shorten-labels(data, (
    "Que otros usuarios confirmen la experiencia": "Confirmación por pares",
    "Verificación del contrato": "Verificación contrato",
    "Moderación de contenido": "Moderación",
  ))

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            bar-style: bar-palette,
            size: (10, 4),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            data,
          )
        })
      },
      caption: [Factores de confianza en un sistema de reseñas verificadas (P27). Selección múltiple; N = 40.],
    ) <fig:anexo-factores-confianza>
  ]
}
