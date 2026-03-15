---
id: VC-0048
title: Creación de User Personas
status: To Do
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-15 11:46'
labels:
  - ux/ui
  - refined
milestone: m-1
dependencies:
  - VC-0047.04
references:
  - >-
    https://www.figma.com/board/BUhYGpA1sI4Vpju7EKBSpF/Mapa-de-Empat%C3%ADa--Copia-?node-id=2001-534
priority: high
ordinal: 1406.25
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
## 📌 TLDR

Diseñar 3 User Personas principales y 2 secundarias en un fichero Markdown, basadas en los arquetipos identificados en la encuesta del estudio de público objetivo.

## 📝 Descripción

Crear perfiles de usuario (personas) basados en los datos del estudio de público objetivo (VC-0047) y el análisis de la encuesta (N=40). Se han identificado 3 arquetipos principales y 2 secundarios a partir de los patrones demográficos, motivacionales y de comportamiento de los encuestados.

### Arquetipos principales

**Persona 1 — La Ciudadana Afectada** (~35% de la muestra)
- 24-35 años, inquilina, destina 30-40% de ingresos a vivienda
- Motivación: Saber si le cobran de más, comparar precios, conocer sus derechos
- Frustración: Asimetría de información, miedo a represalias, desconocimiento legal
- Busca: Evolución de precios en su zona, comparativa precio/m², info legal, reportes anónimos

**Persona 2 — El Activista de Datos** (~25% de la muestra)
- 31-46 años, profesional cualificado, propietario o inquilino
- Motivación: Documentar abusos con datos para forzar cambio sistémico
- Frustración: Inacción política, datos parciales/sesgados, falta de investigación independiente
- Busca: Datos descargables (CSV/API), series históricas, relación pisos turísticos ↔ precios, herramientas de exportación

**Persona 3 — El Usuario Técnico** (~22% de la muestra)
- 24-45 años, perfil tech (devs, ingenieros), predominantemente masculino
- Motivación: Análisis técnico del mercado, evaluar decisiones personales (comprar vs alquilar)
- Frustración: Portales públicos poco intuitivos, datos no accesibles en formatos abiertos
- Busca: API abierta, gráficos interactivos con drill-down, filtros avanzados, documentación técnica

### Arquetipos secundarios

**Persona 4 — El/La Periodista/Investigador/a** (~18% de la muestra)
- 31-45 años, formación en periodismo/investigación
- Motivación: Generar reportajes, verificar claims con datos
- Busca: Datos contextualizados, comparativas internacionales, citas verificables

**Persona 5 — El/La Jubilado/a Propietario/a** (~10% de la muestra)
- 55+ años, propiedad sin hipoteca
- Motivación: Comprender el cambio en su barrio, justificar preocupaciones sobre pisos turísticos
- Busca: Evolución del barrio, número de pisos turísticos, impacto en convivencia

## 🧩 Contexto funcional

### Plantilla de User Persona

Cada persona debe incluir los siguientes campos:

| Campo | Descripción |
|-------|-------------|
| **Nombre + Arquetipo** | Nombre ficticio y etiqueta que resume el perfil (ej. "Laura Vincent — La Chef Práctica") |
| **Quote representativa** | Frase en cursiva que captura la actitud o necesidad principal del usuario |
| **Foto** | Placeholder con descripción del perfil visual (el usuario añadirá la foto en FigJam) |
| **Datos demográficos** | Estado civil, edad, hijos, lugar de residencia |
| **Educación** | Nivel de estudios o formación |
| **Ocupación/Trabajo** | Puesto y tipo de jornada |
| **Motivaciones y deseos** | Lista de lo que busca y espera conseguir |
| **Frustraciones y obstáculos** | Lista de problemas y barreras actuales |
| **Capacidades técnicas** | Nivel (bajo/medio/alto/muy alto) para: Aplicaciones de móvil, Uso del ordenador como usuario, Redes sociales, Compra de productos online |
| **Actividades habituales** | Lista de comportamientos y hábitos cotidianos relacionados con el dominio |

### Ejemplo de referencia (trabajo anterior)

