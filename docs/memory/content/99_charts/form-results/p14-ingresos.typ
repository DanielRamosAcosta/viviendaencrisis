#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 14)
  let data = shorten-labels(data, (
    "No aplica (vivo con familia, etc.)": "No aplica",
  ))

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            bar-style: bar-palette,
            size: (10, 7),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Tramo de esfuerzo],
            data,
          )
        })
      },
      caption: [Porcentaje de ingresos destinado a vivienda (P14). N = 40.],
    ) <fig:anexo-ingresos>
  ]
}
