---
id: VC-0005
title: 'Redactar sección 1.1: Contexto y justificación del Trabajo'
status: In Progress
assignee: []
created_date: '2026-02-26 21:26'
updated_date: '2026-02-28 20:05'
labels: []
milestone: m-0
dependencies: []
references:
  - >-
    docs/research/Contexto socioeconómico de la crisis habitacional en
    España/[Qwen] Contexto socioeconómico de la crisis habitacional en España.md
  - >-
    docs/research/Contexto socioeconómico de la crisis habitacional en
    España/[Claude] Contexto socioeconómico de la crisis habitacional en
    España.md
  - >-
    docs/research/Contexto socioeconómico de la crisis habitacional en
    España/[ChatGPT] Contexto socioeconómico de la crisis habitacional en
    España.md
  - >-
    docs/research/Contexto socioeconómico de la crisis habitacional en
    España/[Perplexity] Contexto socioeconómico de la crisis habitacional en
    España.md
  - >-
    docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ
  - docs/memory/content/02_estado_del_arte/01_contexto_del_mercado.typ
  - >-
    docs/memory/content/02_estado_del_arte/03_plataformas_y_herramientas_existentes.typ
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Redactar la sección 1.1 "Contexto y justificación del Trabajo" de la memoria del TFM. Esta sección es la puerta de entrada del documento: debe situar al lector en el problema de la vivienda en España, justificar por qué es necesaria una plataforma como "Vivienda en Crisis", y motivar el trabajo desde una perspectiva tanto social como académica.

**Alcance de la sección**:
- Contextualización del problema habitacional en España (crisis de acceso, evolución de precios, brecha entre ingresos y costes de vivienda, situación de alquiler vs compra).
- Opacidad y asimetría informativa del mercado inmobiliario: los datos existen pero están fragmentados, son de difícil acceso para la ciudadanía, o están controlados por actores privados (portales inmobiliarios).
- Justificación de la necesidad de un observatorio público basado en datos abiertos: transparencia, empoderamiento ciudadano, rendición de cuentas.
- Motivación del proyecto: por qué este TFM aborda este problema, relevancia social y académica.
- Breve mención del enfoque técnico elegido (plataforma web con visualización de datos abiertos y sistema de reportes ciudadanos), sin entrar en detalle técnico (eso va en secciones posteriores).

**Fuera de alcance** (cubierto por otras secciones):
- Análisis detallado de competidores y herramientas existentes --> Cap. 2.3 (Plataformas y herramientas existentes)
- Análisis profundo de la evolución del mercado con datos y cifras --> Cap. 2.1 (Contexto del mercado)
- Objetivos específicos del proyecto --> Sección 1.2 (Objetivos del Trabajo)
- Impacto en sostenibilidad, ético-social y diversidad --> Sección 1.3 (VC-0007)
- Decisiones técnicas o de arquitectura --> Cap. 3 (Diseño)

**Fuentes disponibles**: 4 informes de Deep Search en `docs/research/Contexto socioeconómico de la crisis habitacional en España/` ([Qwen], [Claude], [ChatGPT], [Perplexity]). El informe [Qwen] es el más completo en redacción y citación de fuentes. El informe [Claude] es el más rico en datos y cifras concretas.

**Fichero destino**: `docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ`

