#!/bin/bash

if [ ! -f "$1" ]; then
    echo "Error: $1 niet gevonden"
    exit 1
fi

cp "$1" "$1.backup"
echo "Backup gemaakt: $1.backup"
