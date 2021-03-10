#!/bin/bash
logfile=access.log
write_file=output.txt

# 2) Total requests per status code
total_requests_per_status_code(){
    printf "\nTotal Requests per status code.\n==================================================\n"
    cat $logfile | awk '{print $7}' | sort | uniq -c > $write_file
    while read line; do
        set -- $line
        printf "Total requests on status code \"$2\" is $1.\n"
    done < $write_file
    # cat $logfile | awk '{print $7}' | sort | uniq -c 
}

# 3) 

total_requests_per_status_code
