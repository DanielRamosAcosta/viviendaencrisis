#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 20)
  let data = shorten-labels(data, (
    "Proporción respecto a vivienda habitual": "Proporción vs habitual",
    "Número de pisos turísticos": "Número de pisos",
    "Evolución en el tiempo": "Evolución temporal",
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
            y-label: [Tipo de información],
            data,
          )
        })
      },
      caption: [Información deseada sobre pisos turísticos en la plataforma (P20). Selección múltiple; N = 40.],
    ) <fig:anexo-info-vut>
  ]
}
