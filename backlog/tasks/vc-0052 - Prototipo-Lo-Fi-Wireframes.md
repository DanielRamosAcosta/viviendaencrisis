---
id: VC-0052
title: Prototipo Lo-Fi (Wireframes)
status: In Review
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-22 21:51'
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
