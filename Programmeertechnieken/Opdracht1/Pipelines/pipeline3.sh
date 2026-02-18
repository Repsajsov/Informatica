#!/bin/bash

bzcat "$1" |                              # Laadt de data
	awk -F ',' '$56=="Ja" {print $3","$4}' | # Filter alleen Taxi's
	sort | uniq -c | sort -rn |              # Sorteer unieke auto's
	head -n 10 |                             # Laat alleen de eerste 10 auto's zien
	awk -F ' ' '{$1=""; print $0}'           # Verwijder alles voor de eerste spatie (nummering)
