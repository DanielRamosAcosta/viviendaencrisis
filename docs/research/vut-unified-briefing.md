# Unified Academic Briefing: VUT Impact on Residential Housing

**Target subsection**: "El alquiler vacacional como factor de presión sobre el mercado residencial"
**Placement**: Between the "vivienda social" paragraph (line 21) and "Datos fragmentados, poder concentrado" (line 23)
**Length**: 3–4 paragraphs (~800–1200 words)
**Prose style**: Match the existing academic register in `01_contexto_y_justificacion_del_trabajo.typ` — formal, data-driven, with inline citations using Typst `@key` and `#cite(<key>, form: "prose")` syntax.

---

## Section A: Escala del fenómeno y dimensión de la ilegalidad

### Key claims (use in paragraph 1)

1. **Total VUT in Spain**: ~340,000 VUT representing approximately 10% of the rental market.
   - **Source**: Banco de España, Informe Anual 2023 (institutional)
   - **BibTeX key**: `banco_espana_informe_anual_2023`
   - **DOES NOT exist** in references.bib

2. **Growth trajectory**: INE experimental statistics show VUT evolution from ~200,000 to ~403,000 to ~329,000.
   - **Source**: INE, Estadística Experimental de Viviendas Turísticas
   - **BibTeX key**: `ine_vut_experimental`
   - **DOES NOT exist** in references.bib

3. **Scale of illegality**: 86,275 illegal VUT notified by MIVAU (February 2026), representing 435,689 plazas = 23% of total supply.
   - **Source**: MIVAU (institutional, press release / official data)
   - **BibTeX key**: `mivau_vut_ilegales_2026`
   - **DOES NOT exist** in references.bib

4. **37% of VUT without license** (November 2025 data).
   - **Source**: Newtral.es (March 2026) — JOURNALISTIC, use only if no institutional alternative covers this claim. The MIVAU data (claim 3) is preferable as institutional source.
   - **FLAG**: Try to attribute the 37% figure to the MIVAU source directly if possible. If not, cite Newtral as relay of MIVAU data.

5. **Madrid**: 92.7% of VUT operating without license (only 1,131–1,200 licensed out of 16,100–17,360 total).
   - **Source**: Plan RESIDE / Madrid regulatory data (institutional)
   - **BibTeX key**: `plan_reside_madrid`
   - **DOES NOT exist** in references.bib

6. **Barcelona enforcement**: >10,500 sanctions and 9,700 illegal VUT closed since 2016.
   - **Source**: Ajuntament de Barcelona (institutional)
   - **BibTeX key**: `ajuntament_barcelona_vut_2024`
   - **DOES NOT exist** in references.bib

7. **Corporate concentration in Barcelona**: 56% of VUT licensees are legal entities; 8.8% of individual licensees control 51% of licensed VUT.
   - **Source**: PAH analysis published in SAGE Journals — financialisation of short-term rentals in Barcelona.
   - **DOI**: 10.1177/09697764251361724
   - **BibTeX key**: `pah_sage_financialisation_barcelona_2025`
   - **DOES NOT exist** in references.bib
   - **FLAG**: Incomplete citation — need full author list and exact title. DOI is available for verification.

8. **EU-level government ordered blocking of >65,000 ads without NRA** (July 2025).
   - **Source**: MIVAU / Registro Único (institutional)
   - Can be folded into the `mivau_vut_ilegales_2026` or a separate `rd_1312_2024` entry.
   - **BibTeX key for the regulation**: `rd_1312_2024` (Real Decreto 1312/2024, Registro Único / VUDA)
   - **DOES NOT exist** in references.bib

---

## Section B: Evidencia de impacto en precios

### Key claims (use in paragraph 2)

