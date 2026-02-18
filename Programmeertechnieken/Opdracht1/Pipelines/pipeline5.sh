#!/bin/bash

bzcat "$1" | awk -F ',' '
# Filter op "Personenauto"
$2=="Personenauto" {
    datums = $6

    # Maak een timestamp d.m.v het splitsen van datum
    split(datums, tijd, "/")
    timestamp = mktime(tijd[3] " " tijd[2] " " tijd[1] " " "0 0 0")

    # Verkrijg weekdag vanuit timestamp object
    weekdag = strftime("%A", timestamp)

    # Tel alle dagen op
    aantal[weekdag]++
}
END {
    # Print hoeveel dagen er op een bepaalde weekdag vielen
    for(dag in aantal) {
        print dag, aantal[dag]
    }
}' | python3 grafiek.py # Stuur de weekdag/aantal data door naar het grafiek script
