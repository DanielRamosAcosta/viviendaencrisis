#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let raw = count-single(rows, 13)

  // Collapse: keep Canarias, sum the rest into "Otras CCAA"
  let canarias = 0
  let otras = 0
  for item in raw {
    if item.at(0) == "Canarias" {
      canarias = item.at(1)
    } else {
      otras += item.at(1)
    }
  }
  let data = (("Canarias", canarias), ("Otras CCAA", otras))

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: sem-2,
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Distribución por comunidad autónoma de residencia (P13). N = 40. "Otras CCAA" agrupa Andalucía, Castilla-La Mancha, Madrid, Catalunya, País Vasco e Illes Balears (1 respuesta cada una).],
    ) <fig:anexo-ccaa>
  ]
}
