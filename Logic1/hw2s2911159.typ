#import "@preview/cetz:0.4.2"
#import "@preview/curryst:0.6.0": prooftree, rule

#set page(margin: .75cm)
#set par(justify: true)
#set text(lang: "nl")

#grid(
  columns: (1fr, auto, 1fr),
  align: (left, center, right),
  [Jasper Vos \ s2911159], text(size: 18pt, weight: "bold")[Logic 1], [Huiswerk 2 \ 17-02-2026],
)

#show heading: it => {
  it.body
  h(0.5em)
}

#line(length: 100%, stroke: 0.8pt)
#v(1em)

= Opgave 1

== a)
#prooftree(
  rule(
    name: [(→I)],
    rule(
      name: [(¬E)],
      rule(name: [(Aanname)], $p, not p tack p$),
      rule(name: [(Aanname)], $p, not p tack not p$),
      $p, not p tack bot$,
    ),
    $p tack not p → q$,
  ),
)

== b)

#prooftree(
  rule(
    name: [(→I)],
    rule(
      name: [(→I)],
      rule(
        name: [(∨E)],
        rule(
          name: [(→E)],
          rule(name: [(Aanname)], $Gamma tack p → (q or r)$),
          rule(name: [(Aanname)], $Gamma tack p$),
          $Gamma tack q or r$,
        ),
        rule(
          name: [(¬E)],
          rule(name: [(Aanname)], $Gamma, q tack q$),
          rule(name: [(Aanname)], $Gamma, q tack not q$),
          $Gamma, q tack bot$,
        ),
        rule(name: [(Aanname)], $Gamma, r tack r$),
        $Gamma tack r$,
      ),
      $Gamma, p tack r$,
    ),
    $p → (q or r) tack not q → (p → r)$,
  ),
)

= Opgave 2
#prooftree(
  rule(
    name: [(∧I)],
    rule(
      name: [(¬I)],
      rule(
        name: [(¬E)],
        rule(name: [(∨I₁)], rule(name: [(Aanname)], $Gamma, phi tack phi$), $Gamma, phi tack phi or psi$),
        rule(name: [(Aanname)], $Gamma, phi tack not(phi or psi)$),
        $Gamma, phi tack bot$,
      ),
      $not(phi or psi) tack not phi$,
    ),
    rule(
      name: [(¬I)],
      rule(
        name: [(¬E)],
        rule(name: [(∨I₂)], rule(name: [(Aanname)], $Gamma, psi tack psi$), $Gamma, psi tack phi or psi$),
        rule(name: [(Aanname)], $Gamma, psi tack not(phi or psi)$),
        $Gamma, psi tack bot$,
      ),
      $not(phi or psi) tack not psi$,
    ),
    $not(phi or psi) tack not phi and not psi$,
  ),
)
