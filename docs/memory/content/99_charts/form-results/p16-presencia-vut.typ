#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 16)

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: sem-4,
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Presencia de pisos turísticos en el edificio o calle del encuestado (P16). N = 40.],
    ) <fig:anexo-presencia-vut>
  ]
}
