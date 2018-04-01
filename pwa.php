<?php
$card = shell_exec('iw dev | awk \'$1=="Interface"{print $2}\' | sed -e \'2d\' ');
$message = "Monitor mode already enabled";
$moncheck = shell_exec('iwconfig wlan1 | grep Monitor | sed -e "s/Mode:/ /" | awk \'{print $1}\' | cut -b 5');
$wps = shell_exec('sudo timeout 10 wash -i wlan1');
	if ($moncheck == 1) {
		echo "<pre>$wps</pre>";
	}
?>

