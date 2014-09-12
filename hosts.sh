#!/bin/bash
while read line; do 
    nmblookup -A $line>>hosts.txt
done < activeIPs.txt
