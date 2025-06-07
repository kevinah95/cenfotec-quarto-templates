# Assigment Format

## Installing

```bash
quarto use template kevinah95/cenfotec-quarto-templates/assigment
```

This will install the format extension and create an example qmd file
that you can use as a starting place for your document.

## Using

Specify the parameters using YAML options, then write the body of the assigment. For example, the following qmd source:

```yaml
---
header-image:
  path: "header.png"
  caption: "Award winning science"
format:
  assigment-typst: default
---

# Datos generales de la actividad

# Instrucciones generales
1. Lea cuidadosamente las instrucciones de la actividad, en caso de tener alguna duda puede consultar con el docente.
1. Esta actividad se desarrolla de manera individual o grupal (de acuerdo con lo especificado en los datos generales), cualquier intento de plagio será sancionado de acuerdo con el reglamento académico vigente.
1. Al completar la actividad, debe subir la solución en la plataforma Moodle en el formato, tiempo y espacio indicado por el docente.

# Objetivos o competencias del curso que se evaluarán en la actividad de aprendizaje
```

This document would be rendered as:

![](assigment.png)
