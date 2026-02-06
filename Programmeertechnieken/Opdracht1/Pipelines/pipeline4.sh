#!/bin/bash

bzcat "$1" | awk -F ',' '
NR > 1 && $2=="Personenauto" {
    merk = $3
    split($21, leeftijd, "/")
    if (leeftijd[3] != "") {
        aantal[merk]++ 
        somLeeftijd[merk]+=(2021 - leeftijd[3])
    }
} 
END {
    for(m in aantal) {
        if(aantal[m] >= 100) { 
            gemiddelde=int((somLeeftijd[m] / aantal[m]) + 0.5)
            print gemiddelde, m
        }
    }
}' | sort -rn
