<?php
$db_host = "localhost";
$db_user = "edu_app";
$db_password = "Password123!";
$db_name = "db_secure";

// Create Connection
$conn = new mysqli($db_host, $db_user, $db_password, $db_name);

// Check Connection
if($conn->connect_error) {
 die("Connection failed");
} 
?>