d1=$(date --date="-10 min" "+%_d/%b/%Y:%H:%M:%S")
d2=$(date "+%_d/%b/%Y:%H:%M:%S")
#echo $d1
#echo $d2
awk -v d1="$d1" -v d2="$d2" "$2 > d1 && $2 < $d2 || $2 ~ $d2" $logfile
