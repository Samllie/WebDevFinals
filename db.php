<?php
$host = "localhost";
$user = "u627256117_eventzen";
$password = "IdQnPS7S/U";
$dbname = "u627256117_eventzen";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