1. **FLAGSHIP — García-López, Jofre-Monseny, Martínez-Mazza & Segú (2020)**:
   - Average impact: +1.9% rents, +4.6% transaction prices, +3.7% posted prices.
   - Top decile neighborhoods (highest Airbnb density): +7% rents, +17% transaction prices.
   - Geography: Barcelona. Methodology: IV shift-share.
   - *Journal of Urban Economics*, 119, 103278.
   - **DOI**: 10.1016/j.jue.2020.103278
   - **BibTeX key**: `garcia_lopez_airbnb_barcelona_2020`
   - **DOES NOT exist** in references.bib
   - **545 Google Scholar citations** — flagship causal study for Spain.

2. **Barron, Kung & Proserpio (2021)** — causal mechanism via US data:
   - +1% Airbnb listings → +0.018% rents, +0.026% sale prices.
   - Airbnb responsible for ~1/5 of annual rent increase in US (2012–2016).
   - Methodology: IV (restaurant density + Google searches).
   - *Marketing Science*, 40(1), 23–47.
   - **DOI**: 10.1287/mksc.2020.1227
   - **BibTeX key**: `barron_airbnb_prices_2021`
   - **DOES NOT exist** in references.bib
   - **FLAG**: DOI needs verification. SSRN URL available: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3006832

3. **Franco & Santos (2021)** — Portugal comparison:
   - +3.7% house prices per percentage point increase in Airbnb market share.
   - Up to +32.3% in highly touristic parishes (Lisbon/Porto).
   - *Regional Science and Urban Economics*, 88, 103667.
   - **DOI**: 10.1016/j.regsciurbeco.2021.103667
   - **BibTeX key**: `franco_santos_airbnb_portugal_2021`
   - **DOES NOT exist** in references.bib

4. **Banco de España institutional confirmation**: Neighborhoods with VUT concentration show higher relative price increases.
   - **Source**: Banco de España, Informe Anual 2023 (same as Section A, claim 1).
   - **BibTeX key**: `banco_espana_informe_anual_2023`

5. **FEDEA (2026)**: VUT expansion reduces long-term rental stock and raises rents; calls for "información detallada y mecanismos de supervisión efectivos."
   - **BibTeX key**: `fedea_vut_2026`
   - **DOES NOT exist** in references.bib
   - **FLAG**: Need full author list and exact title for FEDEA report. Source type: institutional/think-tank.

6. **Multicausal acknowledgment**: Housing deficit of 515,000–765,000 units (2021–2024) could explain up to 39% of price increase (CaixaBank Research, Sep 2025). VUT is a significant but not sole driver.
   - **BibTeX key**: `caixabank_research_deficit_2025`
   - **DOES NOT exist** in references.bib
   - **Use sparingly** — the point is to acknowledge multicausality without diluting the VUT argument.

### Writing guidance for paragraph 2:
- Lead with García-López et al. as the definitive Spanish evidence.
- Use Barron et al. for the causal mechanism (internationally validated methodology).
- Franco & Santos for Iberian comparison.
- Highlight the heterogeneity: moderate citywide, severe in tourist neighborhoods.
- Close with institutional confirmation (Banco de España) and multicausal acknowledgment.
- Do NOT cite Fotocasa/Idealista price data here — academic sources cover the claim.

---

## Section C: Desplazamiento y gentrificación

### Key claims (use in paragraph 3)

1. **Palma de Mallorca — Vives-Miró & Rullan (2017)**:
   - Coined "desposesión de vivienda por turistización" in Centro Histórico de Palma.
   - Documented correlation between evictions, property revaluation, and touristification.
   - *Revista de Geografía Norte Grande*, 67, pp. 53–71.
   - **URL**: https://www.researchgate.net/publication/320210361
   - **BibTeX key**: `vives_miro_desposesion_palma_2017`
   - **DOES NOT exist** in references.bib

2. **Madrid/Lavapiés — Mazorra Rodríguez (2023)**:
   - VUT represent >12% of total housing in Lavapiés; ~25% of rental stock in Distrito Centro.
   - Lost 10,000 residents in 5 years (>5 per day).
   - *Historia y Memoria*, 26.
   - **BibTeX key**: `mazorra_lavapies_2023`
   - **DOES NOT exist** in references.bib
   - **FLAG**: Need DOI or URL. Journal title and issue number available.

