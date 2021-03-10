#!/bin/bash
logfile=access.log

# #Highest Hosted Request on 12/Feb/2021.
# cat $logfile | grep '12/Feb/2021' | awk '{print $NF}' | sort | uniq -c | sort -r | head -1 > feb_hosts.txt 
# times=$(awk '{print $1}' feb_hosts.txt)
# host_name=$(awk '{print $2}' feb_hosts.txt)
# echo "On \"12/Feb/2021\" - \"$host_name\" was the highest requested host and it was requested $times many times."

# #Highest Requested upstream_ip on 12/Feb/2021
# cat $logfile | grep '12/Feb/2021' | awk '{print $9}' | sort | uniq -c | sort -nr | head -1 > feb_upi.txt
# times=$(awk '{print $1}' feb_upi.txt)
# upstream_ip=$(awk '{print $2}' feb_upi.txt)
# echo "On \"12/Feb/2021\" - \"$upstream_ip\" was the highest requested upstream_ip and it was requested $times times."


# #Highest Requested Path.
# cat $logfile | grep '06/Mar/2021' | awk '{print $5}' | sort | uniq -c | sort -nr | head -1 > feb_path.txt
# times=$(awk '{print $1}' feb_path.txt)
# path=$(awk '{print $2}' feb_path.txt)
# echo "On \"06/Mar/2021\" - \"$path\" was highest requested path and it was requested $times times."

# #Total Requests per status code.
# cat $logfile | awk '{print $7}' | sort | uniq -c > total_requests_on_status_code.txt

# #while read times code; do
# #	echo $times $code  
# #done <total_requests_on_status_code.txt | awk '{print $1,$2}'

# while read line; do
# 	set -- $line
# 	printf "Total requests on status code \"$2\" is $1.\n"
# done < total_requests_on_status_code.txt


# #Top 5 Requested upstream_ip 
# cat $logfile | awk '{print $9}' | sort | uniq -c | sort -nr | head -5 > top_5_requested_upstream_ip.txt
# printf "\n\nTop 5 Requested upstream_ip:\n++++++++++++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "Upstream IP : $2 requested $1 times.\n"
# done < top_5_requested_upstream_ip.txt


# #Top 5 Requested Hosts
# cat $logfile | awk '{print $NF}' | sort | uniq -c | sort -nr | head -5 > top_5_requested_hosts.txt
# printf "\n\n Top 5 Requested Hosts:\n+++++++++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "Host: \"$2\" requested $1 times.\n"
# done < top_5_requested_hosts.txt

# #Top 5 Request By  BodyBytesSent
# cat $logfile | awk '{print $10}' | sort | uniq -c | sort -nr | head -5 > top_5_requested_bodybytesent.txt
# printf "\n\n Top 5 requested BodyByteSent:\n+++++++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "BodyByteSent: \"$2\" requested $1 times.\n"
# done <  top_5_requested_bodybytesent.txt

# #Top 5 Requested Path
# cat $logfile | awk '{print $5}' | sort | uniq -c| sort -nr | head -5 > top_5_requested_paths.txt
# printf "\n\nTop 5 Requested Paths:\n++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "Path : \"$2\" requested $1 times.\n"
# done < top_5_requested_paths.txt


#Top 5 Requested Highest Response
# cat $logfile | awk '{print $8, $5, $1}' | sort -nr | uniq | head -5 > top_5_requested_response.txt
# printf "\n\nTop 5 Requested Resoponse:\n++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	echo "Response Time : \"$1\" requested by: \"$2\" requested from: \"$3\" ip."
# done < top_5_requested_response.txt

#Top 5 requests returning 200/5xx/4xx per host
# cat $logfile | awk '{print $7, $NF}' | sort | uniq -c| sort -nr | head -5 > top_5_requested_stat.txt
# printf "\n\nTop 5 Requested Paths:\n++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "Path : \"$2\" requested $1 times.\n"
# done < top_5_requested_stat.txt

#Last time host returns what status code.
# cat $logfile | awk '{print $2, $3, $NF, $7}' | sort -nr | uniq -c | sort -nr > returns_stat.txt
# printf "\n\nTop 5 Requested Paths:\n++++++++++++++++++++\n"

# while read line; do
# 	set -- $line
# 	printf "Path : \"$2\" requested $1 times.\n"
# done < returns_stat.txt
 

# awk '{print $7}' access.log | sort | uniq -c | sort -rn
# awk '($7 ~ /404/)' access.log | sort | uniq -c | sort -fr


# awk \
# -v start="$(date +"%F %R" --date=@$(expr `date +%s` - 180))" \
# -v end="$(date "+%F %R")" \
# '$0 ~ start, $0 ~ end' \
# $logfile

# awk -v d1="$(date --date '-10 min' '+%d/%b/%Y:%T')" '{gsub(/^[\[\t]+/, "", $4);}; $4 > d1' $logfile
# awk -v d1="$(date --date '-10 min' '+%d/%b/%Y:%T')" '$2, $3 > d1' $logfile 
sed -n "/^$(date --date='10 minutes ago' '+%b %_d %H:%M')/,\$p" $logfile
