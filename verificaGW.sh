#!/bin/sh

WAN=$1

resultado_ping=$(ping -c 10 -I $WAN google.com | awk '/packet loss/ { print $7 }' | tr -d '%')

echo $resultado_ping
