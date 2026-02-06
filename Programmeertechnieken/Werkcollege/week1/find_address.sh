#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: programma accepteert slechte 1 parameter"
    exit 1
fi

echo "The address of $1 is:"
grep "$1" "./data/address.list"
