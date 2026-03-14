#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 11)
  let data = shorten-labels(data, (
    "Precio por m² entre barrios": "Precio/m² barrios",
    "Mi municipio vs media nacional": "Mi municipio vs nacional",
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
            y-label: [Tipo de comparativa],
            data,
          )
        })
      },
      caption: [Tipos de comparativas de mayor interés (P11). Selección múltiple; N = 40.],
    ) <fig:anexo-comparativas>
  ]
}
