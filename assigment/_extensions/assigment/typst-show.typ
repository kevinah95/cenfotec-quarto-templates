
#show: assigment.with(
$if(header-image)$
  header-image: (
    image: image("$header-image.path$", width: 100%),
    caption: [$header-image.caption$]
  ),
$endif$
$if(school)$
  school: [$school$],
$endif$
$if(course-code)$
  course-code: [$course-code$],
$endif$
$if(course-name)$
  course-name: [$course-name$],
$endif$
$if(tsection)$
  tsection: [$tsection$],
$endif$
$if(period)$
  period: [$period$],
$endif$
$if(instructor)$
  instructor: [$instructor$],
$endif$
$if(activity-title)$
  activity-title: [$activity-title$],
$endif$
$if(activity-type)$
  activity-type: [$activity-type$],
$endif$
$if(due-date)$
  due-date: [$due-date$],
$endif$
$if(percentage)$
  percentage: [$percentage$],
$endif$
$if(tformat)$
  tformat: [$tformat$],
$endif$
$if(total-points)$
  total-points: [$total-points$],
$endif$
$if(individual)$
  individual: $individual$,
$endif$
$if(group)$
  group: $group$,
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
