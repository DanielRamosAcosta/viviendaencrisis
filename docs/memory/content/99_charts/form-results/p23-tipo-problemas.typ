#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()

  // Count empty responses as "Ninguno"
  let empty-count = rows.filter(r => r.at(23).trim() == "").len()

  // Count non-empty multi-select responses
  let non-empty-rows = rows.filter(r => r.at(23).trim() != "")
  let data = count-multi(non-empty-rows, 23)
  let data = shorten-labels(data, (
    "Falta de mantenimiento": "Falta mantenimiento",
    "No devolver fianza": "No devolver fianza",
    "No devolver la fianza": "No devolver fianza",
    "Subida de alquiler injustificada": "Subida injustificada",
    "Presión para abandonar el piso": "Presión para abandonar",
  ))

  // Prepend "Ninguno" with the empty count
  let data = (("Ninguno", empty-count),) + data

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
            y-label: [Tipo de problema],
            data,
          )
        })
      },
      caption: [Tipo de problemas experimentados con inmobiliaria o propietario (P23). Selección múltiple; N = 40. La categoría "Ninguno" corresponde a los encuestados que respondieron "No" en P22.],
    ) <fig:anexo-tipo-problemas>
  ]
}
