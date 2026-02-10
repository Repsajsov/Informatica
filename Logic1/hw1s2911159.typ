#import "@preview/cetz:0.4.2"

#set page(margin: 2.5cm)
#set par(justify: true)
#set text(lang: "nl")

#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [Jasper Vos \ s2911159], text(size: 18pt, weight: "bold")[Logic 1], [Huiswerk 1 \ 2026-02-07],
)

#show heading: it => {
  it.body
  h(0.5em)
}

#line(length: 100%, stroke: 0.8pt)
#v(1em)

= Opdracht 1

== a)
$(p or (q and r)) & => ((q=>bot) => p)
<==> (p or (q and r)) & => (q or p)$ \
== b)
=== Formule boom:
#cetz.canvas({
  import cetz.tree
  import cetz.draw: *

  tree.tree(
    (
      [$=>$],
      ([$or$], [$p$], ([$=>$], [$q$], [$r$])),
      ([$or$], [$r$], ([$or$], ([$=>$], [$q$], [$bot$]), [$p$])),
    ),
    direction: "down",
    grow: 1,
    spread: 3.0,
    draw-node: (node, ..) => {
      circle((), radius: .4, stroke: 1pt + black)
      content((), node.content)
    },
  )
})
=== Alle subformules:

Begin links van wortel, daarna rechts en voeg op het eind samen:

=== Links:

$q=> r \ p or (q => r)$

=== Rechts:

$q=>bot <==> not q \ not q or p \ r or not q or p$

=== Samen:

$p or (q => r) => r or not q or p$

= Opdracht 2

== a)
Proof is valid.
Remaining sorries: 0

== b)
Is geen WFF omdat $not$ geen binaire operator, en dus staan er nu twee argumenten zonder binaire operator, namelijk $p$ en $not q$.

== c)
Is geen WFF omdat er in de haakjes geen linker-argument is verbonden aan $=>$.

== d)
Proof is valid.
Remaining sorries: 0

= Opdracht 3

== a)
Het regent en als gevolg is de straat nat. In logica is dit dus:
$
  r => w
$
Met waarheidstabel kunnen we goed de verschillende scenario's bekijken:

Als beide uitspraken waar zijn klopt $r=>w$, als $r$ waar en $w$ niet waar dan klopt de uitspraak niet want de straat kan niet droog zijn als het regent. Als $r$ onwaar is valt er niks te zeggen over $=>$, en dus komt deze formule grotendeels overeen met de werkelijkheid.

== b)
z - "De zon schijnt".

== c)
Als het regent dan is de straat nat en schijnt de zon niet. Ofwel in logica $r=>(w and not z)$.
