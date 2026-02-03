#!/bin/bash


pipeline1() {
    tail -n +2 "$1" | cut -d ',' -f 1 | tr 'A-Za-z' 'X' | tr '0-9' '9' | sort -u
}


pipeline2() {
    sed '1d' "$1" | cut -d ',' -f 3,4 | sort | uniq -c | sort -rn | head -n 10 | sed 's/^ *[0-9]* //'
}

pipeline3() {
    
}

echo "Pipeline 1:"
pipeline1 "$1"
echo
echo "Pipeline 2:"
pipeline2 "$1"
