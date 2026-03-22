#import "template/template.typ": template

#show: template.with(
    subject: "Trabajo Final de Máster",
    title: "Vivienda en Crisis",
    subtitle: "Diseño y desarrollo de una plataforma web de datos abiertos para la transparencia del mercado de la vivienda en España",
    date: datetime(year: 2026, month: 6, day: 15),
    author: "Daniel Ramos Acosta",
    program: "Máster Universitario en Desarrollo de Sitios y Aplicaciones Web",
    area: "Desarrollo de aplicaciones web",
    tutor: "Jordi Ustrell Garrigos",
    professor: "César Pablo Córcoles Briongos",
)

#pagebreak()

#include "content/00_inicio/index.typ"

#pagebreak()

#outline(depth: 3)

#pagebreak()

#outline(
  title: [Índice de figuras],
  target: figure.where(kind: image),
)

#outline(
  title: [Índice de tablas],
  target: figure.where(kind: table),
)

#pagebreak()

#include "content/01_introduccion/index.typ"

#pagebreak()

#include "content/02_materiales_y_metodos/index.typ"

#pagebreak()

#include "content/03_resultados/index.typ"

#pagebreak()

#include "content/04_conclusiones/index.typ"

#pagebreak()

#include "content/05_glosario/index.typ"

#pagebreak()

#include "content/06_bibliografia/index.typ"

#pagebreak()

#include "content/07_anexos/index.typ"
