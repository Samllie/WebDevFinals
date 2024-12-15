<?php
include 'db.php';
session_start();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Processing form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $input_username = $_POST['username'];
    $input_password = $_POST['password'];

    // Prevent SQL Injection
    $input_username = $conn->real_escape_string($input_username);

    // Query to check the user
    $sql = "SELECT * FROM adminusers WHERE username='$input_username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Verify password
        if (password_verify($input_password, $row['password'])) {
            echo json_encode(["success" => true, "message" => "Sign-in successful. Welcome " . $row['username'] . "!"]);
        } else {
            echo json_encode(["success" => false, "message" => "Invalid credentials. Please try again."]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "User does not exist."]);
    }
}

$conn->close();
?>
