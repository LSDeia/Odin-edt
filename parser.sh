#!/bin/sh

date=$(date +"%d%B" | sed 's/[a-z]/\U&/')

PRETTY='pretty-schedule.txt'

found=false

while IFS= read -r line; do #pas trop compris (stackexchange)
    if [ $found = true ]; then #if line is an hour
        if [[ $line =~ ^[A-Z][a-z]{4,7}[0-9]{2} ]]; then
          break  
        else
            echo "$line"
        fi
    fi
    if [[ $line =~ $date ]]; then #if line is a date
        echo "$line"
        found=true
    fi
done < "$PRETTY"
