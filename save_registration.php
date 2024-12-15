<?php
include 'db.php';
session_start();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Processing form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname = $conn->real_escape_string($_POST['fullname']);
    $address = $conn->real_escape_string($_POST['address']);
    $mobile = $conn->real_escape_string($_POST['mobile']);
    $email = $conn->real_escape_string($_POST['email']);
    $event_date = $conn->real_escape_string($_POST['event_date']);
    $guests = (int) $_POST['guests']; // Ensure guests is an integer

    // Query to insert the new registration
    $sql = "INSERT INTO registrations (fullname, address, mobile, email, event_date, guests) VALUES ('$fullname', '$address', '$mobile', '$email', '$event_date', '$guests')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["success" => true, "message" => "Registration saved successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Error saving registration: " . $conn->error]);
    }
}

$conn->close();
?>
