#!/bin/bash

wrkdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl "http://money.cnn.com/data/dow30/" 2>/dev/null | grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' | sed 's/^[\ \t]*//g' | tr -d '\n' | sed 's/<\/TR[^>]*>/\n/Ig' |grep -v Header > ${wrkdir}/dow30.html


