#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 17)
  let data = shorten-labels(data, (
    "Menos oferta de vivienda": "Menos oferta",
    "Gentrificación del barrio": "Gentrificación",
    "Encarecimiento del comercio local": "Comercio local más caro",
  ))

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            bar-style: bar-palette,
            size: (10, 7),
            label-key: 0,
            value-key: 1,
            x-label: [Número de respuestas],
            y-label: [Efecto],
            data,
          )
        })
      },
      caption: [Efectos percibidos de los pisos turísticos en el entorno (P17). Selección múltiple; N = 40.],
    ) <fig:anexo-efectos-vut>
  ]
}
