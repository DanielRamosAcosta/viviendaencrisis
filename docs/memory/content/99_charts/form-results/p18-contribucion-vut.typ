#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let raw = count-single(rows, 18)

  // Relabel extremes
  let raw = shorten-labels(raw, (
    "1": "1 (ninguna)",
    "5": "5 (máxima)",
  ))

  // Sort by scale order (1→5), not by count
  let scale-order = ("1 (ninguna)", "2", "3", "4", "5 (máxima)")
  let data = scale-order.map(label => {
    let match = raw.find(item => item.at(0) == label)
    if match != none { match } else { (label, 0) }
  })

  [
    #figure(
      {
        cetz.canvas({
          chart.columnchart(
            bar-style: bar-palette,
            size: (auto, 6),
            label-key: 0,
            value-key: 1,
            x-label: [Valor en escala 1-5],
            y-label: [Número de respuestas],
            data,
          )
        })
      },
      caption: [Percepción de la contribución de los pisos turísticos a la crisis de vivienda, escala 1-5 (P18). Media = 3,15; mediana = 3. N = 40.],
    ) <fig:anexo-contribucion-vut>
  ]
}
