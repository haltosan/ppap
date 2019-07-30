# PPAP

PiPineappleApplePi or PentestPiAccessPoint

This project is a really easy hotspot creator and traffic logger. It creates a hotspot (of any name and password) for client to 
connect to. My purpose for this is to have a connection point for a deployed pi.

# Getting Started

## Prerequisites

The system this was desighned for was kali linux. The required tools are as follows:
*For the startAP and stopAP*
* nmcli (part of NetworkManager)

*For sniff*
* [tshark](https://wireshark.org) (a part of wireshark)

## Running

### AP

To scan for APs and connect, run:
```
bash connect.sh
```

To start the AP, run:
```
bash startAP.sh [interface] [essid] [passwd]
```

The parameters are as follows:
* interface: The interface to broadcast with
* essid: The essid to broadcast
* passwd: The password of the point. Put - to have no password

To stop the AP, run:
```
bash stopAP.sh
```
 
Example run:
```
bash connect.sh
bash startAP.sh wlan1 FREEWIFI -
bash stopAP.sh
```
 
This follows the connection wizard, creates an open point called FREEWIFI on wlan1, then stops it.
 
### Sniff
 
To use the traffic logging, run the following:
```
bash sniff.sh [int] [file name] [cap len sec]
```

The parameters are as follows:
* int: The interface to log. This should be the broadcast interface.
* file name: The prefix for the logging files for this run.
* cap len sec: How many seconds each cap file should cover.

Example run:
```
bash sniff.sh wlan1 day1 60
```

This sniffs on the interface wlan1 (the broadcast), begins each file with day1, and each file is an hour of captures.

## Notes
 
The sniff program outputs to the 'out' directory. Each file will begin with the file name chosen at run, followed by a timestamp 
relative to run. The files will be in the pcapng format, and can be opened with wireshark for reading. 

The individual part of the project can be use independantly, and should be used when the other is not needed.

## Licence

This project is licenced under the GNU General Public License. See LICENCE.md file for details.
