---
name: Figma Main Design — IDs y estructura
description: File key, page IDs, variable collection IDs y node IDs clave del fichero principal de diseño hi-fi
type: reference
---

## Fichero

- **URL**: https://www.figma.com/design/FF1VIGSYXIDur4aakOhBNm/Main-Design
- **File key**: `FF1VIGSYXIDur4aakOhBNm`

## Páginas

| Nombre | ID |
|--------|----|
| 📋 Cover | `1:4` |
| 🎨 Design System | `0:1` |
| 📐 Wireframes | `7:3` |
| 📱 Pantallas | `7:4` |
| 🧪 Sandbox | `7:5` |
| 📝 Documentación | `7:6` |

## Variables de color

### Colección "Primitivos" (`VariableCollectionId:9:3`, mode `9:0`)

| Variable | ID |
|----------|----|
| primitivos/rojo | `VariableID:9:4` |
| primitivos/negro | `VariableID:9:5` |
| primitivos/crema | `VariableID:9:6` |
| primitivos/blanco-roto | `VariableID:9:7` |
| primitivos/gris-oscuro | `VariableID:9:8` |
| primitivos/verde | `VariableID:9:9` |
| primitivos/ambar | `VariableID:55:3` | ⚠️ Valor real en Figma: ~#E5830E (style guide dice #E58315, diferencia mínima en canal B) |

### Colección "Colores" (`VariableCollectionId:10:3`, mode `10:0`)

| Token | ID |
|-------|----|
| action/primary | `VariableID:10:4` |
| action/secondary | `VariableID:10:5` |
| surface/default | `VariableID:10:6` |
| surface/elevated | `VariableID:10:7` |
| text/primary | `VariableID:10:8` |
| text/secondary | `VariableID:10:9` |
| feedback/error | `VariableID:10:10` |
| feedback/success | `VariableID:10:11` |
| feedback/warning | `VariableID:55:4` |
| text/on-dark | `VariableID:75:88` |
| surface/dark | `VariableID:80:92` |
| surface/dark/elevated | `VariableID:80:93` |
| action/primary/hover | `VariableID:87:5` |
| action/primary/active | `VariableID:87:6` |
| border/default | `VariableID:87:7` |
| border/focus | `VariableID:87:8` |
| border/error | `VariableID:87:9` |
| text/placeholder | `VariableID:87:10` |
| text/disabled | `VariableID:87:11` |
| surface/disabled | `VariableID:87:12` |
| surface/toggle-thumb | `VariableID:87:13` |

### Nuevos Primitivos (añadidos 2026-03-29)
| Variable | ID | Hex |
|----------|----|-----|
| primitivos/rojo-oscuro | `VariableID:87:3` | `#A30000` |
| primitivos/blanco | `VariableID:87:4` | `#FFFFFF` |

## Variables de dimensiones

### Colección "Dimensiones" (`VariableCollectionId:28:3`, mode `28:0`)

| Variable | ID | Valor | Scopes |
|----------|----|-------|--------|
| spacing/1 | `VariableID:28:4` | 4 | GAP, WIDTH_HEIGHT |
| spacing/2 | `VariableID:28:5` | 8 | GAP, WIDTH_HEIGHT |
| spacing/3 | `VariableID:28:6` | 12 | GAP, WIDTH_HEIGHT |
| spacing/4 | `VariableID:28:7` | 16 | GAP, WIDTH_HEIGHT |
| spacing/6 | `VariableID:28:8` | 24 | GAP, WIDTH_HEIGHT |
| spacing/8 | `VariableID:28:9` | 32 | GAP, WIDTH_HEIGHT |
| spacing/12 | `VariableID:28:10` | 48 | GAP, WIDTH_HEIGHT |
| spacing/16 | `VariableID:28:11` | 64 | GAP, WIDTH_HEIGHT |
| spacing/24 | `VariableID:28:12` | 96 | GAP, WIDTH_HEIGHT |
| radius/none | `VariableID:28:13` | 0 | CORNER_RADIUS |
| border/thin | `VariableID:28:14` | 1 | STROKE_FLOAT |
| border/medium | `VariableID:28:15` | 2 | STROKE_FLOAT |
| border/accent | `VariableID:28:16` | 4 | STROKE_FLOAT |
| border/heavy | `VariableID:28:17` | 8 | STROKE_FLOAT |

## Frames de exposición en Design System

| Frame | ID |
|-------|----|
| `color-palette` | `14:3` |
| `dimensions-palette` | `29:67` |
| `typography-palette` | `51:75` |

