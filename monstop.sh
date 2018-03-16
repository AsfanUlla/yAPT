#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>MonStop"
echo "</title></head><body>"

mon0check=`iwconfig wlan1 | grep Monitor | sed -e "s/Mode:/ /" | awk '{print $1}' | cut -b 5`
if [ $mon0check -eq 1 ]; then

        card=$(iw dev | awk '$1=="Interface"{print $2}' | sed -e '2d' )
        echo "<h2>Stoping Monitor Mode on $card</h2>"
        echo "<pre> $(sudo ifconfig $card down && sudo iwconfig $card mode managed && sudo ifconfig $card up) </pre>"
        echo "<br>"
        echo 1 > /www/cgi-bin/sword/wifi/mon.txt
else
echo "<script>alert(\"Monitor Mode is already disabled\")</script>"
echo 1 > /www/cgi-bin/sword/wifi/mon.txt
fi
echo "<h2>iwconfig</h2>"
echo "<pre> $(iwconfig) </pre>"
echo "</body></html>"

