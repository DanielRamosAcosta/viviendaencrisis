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

## Bibliography Labels (refs/references.bib) — accurate list as of P2
- `cis_barometro_enero_2026`, `cis_barometro_dic_2024`, `cis_barometro_nov_2025`
- `eurobarometro_102_2024`, `eurostat_housing_expenditure`
- `banco_espana_doc_2432`, `banco_espana_indicadores_2025`, `banco_espana_informe_anual_2023`, `bde_informe_anual_2025`
- `fotocasa_infojobs_2025`, `cgpj_2025`, `cgpj_2024`, `cje_emancipacion_2024`
- `defensor_pueblo_2024`, `housing_europe_2023`, `ley_vivienda_2023`
- `ambrose_diop_2021`, `st_hilaire_2023`, `aalbers_2016`
- `navalkha_2021`, `maharawal_mcelroy_2018`
- `idra_2024`, `civio_megatenedores_2024`, `idealista_enero_2026`, `kothari_spain_2008`
- `rajagopal_2021`, `alston_spain_2020`
- `provivienda_genero_2023`, `provivienda_discriminacion_2025`, `provivienda_observatorio_monoparentales_2024`
- `matheney_rehous_2025`, `burriel_2008`
- `hammarberg_kanban_2014`, `brown_change_2019`
- `scaleway_environment_2025`, `akour_serverless_2025`, `semafor_rainier_2025`, `anthropic_gcp_2025`
- `orourke_amazon_2025`, `carbone4_cloud_2022`, `carbone4_cloud_2024`, `jegham_hungry_ai_2025`, `ren_reconciling_2024`
- `garcia_lopez_airbnb_barcelona_2020`, `barron_airbnb_prices_2021`, `franco_santos_airbnb_portugal_2021`
- `vives_miro_desposesion_palma_2017`, `cocola_gant_displacement_2018`, `mazorra_lavapies_2023`
- `cocola_gant_financialisation_barcelona_2025`, `fedea_vut_2026`, `mivau_vut_ilegales_2026`
- `ine_vut_experimental`, `reglamento_ue_2024_1028`, `ajuntament_barcelona_vut_2024`
- `ley_6_2025_canarias`, `plan_reside_madrid`
- `mivau_serpavi`, `rd_1312_2024`, `resolucion_serpavi_2026`
- `oecd_affordability_gap_2026`, `patel_nodejs_php_2024`
- **MISSING (needed by other files)**: `beck_xp_1999`, `conventional_commits_2020`, `github_actions_docs`, `wcag_21_2018`, `wai_aria_1_1_2017`, `cohn_agile_estimating_2005`, `vitest_docs`, `playwright_docs`, `rfc_7519_jwt`
- **MISSING (usability — needed for 12_prueba_de_usabilidad)**: `nielsen_usability_1993`, `brooke_sus_1996`

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

## Label Map (confirmed as of P2/VC-0076)
- `<sec:contexto>` → 01_contexto_y_justificacion_del_trabajo.typ
- `<sec:objetivos>` → 02_objetivos_del_trabajo.typ
- `<sec:enfoque>` → 04_enfoque_y_metodo_seguido.typ
- `<sec:planificacion>` → 01_introduccion/05_planificacion_del_trabajo.typ
- `<sec:benchmarking>` → 02_materiales_y_metodos/03_benchmarking.typ
- `<sec:viabilidad>` → 02_materiales_y_metodos/20_viabilidad.typ (new P2)
- `<sec:viabilidad-tecnica>`, `<sec:viabilidad-economica>`, `<sec:viabilidad-legal>`, `<sec:viabilidad-temporal>` → same file as viabilidad
- `<tabla:riesgos>` + `<tabla:fases-planificacion>` → 01_introduccion/05_planificacion_del_trabajo.typ
- `<tabla:fuentes-vivienda>` → 02_materiales_y_metodos/03_benchmarking.typ (new P2)
- Section 1.3 (impacto sostenibilidad): NO label — always use prose ("sección 1.3")
- `<sec:publico-objetivo>` → 04_estudio_publico_objetivo.typ
- `<sec:personas-usuarias>` → 05_personas_usuarias.typ
- `<sec:arquitectura-informacion>` → 06_arquitectura_de_la_informacion.typ
- `<sec:wireframes>` → 08_wireframes.typ
- `<sec:flujo-interactivo>` → 11_flujo_interactivo.typ
- `<sec:prueba-usabilidad>` → 12_prueba_de_usabilidad.typ
- `<sec:metodologia_desarrollo>` → 13_metodologia_xp.typ (new VC-0076)
- `<sec:accesibilidad>` → 16_accesibilidad_tecnica.typ (new VC-0076)
- `<sec:testing>` → 17_estrategia_de_testing.typ (new VC-0076)
- `<sec:seguridad>` → 18_seguridad_y_autenticacion.typ (new VC-0076)
- `<sec:despliegue>` → 19_despliegue_e_infraestructura.typ (new VC-0076)
- `<fig:infrastructure>` → 19_despliegue_e_infraestructura.typ (moved from 04 in VC-0078)
- Kanban chapter (01_metodologia_kanban.typ): NO `<sec:>` label — always reference as prose

