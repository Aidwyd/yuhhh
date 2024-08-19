<?php
$ip = $_SERVER['REMOTE_ADDR'];
$fp = fopen('.txt.txt', 'a');
fwrite($fp, ' -X- Someone visited with the IP: '.$ip);
fclose($fp);
header('Location: https://https://cmr.sellpass.io/')
?>
