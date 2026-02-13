#import "@preview/cetz:0.4.2"

#set page(margin: 2.5cm)
#set par(justify: true)
#set text(lang: "nl")

#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [Jasper Vos \ s2911159], text(size: 17pt, weight: "bold")[Calculus 2], [Homework 1 \ 2026-02-07],
)

#show heading: it => {
  it.body
  h(0.5em)
}

#line(length: 100%, stroke: 0.8pt)
#v(1em)

= Exercise 1

== (a)
$
  integral x^5 sqrt(1+x^3) d x & = integral x^5 sqrt(u) space d x)
                                 quad ("Substitute" 1+x^3 "for" u ) \
                               & = integral x^5 sqrt(u) space (d u) / (3x^2)
                                 quad ("Substitute" d x "with" d x = (d u) / (3x^2)) \
                               & = 1/3 integral x^3 sqrt(u) space d u
                                 quad ("Simplify") \
                               & = 1/3 integral (u-1)sqrt(u) space d u
                                 quad ("Substitute" x^3 "with" x^3 = u-1) \
                               & = 1/3 integral u^(3/2) - u^(1/2) space d u
                                 quad ("Simplify") \
                               & = 1/3(2/5u^(5/2) - 2/3u^(3/2)) + C
                                 quad ("Use reverse power rule for both terms") \
                               & = #rect(stroke: 0.5pt, inset: 6pt)[$ 3/15u^(5/2) - 2/9u^(3/2) + C $]
$

== (b)
$
  integral (sqrt(2tan x))/(cos^2x) d x & = sqrt(2) integral sqrt(u) / (cos^2 x) d x
                                         quad ("Substitute" tan x "for" u) \
                                       & = sqrt(2) integral sqrt(u)/(cos^2x) space cos^2 x space d u
                                         quad ("Substitute" d x "with" d x = cos^2 x space d u) \
                                       & = sqrt(2) integral sqrt(u) space d u
                                         quad ("Simplify") \
                                       & = sqrt(2) (2/3 u^(3/2)) + C
                                         quad ("Use reverse power rule") \
                                       & = #rect(stroke: 0.5pt, inset: 6pt)[$ (sqrt(8)u^(3/2))/3 + C $]
$
#pagebreak()
== (c)
$
  "Use integration by parts:" integral f g' = f g - integral f' g \
  "Let" f = ln x "and" f' = 1/x quad ", also let" g = x^4/4 + x^2/2 "and" g' = x^3 + x "then:" \
$
$
  integral ln x (x^3+x) space d x & = ln x (x^4/4 + x^2/2) - integral 1/x (x^4/4 + x^2/2) space d x \
  & =ln x(x^4/4 + x^2/2) - integral (x^3/4 +x/2) space d x quad ("Simplify") \
  & = ln x(x^4/4 + x^2/2) - (x^4/16 + x^2/4) + C
  quad ("Use reverse power rule for both terms") \
  & = #rect(stroke: 0.5pt, inset: 6pt)[ $(x^4 4 ln x + x^2 8 ln x - x^4 + 4x^2) / 16 + C$ ]
$

== (d)
$
  
$
