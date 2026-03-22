---
id: VC-0059
title: Inicializar monorepo pnpm workspaces + Turborepo
status: Done
assignee: []
created_date: '2026-03-22 19:25'
updated_date: '2026-03-22 21:09'
labels:
  - refined
dependencies: []
priority: high
ordinal: 4.8828125
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Configurar el monorepo con pnpm workspaces y Turborepo. Incluye:
- Migrar de npm a pnpm
- Crear estructura apps/ y packages/
- Inicializar paquete compartido (packages/shared) con modelo User.ts
- Inicializar SPA Vite para wireframes (apps/wireframe) con wired-elements
- Configurar turbo.json y pnpm-workspace.yaml
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 pnpm-workspace.yaml configurado con apps/* y packages/*
- [x] #2 turbo.json configurado con pipelines básicos
- [x] #3 packages/shared con modelo User.ts exportado
- [x] #4 apps/wireframe funciona como SPA Vite con wired-elements
- [x] #5 pnpm install funciona sin errores desde la raíz
<!-- AC:END -->
