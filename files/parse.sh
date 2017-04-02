#!/bin/bash

wrkdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$1" ]
  then
    echo "Required input file not specified. Usage: $0 file"
    exit 1
fi

if [ -f $wrkdir/sql.dump.csv ]
  then
    rm $wrkdir/sql.dump.csv
fi

while IFS= read -r line; do
  html=$(echo $line| grep -i -e '</\?TABLE\ | </\?TD\|</\?TR\|</\?TH' | sed 's/^[\ \t]*//g' | tr -d '\n' | sed 's/<\/TR[^>]*>/\n/Ig' | egrep -v "table|div")
  sym=$(echo $line| grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' | sed 's/^[\ \t]*//g' | tr -d '\n' | sed 's/<\/TR[^>]*>/\n/Ig'  |egrep -v "table|div"|awk -F = '{print $4}'|sed 's/" class//'|sed 's/"wsod_stream">//'|sed 's/<\/span.*//')
  name=$(echo $line|grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' | sed 's/^[\ \t]*//g' | tr -d '\n' | sed 's/<\/TR[^>]*>/\n/Ig'  |egrep -v "table|div"|awk -F = '{print $6}'|sed 's/<\/span.*//'|sed 's/.*>//')
  price=$(echo $line| grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' | sed 's/^[\ \t]*//g' | tr -d '\n' | sed 's/<\/TR[^>]*>/\n/Ig'  |egrep -v "table|div"|awk -F = '{print $9}'|sed 's/" class//'|sed 's/"wsod_stream">//'|sed 's/<\/span.*//')
  echo "\"$sym,\"$name\",$price,\"$html\"" >> $wrkdir/sql.dump.csv
done < "$1"
