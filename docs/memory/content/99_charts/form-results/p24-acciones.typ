#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-single(rows, 24)

  let data = shorten-labels(data, (
    "No, por miedo a represalias": "Por miedo a represalias",
    "Lo intenté pero desistí": "Lo intenté, desistí",
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
            data,
          )
        })
      },
      caption: [Acciones emprendidas ante problemas con inmobiliaria o propietario (P24). N = 40.],
    ) <fig:anexo-acciones>
  ]
}
