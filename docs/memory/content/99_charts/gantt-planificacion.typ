#import "@preview/gantty:0.5.1": gantt

#page(flipped: true, header: none, footer: none, margin: 0.5cm)[
  #set text(size: 5pt)
  #gantt(yaml("gantt-planificacion.yaml"))
]