## Benchmarking (03_benchmarking.typ) — Updated P2
- Heading: "Análisis de mercado: plataformas y fuentes de datos existentes" (label `<sec:benchmarking>` preserved)
- New subsection added: "=== Mapa de fuentes de datos sobre vivienda en España" with `<tabla:fuentes-vivienda>`
- Canonical home for the sources comparison (MIVAU/INE/Catastro/Idealista/Fotocasa)
- The parallel agent will remove `<fig:fragmentacion-fuentes>` from 01_contexto

## Legal references — no BIB keys needed
- Ley 37/2007, Ley 18/2015, LOPDGDD 3/2018, RGPD (UE) 2016/679 → cited in prose with full official name; never @TODO-* placeholders

## Personas Usuarias (confirmed names from 05_personas_usuarias.typ)
- Marina Delgado — ciudadana afectada (arquetipo 1, persona principal)
- Alejandro Ruiz — activista de datos (arquetipo 2, persona principal)
- Pablo Navarro — usuario técnico (arquetipo 3, persona principal)
- Elena Marín — periodista investigadora (persona secundaria)
- Antonio García — jubilado propietario, baja competencia digital (persona secundaria, restricción accesibilidad)

## Cap. 02 Content Status
- `08_wireframes.typ` — DONE (P2). Has 2 figure refs: `fig:wireframe-home`, `fig:wireframe-precios-evolucion`
- `11_flujo_interactivo.typ` — DONE (P2 / VC-0075). No new figures, cross-refs to @sec:wireframes, @sec:arquitectura-informacion
- `12_prueba_de_usabilidad.typ` — DONE (P2 / VC-0075). 4 subsections (===). No formal test executed — informal validation only. Formal test planned P3.

## Compilation Status (as of P2/VC-0021)
- Main document compiles cleanly as of 2026-11-01 (caps 14 + 15 redactados y compilados)
- `<fig:tech-stack>` is defined in `14_diseno_de_la_arquitectura.typ` (moved from 04 in VC-0078)
- `<sec:modelo-datos>` is defined in `15_modelo_de_datos.typ` (added by this session)
- NEVER redefine a label already defined in another file — Typst will fail with "label occurs multiple times"
- Always grep for existing `<fig:X>` labels before adding a new figure with that label

## Label Map additions (P2/VC-0021)
- `<sec:arquitectura>` → 14_diseno_de_la_arquitectura.typ (new)
- `<sec:modelo-datos>` → 15_modelo_de_datos.typ (new)
- `<fig:tech-stack>` → 14_diseno_de_la_arquitectura.typ (moved from 04 in VC-0078; DO NOT redefine)
- `<fig:infrastructure>` → 19_despliegue_e_infraestructura.typ (moved from 04 in VC-0078; DO NOT redefine)
- `<fig:data-model>` → 15_modelo_de_datos.typ (new, defined there)
- `<tbl:stack-tecnologico>` → 14_diseno_de_la_arquitectura.typ (new)
- `<tbl:colecciones-mongodb>` → 15_modelo_de_datos.typ (new)
