#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 9)
  let data = shorten-labels(data, (
    "Hacen falta más viviendas públicas de alquiler": "Más vivienda pública alquiler",
    "La vivienda es un derecho, no un producto de mercado": "Vivienda = derecho",
    "Hay que limitar la compra de vivienda por fondos de inversión": "Limitar fondos inversión",
    "El problema es que hay demasiada burocracia para construir": "Burocracia para construir",
    "Las ayudas al alquiler terminan subiendo los precios": "Ayudas suben precios",
    "La vivienda es un bien de inversión legítimo": "Vivienda = inversión legítima",
    "Regular los alquileres es contraproducente, reduce la oferta": "Regular reduce oferta",
    "El mercado se regula solo, no hay que intervenirlo": "Mercado se regula solo",
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
            y-label: [Afirmación],
            data,
          )
        })
      },
      caption: [Afirmaciones sobre la crisis de vivienda con las que los encuestados están de acuerdo (P9). Selección múltiple; N = 40.],
    ) <fig:anexo-afirmaciones>
  ]
}
