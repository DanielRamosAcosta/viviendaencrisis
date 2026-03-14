#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 12)
  let data = shorten-labels(data, (
    "Propiedad con hipoteca": "Prop. con hipoteca",
    "Propiedad con hipoteca (no se activa)": "Prop. con hipoteca",
    "Propiedad sin hipoteca": "Prop. sin hipoteca",
    "Vivo en cada heredada de abuelos pero sin estar a mi nombre. Problemas con escrituras a mi": "Otra situación",
  ))

  // Merge duplicates after label normalization
  let merged = (:)
  for item in data {
    let key = item.at(0)
    if key in merged {
      merged.insert(key, merged.at(key) + item.at(1))
    } else {
      merged.insert(key, item.at(1))
    }
  }
  let data = merged.pairs().sorted(key: p => p.at(1)).rev()

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: default-palette.slice(0, 5),
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Situación de vivienda actual de los encuestados (P12). N = 40. La categoría "Prop. con hipoteca" agrupa las dos respuestas con ese régimen.],
    ) <fig:anexo-situacion>
  ]
}
