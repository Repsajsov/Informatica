#!/bin/bash

bzcat "$1" | tail -n +2 | cut -d ',' -f 1 | tr 'A-Za-z' 'X' | tr '0-9' '9' | sort -u
