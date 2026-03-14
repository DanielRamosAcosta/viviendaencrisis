#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": bar-palette

#{
  let funcionalidades = (
    ("Datos históricos y evolución", 11),
    ("Fiabilidad y datos verificados", 8),
    ("Reseñas propietarios/inmobiliarias", 5),
    ("Info legal y ayudas", 3),
    ("Búsqueda y comparativas", 3),
    ("Visualiz. pisos turísticos", 2),
    ("Sencillez y claridad UX", 2),
  )

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
            y-label: [Categoría funcional],
            funcionalidades,
          )
        })
      },
      caption: [Categorías de funcionalidades esperadas en la plataforma según las respuestas abiertas a P29 (N válidas = 33).],
    ) <fig:anexo-funcionalidades>
  ]
}
