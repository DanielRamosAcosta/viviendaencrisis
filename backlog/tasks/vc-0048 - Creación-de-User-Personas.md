---
id: VC-0048
title: Creación de User Personas
status: To Do
assignee: []
created_date: '2026-03-04 19:22'
updated_date: '2026-03-15 11:21'
labels:
  - ux/ui
milestone: m-1
dependencies: []
references:
  - >-
    https://www.figma.com/board/BUhYGpA1sI4Vpju7EKBSpF/Mapa-de-Empat%C3%ADa--Copia-?node-id=2001-534
priority: high
ordinal: 1406.25
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Crear perfiles de usuario (personas) basados en los datos del estudio de público objetivo (VC-0047) y el análisis de la encuesta (N=40).

## TLDR

Diseñar 3 User Personas principales y 2 secundarias en un fichero Markdown, basadas en los arquetipos identificados en la encuesta del estudio de público objetivo.

## Arquetipos identificados

### Principales

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

### Secundarias

**Persona 4 — El/La Periodista/Investigador/a** (~18% de la muestra)
- 31-45 años, formación en periodismo/investigación
- Motivación: Generar reportajes, verificar claims con datos
- Busca: Datos contextualizados, comparativas internacionales, citas verificables

**Persona 5 — El/La Jubilado/a Propietario/a** (~10% de la muestra)
- 55+ años, propiedad sin hipoteca
- Motivación: Comprender el cambio en su barrio, justificar preocupaciones sobre pisos turísticos
- Busca: Evolución del barrio, número de pisos turísticos, impacto en convivencia

## Plantilla de User Persona

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

## Ejemplo de referencia (trabajo anterior)

> **Laura Vincent** — *La Chef Práctica*
>
> *"Cocinar es mi escape, pero no tengo tiempo para recetas complicadas"*
>
> **Datos demográficos**
> - Casada
> - 34 años
> - Sin hijos
> - Vive en un piso en Valencia, España
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
> - No siempre encuentra la receta cuando la necesita, porque muchas veces las guarda en redes sociales y luego le cuesta localizarlas
>
> **Capacidades técnicas**
> - Aplicaciones de móvil: Alto
> - Uso del ordenador como usuaria: Muy alto
> - Redes sociales: Muy alto
> - Compra de productos online: Alto
>
> **Actividades habituales**
> - Cocina casi todos los días para ella y su pareja
> - Explora recetas en Instagram y TikTok cuando le salen de forma casual, y sigue algunos canales en YouTube como "Cocina con Diego"
> - Suele improvisar las comidas del día a día, aunque revisa la receta y anota ingredientes en el móvil antes de hacer la compra
> - Utiliza el temporizador del móvil y prefiere recetas rápidas que no duren más de 30 minutos
> - Busca que la comida sea sabrosa y saludable, combinando recetas tradicionales e internacionales

## Entregable

Fichero `USER_PERSONAS.md` en la raíz del proyecto con las 5 personas completas. El usuario trasladará manualmente el contenido a FigJam.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->