3. **Barcelona — Cócola-Gant (2018)**:
   - Taxonomy of 4 types of displacement: direct, by exclusion, by deterioration, collective.
   - Published in: *Handbook of Gentrification Studies*, Edward Elgar.
   - **BibTeX key**: `cocola_gant_displacement_2018`
   - **DOES NOT exist** in references.bib

4. **Barcelona commercial fabric**: >70% of commercial premises in historic center linked to tourism.
   - **Source**: Amics de la Rambla (2023) — association/journalistic. Acceptable as descriptive data point.
   - **BibTeX key**: `amics_rambla_2023`
   - **DOES NOT exist** in references.bib
   - **FLAG**: Weak source. Use as illustrative, not as primary evidence.

5. **Barcelona health impacts**: "sentimientos de tristeza, rabia, soledad, estrés e incluso alienación."
   - **Source**: Agència de Salut Pública de Barcelona (institutional).
   - **BibTeX key**: `aspb_salut_turisme`
   - **DOES NOT exist** in references.bib
   - **FLAG**: Need exact report title, year, and URL.

6. **Canarias mobilization**: April 20, 2024 — 57,000 (police) to 200,000+ (organizers), largest mobilization in Canary Islands history.
   - **Source**: Press coverage (journalistic). Acceptable for documenting a social fact.
   - **FLAG**: Consider citing the Ley 6/2025 Canarias (legislative response) instead, as institutional source.
   - **BibTeX key**: `ley_6_2025_canarias`
   - **DOES NOT exist** in references.bib

7. **Social movements**: ABDT (Assemblea de Barris pel Decreixement Turístic, founded 2015), Red SET, Lavapiés al Límite.
   - Descriptive context, no specific citation needed.

### Writing guidance for paragraph 3:
- Frame as displacement/gentrification evidence specific to Spanish cities.
- Lead with Vives-Miró & Rullan (Palma) as the first Spanish academic documentation.
- Add Mazorra Rodríguez (Madrid) for capital-city evidence.
- Use Cócola-Gant for theoretical framework of displacement types.
- Mention Canarias mobilization briefly as social response indicator.
- Keep the health impacts brief (one clause, citing ASPB).

---

## Section D: Opacidad como justificación de herramientas de transparencia

### Key claims (use in paragraph 4 — transitional paragraph)

1. **EU Regulation 2024/1028**: Identifies "falta de información fiable" as the main obstacle for effective regulation of short-term rentals across the EU. Requires platforms to share data with authorities.
   - **BibTeX key**: `reglamento_ue_2024_1028`
   - **DOES NOT exist** in references.bib
   - Full title: Reglamento (UE) 2024/1028 del Parlamento Europeo y del Consejo, de 11 de abril de 2024, relativo a la recopilación y el intercambio de datos en relación con los servicios de alquiler de alojamiento de corta duración.

2. **FEDEA (2026)**: Need for "información detallada y mecanismos de supervisión efectivos."
   - Same source as Section B, claim 5.
   - **BibTeX key**: `fedea_vut_2026`

3. **Transition hook**: The opacity of the VUT market — lack of centralized data, unlicensed operations, corporate structures obscuring ownership — reinforces the broader argument already made in the next section ("Datos fragmentados, poder concentrado") about information asymmetry in Spanish housing markets. The VUT phenomenon adds a specific layer: not only are rental prices opaque, but an entire segment of the housing stock operates outside regulatory visibility.

### Writing guidance for paragraph 4:
- This is a short transitional paragraph (150–200 words).
- Connect the VUT opacity problem to the existing "Datos fragmentados" section that follows.
- Cite the EU Regulation and FEDEA as institutional validation.
- Do NOT repeat the civic tech argument (that comes later in the document).
- End with a sentence that flows naturally into "=== Datos fragmentados, poder concentrado".

---

## Section E: Consolidated Bibliography

