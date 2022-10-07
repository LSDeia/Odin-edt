#!/bin/bash

FILE='schedule.html' #have to be replace by scheduled.html
FORMATED='pretty-schedule.txt'
CLEANFILE='clean-schedule.txt'
#Delete all 
cat $FILE | sed 's/<[^>]*>//g;s/&nbsp//g;s/;//g;s/salle: //g;s/enseignant://g;s/enseignants://g;s/  //g;/^$/d' > $CLEANFILE

while IFS= read -r line; do #pas trop compris (stackexchange)
    if [[ $line =~ ^[A-Z][a-z]{4,7}[0-9]{2} ]]; then #if line is a date
        echo -e "\n$line" >> $FORMATED
    elif [[ $line =~ ^[0-9]{2}\:[0-9]{2} ]]; then #if line is an hour
        echo -ne "\n      $line" >> $FORMATED
    else
        echo -n " $line " >> $FORMATED
    fi
done < "$CLEANFILE"
