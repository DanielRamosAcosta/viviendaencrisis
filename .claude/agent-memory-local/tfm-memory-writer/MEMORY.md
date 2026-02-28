# Project Memory — TFM "Vivienda en Crisis"

## Key Files
- **Main entry**: `docs/memory/main.typ`
- **Content dir**: `docs/memory/content/` (chapters 00–09)
- **Bibliography**: `docs/memory/refs/references.bib` (APA style, loaded from `08_bibliografia`)
- **Template**: `docs/memory/template/template.typ` (tidbit-uoc v0.2.0)
- **Compile**: `typst compile docs/memory/main.typ` → outputs `docs/memory/main.pdf`
- **Research**: `docs/research/` — deep search reports with verified sources
- **Classroom**: `docs/classroom/` — PEC enunciados and rubrics

## Typst Citation Gotcha
`@TODO-fuente` DOES NOT compile — Typst requires all citation keys to resolve in the BibTeX file.
Fix: either replace with a real key or add a placeholder `@misc{TODO-fuente, ...}` entry.
Preferred: replace with real citation or restructure the sentence.

## Chapter Structure (01_introduccion)
- `01_contexto_y_justificacion_del_trabajo.typ` — DONE (P1 delivery)
- Sub-headings use `===` (level 3), section heading `==` (level 2) at top of file
- Chapter heading `=` lives in `index.typ`, NOT in the content file

## Bibliography Labels (refs/references.bib) — written so far
- `cis_barometro_2026`, `eurobarometro_102_2024`
- `banco_espana_doc_2432`, `banco_espana_indicadores_2025`
- `fotocasa_infojobs_2025`, `cgpj_2025`, `cgpj_2024`, `cje_emancipacion_2024`
- `defensor_pueblo_2024`, `housing_europe_2023`, `ley_vivienda_2023`, `consejo_europa_2024`
- `ambrose_coulson_yoshida_2021`, `wachsmuth_2023`, `aalbers_2016`
- `lopez_rodriguez_2010`, `gil_2025`, `puig_bellacasa_2022`, `maharawal_mcelroy_2018`
- `idra_2024`, `civio_megatenedores_2024`, `rajagopal_2021`, `idealista_enero_2026`

## Style Rules (confirmed)
- Impersonal voice throughout: "se propone", "se ha desarrollado"
- Max ~40 words per sentence; 4-8 lines per paragraph
- No `@TODO-fuente` in compiled files — use real keys or restructure
- `// TODO:` comments for visual placeholders (figures, diagrams) are OK — they are Typst line comments
- APA citation style via `#bibliography("../../refs/references.bib", style: "apa")`

## Content Boundaries for 01_contexto
- Does NOT cover: detailed market analysis (→ cap. 2.1), platform comparison detail (→ cap. 2.3)
- Does NOT cover: sustainability/ethics/diversity impact (→ 1.3, task VC-0007)
- Introduces and justifies — does not analyze in depth