## Componentes en Design System

| Componente | ID | Props |
|------------|----|-------|
| `ds/header` | `32:67` | `Title#32:0`, `Subtitle#32:1` |
| `swatch/primitivo` | `23:3` | `Label#23:0`, `Hex#23:1` |
| `swatch/token` | `24:3` | `Token#24:0`, `Uso#24:1`, `Hex#24:2` |

## Nodes clave en Design System

| Frame | ID |
|-------|----|
| `color-palette` (frame principal paleta) | `14:3` |
| `header` | `14:4` |
| `section-primitivos` | `25:3` |
| `swatches-row` (dentro de section-primitivos) | dentro de `25:3` |
| `separator` | `26:27` |
| `section-tokens` | `26:28` |
| `tokens-grid` (dentro de section-tokens) | dentro de `26:28` |

## Fonts disponibles (verificadas con listAvailableFontsAsync)

| Familia | Disponible | Estilos clave | Notas |
|---------|-----------|---------------|-------|
| **Konstruktor** | ✅ En el archivo | Regular | Font local aplicada manualmente por el usuario. El style `heading/display` en Figma YA USA Konstruktor Regular (no el placeholder Oswald). MCP no puede hacer `loadFontAsync` con ella para crear texto nuevo — usar Oswald Bold como fallback en scripts. |
| **Montserrat** | ✅ Sí | Black, Bold, ExtraBold, **SemiBold**, Medium, Regular, Light, Thin (+ Italic variants) | `"SemiBold"` sin espacio |
| **Oswald** | ✅ Sí | Bold, SemiBold, Medium, Regular, Light, ExtraLight | Sin variantes Italic |
| **Inter** | ✅ Sí | Black, Bold, Extra Bold, **Semi Bold**, Medium, Regular, Light, Thin (+ Italic) | `"Semi Bold"` CON espacio |
| **JetBrains Mono** | ✅ Sí | Bold, ExtraBold, ExtraLight, Light, Medium, **Regular**, Thin (+ Italic) | Sin "Semi Bold" |

⚠️ **Diferencia crítica de naming**:
- `Montserrat` → `"SemiBold"` (una palabra, sin espacio)
- `Inter` → `"Semi Bold"` (dos palabras, con espacio)
- `Inter` → `"Extra Bold"` (dos palabras, con espacio)

## Text Styles

| Nombre | ID | Fuente | Tamaño |
|--------|----|--------|--------|
| `heading/display` | `S:837eb49fb20a150bfb447c766b9a5b3d8a391191,` | Konstruktor* (placeholder Oswald Bold) | 96px |
| `heading/xl` | `S:6b5fdf73f63ba062ec240554143ce8966a86cd76,` | Oswald Bold | 56px |
| `heading/lg` | `S:068d9d083de95d9dd075fbd6b2dee296cdf728e5,` | Oswald Bold | 40px |
| `heading/md` | `S:e9bfd3de8fd789e215e9afecbc8d29a9899a5ca4,` | Oswald SemiBold | 28px |
| `heading/sm` | `S:d12fd3a1a1e0ae10d0e8f90d63bc034be19284e2,` | Montserrat SemiBold | 20px |
| `body/lg` | `S:67510fcd5da62711afdee2e2344db556e7895c55,` | Inter Regular | 18px |
| `body/md` | `S:ed45763fc5358333d4aea85e3f0f5da7bb5632c7,` | Inter Regular | 16px |
| `body/sm` | `S:9bccec02cab936bcab92c4a44f15d36b4a09410d,` | Inter Regular | 14px |
| `body/xs` | `S:aeedf227fcc9616f29f7c7cafd601f19cc81a2e9,` | Inter Regular | 12px |
| `label/md` | `S:df5de713995d9cd0d124508747892ede55f9a910,` | Montserrat SemiBold | 14px |
| `label/sm` | `S:6ad355cce312ff739613833aad6f07db1094fac5,` | Montserrat SemiBold | 12px |
| `data/lg` | `S:81ca29d17e6935cc51847fb8b228d198de228c2d,` | JetBrains Mono Regular | 32px |
| `data/md` | `S:12bc81f7d982007fd5fd6f62ea36609883f80b93,` | JetBrains Mono Regular | 16px |
| `data/sm` | `S:feb96ac69ca6c396a049e989d4d388f9676d7a1d,` | JetBrains Mono Regular | 14px |
