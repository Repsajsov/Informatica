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

== a)
We zien dat $y$ geen beperkingen heeft, omdat $y$ in de teller staat
en verder niet in een functie staat en dus geldt $y in RR$.
Voor $x$ is het moeilijker want het staat zowel in de noemer noch in een wortelfunctie. Voor de wortelfunctie geldt dat het alleen waarden groter of gelijk aan $0$ mag nemen, echter als de waarde $0$ is hebben we $0$ als noemer en dit kan dus ook niet. We moeten dus kijken wanneer:
$
  7-x^2 & > 0 \
      7 & > x^2
$
Dus $x in (-sqrt(7), sqrt(7))$, en $y in RR$.

=== Plaatje van het domein:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.4pt)

    grid(
      (-6, -3),
      (6, 3),
      step: 1,
      stroke: gray + 0.2pt,
    )

    line((-6, 0), (6, 0))
    line((0, -3), (0, 3))

    line((-2.65, -3), (-2.65, 3), stroke: (dash: "dashed"))
    line((2.65, -3), (2.65, 3), stroke: (dash: "dashed"))

    rect((-2.65, -3), (2.65, 3), fill: rgb(150, 150, 200, 60), stroke: none)

    content((5.8, -0.2), [$x$])
    content((0.2, 2.8), [$y$])
    content((-2.65, -3.3), [$-sqrt(7)$])
    content((2.65, -3.3), [$sqrt(7)$])
  })
]

== b i)
Merk op dat $f(x)= x$ continu is, en als we een constante toevoegen blijft dit continu. dus $f(x) = x+3$, en dus moet $p:RR->RR "met" p(y) = y-3$ ook continu zijn.

Bekijk nu $q$. $q$ heeft een wortelfunctie. wortelfuncties zijn gedefineerd voor waarden groter gelijk aan $0$, en dus moet gelden:
$
  7-x^2 >= 0
$
We hebben dit al eerder berekend en dus $x in [-sqrt(7), sqrt(7)]$.
De wortelfunctie is dus continu op dit domein en dus ook in het punt $-1$, want
$-sqrt(7) < -1 < sqrt(7)$.

== b ii)
Merk op dat vanuit i) we hebben bewezen dat de teller en noemer continu zijn in het punt $(-1, 2)$, dus dan moet $f$ ook continu in het punt $(-1,2)$. Gebruik lemma nu en dan hebben we dus dat $lim_(x,y->-1,2)f(x,y)= f(-1,2) = -1/sqrt(6)$.

== c)
De wortelfunctie is niet gedefineerd op $x=7$, en is $f$ is open en $x=7$ is niet het randpunt.

== d)


