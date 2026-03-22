---
id: VC-0059
title: Inicializar monorepo pnpm workspaces + Turborepo
status: In Progress
assignee: []
created_date: '2026-03-22 19:25'
labels:
  - refined
dependencies: []
priority: high
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
- [ ] #1 pnpm-workspace.yaml configurado con apps/* y packages/*
- [ ] #2 turbo.json configurado con pipelines básicos
- [ ] #3 packages/shared con modelo User.ts exportado
- [ ] #4 apps/wireframe funciona como SPA Vite con wired-elements
- [ ] #5 pnpm install funciona sin errores desde la raíz
<!-- AC:END -->
