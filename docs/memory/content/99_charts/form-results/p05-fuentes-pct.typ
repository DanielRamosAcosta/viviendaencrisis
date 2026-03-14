#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let n = rows.len()
  let raw = count-multi(rows, 5)
  let raw = shorten-labels(raw, (
    "Redes Sociales (Instagram, X, TikTok…)": "Redes sociales",
    "Entorno cercano (familia, amigos, compañeros)": "Entorno cercano",
    "YouTube / Podcasts": "YouTube/Podcasts",
    "Foros y comunidades online (Reddit, Telegram…)": "Foros online",
    "Organismos públicos (INE, ministerios, ayuntamiento…)": "Organismos públicos",
    "Asociaciones / sindicatos de inquilinos": "Sindicatos inquilinos",
    "Entorno laboral (compañeros, sindicato de trabajo…)": "Entorno laboral",
  ))
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
            y-label: [Fuente de información],
            data,
          )
        })
      },
      caption: [Fuentes de información sobre la crisis de vivienda (P5). Pregunta de selección múltiple; los porcentajes suman más del 100\%. N = 40.],
    ) <fig:fuentes-informacion>
  ]
}
