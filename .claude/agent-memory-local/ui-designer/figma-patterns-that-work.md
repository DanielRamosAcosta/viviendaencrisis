---
name: Patrones de use_figma que funcionan bien
description: APIs y técnicas del plugin de Figma que han demostrado ser fiables en sesiones reales
type: feedback
---

## Variables de color

- `figma.variables.createVariableAlias(variable)` → aliasing entre colecciones funciona limpio
- `figma.variables.setBoundVariableForPaint(fill, 'color', variable)` → binding a fills funciona en rectángulos dentro de componentes Y en overrides de instancias
- Las strokes/bordes definidas en el componente se propagan correctamente a todas las instancias

## Componentes con TEXT properties

Patrón que funciona (orden crítico):

```js
// 1. Crear componente y añadir properties
const comp = figma.createComponent();
const labelKey = comp.addComponentProperty('Label', 'TEXT', 'Default');

// 2. Crear nodos y construir jerarquía completa
const text = figma.createText();
text.characters = 'Default';
someFrame.appendChild(text);
comp.appendChild(someFrame);

// 3. SÓLO DESPUÉS vincular componentPropertyReferences
text.componentPropertyReferences = { characters: labelKey };
```

- `instance.setProperties({ [key]: value })` → override de TEXT en instancias: fiable y limpio
- `instance.findOne(n => n.name === 'color-block')` → localizar hijos en instancias para overrides de fill: funciona bien

## Sizing pattern recomendado

En lugar de AUTO + esperar recálculo, calcular manualmente y usar FIXED:

```js
// Calcular altura: paddingTop + suma hijos + gaps + paddingBottom
const H = 32 + 84 + 32; // = 148
frame.resize(W, H);
frame.primaryAxisSizingMode = 'FIXED';
frame.counterAxisSizingMode = 'FIXED';
```

## Workflow de validación

- `get_metadata` en el nodo raíz tras crear → detecta inmediatamente alturas erróneas (height: 10)
- `get_screenshot` en el nodo raíz → validación visual rápida antes de añadir más contenido
- Validar componentes individualmente con screenshot ANTES de instanciarlos masivamente

## Checklist pre-fuente

Antes de usar cualquier familia de fuente nueva en un fichero, verificar:
```js
const fonts = await figma.listAvailableFontsAsync();
return fonts.filter(f => f.fontName.family === 'NombreFamilia').map(f => f.fontName.style);
```
Inter → "Semi Bold" (con espacio), no "SemiBold"
Oswald → "Bold", "SemiBold", "Medium", "Regular", "Light", "ExtraLight"
JetBrains Mono → "Regular", "Bold", "Medium", etc.
