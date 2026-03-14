#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 8)
  let data = shorten-labels(data, (
    "Falta de vivienda pública": "Falta vivienda pública",
    "Legislación insuficiente": "Leg. insuficiente",
    "Hay mucha demanda y poca oferta (se soluciona construyendo más)": "Demanda > oferta",
    "Hay mucha demanda y poca oferta": "Demanda > oferta",
    "Exceso de regulación del mercado inmobiliario": "Exceso regulación",
  ))
  // Top 10: descartar respuestas de texto libre con etiquetas muy largas
  let data = data.slice(0, calc.min(data.len(), 10))

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
            y-label: [Causa],
            data,
          )
        })
      },
      caption: [Principales causas percibidas de la crisis de vivienda (P8). Selección múltiple; N = 40.],
    ) <fig:anexo-causas>
  ]
}