### Sources ALREADY in references.bib (DO NOT add again)
- `banco_espana_doc_2432` — Banco de España, Doc. Ocasional 2432
- `ley_vivienda_2023` — Ley 12/2023
- `idealista_enero_2026` — Idealista
- `civio_megatenedores_2024` — Civio
- `defensor_pueblo_2024` — Defensor del Pueblo
- `kothari_spain_2008` — Relator Especial Kothari
- `rajagopal_2021` — Relator Rajagopal

### NEW entries to add to references.bib

```bibtex
@article{garcia_lopez_airbnb_barcelona_2020,
  author    = {García-López, Miquel-Àngel and Jofre-Monseny, Jordi and Martínez-Mazza, Rodrigo and Segú, Mariona},
  title     = {Do short-term rental platforms affect housing markets? {Evidence} from {Airbnb} in {Barcelona}},
  journal   = {Journal of Urban Economics},
  year      = {2020},
  volume    = {119},
  pages     = {103278},
  doi       = {10.1016/j.jue.2020.103278},
  verified  = {false}
}

@article{barron_airbnb_prices_2021,
  author    = {Barron, Kyle and Kung, Edward and Proserpio, Davide},
  title     = {The Effect of Home-Sharing on House Prices and Rents: {Evidence} from {Airbnb}},
  journal   = {Marketing Science},
  year      = {2021},
  volume    = {40},
  number    = {1},
  pages     = {23--47},
  doi       = {10.1287/mksc.2020.1227},
  note      = {DOI needs verification; SSRN working paper: https://papers.ssrn.com/sol3/papers.cfm?abstract\_id=3006832},
  verified  = {false}
}

@article{franco_santos_airbnb_portugal_2021,
  author    = {Franco, Sofia F. and Santos, Carlos Daniel},
  title     = {The impact of {Airbnb} on residential property values and rents: {Evidence} from {Portugal}},
  journal   = {Regional Science and Urban Economics},
  year      = {2021},
  volume    = {88},
  pages     = {103667},
  doi       = {10.1016/j.regsciurbeco.2021.103667},
  verified  = {false}
}

@article{vives_miro_desposesion_palma_2017,
  author    = {Vives-Miró, Sònia and Rullan, Onofre},
  title     = {Desposesión de vivienda por turistización: Revalorización y desplazamientos en el {Centro Histórico} de {Palma} ({Mallorca})},
  journal   = {Revista de Geografía Norte Grande},
  year      = {2017},
  number    = {67},
  pages     = {53--71},
  url       = {https://www.researchgate.net/publication/320210361},
  verified  = {false}
}

@incollection{cocola_gant_displacement_2018,
  author    = {Cócola-Gant, Agustín},
  title     = {Tourism gentrification},
  booktitle = {Handbook of Gentrification Studies},
  editor    = {Lees, Loretta and Phillips, Martin},
  publisher = {Edward Elgar},
  year      = {2018},
  address   = {Cheltenham},
  verified  = {false}
}

@article{mazorra_lavapies_2023,
  author    = {Mazorra Rodríguez, Javier},
  title     = {Turistificación y desplazamiento residencial en el barrio de {Lavapiés} ({Madrid})},
  journal   = {Historia y Memoria},
  year      = {2023},
  number    = {26},
  note      = {DOI/URL pending verification},
  verified  = {false}
}

@techreport{banco_espana_informe_anual_2023,
  author      = {{Banco de España}},
  title       = {Informe Anual 2023},
  year        = {2024},
  institution = {Banco de España},
  url         = {https://www.bde.es/wbe/es/publicaciones/informes-memorias-anuales/informe-anual/},
  note        = {~340.000 VUT en España, ~10\% del mercado de alquiler; barrios con mayor concentración de VUT presentan mayores incrementos relativos de precios},
  verified    = {false}
}

@techreport{fedea_vut_2026,
  author      = {{FEDEA}},
  title       = {Alquiler vacacional y mercado de la vivienda en {España}: impactos económicos y regulación},
  year        = {2026},
  institution = {Fundación de Estudios de Economía Aplicada},
  note        = {Title approximate — needs verification. Calls for "información detallada y mecanismos de supervisión efectivos"},
  verified    = {false}
}

@misc{mivau_vut_ilegales_2026,
  author      = {{MIVAU}},
  title       = {Notificación de viviendas de uso turístico ilegales},
  year        = {2026},
  month       = {2},
  institution = {Ministerio de Vivienda y Agenda Urbana},
  note        = {86.275 VUT ilegales notificadas = 435.689 plazas = 23\% de la oferta total},
  verified    = {false}
}

@misc{ine_vut_experimental,
  author      = {{INE}},
  title       = {Medición del número de viviendas turísticas en {España} y su capacidad},
  year        = {2024},
  institution = {Instituto Nacional de Estadística},
  url         = {https://www.ine.es/experimental/viv_turistica/experimental_viv_turistica.htm},
  note        = {Estadística experimental. Evolución: ~200.000 → ~403.000 → ~329.000},
  verified    = {false}
}

@legislation{reglamento_ue_2024_1028,
  author    = {{Parlamento Europeo and Consejo de la Unión Europea}},
  title     = {Reglamento ({UE}) 2024/1028 relativo a la recopilación y el intercambio de datos en relación con los servicios de alquiler de alojamiento de corta duración},
  year      = {2024},
  month     = {4},
  day       = {11},
  journal   = {Diario Oficial de la Unión Europea},
  url       = {https://eur-lex.europa.eu/eli/reg/2024/1028/oj},
  note      = {Identifica la ``falta de información fiable'' como principal obstáculo para la regulación efectiva},
  verified  = {false}
}

@misc{plan_reside_madrid,
  author      = {{Ayuntamiento de Madrid}},
  title       = {Plan {RESIDE}: Regulación de viviendas de uso turístico},
  year        = {2024},
  institution = {Ayuntamiento de Madrid},
  note        = {1.131--1.200 VUT con licencia de 16.100--17.360 totales (92,7\% sin licencia)},
  verified    = {false}
}

@article{pah_sage_financialisation_barcelona_2025,
  author    = {{PAH}},
  title     = {Financialisation of short-term rentals in {Barcelona}},
  journal   = {SAGE Journals},
  year      = {2025},
  doi       = {10.1177/09697764251361724},
  note      = {56\% licensees = legal entities; 8,8\% individuals control 51\% licensed VUT. Author list and exact title need verification via DOI},
  verified  = {false}
}
```

