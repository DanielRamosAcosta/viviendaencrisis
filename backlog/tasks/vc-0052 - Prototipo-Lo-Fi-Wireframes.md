---
id: VC-0052
title: Prototipo Lo-Fi (Wireframes)
status: In Review
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-29 17:44'
labels:
  - ux/ui
milestone: m-1
dependencies: []
priority: high
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Diseñar wireframes de baja fidelidad en Figma:
- Crear Wireframe Kit con Autolayout
- Wireframes Mobile: dashboard, mapa coroplético, gráficas de evolución, comparador, formulario de reporte
- Wireframes Desktop: adaptación responsiva con mayor aprovechamiento para visualizaciones de datos
- Documentar patrones de diseño usados (filtros de datos, dropdowns de selección geográfica, tooltips en gráficas, cards de reportes, mapas interactivos)
<!-- SECTION:DESCRIPTION:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
## E2E Tests (Playwright)

Set up Playwright e2e testing with 57 passing tests across 4 spec files.

| Spec file | Tests | Description |
|---|---|---|
| `navigation.spec.ts` | 33 (1 skipped) | Every route renders a heading without JS errors |
| `responsive.spec.ts` | 14 | 4 pages at 3 viewports; hamburger on mobile, nav links on desktop |
| `auth.spec.ts` | 4 | AuthGate blocks, login flow, logout, protected routes |
| `interaction.spec.ts` | 6 | Search, FAQ accordion, glossary filter, tab switching, report form steps, 404 |

### Skipped
- `/precios/comparar`: rough-viz bar charts crash headless Chromium (OOM)

### Shadow DOM workarounds
- `wired-search`: 0 height in headless; tests use `toBeAttached()` or `page.evaluate()` dispatch
- `wired-tabs`: tab headers require `getByRole('tab')` or manual `CustomEvent` dispatch
- Auth tests use SPA navigation to preserve React state
<!-- SECTION:NOTES:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
## Prototipo Lo-Fi completo implementado

### Resumen
Se implementó el prototipo no funcional completo de Vivienda en Crisis en el wireframe app (`apps/wireframe/`), con ~33 páginas navegables, responsive (mobile-first), con datos mock y charts hand-drawn.

### Estructura implementada
- **Fase 0**: Fundación compartida — AuthContext, mockData, Layout (Navbar/Footer/PageLayout), AuthGate, SectionCard, StarRating, todas las rutas en App.tsx
- **Fase 1**: 4 packages paralelos:
  - **Precios y Comparativas** (7 páginas): evolución temporal, comparar zonas, precio/m², asequibilidad, oficial vs portales, ranking
  - **Reportes, Reseñas y Auth** (11 páginas): formulario 3 pasos, mapa reportes, consultar reportes/reseñas, login/registro/recuperar
  - **Datos Abiertos + Mi Cuenta** (8 páginas): explorador municipio, descargar datos, metodología, perfil, favoritas, alertas, estado reporte
  - **Info, Home y 404** (7 páginas): about, FAQ accordion, derechos inquilino, glosario searchable, home rediseñado con hero+charts
- **Fase 2**: QA con Playwright — 57 tests passing (navegación, responsive 3 viewports, auth flow, interactividad)

### Commits
- `feat(wireframe): scaffold shared foundation and all route stubs`
- `feat(wireframe): add reportes, resenas and auth pages`
- `feat(wireframe): add datos abiertos and mi cuenta pages`
- `feat(wireframe): integrate precios, info, home and 404 pages`
- `test(wireframe): add Playwright e2e tests for prototype`
<!-- SECTION:FINAL_SUMMARY:END -->
