#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let data = count-multi(rows, 5)
  let data = shorten-labels(data, (
    "Redes Sociales (Instagram, X, TikTok…)": "Redes sociales",
    "Entorno cercano (familia, amigos, compañeros)": "Entorno cercano",
    "YouTube / Podcasts": "YouTube/Podcasts",
    "Foros y comunidades online (Reddit, Telegram…)": "Foros online",
    "Organismos públicos": "Organismos públicos",
    "Asociaciones / sindicatos de inquilinos": "Sindicatos inquilinos",
    "Entorno laboral": "Entorno laboral",
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
            y-label: [Fuente],
            data,
          )
        })
      },
      caption: [Fuentes de información sobre la crisis de vivienda (P5). Selección múltiple; N = 40.],
    ) <fig:anexo-fuentes>
  ]
}
