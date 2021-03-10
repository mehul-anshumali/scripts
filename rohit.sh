#!/bin/bash

# variables
LOGFILE=access.log # LOGFILE
LOGFILE_GZ=access.log #LOGFILE
RESPONSE_CODE="200"

#functions

filter_date(){
grep '12/Feb/2021'
}

request_head(){
head -1
}

high_req_host(){
awk '{print $NF}'|sort | uniq -c | sort -r
}

high_req_upstream_ip(){
awk '{print $9}'|sort | uniq -c | sort -r
}

high_req_path()
{
awk '{print $5}'|sort | uniq -c | sort -r
}

#actions
get_high_req_host(){
echo ""
echo "1.Summary for the day/week/month"
echo "==============================="
echo ""
echo "highest requested host:"
cat $LOGFILE \
| high_req_host \
| request_head
echo ""
}

get_high_upstream(){
echo "highest requested upstream ip:"
cat $LOGFILE \
| high_req_upstream_ip \
| request_head
echo ""
}


get_high_req_path(){
echo "highest requsted path:"
cat $LOGFILE \
| high_req_path \
| request_head
echo ""
}


#executing
get_high_req_host
get_high_upstream
get_high_req_path