#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let n = rows.len()
  let raw = count-multi(rows, 11)
  let raw = shorten-labels(raw, (
    "Precio por m² entre barrios": "Precio/m² barrios",
    "Mi municipio vs media nacional": "Mi municipio vs nacional",
  ))
  let data = raw.map(item => (item.at(0), calc.round(item.at(1) / n * 100, digits: 1)))

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            bar-style: bar-palette,
            size: (10, 4),
            label-key: 0,
            value-key: 1,
            x-label: [% de encuestados],
            y-label: [Tipo de comparativa],
            data,
          )
        })
      },
      caption: [Tipos de comparativas de mayor interés para los encuestados (P11). Pregunta de selección múltiple. N = 40.],
    ) <fig:comparativas-interes>
  ]
}
