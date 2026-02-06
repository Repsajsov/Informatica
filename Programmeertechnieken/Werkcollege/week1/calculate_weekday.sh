#!/bin/bash

dag=$1
maand=$2
jaar=$3

[[ $jaar -lt 1901 || $jaar -gt 2099 ]] && echo "Invalid" && exit 1

jaren=$((jaar - 1901))
schrikkel=$(((jaar - 1901) / 4))

maandDagen=(0 31 59 90 120 151 181 212 243 273 304 334)
totaalDagen=$((jaren * 365 + ${maandDagen[maand - 1]} + schrikkel + dag))

[[ $((jaar % 4)) -eq 0 && $maand -gt 2 ]] && ((totaalDagen++))

weekdag=$(((totaalDagen + 1) % 7))
dagen=("Zondag" "Maandag" "Dinsdag" "Woensdag" "Donderdag" "Vrijdag" "Zaterdag")
echo ${dagen[weekdag]}
