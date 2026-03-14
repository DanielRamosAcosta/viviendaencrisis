// Helpers compartidos para gráficos de encuesta.
// Todas las funciones operan sobre el CSV limpio (N = 40, sin P1 = "No").

#let survey-csv-path = "../../../data/formulario-limpio.csv"

#let load-rows() = {
  let raw = csv(survey-csv-path)
  raw.slice(1) // descartar cabecera
}

// Cuenta ocurrencias de cada valor único en una columna (selección única).
// Devuelve array de (label, count) ordenado descendente por count.
#let count-single(rows, col) = {
  let counts = (:)
  for row in rows {
    let val = row.at(col).trim()
    if val != "" {
      if val in counts {
        counts.insert(val, counts.at(val) + 1)
      } else {
        counts.insert(val, 1)
      }
    }
  }
  counts.pairs().sorted(key: p => p.at(1)).rev()
}

// Cuenta ocurrencias en columna multi-selección (valores separados por ";").
// Devuelve array de (label, count) ordenado descendente por count.
#let count-multi(rows, col) = {
  let counts = (:)
  for row in rows {
    let val = row.at(col).trim()
    if val != "" {
      let parts = val.split(";")
      for part in parts {
        let p = part.trim()
        if p != "" {
          if p in counts {
            counts.insert(p, counts.at(p) + 1)
          } else {
            counts.insert(p, 1)
          }
        }
      }
    }
  }
  counts.pairs().sorted(key: p => p.at(1)).rev()
}

// Reemplaza etiquetas largas del CSV por etiquetas cortas para los gráficos.
// `mapping` es un diccionario: ("etiqueta CSV": "etiqueta corta").
// Las etiquetas que no están en el mapping se mantienen tal cual.
#let shorten-labels(data, mapping) = {
  data.map(d => {
    let label = d.at(0)
    if label in mapping {
      (mapping.at(label), d.at(1))
    } else {
      d
    }
  })
}

// Paleta por defecto basada en la gama cromática complementaria UOC.
// Se evitan #000078 (headers) y #73EDFF (logo) reservados para branding.
// Ordenada para máximo contraste entre categorías adyacentes.
#let default-palette = (
  rgb("#9999C9"), // azul medio UOC
  rgb("#DDBFB3"), // salmón UOC
  rgb("#ECDAB2"), // dorado UOC
  rgb("#878787"), // gris oscuro UOC
  rgb("#B8CCD8"), // azul acero pastel
  rgb("#C4B3D8"), // lavanda pastel
  rgb("#B3D8C4"), // menta pastel
  rgb("#D8B8B3"), // rosa pastel
  rgb("#DDD5C2"), // beige cálido UOC
  rgb("#D8D8EA"), // azul claro UOC
  rgb("#A8C5B8"), // salvia pastel
  rgb("#D0D0D0"), // gris medio UOC
)

// Función de estilo para barcharts/columncharts.
// Asigna un color de la paleta UOC a cada barra según su índice.
#let bar-palette = i => {
  let colors = default-palette
  (stroke: none, fill: colors.at(calc.rem(i, colors.len())))
}

// Paletas semánticas para piecharts con significado (positivo → negativo).
#let sem-2 = (rgb("#9999C9"), rgb("#878787"))
#let sem-3 = (rgb("#9999C9"), rgb("#ECDAB2"), rgb("#878787"))
#let sem-4 = (rgb("#9999C9"), rgb("#B8CCD8"), rgb("#ECDAB2"), rgb("#878787"))
