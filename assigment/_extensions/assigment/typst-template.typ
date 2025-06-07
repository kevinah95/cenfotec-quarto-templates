// This function gets your whole document as its `body`
#let assigment(
  body,
  header-image: none
) = {
  // Configure page and text properties.
  set page(
    paper: "us-letter",
    margin: (top: 2.8cm),
    header: if header-image != none {
      place(
            top,
            dx: -2.7cm,
            box(
                width: 22cm,
                height: 100%,
                header-image.image
            )
        )
    } else {
      none
    },
    header-ascent: 0%,
  )
  set text(font: "PT Sans")
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
    [], [Escuela de], [Exam 2], [Exam 3], [],

    [], [Código del curso], [a], [], [],
    [], [Nombre del curso], [a], [a], [],
    [], [Sección], [a], [Período], [IQ],
    [], [Docente facilitador], [Kevin A. Hernández Rostrán], [], [],
  )
]
  body
}
