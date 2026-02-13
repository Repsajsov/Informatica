#import "@preview/cetz:0.4.2"

#set page(margin: 2.5cm)
#set par(justify: true)
#set text(lang: "nl")

#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [Jasper Vos \ s2911159], text(size: 17pt, weight: "bold")[Analyse 2], [Huiswerk 1 \ 2026-02-07],
)

#show heading: it => {
  it.body
  h(0.5em)
}

#line(length: 100%, stroke: 0.8pt)
#v(1em)

= Opdracht 1
$
  integral x^5 sqrt(1+x^3) d x & = integral x^5 sqrt(u) space d x quad ("Substitute" 1+x^3 "for" u ) \
  & = integral x^5 sqrt(u) space (d u) / (3x^2) quad ("Substitute" d x "with" d x = (d u) / (3x^2)) \
  & = 1/3 integral x^3 sqrt(u) space d u quad ("Simplify") \
  & = 1/3 integral (u-1)sqrt(u) space d u quad ("Substitute with")
$
