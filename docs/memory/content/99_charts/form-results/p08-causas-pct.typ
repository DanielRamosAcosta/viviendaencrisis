#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let n = rows.len()
  let raw = count-multi(rows, 8)
  let raw = shorten-labels(raw, (
    "Falta de vivienda pública": "Falta vivienda pública",
    "Legislación insuficiente": "Leg. insuficiente",
    "Hay mucha demanda y poca oferta (se soluciona construyendo más)": "Demanda > oferta",
    "Hay mucha demanda y poca oferta": "Demanda > oferta",
    "Exceso de regulación del mercado inmobiliario": "Exceso regulación",
  ))
  // Top 10: descartar respuestas de texto libre con etiquetas muy largas
  let raw = raw.slice(0, calc.min(raw.len(), 10))
  let data = raw.map(item => (item.at(0), calc.round(item.at(1) / n * 100, digits: 1)))

  [
    #figure(
      {
        cetz.canvas({
          chart.barchart(
            bar-style: bar-palette,
            size: (10, 7),
            label-key: 0,
            value-key: 1,
            x-label: [% de encuestados],
            y-label: [Causa percibida],
            data,
          )
        })
      },
      caption: [Causas percibidas de la crisis de vivienda (P8). Pregunta de selección múltiple. N = 40.],
    ) <fig:causas-crisis>
  ]
}
