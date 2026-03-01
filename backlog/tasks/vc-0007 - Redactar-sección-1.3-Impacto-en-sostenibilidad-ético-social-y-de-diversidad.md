---
id: VC-0007
title: 'Redactar sección 1.3: Impacto en sostenibilidad, ético-social y de diversidad'
status: In Progress
assignee: []
created_date: '2026-02-26 21:26'
updated_date: '2026-03-01 12:35'
labels: []
milestone: m-0
dependencies:
  - VC-0005
references:
  - >-
    docs/classroom/content/01_P1/recursos_de_aprendizaje/Guia transversal sobre
    la CCEG para estudiantado de TFx-EIMT.md
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
  - docs/memory/content/01_introduccion/03_impacto_en_sostenibilidad.typ
  - >-
    docs/memory/content/01_introduccion/01_contexto_y_justificacion_del_trabajo.typ
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Redactar la sección 1.3 "Impacto en sostenibilidad, ético-social y de diversidad" de la memoria del TFM, siguiendo la guía transversal CCEG de la UOC.

Esta sección analiza el impacto del proyecto en las 3 dimensiones de la Competencia en Compromiso Ético Global (CCEG). Debe conectar el problema de la vivienda (contextualizado en la sección 1.1) con las implicaciones éticas, sociales, medioambientales y de diversidad del proyecto.

**Requisitos del template UOC**:
- Identificar los impactos positivos y/o negativos del TF en las tres dimensiones de la competencia transversal UOC "Compromiso ético y global" (CCEG)
- Incluir el compromiso de garantizar la accesibilidad web del proyecto realizado (requisito obligatorio)
- Seguir la Guía transversal sobre la Competencia Ética y Global para redactar los apartados

**Alcance de la sección (3 dimensiones CCEG)**:

1. **Sostenibilidad**: Impacto ambiental del desarrollo y despliegue de la plataforma. Conexión con el ODS 11 (Ciudades y comunidades sostenibles). Reflexión sobre huella digital, eficiencia del despliegue, y cómo la transparencia de datos contribuye a políticas urbanas más sostenibles.

2. **Ético-social**: Transparencia del mercado inmobiliario como bien público. Datos abiertos vs privacidad. Reportes ciudadanos como herramienta de denuncia y participación cívica. Responsabilidad en el tratamiento de datos sensibles (ODS 8 - Trabajo decente, ODS 16 - Paz, justicia e instituciones sólidas).

3. **Diversidad y Derechos Humanos**: Accesibilidad web como requisito obligatorio (WCAG). Diseño inclusivo. Perspectiva de género y colectivos vulnerables en el acceso a la vivienda (ODS 10 - Reducción de desigualdades). Lenguaje inclusivo en la plataforma.

**Oportunidades de apoyo gráfico**:
Identificar e incluir gráficos o figuras que faciliten la comprensión de esta sección. Posibles candidatos:
- Tabla resumen de impactos positivos/negativos por dimensión CCEG
- Diagrama que relacione las funcionalidades del proyecto con los ODS relevantes
- Gráfico o infografía sobre la brecha de acceso a la vivienda por colectivos vulnerables (género, edad, origen) si hay datos disponibles en las fuentes de investigación
- Tabla de compromisos de accesibilidad (nivel WCAG objetivo, criterios clave)

**Fuera de alcance** (cubierto por otras secciones de la memoria):
- Contextualización general del problema de la vivienda → Sección 1.1 (VC-0005)
- Implementación técnica de accesibilidad → Se abordará en los capítulos de Materiales y métodos (Cap. 2) y/o Resultados (Cap. 3) cuando se desarrollen
- Objetivos del proyecto → Sección 1.2

**Fuentes disponibles**: Los 4 informes de Deep Search de `docs/research/Contexto socioeconómico de la crisis habitacional en España/` contienen datos relevantes sobre desigualdad, colectivos vulnerables y dimensión social del problema. La guía transversal CCEG está en `docs/classroom/content/01_P1/recursos_de_aprendizaje/Guia transversal sobre la CCEG para estudiantado de TFx-EIMT.md`.

**Fichero destino**: `docs/memory/content/01_introduccion/03_impacto_en_sostenibilidad.typ`

**Tono y estilo**: Académico formal. Reflexivo y argumentativo. Usar lenguaje inclusivo. Citar fuentes verificables para datos y afirmaciones.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 El fichero `docs/memory/content/01_introduccion/03_impacto_en_sostenibilidad.typ` contiene la redacción completa (no placeholder)
- [ ] #2 La memoria compila correctamente con `typst compile docs/memory/main.typ`
- [ ] #3 Todas las citas bibliográficas están registradas en el fichero de bibliografía
- [ ] #4 Las fuentes citadas han sido verificadas
- [ ] #5 La sección es coherente con la sección 1.1 (Contexto y justificación) y no duplica contenido
<!-- DOD:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Incluye el compromiso explícito de garantizar la accesibilidad web del proyecto (requisito obligatorio CCEG del template UOC)
- [ ] #2 Identifica impactos positivos y/o negativos en las 3 dimensiones CCEG: sostenibilidad, ético-social, y diversidad/DDHH
- [ ] #3 Referencia al menos 2 ODS relevantes (ODS 10, 11, 16 o similares) con justificación de su relación con el proyecto
- [ ] #4 Conecta el problema de la vivienda (contextualizado en 1.1) con las implicaciones éticas y sociales del proyecto
- [ ] #5 Reflexiona sobre datos abiertos vs privacidad en el contexto de los reportes ciudadanos
- [ ] #6 Incluye perspectiva de género y colectivos vulnerables en el acceso a la vivienda
- [ ] #7 Usa lenguaje inclusivo a lo largo de toda la sección
- [ ] #8 Todas las afirmaciones de peso tienen cita a fuente verificable
- [ ] #9 El texto está escrito en español académico formal (nivel TFM)
- [ ] #10 El fichero Typst compila correctamente con `typst compile docs/memory/main.typ`
- [ ] #11 Incluye al menos 1 elemento gráfico (tabla, diagrama o figura) que facilite la comprensión de los impactos o compromisos
<!-- AC:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
## Plan de ejecución

### Paso 1: Lectura de la guía CCEG y destilación de fuentes
- Leer la guía transversal CCEG (`docs/classroom/content/01_P1/recursos_de_aprendizaje/Guia transversal sobre la CCEG...`)
- Reutilizar el material destilado de los 4 informes de investigación (ya procesados en VC-0005) extrayendo información específica sobre: desigualdad, colectivos vulnerables, género, sostenibilidad urbana, privacidad de datos

### Paso 2: Propuesta de estructura al usuario
Proponer 2-3 esqueletos posibles para organizar las 3 dimensiones CCEG. Incluir propuestas de gráficos/tablas de apoyo. El usuario elige.

### Paso 3: Redacción con agente tfm-memory-writer
Redactar la sección completa en Typst siguiendo el esqueleto elegido. Incluir los elementos gráficos acordados (tablas de impacto, relación ODS-funcionalidades, etc.).

### Paso 4: Verificación de fuentes (agente source-verifier)
Verificar todas las citas incluidas. Priorizar papers y organismos públicos.

### Paso 5: Compilación y verificación final
Compilar con `typst compile docs/memory/main.typ` y verificar coherencia con la sección 1.1 ya redactada.
<!-- SECTION:PLAN:END -->
