#!/bin/bash
#usage: bash $0 [interface] [essid] [passwd]

if [ $# -eq 0 ]; then
    echo "usage: bash $0 [interface] [essid] [passwd]"
    exit 1
fi
if [ $1 == "--help"]; then
    echo "usage: bash $0 [interface] [essid] [passwd]"
    exit 0
fi

#nmcli dev wifi hotspot ifname wlp4s0 ssid test password "test1234"

nmcli c add type wifi ifname $1 con-name broadcast autoconnect no ssid $2
nmcli connection modify broadcast 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
nmcli connection modify broadcast wifi-sec.key-mgmt wpa-psk
nmcli connection modify broadcast wifi-sec.psk $3
nmcli connection up broadcast

echo "Run stopAP to end the connection"

exit 0
