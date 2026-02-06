#!/bin/bash

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
' | python3 .grafiek.py
