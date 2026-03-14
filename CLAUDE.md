# Vivienda en Crisis

TFM (Trabajo Final de Máster) del Máster Universitario en Desarrollo de Sitios y Aplicaciones Web de la UOC (Universitat Oberta de Catalunya).

## Contexto Funcional

**Título**: Vivienda en Crisis: Diseño y desarrollo de una plataforma web de datos abiertos para la transparencia del mercado de la vivienda en España

### Descripción

Plataforma web que funciona como observatorio público de vivienda. Permite visualizar datos abiertos sobre precios de alquiler y compraventa, comparativas por zona, y mapas coropléticos. Incluye un sistema de reportes ciudadanos para denunciar abusos inmobiliarios.

## Funcionalidades core

- Visualización de evolución temporal de precios (líneas/barras)
- Comparativas entre zonas y precio por m²
- Mapas coropléticos por comunidad autónoma y municipio
- Sistema de reportes ciudadanos con moderación
- Autenticación con dos roles: usuario registrado y administrador
- Datos y visualizaciones accesibles sin registro

## Contexto técnico

### Estructura del monorepo

- `backlog/` — Tareas, milestones y planificación, gestionadas con backlog.md
- `docs/memory` — Memoria del proyecto, escrita en Typst
- `docs/classroom/` — Enunciados y tareas del aula virtual (contexto académico)
- `docs/reserach/` — Investigaciones profundas (Deep Search) realizadas con IA relevantes para el contexto del proyecto

### Stack técnico

- **Frontend**: Next.js (React) + TypeScript
- **Backend/API**: Hono (Node.js)
- **Base de datos**: MongoDB
- **Visualización**: D3.js / Recharts / Nivo + Leaflet / Mapbox
- **Despliegue**: Docker, GitHub Actions, Vercel (frontend)

### Fuentes de datos

- Ministerio de Vivienda y Agenda Urbana (índices de precios trimestrales)
- INE (Censo de vivienda, indicadores demográficos)
- Catastro (datos abiertos de uso y superficie)

Se contempla scraping puntual de portales inmobiliarios (Idealista, Fotocasa, etc.) como sondeo complementario, siempre dentro del marco legal (datos públicos, sin evadir rate limiters ni medidas anti-scraping).

### Commits

- Conventional Commits: `tipo(scope): mensaje` (e.g. `feat(api): add endpoint for rental prices`)
- En inglés
- Máximo 96 caracteres en el mensaje del commit
- Sin `Co-Authored-By`
- Antes de hacer commit, revisar la diff para generar un mensaje significativo


<!-- BACKLOG.MD MCP GUIDELINES START -->

<CRITICAL_INSTRUCTION>

### Otras instrucciones

* Siempre que te encuentres con un binario o fichero que podría llenar de tokens el contexto (*.doc, *.docx, *.png), si necesitas leerlo, antes de leerlo, solicita siempre permiso al usuario
* Siempre que necesites leer un fichero de texto en formato propietario o PDF, intenta buscar su alernativa en Markdown (debería tener el mismo nombre, pero en `.md`). Si no tiene, probablemente no sea un fichero relevante.
* Para redacciones de la memoria del TFM (docs/memory/), usar siempre el agente `tfm-memory-writer` en lugar de editar directamente

### Gestión de tareas obligatoria

Todo trabajo (sesión principal y subagentes) **debe** estar vinculado a una tarea del backlog. Además, se debe reflejar el estado real en todo momento:

1. **Al refinar** una tarea con el usuario (product-owner) → moverla a **Refinement**
2. **Al empezar** a trabajar en una tarea → moverla a **In Progress**
3. **Al terminar** el prompt, poner la tarea en "In Review" automáticamente y sin preguntar
4. **Cuando el usuario dé el OK** → moverla a **Done**
5. **Si el usuario no da el OK** moverla de nuevo a **In Progress** en lo que se realizan los ajustes (es decir, volver al paso 2.)

Nunca se debe trabajar sin una tarea asociada. Si no existe, créala antes de empezar.

## Vocabulario UOC

* **UOC**: Universitat Oberta de Catalunya
* **PEC**: Prueba de Evaluación Continua
* **P<XX>**: Una práctica concreta (P1 = Práctica 1)
* **EIMT**: Estudios de Informática, Multimedia y Telecomunicación
* **CCEG**: Competencia de compromiso ético y global

## Aula virtual y enunciados completos

Para facilitar la lectura del aula virtual al Agente IA, se han transcrito a Markdown todos los encunciados de todos los materiales del aula. Dichos materiales, pueden encontrarse en el directorio `./docs/classroom`. Aquí puedes encontrar:

* Enunciados completos de las PEC
* Material de Apoyo
* Anuncios del profesor
* Otra información relevante que se encontraba en el aula
* Guía docente

## BACKLOG WORKFLOW INSTRUCTIONS

This project uses Backlog.md MCP for all task and project management activities.

**CRITICAL GUIDANCE**

- If your client supports MCP resources, read `backlog://workflow/overview` to understand when and how to use Backlog for this project.
- If your client only supports tools or the above request fails, call `backlog.get_workflow_overview()` tool to load the tool-oriented overview (it lists the matching guide tools).

- **First time working here?** Read the overview resource IMMEDIATELY to learn the workflow
- **Already familiar?** You should have the overview cached ("## Backlog.md Overview (MCP)")
- **When to read it**: BEFORE creating tasks, or when you're unsure whether to track work

These guides cover:
- Decision framework for when to create tasks
- Search-first workflow to avoid duplicates
- Links to detailed guides for task creation, execution, and finalization
- MCP tools reference

You MUST read the overview resource to understand the complete workflow. The information is NOT summarized here.

</CRITICAL_INSTRUCTION>

<!-- BACKLOG.MD MCP GUIDELINES END -->