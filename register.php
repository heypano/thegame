<?php
require_once('./include/dbconnect.php');
// Only run this script if the sendRequest is from our flash application
if ($_POST['sendRequest'] == "parse") {
// Access the value of the dynamic text field variable sent from flash
$username = $_POST['username'];
$password = $_POST['password'];
$query = "SELECT * FROM users WHERE username= '$username'";

$result = mysql_query($query);
$count = mysql_num_rows($result);
if($count>0){
	print "var1=0";//registration failed (already existed)
	
	}
else {
	$query = "INSERT INTO `users` (`id`, `username`, `password`) VALUES (NULL, '$username', '$password');";
	mysql_query($query);
	print "var1=1";//registration successful
	}
}



?>