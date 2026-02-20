// Function to create activity details table
#let activity-details-table(activity-type, due-date, percentage, tformat, total-points, individual, group) = {
  set text(size: 9pt)
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: (left, left, left, left),
    stroke: 0.5pt + black,
    inset: 8pt,

    table.cell(colspan: 4)[
      *Tipo de actividad:* (Resolución de problemas, estudio de caso, práctica, presentación, avance de proyecto, laboratorio, taller, infografía, portafolio, tarea, etc) #h(1em) #if activity-type != none { activity-type } else { [ ] }
    ],

    table.cell(colspan: 2)[*Fecha de entrega:* #h(1em) #if due-date != none { due-date } else { [] }],
    table.cell(colspan: 2)[*Valor porcentual:* #h(1em) #if percentage != none { percentage } else { [] }],

    table.cell(colspan: 2)[*Formato de entrega:* (PDF, DOCX, ZIP, video, código, etc.) #h(1em) #if tformat != none { tformat } else { [] }],
    table.cell(colspan: 2)[*Puntaje total:* #h(1em) #if total-points != none { total-points } else { [] }],

    table.cell(colspan: 2)[*Individual:* #h(1em) #if individual != none and individual { [X] } else { [ ] }],
    table.cell(colspan: 2)[*Grupal:* #h(1em) #if group != none and group { [X] } else { [ ] }],
  )
}

// Function to create a rubric table based on provided criteria
#let rubric-table(criteria) = {
  set text(size: 9pt)
  table(
    columns: 5,
    align: (left, center, center, center, center),
    fill: (col, row) => if row == 0 { rgb("#00479B") } else if col == 0 { rgb("#D1D3D4") } else { rgb("#9CC8FF") },
    inset: 8pt,
    stroke: 1.5pt + rgb("#000000"),

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
  rubric-criteria: none,
  school: "Software",
  course-code: "BISOFT-38",
  course-name: "Proyecto de Ing. de Software 4",
  tsection: "SCV2",
  period: "Q02",
  instructor: "Kevin A. Hernández Rostrán",
  activity-title: "Proyecto",
  activity-type: none,
  due-date: none,
  percentage: none,
  tformat: none,
  total-points: none,
  individual: none,
  group: none,
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
    [], [Escuela de], [#school], [], [],

    [], [Código del curso], [#course-code], [], [],
    [], [Nombre del curso], [#course-name], [], [],
    [], [Sección], [#tsection], [Período], [#period],
    [], [Docente facilitador], [#instructor], [], [],
  )
]

  // Activity title
  align(center)[
    #text(size: 14pt, weight: "bold")[CONSIGNA DE #upper(activity-title)]
  ]
  v(1em)

  // Activity details table
  activity-details-table(activity-type, due-date, percentage, tformat, total-points, individual, group)
  v(1em)

  body

  // Renderizar rúbrica si existe
  if rubric-criteria != none {
    v(1em)
    rubric-table(rubric-criteria)
  }
}
