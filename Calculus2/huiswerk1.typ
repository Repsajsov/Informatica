#import "@preview/cetz:0.4.2"

#set page(margin: 2.5cm)
#set par(justify: true)
#set text(lang: "nl")

#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [JASPER VOS \ s2911159], text(size: 17pt, weight: "bold")[Calculus 2], [Homework 1 \ 2026-02-07],
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
  & = #rect(stroke: 0.5pt, inset: 12pt)[ $(x^4 4 ln x + x^2 8 ln x - x^4 + 4x^2) / 16 + C$ ]
$
#pagebreak()
== (d)
$
  integral cos^4(x) space d x & = integral (cos^2(x))^2 space d x \
  & = integral ((cos(2x) + 1)/2 )^2 space d x \
  & = integral (cos^2(2x))/4 + (cos(2x))/2 + 1/4 space d x \
  & = integral cos(4x)/8 + 1/8 + cos(2x)/2 + 1/4 space d x \
  & = 1/8integral cos(4x) space d x
  + 1/8 integral 1 space d x
  + 1/2 integral cos(2x) space d x
  + 1/4 integral 1 space d x \
  "Let's calculate all terms, first term:" \
  1/8 integral cos(4x) space d x & = integral cos(u) space (d u) /4
  quad ("Since" u = 4x ==> d x = (d u)/4) \
  & = 1/32 sin(u) + C_1
  quad ("Since" integral cos(u) = sin(u) + C) \
  & = 1/32 sin(4x) + C_1
  quad ("Substitute" u = 4x) \
  \
  "Second term:" \
  1/8 integral 1 space d x & = x/8 + C_2
  quad ("Since" integral 1 space d x = x + C) \
  \
  "Third term:" \
  1/2 integral cos(2x) space d x & = 1/2 integral cos(u) space (d u)/2
  quad ("Since" u = 2x ==> d x = (d u)/2) \
  & = 1/4 sin(u) + C_3
  quad ("Since" integral cos(u) = sin(u) + C) \
  & = 1/4sin(2x) + C_3
  quad ("Substitute" u = 2x) \
  \
  "Fourth term:" \
  1/4 integral 1 space d x & = x/4 + C_4
  quad ("Since" integral 1 space d x = x + C ) \ \
  "Sum all the terms: "\
  integral cos^4(x) space d x &= #rect(stroke: 0.5pt, inset: 12pt)[$1/32 sin(4x) + x/8 + 1/4 sin(2x) + x/4 + C$]quad ("With" C = C_1 + C_2 + C_3 + C_4)
$

#pagebreak()
= Exercise 2

== (a)

Divide integral in two parts:
$
  integral_(-2)^2 (x+3)sqrt(4-x^2) space d x & =
                                               integral_(-2)^2 x sqrt(4-x^2) space d x +
                                               3 integral_(-2)^2 sqrt(4-x^2) space d x \
$
Notice that the first term looks like an uneven function. \
Check if $f(-x) = -f(x)$ for $f(x) = x sqrt(4-x^2)$ :
$
  f(-x) & = (-x)sqrt(4-(-x)^2) = -x sqrt(4-x^2) \
  -f(x) & = -x sqrt(4-x^2) \
$
Since $f$ uneven $==> integral_(-2)^2 x sqrt(4-x^2) space d x= 0$ \ \
Notice that the second term is a semi-circle. The integral could be seen as:
$
  3 (( pi dot 2^2)/2) = 6 pi quad ("Since surface semi-circle" => pi dot r^2 "with" r=2)
$
The range of the integral is equal to the range of the semi-circle and thus:
$
  integral (x+3)sqrt(4 - x^2) space d x = #rect(stroke: 0.5pt, inset: 6pt)[$6 pi$]
$

== (b)
$
  integral_0^1 (x^2)/(x^3 + 7)^(1/3) space d x & = integral_7^8 x^2/u^(1/3) space (d u)/(3x^2)
                                                 quad ("Let" u = x^3 + 7 "and convert bounds and" d x "in terms of" u) \
                                               & = 1/3 integral_7^8 u^(-1/3) space d u
                                                 quad ("Simplify") \
                                               & = 1/3 lr(size: #150%, [3/2 u^(2/3)])_7^8
                                                 quad ("Since" integral u^(-1/3) = 3/2 u^(2/3) + C) \
                                               & = #rect(stroke: 0.5pt, inset: 12pt)[$1/6(8^(2/3) - 7^(2/3))$]
$

== (c)
$
  integral_1^(sqrt(e)) sin(pi ln(x))/x space d x & = 1/pi integral_0^(pi/2) sin(u)/x space x d
  quad ("Let" u=pi ln (x) "and convert bounds and" d x "in terms of" u) \
  & = 1/pi lr(size: #250%, [-cos(u)])_0^(pi/2) quad ("Since" integral sin(u) space d u = -cos(u) + C ) \
  &= 1/pi (0 - (-1) ) = #rect(stroke: 0.5pt, inset: 6pt)[$1/pi$]
$

#pagebreak()

= Exercise 3

Calculate intersections first:
$
          y^2 & = 2y^2 - y -2 \
              & <==> \
         -y^2 & = -y - 2 \
              & <==> \
  y^2 - y - 2 & = 0 \
              & <==> \
   (y+1)(y-2) & = 0
$
Intersections on $y=-1$ or $y=2$. Check which line is greater in the domain $[-1, 2]$. Let $y=0$ then:
$
  x = y^2 = 0 "and" x = 2y^2 - y - 2 = -2
$
Thus $y^2$ is greater than $2y^2 - y - 2$ in the domain $[-1, 2]$, write the integral:
$
  integral_(-1)^2 y^2 - 2y^2 + y + 2 space d y & = lr(size: #150%, [y^3/3 - (2y^3)/3 +y^2/2 + 2y]_(-1)^2)
                                                 quad ("Use reverse power rule for all terms") \
                                               & = (8/3 -16/3 + 4/2 + 4) - (-1/3 +2/3 + 1/2 -2) \
                                               & = #rect(stroke: 0.5pt, inset: 12pt)[$9/2$]
$
Rough sketch:
#image("sketch.jpeg", width: 70%)





