#!/bin/bash

bzcat "$1" |                                       # Laadt de data
	awk -F ',' '$2=="Personenauto" {print $4","$3}' | # Filter op "Personenauto" en print benodigde kolommen"
	sort | uniq -c | sort -rn |                       # Sorteer op unieke auto's
	head -n 10 |                                      # Laat alleen de eerste 10 auto's zien
	awk -F ' ' '{$1=""; print $0}'                    # Verwijder alles voor de eerste spatie (nummering)
