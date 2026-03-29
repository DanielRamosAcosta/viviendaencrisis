---
name: Gotchas comunes en use_figma
description: Errores frecuentes encontrados y sus soluciones en el plugin de Figma
type: feedback
---

## 1. `primaryAxisSizingMode` / `counterAxisSizingMode` no aceptan 'HUG'

**Why:** La API del plugin usa 'AUTO' en lugar de 'HUG'.
- ✅ `frame.primaryAxisSizingMode = 'AUTO'`  → hugs content en eje principal
- ❌ `frame.primaryAxisSizingMode = 'HUG'`   → lanza error de validación

**How to apply:** Siempre usar `'AUTO'` para hug, `'FIXED'` para tamaño fijo.

---

## 2. `AUTO` sizing es poco fiable en el plugin — usar FIXED por defecto

**Why:** Frames con `primaryAxisSizingMode = 'AUTO'` frecuentemente se quedan en su tamaño inicial (10px) aunque tengan hijos más grandes. Esto ocurrió dos veces en la misma sesión: en los swatches y en el header. El recálculo no ocurre sincrónicamente durante la ejecución del plugin.

**How to apply:** **Regla por defecto: usar siempre `FIXED` + `resize(w, h)` explícito.** Calcular la altura manualmente (suma de hijos + padding + gaps). Reservar `AUTO` solo cuando realmente no se puede precalcular, y aun así estar preparado para corregirlo con un script de fix.

---

## 3. `hiddenFromPublishing` no está soportado en use_figma

**Why:** Lanza "Node with id X not found" aunque el nodo exista.
**How to apply:** No usar `variable.hiddenFromPublishing`. Omitir o gestionar visibilidad solo con `scopes`.

---

## 4. `resize()` debe llamarse ANTES de setear sizing modes

**Why:** `resize()` resetea los sizing modes a FIXED. Si los seteas antes y luego llamas resize(), se pierden.
**How to apply:** Orden correcto: `frame.resize(w, h)` → luego `frame.primaryAxisSizingMode = 'AUTO'`.

---

## 5. Font style "Semi Bold" lleva espacio en Inter

**Why:** En Inter, el estilo SemiBold se llama `"Semi Bold"` (con espacio), no `"SemiBold"`.
**How to apply:** Verificar siempre con `figma.listAvailableFontsAsync()` antes de usar una fuente nueva.

---

## 8. `use_figma` requiere el parámetro `description` (campo obligatorio)

**Why:** El tool valida que `description` esté presente. Sin él lanza un error de validación antes de ejecutar nada.
**How to apply:** Incluir siempre `description: "..."` en cada llamada a `use_figma`. 3-5 palabras en inglés basta.

---

## 7. `componentPropertyReferences` debe asignarse DESPUÉS de que el nodo sea hijo del componente

**Why:** Si asignas `textNode.componentPropertyReferences = { characters: key }` antes de que `textNode` esté dentro del componente (aunque sea indirectamente a través de frames intermedios), Figma lanza "Can only set component property references on symbol sublayer".
**How to apply:** Construir toda la jerarquía primero (appendChild de todo), y LUEGO asignar `componentPropertyReferences`.

---

## 6. WRAP en auto-layout requiere anchura FIJA en el contenedor

**Why:** `layoutWrap = 'WRAP'` necesita que el frame tenga `primaryAxisSizingMode = 'FIXED'` y un ancho concreto para saber cuándo saltar de línea. Con AUTO en el eje principal, no wrappea.
**How to apply:** Siempre `resize(ancho_deseado, h)` + `primaryAxisSizingMode = 'FIXED'` en el contenedor que tenga `layoutWrap = 'WRAP'`.
