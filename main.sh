#!/bin/bash

FORMATTED_FILE='pretty-scheduled.txt'
HTML_FILE='schedule.html'

if [ !  -f  "$HTML_FILE" ];then
    source edt.sh
fi

if [ ! -f "$FORMATTED_FILE" ];then
        source pretty.sh
fi

source parser.sh
