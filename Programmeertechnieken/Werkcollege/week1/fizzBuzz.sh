#!/bin/bash

count=1

while [ $count -le 100 ]; do
    result=""

    [ $((count % 3)) -eq 0 ] && result+="Fizz"
    [ $((count % 5)) -eq 0 ] && result+="Buzz"
    [ -z $result ] && echo $count || echo $result

    count=$((count + 1))
done
