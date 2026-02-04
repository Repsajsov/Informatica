#!/bin/bash

pipeline1() {
    tail -n +2 "$1" | cut -d ',' -f 1 | tr 'A-Za-z' 'X' | tr '0-9' '9' | sort -u
}

pipeline2() {
    sed '1d' "$1" | cut -d ',' -f 3,4 | sort | uniq -c | sort -rn | head -n 10 | sed 's/^ *[0-9]* //'
}

pipeline3() {
    awk -F ',' 'NR==1 {for(i=1; i<=NF; i++) if($i=="Taxi indicator") kolomTaxi=i; next} 
                $kolomTaxi=="Ja" {voertuigen[$3 " " $4]++} 
                END {for(voertuig in voertuigen) print voertuigen[voertuig],voertuig}' "$1" | sort -rn | head -n 10
}

pipeline4() {
    awk -F ',' '{merken[$3]++} END {for(merk in merken) if(merken[merk] >= 100) print merken[merk], merk}' "$1"
}

pipeline4 "$1"
