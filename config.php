<?php

if (!empty($argv[1]) && ($configs = json_decode($argv[1])) !== false) {
    $fp = fopen('/var/www/html/config.php', 'w');

    fwrite($fp, '<?php
/**
 * RockMongo configuration
 *
 * Defining default options and server configuration
 * @package rockmongo
 */
 
$MONGO = array();
$MONGO["features"]["log_query"] = "on";//log queries
$MONGO["features"]["theme"] = "default";//theme
$MONGO["features"]["plugins"] = "on";//plugins

$i = 0;' . PHP_EOL);

    foreach ($configs as $config) {
        foreach ($config as $k => $v) {
            fwrite($fp, sprintf('$MONGO["servers"][$i]["%s"] = "%s";', $k, $v) . PHP_EOL);
        }
        fwrite($fp, PHP_EOL . '$i++;' . PHP_EOL);
    }

    fclose($fp);
}




