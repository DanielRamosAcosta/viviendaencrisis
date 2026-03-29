---
name: Patrón negro-sobre-crema en Design System
description: El Design System incluye o incluirá tokens para fondo negro con texto crema, patrón constructivista presente en navbar, heroes y botones secundarios
type: project
---

El usuario habilitó (o está habilitando) el patrón **negro como surface / crema como texto** dentro de las variables del Design System.

**Why:** Es el patrón constructivista de sección oscura — presente en navbar, secciones hero, botones secundarios, y bloques de énfasis. El token `text/on-dark` (#F5E6C8) ya existe en la colección "Colores", pero puede que se necesite también un `surface/dark` (#1A1A1A) si no está creado.

**How to apply:** Antes de crear cualquier átomo que use fondo oscuro (button/secondary, navbar, secciones hero), verificar que `surface/dark` y `text/on-dark` estén disponibles como variables en Figma y usarlos — no hardcodear #1A1A1A ni #F5E6C8.
