#!/bin/bash
shopt -s lastpipe
#check for arguments
if [ -z "$3" ]
  then
      printf "Usage: ./bruteimagehost.sh i.supa.codes(url) 5(idlength) isupacodes.txt(output) [-v][-d]\n"
    exit 1
fi

#info header output
clear
#------------
printf '””””””””””””””””””””””””””””””\n'
printf "\033[1mbruteimagehost.sh\033[0m\n"
printf '””””””””””””””””””””””””””””””\n'
#
printf "%s | s22f3\n" "$1"
#
printf "bruteforcing press \033[1mq\033[0m to quit\n\n"
#-------------

#check specific arguments 
    case "$*" in
        *"-d"*)
            #just download all
            until read -r -s -d q -t 0.01; do 
                status_code=200
                random=$(tr -dc 'a-zA-Z0-9_-'  < /dev/urandom | head -n1 -c"$2")
                wget "https://$1/$random" -c -q -P  downloaded | status_code=404
                printf "%s:%s\n" "$status_code" "$random"
            done
            ;;

        *"-v"*)
            #verbose output
            until read -r -s -d q -t 0.01; do 
                random=$(tr -dc 'a-zA-Z0-9_-'  < /dev/urandom | head -n1 -c"$2")
                curl --no-progress-meter -I "https://$1/$random" | head -n1 | tail -c6 | head -c3 | tee -a "$3" && printf ":%s\n" "$random" | tee -a "$3"
            done
            ;;

        *)
            #normal output
            until read -r -s -d q -t 0.01; do 
                random=$(tr -dc 'a-zA-Z0-9_-'  < /dev/urandom | head -n1 -c"$2")
                curl --no-progress-meter -I "https://$1/$random" | head -n 1 | grep -q "200" && printf "%s\n" "$random" | tee -a "$3"
            done
            ;;
esac
printf "\n"
