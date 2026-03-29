---
name: Workflow para fuentes custom en Figma MCP
description: El MCP no puede usar fuentes custom locales. Crear text style con placeholder, usuario aplica la fuente manualmente, luego usar el style por ID.
type: feedback
---

El MCP de Figma ataca directo a Figma Cloud, que no tiene contexto de fuentes custom instaladas localmente. No se pueden cargar con `loadFontAsync`.

**Workflow acordado:**
1. Crear el text style con una fuente placeholder disponible (ej. Oswald Bold)
2. El usuario edita el text style manualmente en Figma Desktop → aplica la fuente custom (ej. Konstruktor)
3. A partir de ahí, usar `setTextStyleIdAsync(styleId)` para aplicar el style — la fuente custom se resuelve correctamente

**Why:** El usuario lo descubrió y propuso este workflow. Es eficiente: la intervención manual es una sola vez por style.

**How to apply:** Cuando necesites una fuente que no está en Google Fonts / Adobe Fonts, usa este patrón. Siempre indica en la `description` del text style que es un placeholder.
