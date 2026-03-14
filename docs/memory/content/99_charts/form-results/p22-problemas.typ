#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 22)

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
      caption: [Proporción de encuestados que han tenido problemas con una inmobiliaria o propietario (P22). N = 40.],
    ) <fig:anexo-problemas>
  ]
}
