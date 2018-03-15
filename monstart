#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>MonitorModeI"
echo "</title></head><body>"

#For Get request
USERNAME=`echo "$QUERY_STRING" | sed -n 's/^.*username=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"
PASSWORD=`echo "$QUERY_STRING" | sed -n 's/^.*password=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"

mon0check=`ip addr | grep mon0 | awk '{print $1}' | cut -b 4`
if [ $mon0check -eq 0 ]; then 
echo "<script>alert(\"Wi-Fi monitor mode already enabed on Mon0\")</script>"
echo 1 > /www/cgi-bin/sword/wifi/mon.txt
else
	card=$(iw dev | awk '$1=="Interface"{print $2}' | sed -e '2d' )
	echo "<h2>Starting Monitor Mode on $card</h2>"
	echo "<pre> $(sudo airmon-ng start $card) </pre>"
	echo "<br>"
	echo 1 > /www/cgi-bin/sword/wifi/mon.txt
fi
echo "<h2>iwconfig</h2>"
echo "<pre> $(iwconfig) </pre>"
echo "</body></html>"



