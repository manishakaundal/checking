<?php
	$servername = "ap-cdbr-azure-east-c.cloudapp.net";  //Or you can use 127.0.0.1    echo $mysqli->host_info . "\n";
	$username = "ba399a026d89b7";
	$password = "48853dae";
	$database = "omh";

	$mysqli = new mysqli($servername, $username, $password, $database);

	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: " . $mysqli->connect_error;
	}

?>
