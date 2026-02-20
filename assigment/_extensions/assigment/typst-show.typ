
#show: assigment.with(
$if(header-image)$
  header-image: (
    image: image("$header-image.path$", width: 100%),
    caption: [$header-image.caption$]
  ),
$endif$
$if(rubric-criteria)$
  rubric-criteria: (
$for(rubric-criteria)$
    (
      criteria: [$rubric-criteria.criteria$],
      deficient: [$rubric-criteria.deficient$],
      regular: [$rubric-criteria.regular$],
      good: [$rubric-criteria.good$],
      excellent: [$rubric-criteria.excellent$],
    ),
$endfor$
  ),
$endif$
)
