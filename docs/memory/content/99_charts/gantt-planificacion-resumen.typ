#import "@preview/gantty:0.5.1": gantt
#import "_gantt-drawer.typ": no-today-drawer

#figure(
  gantt(yaml("gantt-planificacion-resumen.yaml"), drawer: no-today-drawer),
  caption: [Diagrama de Gantt resumido con las cinco fases del proyecto (P1--P5) y sus fechas de entrega. El desglose completo de tareas puede consultarse en el @anexo:gantt-detallado.],
) <fig:gantt-planificacion>
