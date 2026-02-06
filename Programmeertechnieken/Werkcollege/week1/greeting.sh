#!/bin/bash

echo "Welcome $USER!"
echo "Er zijn $(who | wc -l) van de $(cat /etc/passwd | wc -l) gebruikers online!"
