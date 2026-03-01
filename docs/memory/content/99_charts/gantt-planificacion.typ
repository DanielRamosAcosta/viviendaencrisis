#import "@preview/gantty:0.5.1": gantt
#import "_gantt-drawer.typ": no-today-drawer

#page(flipped: true, header: none, footer: none, margin: 0.5cm)[
  #set text(size: 5pt)
  #gantt(yaml("gantt-planificacion.yaml"), drawer: no-today-drawer)
]
