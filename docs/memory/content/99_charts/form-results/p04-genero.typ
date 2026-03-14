#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 4)
  let data = shorten-labels(data, (
    "Sexo masculino, sin género": "Masc. sin género",
  ))

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: default-palette.slice(0, data.len()),
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Distribución por género (P4). N = 40.],
    ) <fig:anexo-genero>
  ]
}