**Tono y estilo**: Académico formal (nivel TFM universitario). Todas las afirmaciones de peso deben estar respaldadas por citas verificables (papers, informes de organismos públicos, periodismo de investigación). Evitar lenguaje coloquial o activista.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 El fichero `docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ` contiene la redacción completa (no placeholder)
- [x] #2 La memoria compila correctamente con `typst compile docs/memory/main.typ`
- [x] #3 Todas las citas bibliográficas utilizadas están registradas en el fichero de bibliografía del proyecto
- [ ] #4 Las fuentes citadas han sido verificadas (URLs accesibles o referencias bibliográficas correctas)
- [ ] #5 La sección ha sido revisada para coherencia con el resto del capítulo 1 (no contradice ni duplica contenido de secciones 1.2-1.7)
<!-- DOD:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 La sección contextualiza el problema habitacional en España con al menos 3 dimensiones (precios, acceso, brecha salarial, demografía, etc.) respaldadas por datos con cita
- [x] #2 Se describe la asimetría informativa del mercado inmobiliario: fragmentación de datos, control por actores privados, falta de herramientas públicas para la ciudadanía
- [x] #3 Se justifica la necesidad de un observatorio público de vivienda basado en datos abiertos, conectando transparencia con empoderamiento ciudadano
- [x] #4 Se presenta la motivación del TFM (relevancia social y académica del problema)
- [x] #5 Se menciona brevemente el enfoque del proyecto (plataforma web, datos abiertos, reportes ciudadanos) sin entrar en detalle técnico
- [x] #6 No se solapa con el contenido de las secciones 2.1 (Contexto del mercado) ni 2.3 (Plataformas existentes): la sección introduce y justifica, no analiza en profundidad
- [x] #7 Todas las afirmaciones factuales tienen cita a fuente verificable (paper, informe oficial, medio de comunicación de referencia)
- [x] #8 Mínimo 5 citas bibliográficas distintas, priorizando: papers > informes de organismos públicos > periodismo de investigación
- [x] #9 La extensión es adecuada para una sección introductoria de TFM (entre 1500 y 3000 palabras orientativamente)
- [x] #10 El texto está escrito en español formal académico sin lenguaje coloquial ni activista
- [x] #11 El fichero Typst compila correctamente con `typst compile docs/memory/main.typ` sin errores ni warnings relevantes
- [x] #12 No incluye análisis de impacto en sostenibilidad, ético-social ni diversidad (eso se aborda en la sección 1.3, tarea VC-0007)
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
## Plan de ejecución

### Paso 1: Lectura y destilación de fuentes (subagentes)
Lanzar subagentes para leer y destilar los 4 informes de investigación de `docs/research/Contexto socioeconómico de la crisis habitacional en España/`. Los informes son extensos y no caben en un solo contexto. Cada subagente debe extraer:
- Datos y cifras clave sobre la crisis habitacional
- Citas textuales con fuente original (URL, paper, informe)
- Argumentos sobre opacidad del mercado y asimetría informativa
- Cualquier referencia a datos abiertos, observatorios públicos o transparencia

Prioridad de informes: [Qwen] > [Claude] > [ChatGPT] = [Perplexity]

### Paso 2: Propuesta de esqueletos estructurales
Con el material destilado, proponer al usuario 2-3 esqueletos/estructuras posibles para la sección. Cada esqueleto debe incluir:
- Subsecciones propuestas con título y breve descripción de contenido
- Hilo argumental (cómo fluye la narrativa)
- Dónde encajan las citas y datos clave

El usuario elige el esqueleto que prefiere.

### Paso 3: Redacción con agente tfm-memory-writer
Usando el esqueleto elegido por el usuario, redactar la sección completa en Typst. El agente `tfm-memory-writer` se encarga de:
- Escribir en español académico formal
- Insertar citas en formato Typst (`@clave`)
- Respetar el scope definido (no solapar con cap. 2)
- Mantener la extensión objetivo (1500-3000 palabras)

### Paso 4: Verificación de fuentes (agente source-verifier)
El agente `source-verifier` revisa todas las citas incluidas:
- Prioridad: papers > organismos públicos > periodismo de investigación
- Verificar que las URLs son accesibles y el contenido coincide
- Asegurar que las entradas bibliográficas están en el fichero de bibliografía
- Señalar citas que no se puedan verificar para buscar alternativas

### Paso 5: Compilación y verificación final
- Compilar la memoria con `typst compile docs/memory/main.typ`
- Verificar que no hay errores ni warnings
- Revisar coherencia con las secciones adyacentes (1.2 Objetivos, cap. 2)
- Verificar extensión y formato
<!-- SECTION:PLAN:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
## Ejecución completada (2026-02-28)

### Fuentes verificadas
- @cis_barometro_2026: URL accesible, contenido confirmado (42,6%, enero 2026)
- @civio_megatenedores_2024: URL accesible, cifras confirmadas (737 megatenedores, 178.000+ viviendas)
- @navalkha_2021: URL accesible, autoría corregida (Chenab Navalkha, no Puig de la Bellacasa)
- PDFs de BdE, Fotocasa/InfoJobs, IDRA: accesibles pero no parseables vía web; documentos oficiales referenciados en 4 informes de investigación

### Corrección aplicada
- La tesis del MIT citada como Puig de la Bellacasa (2022) es en realidad de Chenab Navalkha (2021). Corregido en el fichero .typ y en references.bib.

### Estadísticas del resultado
- 21 citas únicas de ~15 fuentes distintas
- ~1929 palabras
- 2 comentarios TODO para refuerzos visuales
- Compila sin errores
<!-- SECTION:NOTES:END -->
