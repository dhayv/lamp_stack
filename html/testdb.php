<?php
$servername = "local_hose";
$username = "test_user";
$password = "Passowrd123!";
$dbname = "testdb";

$conn = new mysqli(hostname: $servername, username: $username, password: $password, database: $dbname)

if ($conn->connect_error) {
    die("Connection failed" . $conn->connect_error);
} 
echo"Connection Successful";
?>