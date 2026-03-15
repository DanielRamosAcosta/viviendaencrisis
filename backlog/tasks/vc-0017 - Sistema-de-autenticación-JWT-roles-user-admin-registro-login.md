---
id: VC-0017
title: 'Sistema de autenticación (JWT + roles user/admin, registro, login)'
status: To Do
assignee: []
created_date: '2026-03-01 17:55'
updated_date: '2026-03-15 15:12'
labels:
  - auth
milestone: m-1
dependencies:
  - VC-0014
  - VC-0016
priority: low
ordinal: 7000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Implementar sistema completo de autenticación con JWT. Incluye: registro de usuarios, login, refresh tokens, middleware de autorización, y sistema de roles (usuario registrado y administrador). Tanto endpoints API (Hono) como páginas frontend (Next.js).

Horas estimadas: 10h

Dependencia clave: bloquea Reportes Airbnb (P3) y Moderación admin (P4).
<!-- SECTION:DESCRIPTION:END -->
