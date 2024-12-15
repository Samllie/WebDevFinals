<?php
include 'db.php';
session_start();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Processing form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $memberName = $_POST['name'];
    $memberPassword = $_POST['password'];

    // Prevent SQL Injection
    $memberName = $conn->real_escape_string($memberName);
    $memberPassword = password_hash($memberPassword, PASSWORD_DEFAULT); // Hash the password

    // Query to insert the new member with password
    $sql = "INSERT INTO adminusers (username, password) VALUES ('$memberName', '$memberPassword')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["success" => true, "message" => "Member added successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Error adding member: " . $conn->error]);
    }
}

$conn->close();
?>
