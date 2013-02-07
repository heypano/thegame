<?php
require_once('./include/dbconnect.php');
// Only run this script if the sendRequest is from our flash application
if ($_POST['sendRequest'] == "parse") {
// Access the value of the dynamic text field variable sent from flash
$username = $_POST['username'];
$password = $_POST['password'];
$query = "SELECT * FROM users WHERE username= '$username' and password='$password'";

$result = mysql_query($query);
$count = mysql_num_rows($result);
if($count==1){
	print "var1=1";
	
	}
else {
	print "var1=0";
	}
// Print  two vars back to flash, you can also use "echo" in place of print
//print "var1=The name field with a variable of username $username and password $password has been sent to PHP and is back.";
/*
$username2 = $username."2";
print "&var2=The username2 $username2 is also set and password $password in variable 2 from PHP.";
*/
}

?>