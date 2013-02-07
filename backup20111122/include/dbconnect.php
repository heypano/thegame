<?php

define("HOST", "localhost");
define("DBUSER","std06033");
define("PASS","12345");
define("DB","game");

$conn = mysql_connect(HOST,DBUSER,PASS) or die('Could not connect to server.');
$db = mysql_select_db(DB) or die('Database could not be located.');


?>