### Sources considered but NOT recommended for inclusion
- **Newtral.es** — Journalistic; claims covered by MIVAU institutional data.
- **Fotocasa (2024)** — Price evolution already covered by academic sources (García-López et al.) and existing `banco_espana_doc_2432`.
- **Idealista** — Already in references.bib as `idealista_enero_2026`; not needed for VUT section.
- **Amics de la Rambla (2023)** — Weak source; >70% commercial premises claim is illustrative but not essential.
- **ASPB health impacts** — Incomplete citation; could be mentioned without formal citation or with a general reference to institutional reports.
- **Chinese-language sources from ScienceOne** — Excluded per instructions.

---

## Verification flags

1. **`barron_airbnb_prices_2021`**: DOI `10.1287/mksc.2020.1227` needs verification. Volume/pages taken from standard Marketing Science format.
2. **`fedea_vut_2026`**: Title is approximate. Full author list unknown. Needs verification.
3. **`mazorra_lavapies_2023`**: No DOI or URL found. Journal "Historia y Memoria" issue 26 is confirmed.
4. **`pah_sage_financialisation_barcelona_2025`**: Only DOI available. Author list, exact title, and journal name need recovery from DOI.
5. **`mivau_vut_ilegales_2026`**: Exact URL of the MIVAU press release or data source not identified.
6. **`plan_reside_madrid`**: Exact document or URL for Plan RESIDE data not verified.
7. **`banco_espana_informe_anual_2023`**: The ~340,000 VUT figure and the neighborhood-level price correlation claim both need page-level verification.
8. **Canarias mobilization figures** (57,000–200,000): Journalistic sources only; no academic citation available. Recommend mentioning without formal citation or citing the legislative response (Ley 6/2025 Canarias) instead.
