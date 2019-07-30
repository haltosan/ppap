#!/bin/bash
#usage: bash $0 [int] [file name] [cap len sec]

if [ $# -eq 0 ]; then
    echo "usage: bash "$0" [int] [file name] [cap len sec]"
fi

echo "<controll c to stop>"
echo "[enter to continue]"
read t

tshark -i $1 -w log/$2 -b duration:$3
