#!/bin/bash
logfile1=/Users/mehul.intern/development/bash/scripts/access.log
logfile=/home/mehul/learning_stuff/bash/first/access.log
write_file=record.txt

# ip=$(awk '{print $1}' $logfile)
# # printf "$ip\n"
# # date=$(awk '{print $2}' $logfile)
# # printf "$date\n"
# awk -F: '/:$/ {print $2}' $logfile


# printf "\nHighest Requested Hosts, Upstream IP's and Paths Date-Wise\n===============================================================================\n"
# highest_requested(){
#     date=$1
# 	cat $logfile | grep $date | awk '{print $NF}' | sort | uniq -c | sort -r | head -1 > $write_file
#     host_times=$(awk '{print $1}' $write_file)
# 	host_name=$(awk '{print $2}' $write_file)
    
#     cat $logfile | grep $date | awk '{print $9}' | sort | uniq -c | sort -r | head -1 > $write_file
#     upstream_ip_times=$(awk '{print $1}' $write_file)
# 	upstream_ip=$(awk '{print $2}' $write_file)

#     cat $logfile | grep $date | awk '{print $5}' | sort | uniq -c | sort -nr | head -1 > $write_file
#     path_times=$(awk '{print $1}' $write_file)
#     path=$(awk '{print $2}' $write_file)

  
#     printf "\n+++++++++++++++++++\n On \"$date\"\n+++++++++++++++++++\n\n"
#     echo "\"$host_name\" was the highest requested upstream_ip and it was requested $host_times times."
# 	echo "\"$upstream_ip\" was the highest requested upstream_ip and it was requested $upstream_ip_times times."
#     echo "\"$path\" was highest requested path and it was requested $path_times times."
#     printf "\n\n"
# }

# #Function Call- highest requested(date)
# highest_requested 12/Feb/20
# highest_requested 06/Mar/2021
# highest_requested 07/Mar/2021
# highest_requested 08/Mar/2021

# #Total Requests per status code.
# printf "\nTotal Requests per status code.\n============================================================\n"
# cat $logfile | awk '{print $7}' | sort | uniq -c > $write_file
# while read line; do
# 	set -- $line
# 	printf "Total requests on status code \"$2\" is $1.\n"
# done < $write_file

# #Top 5 Requested Upstream IP, Host, BodyByteSent and Path
# top_5_requested() {
#     awkval=$1
#     name=$2

#     cat $logfile | awk '{print $'$awkval'}' | sort | uniq -c | sort -nr | head -5 > $write_file
#     # cat $logfile | awk '{print $9}' | sort | uniq -c | sort -nr | head -5 > $write_file
    
#     printf "\n\nTop 5 Requested $name:\n++++++++++++++++++++++++++++++\n"

#     while read line; do
# 	    set -- $line
# 	    printf "$name : \"$2\" requested $1 times.\n"
#     done < $write_file

# }
# #Function Call- top_5_requested(awkValue, Name)
# top_5_requested 9 Upstream_ip
# top_5_requested NF Host
# top_5_requested 10 BodyBytesSent
# top_5_requested 5 Path

# top_5_highest_response(){
#     cat $logfile | awk '{print $8, $NF}' | sort -nr | uniq | head -5 > $write_file
#     printf "\n\nTop 5 Requested Response:\n+++++++++++++++++++++++\n"

#     while read line; do
# 	    set -- $line
# 	    echo "Response Time : \"$1\" requested by: \"$2\" requested from: \"$3\" IP."
#     done < $write_file
# }

# top_5_highest_response 

# #Top 5 requests returning 200/5xx/4xx per host
# top_5_requested_stat_by_host(){
#     cat $logfile | awk '{print $7, $NF}' | sort | uniq -c| sort -nr | head -5 > $write_file
#     printf "\n\nTop 5 Requested Paths:\n++++++++++++++++++++\n"

#     while read line; do
#         set -- $line
#         printf "Status Code : \"$2\" Host : \"$3\" requested $1 times.\n"
#     done < $write_file
# }
# top_5_requested_stat_by_host


# # cat $logfile | awk '{print $2, $NF, $7}' > $write_file
# # cat $logfile | awk '($7 ~ /404/) {print $NF, $7, $2}' | sort > $write_file

# awk -v d1="$(date  -j -f "%d/%m/%Y:%H:%M" '-10 min' '+%s')" -v d2="$(date '+%s')" -F '[-":,T+]' ' { ts=mktime($5" "$6" "$7" "$8" "$9" "$10) } ts >= d1 && ts <= d2 ts > d2{ exit 0 }' $logfile


#d1=$(date --date="-10 min" "+%d/%m/%Y:%H:%M:%S")
#d2=$(date "+%d/%m/%Y:%H:%M:%S")
#echo $d1
#cat $logfile | awk '{print $NF, $7}'  | sed -n "/^$(date --date="-10 min" "+_%d/%b/%Y:%H:%M:%S")/,\$p"
d1=$(date --date="-10 min" "+%_d/%b/%Y:%H:%M:%S")
d2=$(date "+%_d/%b/%Y:%H:%M:%S")
#echo $d1
#echo $d2
awk -v d1="$d1" -v d2="$d2" "$2 > d1 && $2 < $d2 || $2 ~ $d2" $logfile
