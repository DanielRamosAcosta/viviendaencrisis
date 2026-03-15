---
id: VC-0055
title: Verificar claim sobre VUT en Banco de España Informe Anual 2023
status: Done
assignee: []
created_date: '2026-03-14 18:24'
updated_date: '2026-03-14 18:40'
labels: []
dependencies: []
priority: high
milestone: m-1
ordinal: 187.5
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Verificar si el claim "El número de VUT en España es de aproximadamente 340.000, lo que representa cerca del 10% del mercado de alquiler" atribuido a `banco_espana_informe_anual_2023` está explícitamente en el Capítulo 4 del Informe Anual 2023, o si las cifras provienen del INE o del Documento Ocasional 2432.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
## Resultado de la verificación

### Claim a verificar
"El número de VUT en España es de aproximadamente 340.000, lo que representa cerca del 10% del mercado de alquiler" — atribuido a `banco_espana_informe_anual_2023`.

### Veredicto: PARCIALMENTE CORRECTO — la atribución es imprecisa

**Las cifras SÍ aparecen explícitamente en el Capítulo 4 del Informe Anual 2023**, pero con matices importantes:

#### Texto literal del Informe Anual 2023, Cap. 4, p. 255:
> "El alquiler vacacional tiene un peso modesto en el conjunto del mercado residencial, con una ratio estimada en el 1,8 % del total de viviendas principales (340.000 viviendas)⁴¹. No obstante, ya supone cerca un 10 % del tamaño del mercado del alquiler."

#### Footnote 41 del Cap. 4:
> "Véase Estadística experimental. Medición del número de viviendas turísticas en España y su capacidad."

Es decir, el Informe Anual 2023 cita la cifra de **340.000 viviendas**, pero la fuente primaria es la **Estadística Experimental del INE** (INE, 2024d), no los propios cálculos del Banco de España.

#### Documento Ocasional 2432 (DO2432):
- Título: "El mercado del alquiler de vivienda residencial en España: evolución reciente, determinantes e indicadores de esfuerzo" (Khametshin, López Rodríguez y Pérez García, octubre 2024)
- Es un **documento complementario** al Cap. 4 del Informe Anual 2023, publicado posteriormente.
- DO2432 cita **350.000 viviendas** (actualización a principios de 2024), y el mismo 10% del mercado de alquiler.
- Footnote 29 de DO2432 también remite a la misma fuente: **INE, 2024d** — Estadística experimental del INE.

### Corrección recomendada para el TFM
La cita a `banco_espana_informe_anual_2023` es **válida** (las cifras aparecen literalmente en el Cap. 4), pero debería añadirse también la fuente primaria:
- Fuente primaria: INE (2024). *Estadística experimental. Medición del número de viviendas turísticas en España y su capacidad.* https://www.ine.es/experimental/viv_turistica/experimental_viv_turistica.htm
- El DO2432 no es la fuente del claim original; es un documento posterior que actualiza la cifra a 350.000 (2024).
<!-- SECTION:FINAL_SUMMARY:END -->
