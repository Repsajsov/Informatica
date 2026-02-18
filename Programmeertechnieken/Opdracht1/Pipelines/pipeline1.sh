#!/bin/bash

bzcat "$1" | tail -n +1 |                # Weergeef gecomprimeerd bestand en Haal eerste regel weg
	cut -d ',' -f 1,2 |                     # Kies alleen kolom 1 en 2
	grep "Personenauto" | cut -d ',' -f 1 | # Filter op "Personenauto" en kies de eerste kolom
	tr 'A-Za-z' 'X' | tr '0-9' '9' |        # Vervang elke letter met "X", en elk nummer met "9"
	sort -u                                 # Sorteer enkel de unieke auto's
