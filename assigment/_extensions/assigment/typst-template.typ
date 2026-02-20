// Function to create a rubric table based on provided criteria
#let rubric-table(criteria) = {
  set text(size: 9pt)
  table(
    columns: 5,
    align: (left, center, center, center, center),
    fill: (col, row) => if row == 0 { rgb("#00479B") } else { white },
    inset: 8pt,
    stroke: 0.5pt + rgb("#cccccc"),

    // Header
    [#text(fill: white, weight: "bold")[Criterios de desempeño]],
    [#text(fill: white, weight: "bold")[Deficiente (1 punto)]],
    [#text(fill: white, weight: "bold")[Regular (2 puntos)]],
    [#text(fill: white, weight: "bold")[Bueno (3 puntos)]],
    [#text(fill: white, weight: "bold")[Excelente (4 puntos)]],

    // Rows
    ..criteria.map(c => (
      [#c.criteria],
      [#c.deficient],
      [#c.regular],
      [#c.good],
      [#c.excellent]
    )).flatten()
  )
}

// This function gets your whole document as its `body`
#let assigment(
  body,
  header-image: none,
  rubric-criteria: none
) = {
  // Configure page and text properties.
  set page(
    paper: "us-letter",
    margin: (top: 2.8cm, left: 2.54cm, right: 2.54cm, bottom: 2.54cm),
    header: if header-image != none {
      place(
            top,
            dx: -2.54cm,
            box(
                width: 21.59cm, // Ancho completo de carta US
                height: 100%,
                header-image.image
            )
        )
    } else {
      none
    },
    header-ascent: 0%,
  )
  set text(font: "Arial")
  set heading(numbering: "1.a.")
  set enum(indent: .5cm)
  set par(
    spacing: 1.15em,
  )

[
  #set table(
    stroke: none,
    gutter: 0.2em,
    inset: (right: 1.5em),
  )
  #table(
    columns: 5,
    align: (center,right,left,center),
    [], [Escuela de], [Software], [], [],

    [], [Código del curso], [BISOFT-38], [], [],
    [], [Nombre del curso], [Proyecto de Ing. de Software 4], [], [],
    [], [Sección], [SCV2], [Período], [Q02],
    [], [Docente facilitador], [Kevin A. Hernández Rostrán], [], [],
  )
]
  body
  // Renderizar rúbrica si existe
  if rubric-criteria != none {
    rubric-table(rubric-criteria)
    v(1em)
  }
}
