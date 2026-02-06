#!/bin/bash

pipeline1() {
    bzcat "$1" | tail -n +2 | cut -d ',' -f 1 | tr 'A-Za-z' 'X' | tr '0-9' '9' | sort -u
}

pipeline2() {
    bzcat "$1" | sed '1d' | cut -d ',' -f 3,4 | sort | uniq -c | sort -rn | head -n 10 | sed 's/^ *[0-9]* //'
}

pipeline3() {
    bzcat "$1" | awk -F ',' '
    NR==1 {
        for(i=1; i<=NF; i++){ 
            if($i=="Taxi indicator") {
                kolomTaxi=i
            }
        }
    } 
    NR > 1 && $kolomTaxi=="Ja" {
        voertuigen[$3 " " $4]++
    } 
    END {
        for(voertuig in voertuigen) {
            print voertuigen[voertuig],voertuig 
        }
    }' | sort -rn | head -n 10
}

pipeline4() {
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
}

pipeline5() {
    bzcat "$1" | awk -F ',' '
    NR > 1 && $2=="Personenauto" {
        datums = $6 
        split(datums, tijd, "/")
        timestamp = mktime(tijd[3] " " tijd[2] " " tijd[1] " " "0 0 0")
        weekdag = strftime("%A", timestamp)
        aantal[weekdag]++
    }
    END {
    for(dag in aantal) {
        print dag, aantal[dag]}} 
    ' | python3 grafiek.py
}

pipeline5 "$1"
