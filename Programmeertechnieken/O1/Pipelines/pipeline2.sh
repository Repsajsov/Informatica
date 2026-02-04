#!/bin/bash

bzcat "$1" | sed '1d' | cut -d ',' -f 3,4 | sort | uniq -c | sort -rn | head -n 10 | sed 's/^ *[0-9]* //'
