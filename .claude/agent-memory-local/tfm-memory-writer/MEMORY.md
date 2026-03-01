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
- `03_impacto_en_sostenibilidad.typ` — DONE (P1 delivery)
- Sub-headings use `===` (level 3), section heading `==` (level 2) at top of file
- Chapter heading `=` lives in `index.typ`, NOT in the content file

## Bibliography Labels (refs/references.bib) — accurate list as of P1
- `cis_barometro_enero_2026`, `cis_barometro_dic_2024`, `cis_barometro_nov_2025`
- `eurobarometro_102_2024`, `eurostat_housing_expenditure`
- `banco_espana_doc_2432`, `banco_espana_indicadores_2025`
- `fotocasa_infojobs_2025`, `cgpj_2025`, `cgpj_2024`, `cje_emancipacion_2024`
- `defensor_pueblo_2024`, `housing_europe_2023`, `ley_vivienda_2023`
- `ambrose_diop_2021`, `st_hilaire_2023`, `aalbers_2016`
- `navalkha_2021`, `maharawal_mcelroy_2018`
- `idra_2024`, `civio_megatenedores_2024`, `idealista_enero_2026`, `kothari_spain_2008`
- `rajagopal_2021`, `alston_spain_2020`
- `provivienda_genero_2023`, `provivienda_discriminacion_2025`
- `garcia_lamarca_2020`, `garcia_lamarca_mujer_vivienda_2020`
- `matheney_rehous_2025`, `tirado_herrero_2018`, `burriel_2008`

## Style Rules (confirmed)
- Impersonal voice throughout: "se propone", "se ha desarrollado"
- Max ~40 words per sentence; 4-8 lines per paragraph
- No `@TODO-fuente` in compiled files — use real keys or restructure
- `// TODO:` comments for visual placeholders (figures, diagrams) are OK — they are Typst line comments
- APA citation style via `#bibliography("../../refs/references.bib", style: "apa")`

## Content Boundaries
### 01_contexto
- Does NOT cover: detailed market analysis (→ cap. 2.1), platform comparison detail (→ cap. 2.3)
- Does NOT cover: sustainability/ethics/diversity impact (→ 1.3)
- Introduces and justifies — does not analyze in depth

### 03_impacto_en_sostenibilidad
- Covers: CCEG 3 dimensions (sostenibilidad, ética-RS, diversidad+DDHH)
- Covers: ODS alignment table + impact synthesis table
- Does NOT repeat price/salary data from 1.1 — cross-references explicitly
- Pattern: 2 intro paragraphs → 3 subsections (===) → 2 synthesis tables (===)
- Has NO `<sec:>` label on its `==` heading — reference as prose ("sección 1.3") not as `@sec:`

### 04_enfoque_y_metodo_seguido — DONE (P1 delivery)
- Covers: alternatives analysis table (5 OSS projects), chosen strategy, DCU/iterative/XP/validation methodology, data strategy, tech stack
- Label: `<sec:enfoque>` on the `==` heading
- 5 sub-sections (`===`): Estrategias descartadas, Estrategia elegida, Metodología, Datos, Stack
- Only external citation: `@akour_serverless_2025` (serverless energy efficiency, in Hono justification)
- Cross-refs: `@sec:objetivos` (valid); section 1.3 referenced in prose only (no label exists)

## Label Map (confirmed as of P1)
- `<sec:contexto>` → 01_contexto_y_justificacion_del_trabajo.typ
- `<sec:objetivos>` → 02_objetivos_del_trabajo.typ
- `<sec:enfoque>` → 04_enfoque_y_metodo_seguido.typ
- Section 1.3 (impacto sostenibilidad): NO label — always use prose ("sección 1.3")
