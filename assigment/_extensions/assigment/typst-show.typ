
#show: assigment.with(
$if(header-image)$
  header-image: (
    image: image("$header-image.path$", width: 100%),
    caption: [$header-image.caption$]
  ),
$endif$
)
