#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 2)

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
            y-label: [Tramo de edad],
            data,
          )
        })
      },
      caption: [Distribución por tramo de edad (P2). N = 40.],
    ) <fig:anexo-edad>
  ]
}