> **Laura Vincent** — *La Chef Práctica*
>
> *"Cocinar es mi escape, pero no tengo tiempo para recetas complicadas"*
>
> **Datos demográficos**
> - Casada, 34 años, sin hijos, vive en un piso en Valencia, España
>
> **Educación**: Grado en Administración de Empresas
>
> **Ocupación**: Administrativa en una empresa de logística, jornada completa
>
> **Motivaciones y deseos**
> - Mantener una dieta saludable sin renunciar al sabor
> - Explorar nuevas recetas sin dedicar demasiado tiempo
> - Ahorrar tiempo en la cocina, especialmente después de un largo día de trabajo
> - Simplificar la planificación de la compra y tener a mano recetas para organizarse mejor
>
> **Frustraciones y obstáculos**
> - Falta de tiempo para recetas largas o complicadas
> - Las recetas que requieren ingredientes difíciles de encontrar
> - Vídeos largos o explicaciones confusas que no van al grano
> - No siempre encuentra la receta cuando la necesita
>
> **Capacidades técnicas**
> - Aplicaciones de móvil: Alto
> - Uso del ordenador como usuaria: Muy alto
> - Redes sociales: Muy alto
> - Compra de productos online: Alto
>
> **Actividades habituales**
> - Cocina casi todos los días para ella y su pareja
> - Explora recetas en Instagram y TikTok
> - Prefiere recetas rápidas que no duren más de 30 minutos

## 📦 Entregables

- `USER_PERSONAS.md` en la raíz del proyecto con las 5 personas completas
- Captura de pantalla del FigJam en `docs/memory/images/`
- Sección de User Personas documentada en la memoria del TFM (docs/memory/)
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 El fichero USER_PERSONAS.md contiene 5 personas completas (3 principales + 2 secundarias) con todos los campos de la plantilla: nombre+arquetipo, quote, placeholder foto, datos demográficos, educación, ocupación, motivaciones, frustraciones, capacidades técnicas y actividades habituales
- [ ] #2 Las 2 personas secundarias (Periodista/Investigador, Jubilado/Propietario) están marcadas explícitamente como perfiles secundarios poco representativos de la encuesta
- [ ] #3 Cada persona ha sido verificada individualmente contra los datos de la encuesta (docs/memory/data/formulario-resultados.csv) por un agente independiente con contexto limpio
- [ ] #4 Cada persona incluye un placeholder descriptivo para la foto (ej. "Mujer joven, 28 años, aspecto urbano")
- [ ] #5 Los 5 User Personas quedan documentados en la memoria del TFM (docs/memory/) mediante el agente tfm-memory-writer junto con la captura de pantalla del FigJam
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
## 🔄 Flujo de trabajo

### Paso 1 — Generación
El agente principal genera el fichero `USER_PERSONAS.md` con las 5 personas completas, siguiendo la plantilla y los arquetipos definidos en la descripción.

### Paso 2 — Verificación
Se lanzan 5 agentes en paralelo (uno por persona), cada uno con contexto limpio. Cada agente:
- Lee el `USER_PERSONAS.md` (solo la sección de su persona asignada)
- Lee los datos de la encuesta (`docs/memory/data/formulario-resultados.csv`)
- Verifica que los datos demográficos, motivaciones, frustraciones y comportamientos de la persona son coherentes con los datos reales de la encuesta
- Reporta discrepancias o invenciones no respaldadas por los datos

### Paso 3 — Corrección (si aplica)
El agente principal corrige las discrepancias reportadas por los agentes verificadores en el `USER_PERSONAS.md`.

### Paso 4 — Volcado manual a FigJam
El usuario traslada el contenido del Markdown a FigJam.

### Paso 5 — Captura de pantalla
El usuario saca una captura de pantalla del FigJam y la deja en el directorio de imágenes de la memoria (`docs/memory/images/` o similar).

### Paso 6 — Documentación en la memoria del TFM
El usuario avisa y se invoca al agente `tfm-memory-writer` para documentar los 5 User Personas (3 principales + 2 secundarios) en la memoria del TFM, incluyendo la captura de pantalla del FigJam.
<!-- SECTION:PLAN:END -->
