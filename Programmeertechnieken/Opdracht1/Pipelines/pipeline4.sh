#!/bin/bash

# bzcat "$1" | awk -F ',' '
# NR > 1 && $2=="Personenauto" {
#     merk = $3
#     split($21, leeftijd, "/")
#     if (leeftijd[3] != "") {
#         aantal[merk]++
#         somLeeftijd[merk]+=(2021 - leeftijd[3])
#     }
# }
# END {
#     for(m in aantal) {
#         if(aantal[m] >= 100) {
#             gemiddelde=int((somLeeftijd[m] / aantal[m]) + 0.5)
#             print gemiddelde, m
#         }
#     }
# }' | sort -rn

bzcat "$1" | awk -F ',' '$2=="Personenauto" {print $3","$21}' |                                                                   # Selecteer benodigde kolommen
	awk -F ',' '{split($2, geboortedatum, "/"a); if(geboortedatum[3] != ""){leeftijd=2021-geboortedatum[3]; print $1","leeftijd}}' | # Bereken leeftijd per auto
	awk -F ',' '{
        aantal[$1]++; somLeeftijd[$1]+=$2
    } END {
        for(auto in aantal){
            if(aantal[auto]>=100){
                gemiddelde=int((somLeeftijd[auto] / aantal[auto]) + 0.5) 
                print gemiddelde, auto
            }
        }
    }' | sort -n # Bereken gemiddelde leeftijd per auto, en sorteer oplopend
