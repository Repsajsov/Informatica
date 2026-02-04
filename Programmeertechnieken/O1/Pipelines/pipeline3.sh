#!/bin/bash

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
