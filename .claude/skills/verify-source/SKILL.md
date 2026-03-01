---
name: verify-source
description: Verificar una cita bibliográfica del .bib contra su fuente original (PDF/web), corrigiendo cifras erróneas y marcando verified=true.
argument-hint: clave del .bib (ej. banco_espana_doc_2432) o "next" para la siguiente sin verificar
allowed-tools: Read, Edit, Write, Glob, Grep, Bash, WebFetch, WebSearch
---

# Skill: Verificación de fuentes bibliográficas

Verificas citas de la memoria del TFM contra sus fuentes originales, siguiendo un flujo sistemático.

## Archivos clave

- **BibTeX**: `docs/memory/refs/references.bib`
- **Contenido**: `docs/memory/content/**/*.typ`
- **Compilar**: `npm run build:docs`

## Flujo de verificación

### Paso 0 — Seleccionar fuente

Si `$ARGUMENTS` es "next" o está vacío:
1. Lee `references.bib` y lista las entradas **sin** `verified = {true}`.
2. Muestra la lista al usuario y pregunta cuál verificar.

Si `$ARGUMENTS` es una clave concreta (ej. `banco_espana_doc_2432`):
1. Usa esa clave directamente.

### Paso 1 — Localizar las citas en el texto

1. Busca con `Grep` la clave `@clave_bib` en `docs/memory/content/` para encontrar todos los párrafos que la citan.
2. Lee cada párrafo y extrae las **afirmaciones concretas** que se atribuyen a esa fuente (cifras, porcentajes, fechas, conclusiones).
3. Presenta al usuario un resumen: "Esta fuente se cita N veces con las siguientes afirmaciones: ..."

### Paso 2 — Obtener la fuente original

Según el tipo de fuente:

**PDF (URL directa o local)**:
1. Descargar con `curl -sL -o /tmp/<nombre>.pdf "<url>"`.
2. Convertir con `marker_single`:
   ```
   marker_single /tmp/<nombre>.pdf --output_format markdown --disable_image_extraction --output_dir /tmp/<nombre>_md
   ```
3. Si `marker_single` falla (error de página), reintentar con `--page_range` excluyendo la página problemática. Dividir en segmentos (ej. `0-30`, `31-65`).
4. El markdown resultante estará en `/tmp/<nombre>_md/<nombre>/<nombre>.md`.

**Web (HTML)**:
1. Usar `WebFetch` para obtener y analizar el contenido.

**Artículo con DOI**:
1. Buscar con `WebFetch` en `https://doi.org/<doi>` para obtener metadatos.
2. Si hay PDF de acceso abierto, descargarlo y convertirlo.
3. Si no, buscar con `paper_search` MCP tools.

Si no lo encuentro debo avisar al usuario para que realice la descarga manualmente.

### Paso 3 — Buscar las cifras en la fuente

1. Usar `Grep` con los números/porcentajes/términos clave de cada afirmación.
2. Si las líneas salen omitidas por ser muy largas, usar `Read` con offset/limit en las líneas relevantes.
3. Leer el contexto suficiente (3-5 líneas alrededor) para entender el dato completo.

### Paso 4 — Contrastar y reportar

Para cada afirmación citada, reportar:

- **Afirmación en el texto**: la frase exacta del `.typ`
- **Texto de la fuente**: la frase/párrafo completo de la fuente original (con número de página aproximado del PDF)
- **Veredicto**:
  - EXACTA: la cifra coincide tal cual
  - APROXIMADA: hay diferencia menor (redondeo, etc.) — indicar cifra correcta
  - INCORRECTA: la cifra no coincide — indicar cifra correcta
  - NO ENCONTRADA: no se localiza esa afirmación en la fuente
- **Fuente primaria**: si la fuente cita a su vez otra fuente (ej. "según Eurostat"), indicarlo

### Paso 5 — Corregir el texto

Si hay erratas:
1. Editar el `.typ` con las cifras correctas.
2. Si la fuente primaria es distinta (ej. Eurostat citado por Defensor del Pueblo), ajustar la atribución.

### Paso 6 — Marcar como verificada

1. Añadir `verified = {true}` a la entrada en `references.bib`.
2. Corregir la URL si apuntaba a un documento incorrecto (ej. anexo en vez de informe completo).
3. Compilar con `npm run build:docs` para verificar que no hay errores.

### Paso 7 — Dar al usuario las citas textuales

Siempre terminar mostrando al usuario las **frases completas de la fuente original** que respaldan cada afirmación, con la página aproximada del PDF, para que pueda verificar manualmente.

## Reglas importantes

- **Nunca leer un PDF directamente con Read** (excepto <20 páginas). Siempre convertir con `marker_single` primero.
- **Nunca leer el markdown entero de documentos grandes**. Usar `Grep` para buscar y `Read` con offset/limit para contexto.
- **Ser preciso con las cifras**: 43,1% no es "aproximadamente 45%". Corregir siempre al dato exacto.
- **Distinguir fuente primaria de secundaria**: si el Defensor del Pueblo cita a Eurostat, decirlo.
- **No inventar datos**: si no se encuentra la cifra, reportar NO ENCONTRADA y sugerir eliminar o buscar fuente alternativa.
