#!/bin/bash

usage () {
  echo "usage: $0 -s subnetID"
  
}

sub=""

while getopts "s:h" option; do
	case "$option" in
		s)  sub="$OPTARG" ;;
   		h)  # it's always useful to provide some help 
        		usage
        		exit 0 
        		;;
  esac
done  

if [ "$sub" != "" ];then  
	nmap -v -sP $sub/24>>out.txt
	sed -i "\|$host down|d" out.txt 
	sed -i "\|$host is up|d" out.txt
	sed 's/Nmap scan report for//g' out.txt>>allIPs.txt
	grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" allIPs.txt >> activeIPs.txt
else 
	usage
fi	
