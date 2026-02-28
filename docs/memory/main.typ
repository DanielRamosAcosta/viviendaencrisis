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

#outline()

#pagebreak()

#include "content/01_introduccion/index.typ"

#pagebreak()

#include "content/02_estado_del_arte/index.typ"

#pagebreak()

#include "content/03_diseno/index.typ"

#pagebreak()

#include "content/04_implementacion/index.typ"

#pagebreak()

#include "content/05_pruebas/index.typ"

#pagebreak()

#include "content/06_conclusiones/index.typ"

#pagebreak()

#include "content/07_glosario/index.typ"

#pagebreak()

#include "content/08_bibliografia/index.typ"

#pagebreak()

#include "content/09_anexos/index.typ"
