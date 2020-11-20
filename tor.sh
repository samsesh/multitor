#!/bin/bash

if [[ ! -d multitor ]]; then
mkdir multitor;
printf "SOCKSPort 9051\nDataDirectory /var/lib/tor1" > multitor/multitor1
printf "SOCKSPort 9052\nDataDirectory /var/lib/tor2" > multitor/multitor2
printf "SOCKSPort 9053\nDataDirectory /var/lib/tor3" > multitor/multitor3
printf "SOCKSPort 9054\nDataDirectory /var/lib/tor4" > multitor/multitor4
printf "SOCKSPort 9055\nDataDirectory /var/lib/tor5" > multitor/multitor5
fi

printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9051\e[0m\n"
tor -f multitor/multitor1 > /dev/null &
tor1=$!
#printf "Process %s\n" $tor1
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9052\e[0m\n"
tor -f multitor/multitor2 > /dev/null & 
tor2=$!
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9053\e[0m\n"
tor -f multitor/multitor3 > /dev/null &
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9054\e[0m\n"
tor -f multitor/multitor4 > /dev/null &
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9055\e[0m\n"
tor -f multitor/multitor5 > /dev/null &
sleep 6
checkcount=0
printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9051\e[0m..."
check1=$(curl --socks5-hostname localhost:9051 -s https://www.google.com > /dev/null; echo $?)
if [[ "check1" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9052\e[0m..."
check2=$(curl --socks5-hostname localhost:9052 -s https://www.google.com > /dev/null; echo $?)
if [[ "check2" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi
 
printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9053\e[0m..."
check3=$(curl --socks5-hostname localhost:9053 -s https://www.google.com > /dev/null; echo $?)
if [[ "check3" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi


printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9054\e[0m..."
check4=$(curl --socks5-hostname localhost:9054 -s https://www.google.com > /dev/null; echo $?)
if [[ "check4" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9055\e[0m..."
check5=$(curl --socks5-hostname localhost:9055 -s https://www.google.com > /dev/null; echo $?)
if [[ "check5" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

if [[ $checkcount != 5 ]]; then
printf "\e[1;91mRequire all TOR connection running to continue. Exiting\e[0m\n"
exit 1
fi
printf "\n"
printf "\e[1;77m[*] init__0\e[0m\n"
printf "\e[1;77m[*] Starting...\e[0m\n"
printf "\e[1;91m [*] run ./killtor to Stop\e[0m\n"
sleep 2

