#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 6)

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 2.8,
            slice-style: sem-3,
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Capacidad de estimar la subida del alquiler en su zona (P6). N = 40.],
    ) <fig:anexo-estimacion>
  ]
}
