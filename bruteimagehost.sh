#/bin/bash
#info output
printf "$1 | S22F5\n"
printf "Usage: $0 i.supa.codes(url) 5(idlength) isupacodes.txt(output file)\n"
#start bruteforcing
printf "bruteforcing press \033[1mq\033[0m to quit\n"
until read -s -d q -t 0.01; do 
    random=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9_-' | head -n1 -c$2)
    curl --no-progress-meter -I "https://$1/$random" | head -n1 | tail -c6 | head -c3 | tee -a $3 && printf ":$random\n" | tee -a $3
    # | grep -a "200:"
done
