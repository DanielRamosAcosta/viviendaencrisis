# Styleguide — Vivienda en Crisis

Guía visual basada en el **Constructivismo Ruso** (1920s), adaptada a una plataforma web moderna de datos abiertos sobre vivienda.

## Referentes visuales

- **Alexander Rodchenko** — composiciones diagonales, fotomontaje, tipografía bold
- **Liubov Popova** — geometría abstracta, superposición de planos
- **El Lissitzky** — "Beat the Whites with the Red Wedge", uso del espacio negativo
- **Revistas LEF / Novy LEF** — maquetación editorial, portadas tipográficas
- **Aleksei Gan** — manifiesto "Конструктивизм" (Constructivismo, 1922)

Moodboard completo en Figma: [Benchmarking — Constructivismo Ruso](https://www.figma.com/board/AMxWQhPs1jEGNC2P2dcHGN/Benchmarking?node-id=17-449)

## Paleta de colores

| Nombre         | Hex       | Uso principal                              |
| -------------- | --------- | ------------------------------------------ |
| Rojo intenso   | `#CC0000` | Acción, énfasis, alertas, elementos clave  |
| Negro          | `#1A1A1A` | Texto principal, fondos, contraste fuerte  |
| Crema / Beige  | `#F5E6C8` | Fondo general, áreas de contenido          |
| Blanco roto    | `#FAF7F0` | Fondo alternativo, tarjetas                |
| Gris oscuro    | `#3D3D3D` | Texto secundario, bordes                   |

La paleta se limita intencionalmente a pocos colores de alto contraste, fiel al constructivismo que priorizaba la funcionalidad sobre la decoración.

## Tipografía

| Rol              | Familia sugerida                  | Peso        | Estilo                  |
| ---------------- | --------------------------------- | ----------- | ----------------------- |
| Títulos (H1-H2)  | Condensada sans-serif (ej. Oswald, Bebas Neue) | Bold / Black | Mayúsculas, tracking amplio |
| Subtítulos (H3-H4) | Sans-serif geométrica (ej. Montserrat) | SemiBold    | Mayúsculas opcionales   |
| Cuerpo           | Sans-serif legible (ej. Inter, Source Sans) | Regular     | Normal                  |
| Datos / Tablas   | Monoespaciada (ej. JetBrains Mono) | Regular     | Tabular nums            |

### Principios tipográficos

- Títulos en **mayúsculas** con peso visual alto
- Jerarquía clara mediante tamaño y peso, no mediante variedad de fuentes
- Contraste extremo entre título y cuerpo

## Elementos gráficos

### Líneas y barras

- Barras rojas gruesas como separadores y elementos decorativos
- Líneas diagonales (45 grados) como recurso compositivo recurrente
- Bordes gruesos (`2-4px`) en componentes clave

### Composición

- **Asimetría**: layouts no centrados, composiciones dinámicas
- **Diagonales**: elementos rotados o cortados en diagonal para generar tensión visual
- **Grid multicolumna**: distribución editorial con columnas de ancho variable
- **Numeración grande**: indicadores numéricos de gran tamaño como recurso visual (útil para estadísticas de vivienda)

### Texturas y fondos

- Fondo con aspecto de papel envejecido / kraft (sutil, no dominante)
- Ruido o grain muy ligero para dar calidez analógica
- Evitar gradientes — usar bloques de color plano

## Iconografía

- Estilo geométrico y angular, sin redondeos suaves
- Líneas gruesas (`stroke-width: 2-3`)
- Monocromática: negro o rojo sobre fondo claro

## Componentes UI — Directrices

### Tarjetas de datos

- Fondo crema o blanco roto
- Borde izquierdo grueso rojo (`4px`)
- Título en mayúsculas, dato numérico grande y prominente
- Sin sombras suaves — usar bordes sólidos o sin elevación

### Botones

- Primario: fondo rojo, texto blanco/crema, sin border-radius (esquinas rectas)
- Secundario: fondo negro, texto crema
- Hover: inversión de colores (outline)
- Sin border-radius (`border-radius: 0`)

### Navegación

- Barra superior con fondo negro
- Links en crema/blanco, activo subrayado con rojo
- Tipografía condensada en mayúsculas

### Mapas coropléticos

- Escala de color: de crema (valor bajo) a rojo intenso (valor alto)
- Bordes de regiones en negro fino
- Leyenda con estilo tipográfico consistente

### Gráficos y visualizaciones

- Colores principales: rojo y negro sobre fondo crema
- Ejes y gridlines en gris oscuro, discretos
- Labels en sans-serif, tamaño legible
- Estilo flat, sin gradientes ni 3D

## Tono visual general

El constructivismo ruso nació como un movimiento artístico al servicio de la revolución social. Su estética comunica **urgencia, denuncia y acción colectiva** — valores que encajan con una plataforma que busca transparencia frente a la crisis de vivienda.

La interfaz debe sentirse como un **cartel de propaganda moderna**: directa, impactante, sin adornos innecesarios. Cada elemento visual tiene una función. Si no comunica, sobra.
